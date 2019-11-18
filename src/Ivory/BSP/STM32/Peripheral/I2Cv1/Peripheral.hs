{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE Rank2Types #-}
{-# LANGUAGE DataKinds #-}
--
-- Peripheral.hs --- I2C peripheral driver for the STM32F4.
--

module Ivory.BSP.STM32.Peripheral.I2Cv1.Peripheral where

import Control.Monad (replicateM_)

import Ivory.Language
import Ivory.HW
import Ivory.Stdlib

import Ivory.BSP.STM32.Interrupt
import Ivory.BSP.STM32.Peripheral.GPIO

import Ivory.BSP.STM32.ClockConfig
import Ivory.BSP.STM32.Peripheral.I2Cv1.Regs

data I2C = I2C
  { i2cRegCR1     :: BitDataReg I2C_CR1
  , i2cRegCR2     :: BitDataReg I2C_CR2
  , i2cRegOAR1    :: BitDataReg I2C_OAR1
  , i2cRegOAR2    :: BitDataReg I2C_OAR2
  , i2cRegDR      :: BitDataReg I2C_DR
  , i2cRegSR1     :: BitDataReg I2C_SR1
  , i2cRegSR2     :: BitDataReg I2C_SR2
  , i2cRegCCR     :: BitDataReg I2C_CCR
  , i2cRegTRISE   :: BitDataReg I2C_TRISE
  , i2cRCCEnable   :: forall eff . Ivory eff ()
  , i2cRCCDisable  :: forall eff . Ivory eff ()
  , i2cRCCReset    :: forall eff . Ivory eff ()
  , i2cIntEvent    :: HasSTM32Interrupt
  , i2cIntError    :: HasSTM32Interrupt
  , i2cPClk        :: PClk
  , i2cAFLookup    :: GPIOPin -> GPIO_AF
  , i2cName        :: String
  }

mkI2C :: (STM32Interrupt i)
            => Integer -- Base
            -> (forall eff . Ivory eff ()) -- RCC Enable
            -> (forall eff . Ivory eff ()) -- RCC Disable
            -> (forall eff . Ivory eff ()) -- RCC Reset
            -> i -- event interrupt
            -> i -- error interrupt
            -> PClk   -- Clock source
            -> (GPIOPin -> GPIO_AF)
            -> String -- Name
            -> I2C
mkI2C base rccenable rccdisable rccreset evtint errint pclk afLookup n = I2C
  { i2cRegCR1     = reg 0x0 "cr1"
  , i2cRegCR2     = reg 0x4 "cr2"
  , i2cRegOAR1    = reg 0x8 "oar1"
  , i2cRegOAR2    = reg 0xc "oar2"
  , i2cRegDR      = reg 0x10 "dr"
  , i2cRegSR1     = reg 0x14 "sr1"
  , i2cRegSR2     = reg 0x18 "sr2"
  , i2cRegCCR     = reg 0x1c "ccr"
  , i2cRegTRISE   = reg 0x20 "trise"
    , i2cRCCEnable  = rccenable
    , i2cRCCDisable = rccdisable
    , i2cRCCReset   = rccreset
    , i2cIntEvent   = HasSTM32Interrupt evtint
    , i2cIntError   = HasSTM32Interrupt errint
    , i2cPClk       = pclk
    , i2cAFLookup   = afLookup
    , i2cName       = n
    }
  where
  reg :: (IvoryIOReg (BitDataRep d)) => Integer -> String -> BitDataReg d
  reg offs name = mkBitDataRegNamed (base + offs) (n ++ "->" ++ name)

i2cInit :: (GetAlloc eff ~ 'Scope cs)
        => I2C
        -> GPIOPin
        -> GPIOPin
        -> ClockConfig
        -> Integer
        -> Ivory eff ()
i2cInit periph sda scl clockconfig freq = do
  i2cRCCEnable periph
  pinsetup sda
  pinsetup scl

  -- Reset and clear peripheral
  setReg (i2cRegCR1 periph) clear
  setReg (i2cRegCR2 periph) clear
  setReg (i2cRegSR1 periph) clear
  setReg (i2cRegSR2 periph) clear

  replicateM_ 32 $
    modifyReg (i2cRegCR1 periph) $ setBit i2c_cr1_swrst
  modifyReg (i2cRegCR1 periph) $ clearBit i2c_cr1_swrst

  modifyReg (i2cRegCR2 periph) $ do
    setField i2c_cr2_freq (fromRep (42 :: Uint8))

  modifyReg (i2cRegCR2 periph) $ do
    setBit i2c_cr2_itbufen
    setBit i2c_cr2_itevten
    setBit i2c_cr2_iterren

  pclk1 <- assign (fromIntegral (clockPClkHz (i2cPClk periph) clockconfig))
  ccr   <- calcHSCCR pclk1
  modifyReg (i2cRegCCR periph) $ do
    setBit i2c_ccr_f_s
    setBit i2c_ccr_duty
    setField i2c_ccr_ccr (fromRep ccr)

  modifyReg (i2cRegCR1 periph) $ setBit i2c_cr1_pe
  where
  calcHSCCR :: Uint32 -> Ivory eff Uint16
  calcHSCCR pclk = do
    -- Need to divide clock to use 25 cycles (DUTY mode is 16 low + 9 high)
    -- at 400khz. Clock divider must be at least 1.
    v <- assign $ castWith 0 (pclk `iDiv` (fromIntegral freq * 25))
    assign ((v <? 1) ? (1, v))

  pinsetup :: GPIOPin -> Ivory eff ()
  pinsetup p = do
    pinEnable        p
    pinSetOutputType p gpio_outputtype_opendrain
    pinSetPUPD       p gpio_pupd_none
    pinSetAF         p (i2cAFLookup periph p)
    pinSetMode       p gpio_mode_af

i2cDeinit :: I2C -> GPIOPin -> GPIOPin -> Ivory eff ()
i2cDeinit periph sda scl = do
  setReg (i2cRegCR1 periph) clear
  pinUnconfigure sda
  pinUnconfigure scl
  i2cRCCReset periph
  i2cRCCDisable periph

-- | Reset an I2C peripheral and bus by reinitializing the peripheral
-- and attempting to clear any stuck devices on the bus by toggling
-- GPIOs. Procedure adapted from PX4/NuttX
i2cReset
  :: (GetBreaks (AllowBreak eff) ~ 'Break,
      GetAlloc eff ~ 'Scope cs)
  => I2C
  -> GPIOPin
  -> GPIOPin
  -> ClockConfig
  -> Integer
  -> Ivory eff ()
i2cReset periph sda scl clockconfig freq = do
  i2cDeinit periph sda scl
  let pinSetup p = do
        pinEnable        p
        pinSetOutputType p gpio_outputtype_opendrain
        pinSetSpeed      p gpio_speed_50mhz
        pinSetPUPD       p gpio_pupd_none
        pinSetMode       p gpio_mode_output
  pinSetup sda
  pinSetup scl

  times (500 :: Ix 501) $ \_ -> do
    isClear <- pinRead sda
    when isClear breakOut

    -- jiggle the handle
    replicateM_ 16 (pinSet scl)
    replicateM_ 16 (pinClear scl)

  -- generate a stop followed by a start to reset other devices
  replicateM_ 16 (pinClear sda)
  replicateM_ 16 (pinClear scl)
  replicateM_ 16 (pinSet scl)
  replicateM_ 16 (pinSet sda)

  -- let go of the GPIOs and reinit the peripheral
  pinUnconfigure sda
  pinUnconfigure scl
  i2cInit periph sda scl clockconfig freq
