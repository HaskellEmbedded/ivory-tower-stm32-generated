{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE Rank2Types #-}

module Ivory.BSP.STM32.Peripheral.ADC.Peripheral where

import Ivory.HW
import Ivory.Language

import Ivory.BSP.STM32.Interrupt
import Ivory.BSP.STM32.Peripheral.ADC.CommonRegs
import Ivory.BSP.STM32.Peripheral.ADC.Regs
import Ivory.BSP.STM32.Peripheral.ADC.RegTypes

data ADC = ADC
  { adcRegSR      :: BitDataReg ADC_SR
  , adcRegCR1     :: BitDataReg ADC_CR1
  , adcRegCR2     :: BitDataReg ADC_CR2
  , adcRegSMPR1   :: BitDataReg ADC_SMPR1
  , adcRegSMPR2   :: BitDataReg ADC_SMPR2
  , adcRegJOFR1   :: BitDataReg ADC_JOFR1
  , adcRegJOFR2   :: BitDataReg ADC_JOFR2
  , adcRegJOFR3   :: BitDataReg ADC_JOFR3
  , adcRegJOFR4   :: BitDataReg ADC_JOFR4
  , adcRegHTR     :: BitDataReg ADC_HTR
  , adcRegLTR     :: BitDataReg ADC_LTR
  , adcRegSQR1    :: BitDataReg ADC_SQR1
  , adcRegSQR2    :: BitDataReg ADC_SQR2
  , adcRegSQR3    :: BitDataReg ADC_SQR3
  , adcRegJSQR    :: BitDataReg ADC_JSQR
  , adcRegJDR1    :: BitDataReg ADC_JDR1
  , adcRegJDR2    :: BitDataReg ADC_JDR2
  , adcRegJDR3    :: BitDataReg ADC_JDR3
  , adcRegJDR4    :: BitDataReg ADC_JDR4
  , adcRegDR      :: BitDataReg ADC_DR
  , adcRegCSR :: BitDataReg ADC_CSR
  , adcRegCCR :: BitDataReg ADC_CCR
  , adcRegCDR :: BitDataReg ADC_CDR
  , adcRCCEnable :: forall eff . Ivory eff ()
  , adcRCCDisable :: forall eff . Ivory eff ()
  , adcInt :: HasSTM32Interrupt
  , adcName :: String
  }

-- | Create ADC given the base register address, global interrupt and its name
mkADC
  :: (STM32Interrupt i)
  => Integer -- ^ Base
  -> Integer -- ^ Base for common status, control, data registers
  -> (forall eff . Ivory eff ()) -- ^ RCC Enable
  -> (forall eff . Ivory eff ()) -- ^ RCC Disable
  -> i -- ^ global adc interrupt. NB: shared with other adc periphs!
  -> String -- ^ Name
  -> ADC
mkADC base commonBase rccen rccdis int n = ADC
  { adcRegSR      = reg 0x0 "sr"
  , adcRegCR1     = reg 0x4 "cr1"
  , adcRegCR2     = reg 0x8 "cr2"
  , adcRegSMPR1   = reg 0xc "smpr1"
  , adcRegSMPR2   = reg 0x10 "smpr2"
  , adcRegJOFR1   = reg 0x14 "jofr1"
  , adcRegJOFR2   = reg 0x18 "jofr2"
  , adcRegJOFR3   = reg 0x1c "jofr3"
  , adcRegJOFR4   = reg 0x20 "jofr4"
  , adcRegHTR     = reg 0x24 "htr"
  , adcRegLTR     = reg 0x28 "ltr"
  , adcRegSQR1    = reg 0x2c "sqr1"
  , adcRegSQR2    = reg 0x30 "sqr2"
  , adcRegSQR3    = reg 0x34 "sqr3"
  , adcRegJSQR    = reg 0x38 "jsqr"
  , adcRegJDR1    = reg 0x3c "jdr1"
  , adcRegJDR2    = reg 0x40 "jdr2"
  , adcRegJDR3    = reg 0x44 "jdr3"
  , adcRegJDR4    = reg 0x48 "jdr4"
  , adcRegDR      = reg 0x4c "dr"
  -- common status and control registers
  -- offset: ADC1 base address + 0x300
  , adcRegCSR     = commonReg 0x300 "csr"
  , adcRegCCR     = commonReg 0x304 "ccr"
  , adcRegCDR     = commonReg 0x308 "cdr"
  , adcRCCEnable  = rccen
  , adcRCCDisable = rccdis
  , adcInt        = HasSTM32Interrupt int
  , adcName       = n
  }
  where
  reg :: (IvoryIOReg (BitDataRep d)) => Integer -> String -> BitDataReg d
  reg offs name = mkBitDataRegNamed (base + offs) (n ++ "->" ++ name)
  commonReg :: (IvoryIOReg (BitDataRep d)) => Integer -> String -> BitDataReg d
  commonReg offs name = mkBitDataRegNamed (commonBase + offs) (n ++ "->" ++ name ++ "(common)")

adcInit
  :: ADC
  -> ADCResolution -- ^ How many bits of precision to use in conversion?
  -> IBool -- ^ Left-align converted bits in 16-bit data register?
  -> Ivory eff ()
adcInit periph res align = do
  adcRCCEnable periph
  modifyReg (adcRegCR1 periph) $ do
    setField adc_cr1_res res
  modifyReg (adcRegCR2 periph) $ do
    setField adc_cr2_align $ boolToBit align
    setBit adc_cr2_adon

adcStartConversion :: ADC -> Int -> Ivory eff ()
adcStartConversion periph chan = do
  setReg (adcRegSQR3 periph) $ do
    setField adc_sqr3_sq1 $ fromRep $ fromIntegral chan
  setReg (adcRegSQR1 periph) $ do
    setField adc_sqr1_l $ fromRep 1
  modifyReg (adcRegCR2 periph) $ do
    setBit adc_cr2_swstart
    clearBit adc_cr2_eocs
    clearBit adc_cr2_dma
    clearBit adc_cr2_cont

adcGetConversion :: ADC -> Ivory eff Uint16
adcGetConversion periph = do
  dr <- getReg (adcRegDR periph)
  return (toRep (dr #. adc_dr_data))

