{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE Rank2Types #-}

module Ivory.BSP.STM32F745.SYSCFG.Peripheral where

import Ivory.Language

import Ivory.HW

import Ivory.BSP.STM32F745.SYSCFG.Regs

-- Convenience type synonyms
data SYSCFG = SYSCFG
  { syscfgRegMEMRM   :: BitDataReg SYSCFG_MEMRM
  , syscfgRegPMC     :: BitDataReg SYSCFG_PMC
  , syscfgRegEXTICR1 :: BitDataReg SYSCFG_EXTICR1
  , syscfgRegEXTICR2 :: BitDataReg SYSCFG_EXTICR2
  , syscfgRegEXTICR3 :: BitDataReg SYSCFG_EXTICR3
  , syscfgRegEXTICR4 :: BitDataReg SYSCFG_EXTICR4
  , syscfgRegCMPCR   :: BitDataReg SYSCFG_CMPCR
  , syscfgRCCEnable       :: forall eff . Ivory eff ()
  , syscfgRCCDisable      :: forall eff . Ivory eff ()
  }

-- | Create SYSCFG given the base register address.
mkSYSCFG  :: Integer
       -> (forall eff . Ivory eff ())
       -> (forall eff . Ivory eff ())
       -> SYSCFG
mkSYSCFG base rccen rccdis = SYSCFG
  { syscfgRegMEMRM   = reg 0x0 "memrm"
  , syscfgRegPMC     = reg 0x4 "pmc"
  , syscfgRegEXTICR1 = reg 0x8 "exticr1"
  , syscfgRegEXTICR2 = reg 0xc "exticr2"
  , syscfgRegEXTICR3 = reg 0x10 "exticr3"
  , syscfgRegEXTICR4 = reg 0x14 "exticr4"
  , syscfgRegCMPCR   = reg 0x20 "cmpcr"
    , syscfgRCCEnable      = rccen
    , syscfgRCCDisable     = rccdis
    }
  where
  reg :: (IvoryIOReg (BitDataRep d)) => Integer -> String -> BitDataReg d
  reg offs name = mkBitDataRegNamed (base + offs) ("syscfg->" ++ name)
