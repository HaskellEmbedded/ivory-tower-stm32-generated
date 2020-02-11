{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE Rank2Types #-}

module Ivory.BSP.STM32F303.SYSCFG.Peripheral where

import Ivory.Language

import Ivory.HW

import Ivory.BSP.STM32F303.SYSCFG.Regs

-- Convenience type synonyms
data SYSCFG = SYSCFG
  { syscfgRegCFGR1      :: BitDataReg SYSCFG_CFGR1
  , syscfgRegEXTICR1    :: BitDataReg SYSCFG_EXTICR1
  , syscfgRegEXTICR2    :: BitDataReg SYSCFG_EXTICR2
  , syscfgRegEXTICR3    :: BitDataReg SYSCFG_EXTICR3
  , syscfgRegEXTICR4    :: BitDataReg SYSCFG_EXTICR4
  , syscfgRegCFGR2      :: BitDataReg SYSCFG_CFGR2
  , syscfgRegRCR        :: BitDataReg SYSCFG_RCR
  , syscfgRegCOMP1_CSR  :: BitDataReg SYSCFG_COMP1_CSR
  , syscfgRegCOMP2_CSR  :: BitDataReg SYSCFG_COMP2_CSR
  , syscfgRegCOMP3_CSR  :: BitDataReg SYSCFG_COMP3_CSR
  , syscfgRegCOMP4_CSR  :: BitDataReg SYSCFG_COMP4_CSR
  , syscfgRegCOMP5_CSR  :: BitDataReg SYSCFG_COMP5_CSR
  , syscfgRegCOMP6_CSR  :: BitDataReg SYSCFG_COMP6_CSR
  , syscfgRegCOMP7_CSR  :: BitDataReg SYSCFG_COMP7_CSR
  , syscfgRegOPAMP1_CSR :: BitDataReg SYSCFG_OPAMP1_CSR
  , syscfgRegOPAMP2_CSR :: BitDataReg SYSCFG_OPAMP2_CSR
  , syscfgRegOPAMP3_CSR :: BitDataReg SYSCFG_OPAMP3_CSR
  , syscfgRegOPAMP4_CSR :: BitDataReg SYSCFG_OPAMP4_CSR
  , syscfgRCCEnable       :: forall eff . Ivory eff ()
  , syscfgRCCDisable      :: forall eff . Ivory eff ()
  }

-- | Create SYSCFG given the base register address.
mkSYSCFG  :: Integer
       -> (forall eff . Ivory eff ())
       -> (forall eff . Ivory eff ())
       -> SYSCFG
mkSYSCFG base rccen rccdis = SYSCFG
  { syscfgRegCFGR1      = reg 0x0 "cfgr1"
  , syscfgRegEXTICR1    = reg 0x8 "exticr1"
  , syscfgRegEXTICR2    = reg 0xc "exticr2"
  , syscfgRegEXTICR3    = reg 0x10 "exticr3"
  , syscfgRegEXTICR4    = reg 0x14 "exticr4"
  , syscfgRegCFGR2      = reg 0x18 "cfgr2"
  , syscfgRegRCR        = reg 0x4 "rcr"
  , syscfgRegCOMP1_CSR  = reg 0x1c "comp1_csr"
  , syscfgRegCOMP2_CSR  = reg 0x20 "comp2_csr"
  , syscfgRegCOMP3_CSR  = reg 0x24 "comp3_csr"
  , syscfgRegCOMP4_CSR  = reg 0x28 "comp4_csr"
  , syscfgRegCOMP5_CSR  = reg 0x2c "comp5_csr"
  , syscfgRegCOMP6_CSR  = reg 0x30 "comp6_csr"
  , syscfgRegCOMP7_CSR  = reg 0x34 "comp7_csr"
  , syscfgRegOPAMP1_CSR = reg 0x38 "opamp1_csr"
  , syscfgRegOPAMP2_CSR = reg 0x3c "opamp2_csr"
  , syscfgRegOPAMP3_CSR = reg 0x40 "opamp3_csr"
  , syscfgRegOPAMP4_CSR = reg 0x44 "opamp4_csr"
    , syscfgRCCEnable      = rccen
    , syscfgRCCDisable     = rccdis
    }
  where
  reg :: (IvoryIOReg (BitDataRep d)) => Integer -> String -> BitDataReg d
  reg offs name = mkBitDataRegNamed (base + offs) ("syscfg->" ++ name)
