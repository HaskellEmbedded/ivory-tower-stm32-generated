{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE Rank2Types #-}

module Ivory.BSP.STM32.Peripheral.EXTIv2.Peripheral where

import Ivory.Language

import Ivory.HW

import Ivory.BSP.STM32.Interrupt
import Ivory.BSP.STM32.Peripheral.EXTI.RegTypes
import Ivory.BSP.STM32.Peripheral.EXTIv2.Regs

-- Convenience type synonyms
data EXTI = EXTI
  { extiRegRTSR1   :: BitDataReg EXTI_RTSR1
  , extiRegFTSR1   :: BitDataReg EXTI_FTSR1
  , extiRegSWIER1  :: BitDataReg EXTI_SWIER1
  , extiRegRPR1    :: BitDataReg EXTI_RPR1
  , extiRegFPR1    :: BitDataReg EXTI_FPR1
  , extiRegEXTICR1 :: BitDataReg EXTI_EXTICR1
  , extiRegEXTICR2 :: BitDataReg EXTI_EXTICR2
  , extiRegEXTICR3 :: BitDataReg EXTI_EXTICR3
  , extiRegEXTICR4 :: BitDataReg EXTI_EXTICR4
  , extiRegIMR1    :: BitDataReg EXTI_IMR1
  , extiRegEMR1    :: BitDataReg EXTI_EMR1
  , extiInterrupts :: [(Int, Int, HasSTM32Interrupt)]
  , extiEnable     :: forall eff . Ivory eff ()
  , extiDisable    :: forall eff . Ivory eff ()
  , extiCR1        :: BitDataReg (EXTI_EXTICR)
  , extiCR2        :: BitDataReg (EXTI_EXTICR)
  , extiCR3        :: BitDataReg (EXTI_EXTICR)
  , extiCR4        :: BitDataReg (EXTI_EXTICR)
  }

-- set extiCRx to internal registers via this fixed point function
fix :: EXTI -> EXTI
fix e = e
  { extiCR1 = cvtReg $ extiRegEXTICR1 e
  , extiCR2 = cvtReg $ extiRegEXTICR2 e
  , extiCR3 = cvtReg $ extiRegEXTICR3 e
  , extiCR4 = cvtReg $ extiRegEXTICR4 e
  }

-- | Create an EXTI given the base register address.
mkEXTI  :: (STM32Interrupt i)
       => Integer
       -> (forall eff . Ivory eff ())
       -> (forall eff . Ivory eff ())
       -> BitDataReg (EXTI_EXTICR)
       -> BitDataReg (EXTI_EXTICR)
       -> BitDataReg (EXTI_EXTICR)
       -> BitDataReg (EXTI_EXTICR)
       -> [(Int, Int, i)]
       -> EXTI
mkEXTI base syscfgrccen syscfgrccdis r1 r2 r3 r4 isrs = fix $ EXTI
  { extiRegRTSR1   = reg 0x0 "rtsr1"
  , extiRegFTSR1   = reg 0x4 "ftsr1"
  , extiRegSWIER1  = reg 0x8 "swier1"
  , extiRegRPR1    = reg 0xc "rpr1"
  , extiRegFPR1    = reg 0x10 "fpr1"
  , extiRegEXTICR1 = reg 0x60 "exticr1"
  , extiRegEXTICR2 = reg 0x64 "exticr2"
  , extiRegEXTICR3 = reg 0x68 "exticr3"
  , extiRegEXTICR4 = reg 0x6c "exticr4"
  , extiRegIMR1    = reg 0x80 "imr1"
  , extiRegEMR1    = reg 0x84 "emr1"
    , extiInterrupts = map (\(s, e, i) -> (s, e, HasSTM32Interrupt i)) isrs
    , extiEnable = syscfgrccen
    , extiDisable = syscfgrccdis
    , extiCR1 = r1
    , extiCR2 = r2
    , extiCR3 = r3
    , extiCR4 = r4
    }
  where
  reg :: (IvoryIOReg (BitDataRep d)) => Integer -> String -> BitDataReg d
  reg offs name = mkBitDataRegNamed (base + offs) ("exti->" ++ name)

