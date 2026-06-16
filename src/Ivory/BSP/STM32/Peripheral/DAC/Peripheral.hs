{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE Rank2Types #-}

module Ivory.BSP.STM32.Peripheral.DAC.Peripheral where

import Ivory.HW
import Ivory.Language

import Ivory.BSP.STM32.Interrupt
import Ivory.BSP.STM32.Peripheral.DAC.Regs

data DAC = DAC
  { dacRegCR      :: BitDataReg DAC_CR
  , dacRegSWTRIGR :: BitDataReg DAC_SWTRIGR
  , dacRegDHR12R1 :: BitDataReg DAC_DHR12R1
  , dacRegDHR12L1 :: BitDataReg DAC_DHR12L1
  , dacRegDHR8R1  :: BitDataReg DAC_DHR8R1
  , dacRegDHR12R2 :: BitDataReg DAC_DHR12R2
  , dacRegDHR12L2 :: BitDataReg DAC_DHR12L2
  , dacRegDHR8R2  :: BitDataReg DAC_DHR8R2
  , dacRegDHR12RD :: BitDataReg DAC_DHR12RD
  , dacRegDHR12LD :: BitDataReg DAC_DHR12LD
  , dacRegDHR8RD  :: BitDataReg DAC_DHR8RD
  , dacRegDOR1    :: BitDataReg DAC_DOR1
  , dacRegDOR2    :: BitDataReg DAC_DOR2
  , dacRegSR      :: BitDataReg DAC_SR
  , dacRCCEnable  :: forall eff . Ivory eff ()
  , dacRCCDisable :: forall eff . Ivory eff ()
  , dacInt        :: HasSTM32Interrupt
  , dacName       :: String
  }

-- | Create DAC given the base register address, global interrupt and its name
mkDAC
  :: (STM32Interrupt i)
  => Integer -- ^ Base
  -> (forall eff . Ivory eff ()) -- ^ RCC Enable
  -> (forall eff . Ivory eff ()) -- ^ RCC Disable
  -> i -- ^ dac underrun interrupt
  -> String -- ^ Name
  -> DAC
mkDAC base rccen rccdis int n = DAC
  { dacRegCR      = reg 0x0 "cr"
  , dacRegSWTRIGR = reg 0x4 "swtrigr"
  , dacRegDHR12R1 = reg 0x8 "dhr12r1"
  , dacRegDHR12L1 = reg 0xc "dhr12l1"
  , dacRegDHR8R1  = reg 0x10 "dhr8r1"
  , dacRegDHR12R2 = reg 0x14 "dhr12r2"
  , dacRegDHR12L2 = reg 0x18 "dhr12l2"
  , dacRegDHR8R2  = reg 0x1c "dhr8r2"
  , dacRegDHR12RD = reg 0x20 "dhr12rd"
  , dacRegDHR12LD = reg 0x24 "dhr12ld"
  , dacRegDHR8RD  = reg 0x28 "dhr8rd"
  , dacRegDOR1    = reg 0x2c "dor1"
  , dacRegDOR2    = reg 0x30 "dor2"
  , dacRegSR      = reg 0x34 "sr"
  -- common status and control registers
  , dacRCCEnable  = rccen
  , dacRCCDisable = rccdis
  , dacInt        = HasSTM32Interrupt int
  , dacName       = n
  }
  where
  reg :: (IvoryIOReg (BitDataRep d)) => Integer -> String -> BitDataReg d
  reg offs name = mkBitDataRegNamed (base + offs) (n ++ "->" ++ name)

data DACChannel
  = DACChannel_1
  | DACChannel_2
  deriving (Eq, Enum, Ord, Show)

data DACMode
  = DACMode_8Bit_RightAligned
  | DACMode_12Bit_LeftAligned
  | DACMode_12Bit_RightAligned
  deriving (Eq, Enum, Ord, Show)

data DACBuffering
  = DACBuffering_Buffered -- ^ Default
  | DACBuffering_Unbuffered
  deriving (Eq, Enum, Ord, Show)

-- | Enable DAC peripheral
dacInit
  :: DAC
  -> Ivory eff ()
dacInit periph = do
  dacRCCEnable periph

-- | Enable a DAC channel
dacEnableChannel
  :: DAC
  -> DACChannel
  -> DACBuffering
  -> Ivory eff ()
dacEnableChannel periph chan buffering =
  modifyReg (dacRegCR periph)
    $ case chan of
        DACChannel_1 -> do
          case buffering of
            DACBuffering_Buffered ->
              clearBit dac_cr_boff1
            DACBuffering_Unbuffered ->
              setBit dac_cr_boff1

          setBit dac_cr_en1

        DACChannel_2 -> do
          case buffering of
            DACBuffering_Buffered ->
              clearBit dac_cr_boff2
            DACBuffering_Unbuffered ->
              setBit dac_cr_boff2

          setBit dac_cr_en2

-- | Write a new value to DAC channel
-- and poke its software trigger
dacWrite
  :: DAC
  -> DACChannel
  -> DACMode -- ^ Bit width and alignment
  -> Uint16
  -> Ivory eff ()
dacWrite periph chan mode val = do
  case chan of
    DACChannel_1 -> do
      case mode of
        DACMode_8Bit_RightAligned ->
          setReg (dacRegDHR8R1 periph)
            $ setField dac_dhr8r1_dacc1dhr
            $ fromRep
            $ bitCast val
        DACMode_12Bit_LeftAligned ->
          setReg (dacRegDHR12L1 periph)
            $ setField dac_dhr12l1_dacc1dhr
            $ fromRep
            $ bitCast val
        DACMode_12Bit_RightAligned ->
          setReg (dacRegDHR12R1 periph)
            $ setField dac_dhr12r1_dacc1dhr
            $ fromRep
            $ bitCast val

    DACChannel_2 -> do
      case mode of
        DACMode_8Bit_RightAligned ->
          setReg (dacRegDHR8R2 periph)
            $ setField dac_dhr8r2_dacc2dhr
            $ fromRep
            $ bitCast val
        DACMode_12Bit_LeftAligned ->
          setReg (dacRegDHR12L2 periph)
            $ setField dac_dhr12l2_dacc2dhr
            $ fromRep
            $ bitCast val
        DACMode_12Bit_RightAligned ->
          setReg (dacRegDHR12R2 periph)
            $ setField dac_dhr12r2_dacc2dhr
            $ fromRep
            $ bitCast val
