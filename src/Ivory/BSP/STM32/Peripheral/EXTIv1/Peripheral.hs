{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE Rank2Types #-}

module Ivory.BSP.STM32.Peripheral.EXTIv1.Peripheral where

import Ivory.Language

import Ivory.HW

import Ivory.BSP.STM32.Interrupt
import Ivory.BSP.STM32.Peripheral.EXTI.RegTypes
import Ivory.BSP.STM32.Peripheral.EXTIv1.Regs

-- Convenience type synonyms
data EXTI = EXTI
  { extiRegIMR     :: BitDataReg EXTI_IMR
  , extiRegEMR     :: BitDataReg EXTI_EMR
  , extiRegRTSR    :: BitDataReg EXTI_RTSR
  , extiRegFTSR    :: BitDataReg EXTI_FTSR
  , extiRegSWIER   :: BitDataReg EXTI_SWIER
  , extiRegPR      :: BitDataReg EXTI_PR
  , extiInterrupts :: [(Int, Int, HasSTM32Interrupt)]
  , extiEnable     :: forall eff . Ivory eff ()
  , extiDisable    :: forall eff . Ivory eff ()
  , extiCR1        :: BitDataReg (EXTI_EXTICR)
  , extiCR2        :: BitDataReg (EXTI_EXTICR)
  , extiCR3        :: BitDataReg (EXTI_EXTICR)
  , extiCR4        :: BitDataReg (EXTI_EXTICR)
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
mkEXTI base syscfgrccen syscfgrccdis r1 r2 r3 r4 isrs = EXTI
  { extiRegIMR     = reg 0x0 "imr"
  , extiRegEMR     = reg 0x4 "emr"
  , extiRegRTSR    = reg 0x8 "rtsr"
  , extiRegFTSR    = reg 0xc "ftsr"
  , extiRegSWIER   = reg 0x10 "swier"
  , extiRegPR      = reg 0x14 "pr"
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

