{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE Rank2Types #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE TypeOperators #-}
--
-- Peripheral.hs --- UART Peripheral Description
-- UART Peripheral type and constructor
--

module Ivory.BSP.STM32.Peripheral.UARTv3.Peripheral where

import qualified Data.List as L

import Ivory.Language

import Ivory.HW

import Ivory.BSP.STM32.Interrupt
import Ivory.BSP.STM32.ClockConfig
import Ivory.BSP.STM32.Peripheral.GPIO

import Ivory.BSP.STM32.Peripheral.UART.Pins
import Ivory.BSP.STM32.Peripheral.UART.RegTypes
import Ivory.BSP.STM32.Peripheral.UARTv3.Regs

data UART = UART
  { uartRegCR1     :: BitDataReg UART_CR1
  , uartRegCR2     :: BitDataReg UART_CR2
  , uartRegCR3     :: BitDataReg UART_CR3
  , uartRegBRR     :: BitDataReg UART_BRR
  , uartRegGTPR    :: BitDataReg UART_GTPR
  , uartRegRTOR    :: BitDataReg UART_RTOR
  , uartRegRQR     :: BitDataReg UART_RQR
  , uartRegISR     :: BitDataReg UART_ISR
  , uartRegICR     :: BitDataReg UART_ICR
  , uartRegRDR     :: BitDataReg UART_RDR
  , uartRegTDR     :: BitDataReg UART_TDR
  , uartRCCEnable  :: forall eff . Ivory eff ()
  , uartRCCDisable :: forall eff . Ivory eff ()
  , uartInterrupt  :: HasSTM32Interrupt
  , uartPClk       :: PClk
  , uartAFLookup   :: GPIOPin -> GPIO_AF
  , uartName       :: String
  }

mkUART :: (STM32Interrupt i)
       => Integer
       -> (forall eff . Ivory eff ())
       -> (forall eff . Ivory eff ())
       -> i
       -> PClk
       -> (GPIOPin -> GPIO_AF)
       -> String
       -> UART
mkUART base rccen rccdis interrupt pclk afLookup n = UART
  { uartRegCR1     = reg 0x0 "cr1"
  , uartRegCR2     = reg 0x4 "cr2"
  , uartRegCR3     = reg 0x8 "cr3"
  , uartRegBRR     = reg 0xc "brr"
  , uartRegGTPR    = reg 0x10 "gtpr"
  , uartRegRTOR    = reg 0x14 "rtor"
  , uartRegRQR     = reg 0x18 "rqr"
  , uartRegISR     = reg 0x1c "isr"
  , uartRegICR     = reg 0x20 "icr"
  , uartRegRDR     = reg 0x24 "rdr"
  , uartRegTDR     = reg 0x28 "tdr"
  , uartRCCEnable  = rccen
  , uartRCCDisable = rccdis
  , uartInterrupt  = HasSTM32Interrupt interrupt
  , uartPClk       = pclk
  , uartAFLookup   = afLookup
  , uartName       = n
  }
  where
  reg :: (IvoryIOReg (BitDataRep d)) => Integer -> String -> BitDataReg d
  reg offs name = mkBitDataRegNamed (base + offs) (n ++ "->" ++ name)


-- | Initialize GPIO pins for a UART.
initPin :: UART -> GPIOPin -> Ivory eff ()
initPin uart p = do
  pinEnable        p
  pinSetSpeed      p gpio_speed_50mhz
  pinSetOutputType p gpio_outputtype_pushpull
  pinSetPUPD       p gpio_pupd_pullup
  pinSetAF         p (uartAFLookup uart p)
  pinSetMode       p gpio_mode_af

-- | Set the BRR register of a UART given a baud rate.
setBaudRate :: (GetAlloc eff ~ 'Scope s)
            => UART -> ClockConfig -> Uint32 -> Ivory eff ()
setBaudRate uart clockconfig baud = do
  case "lpuart" `L.isPrefixOf` (uartName uart) of
    False -> do
      -- simplified without over8 this is just
      -- (pclk + baud `iDiv` 2 ) `iDiv` baud
      pclk    <- assign (fromIntegral (clockPClkHz (uartPClk uart) clockconfig))
      cr1     <- getReg (uartRegCR1 uart)
      isOver8 <- assign (bitToBool (cr1 #. uart_cr1_over8))
      ipart   <- assign ((25 * pclk) `iDiv` (baud * (isOver8 ? (2, 4))))
      mask    <- assign ((ipart `iDiv` 100) `iShiftL` 4)
      fpart   <- assign (ipart - (100 * (mask `iShiftR` 4)))
      brr     <- assign (mask .|
                         (isOver8 ?
                          ( (((fpart * 8)  + 50) `iDiv` 100) .& 0x07
                          , (((fpart * 16) + 50) `iDiv` 100) .& 0x0f)))
      setReg (uartRegBRR uart) $ do
        setField uart_brr_brr (fromRep (safeCast $ lbits brr))
    True -> do
      -- for LPUART BRR formula is the only difference
      pclk <- assign (fromIntegral (clockPClkHz (uartPClk uart) clockconfig))
      brr  <- assign $
        (pclk `iDiv` baud) * 256
        + ((pclk .% baud) * 256 + baud `iDiv` 2) `iDiv` baud

      setReg (uartRegBRR uart) $ do
        setField uart_brr_brr (fromRep brr)

-- | Configure the stop bits for a UART.
setStopBits :: UART -> UART_StopBits -> Ivory eff ()
setStopBits uart x =
  modifyReg (uartRegCR2 uart) $
    setField uart_cr2_stop x

-- | Configure the word length for a UART.
setWordLen :: UART -> UART_WordLen -> Ivory eff ()
setWordLen uart x =
  modifyReg (uartRegCR1 uart) $
    setField uart_cr1_m0 x

-- | Configure the parity setting for a UART.
setParity :: UART -> IBool -> Ivory eff ()
setParity uart x =
  modifyReg (uartRegCR1 uart) $
    setField uart_cr1_pce (boolToBit x)

-- | Initialize a UART device given a baud rate.
uartInit :: (GetAlloc eff ~ 'Scope s)
         => UART -> UARTPins -> ClockConfig -> Uint32 -> Bool -> Ivory eff ()
uartInit uart pins clockconfig baud useinterrupts = do
  -- Enable the peripheral clock and set up GPIOs.
  uartRCCEnable uart
  initPin uart (uartPinTx pins)
  initPin uart (uartPinRx pins)

  -- Initialize the baud rate and other settings.
  setBaudRate uart clockconfig baud
  setStopBits uart uart_stop_bits_1_0
  setWordLen  uart uart_word_len_8
  setParity   uart false

  interrupt_enable $ uartInterrupt uart

  -- enable rxne interrupt, transmitter, and receiver.
  modifyReg (uartRegCR1 uart) $ do
    -- XXX: we shouldn't have to set txeie here - but if we don't, txe interrupt
    -- will never fire until an rxneie interrupt has occured. this wasn't the
    -- case in the old hwf4 code, and i can't explain the root cause of this
    -- bug.
    case useinterrupts of
      True -> do
        setBit uart_cr1_txeie
        setBit uart_cr1_rxneie
      _ -> return ()

    setBit uart_cr1_te
    setBit uart_cr1_re

  -- Enable the UART
  modifyReg (uartRegCR1 uart) $ do
    setBit uart_cr1_ue

-- | Set the UART data register.
setDR :: UART -> Uint8 -> Ivory eff ()
setDR uart b =
  setReg (uartRegTDR uart) $
    setField uart_tdr_tdr (fromRep b)

-- | Read the UART data register.
readDR :: UART -> Ivory eff Uint8
readDR uart = do
  dr <- getReg (uartRegRDR uart)
  return (toRep (dr #. uart_rdr_rdr))

-- | Enable or disable the "TXE" interrupt.
setTXEIE :: UART -> IBool -> Ivory eff ()
setTXEIE uart x =
  modifyReg (uartRegCR1 uart) $
    setField uart_cr1_txeie (boolToBit x)

-- | See whether "TXE" interrupt is enabled.
getTXEIE :: UART -> Ivory eff IBool
getTXEIE uart = do
  cr1 <- getReg (uartRegCR1 uart)
  return $ bitToBool (cr1 #. uart_cr1_txeie)

-- | Enable or disable the "RXNE" interrupt.
setRXNEIE :: UART -> IBool -> Ivory eff ()
setRXNEIE uart x =
  modifyReg (uartRegCR1 uart) $
    setField uart_cr1_rxneie (boolToBit x)

-- clear overrun (ORE) flag
clearORE :: UART -> Ivory eff ()
clearORE uart =
  modifyReg (uartRegICR uart) $
    setBit uart_icr_orecf
