{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleContexts #-}

module Ivory.BSP.STM32.Driver.SPI
  ( spiTower
  , module Ivory.Tower.HAL.Bus.SPI
  , module Ivory.Tower.HAL.Bus.SPI.DeviceHandle
  ) where

import Ivory.Language
import Ivory.Stdlib
import Ivory.Tower
import Ivory.Tower.HAL.Bus.Interface
import Ivory.Tower.HAL.Bus.SPI
import Ivory.Tower.HAL.Bus.SPI.DeviceHandle
import Ivory.HW

import Ivory.BSP.STM32.Interrupt
import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32.Peripheral.SPI.Pins
import Ivory.BSP.STM32.Peripheral.SPI.Regs
import Ivory.BSP.STM32.Peripheral.SPI.Peripheral

spiTower :: forall e
          . (e -> ClockConfig)
         -> [SPIDevice]
         -> SPIPins
         -> Tower e ( BackpressureTransmit ('Struct "spi_transaction_request")
                                           ('Struct "spi_transaction_result")
                    , ChanOutput ('Stored ITime))
spiTower tocc devices pins = do
  towerDepends spiDriverTypes
  towerModule  spiDriverTypes
  reqchan <- channel
  reschan <- channel
  readychan <- channel
  irq <- signalUnsafe (Interrupt interrupt)
                (Microseconds 9)
                (interrupt_disable interrupt)

  watchdog_per <- period (Milliseconds 1)
  monitor (periphname ++ "PeripheralDriver") $
    spiPeripheralDriver tocc periph pins devices (snd reqchan) (fst reschan) (fst readychan) irq watchdog_per
  return (BackpressureTransmit (fst reqchan) (snd reschan), snd readychan)
  where
  interrupt = spiInterrupt periph
  periphname = spiName periph
  periph = case devices of
    [] -> err "for an empty device set"
    d:ds ->
      let canonicalp = spiDevPeripheral d
      in case and (map (\d' -> canonicalp `eqname` spiDevPeripheral d') ds) of
        False -> err "with devices on different peripherals"
        True -> case and (map (\d' -> spiDevClockHz d' <= 500000) devices) of
          False -> err "with any device clock speed over 500khz" -- XXX if we go higher, we drop interrupts
          True -> canonicalp
  eqname a b = spiName a == spiName b
  err m = error ("spiTower cannot be created " ++ m)

spiPeripheralDriver :: forall e
                     . (e -> ClockConfig)
                    -> SPI
                    -> SPIPins
                    -> [SPIDevice]
                    -> ChanOutput   ('Struct "spi_transaction_request")
                    -> ChanInput    ('Struct "spi_transaction_result")
                    -> ChanInput    ('Stored ITime)
                    -> ChanOutput ('Stored ITime)
                    -> ChanOutput ('Stored ITime)
                    -> Monitor e ()
spiPeripheralDriver tocc periph pins devices req_out res_in ready_in irq watchdog_per = do
  clockconfig <- fmap tocc getEnv
  monitorModuleDef $ hw_moduledef
  done <- state (named "done")
  shutdown <- stateInit (named "shutdown") (ival false)
  handler systemInit (named "initialize_hardware") $ do
    send_ready <- emitter ready_in 1
    callback $ \ now -> do
      spiInit        periph pins
      mapM_ spiDeviceInit devices
      store done true
      emit send_ready now
      interrupt_enable interrupt

  reqbuffer    <- state (named "reqbuffer")
  reqbufferpos <- state (named "reqbufferpos")

  resbuffer    <- state (named "resbuffer")
  resbufferpos <- state (named "resbufferpos")

  overruns     <- stateInit (named "overruns") (ival (0 :: Uint32))

  handler watchdog_per (named "shutdown_watchdog") $ do
    e <- emitter res_in 1
    callback $ \_ -> do
      do_shutdown <- deref shutdown
      when do_shutdown $ do
        sr <- getReg (spiRegSR periph)
        unless (bitToBool (sr #. spi_sr_bsy)) $ do
          spiBusEnd periph
          chooseDevice spiDeviceDeselect (reqbuffer ~> tx_device)
          emit e (constRef resbuffer)
          store done true
          store shutdown false

  handler irq (named "irq") $ do
    callback $ \_ -> do
      tx_pos <- deref reqbufferpos
      tx_sz  <- deref (reqbuffer ~> tx_len)
      rx_pos <- deref resbufferpos
      rx_sz  <- deref (resbuffer ~> rx_idx)

      sr <- getReg (spiRegSR periph)

      cond_
        [ bitToBool (sr #. spi_sr_rxne) ==> do
            when (rx_pos <? rx_sz) $ do
              r <- spiGetDR periph
              store ((resbuffer ~> rx_buf) ! rx_pos) r
              store resbufferpos (rx_pos + 1)
            when (tx_pos <? tx_sz) $ do
              comment "still more to send"
              modifyReg (spiRegCR2 periph)
                (setBit spi_cr2_txeie >> clearBit spi_cr2_rxneie)
            when (rx_pos ==? (rx_sz - 1)) $ do
              comment "done receiving"
              modifyReg (spiRegCR2 periph)
                (setBit spi_cr2_txeie >> clearBit spi_cr2_rxneie)

        , bitToBool (sr #. spi_sr_txe) ==> do
            when (tx_pos <? tx_sz) $ do
              w <- deref ((reqbuffer ~> tx_buf) ! tx_pos)
              spiSetDR periph w
              store reqbufferpos (tx_pos + 1)
              when (rx_pos <? rx_sz) $ do
                comment "still more to receive"
                modifyReg (spiRegCR2 periph)
                  (clearBit spi_cr2_txeie >> setBit spi_cr2_rxneie)
            when (tx_pos >=? tx_sz .&& rx_pos >=? (rx_sz - 1) .&&
                  iNot (bitToBool (sr #. spi_sr_bsy))) $ do
              comment "transaction done; disable interrupts and let watchdog"
              comment "shut down the device once the bus isn't busy"
              modifyReg (spiRegCR2 periph) (clearBit spi_cr2_txeie)
              store shutdown true
        ]
      interrupt_enable interrupt

  let deviceBeginProc :: SPIDevice -> Def('[]:->())
      deviceBeginProc dev = proc ((spiDevName dev) ++ "_devicebegin") $
        body $ do
          spiBusBegin clockconfig dev
          spiDeviceSelect dev

  monitorModuleDef $ do
    mapM_ (incl . deviceBeginProc) devices

  handler req_out (named "request") $ do
    callback $ \req -> do
      ready <- deref done
      when ready $ do
        store done false
        -- Initialize request and result state
        refCopy reqbuffer req
        reqlen <- deref (reqbuffer ~> tx_len)
        store reqbufferpos 0
        store resbufferpos 0
        store (resbuffer ~> rx_idx) reqlen
        -- Get the first byte to transmit
        tx0 <- deref ((reqbuffer ~> tx_buf) ! 0)
        store reqbufferpos 1
        -- select the device and setup the spi peripheral
        chooseDevice (call_ . deviceBeginProc) (reqbuffer ~> tx_device)
        -- Send the first byte, enable tx empty interrupt
        spiSetDR  periph tx0
        modifyReg (spiRegCR2 periph) (setBit spi_cr2_txeie)

      unless ready $ do
        -- This means that the request/response protocol is not followed
        -- correctly and a transaction is still pending when new one arrives.
        -- We could assert here, but instead we just increment overruns
        -- variable that can be checked via gdb
        overruns += 1

  where
  named nm = spiName periph ++ "_" ++ nm

  interrupt = spiInterrupt periph

  chooseDevice :: (SPIDevice -> Ivory eff ())
               -> Ref 'Global ('Stored SPIDeviceHandle) -> Ivory eff ()
  chooseDevice cb devref = do
    comment "selecting device:"
    currdev <- deref devref
    assert (currdev <? invalidhandle)
    cond_ (zipWith (aux currdev) devices [(0::Integer)..])
    comment "end selecting configured device"
    where
    invalidhandle = SPIDeviceHandle (fromIntegral (length devices))
    aux cd device idx =
      cd ==? SPIDeviceHandle (fromIntegral idx) ==> cb device
