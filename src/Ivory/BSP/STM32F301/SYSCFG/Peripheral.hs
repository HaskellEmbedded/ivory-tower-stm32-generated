{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE Rank2Types #-}

module Ivory.BSP.STM32F301.SYSCFG.Peripheral where

import Ivory.Language

import Ivory.HW

import Ivory.BSP.STM32F301.SYSCFG.Regs

-- Convenience type synonyms
data SYSCFG = SYSCFG
  { syscfgRegCFGR1      :: BitDataReg SYSCFG_CFGR1
  , syscfgRegEXTICR1    :: BitDataReg SYSCFG_EXTICR1
  , syscfgRegEXTICR2    :: BitDataReg SYSCFG_EXTICR2
  , syscfgRegEXTICR3    :: BitDataReg SYSCFG_EXTICR3
  , syscfgRegEXTICR4    :: BitDataReg SYSCFG_EXTICR4
  , syscfgRegCFGR2      :: BitDataReg SYSCFG_CFGR2
  , syscfgRegRCR        :: BitDataReg SYSCFG_RCR
  , syscfgRegCFGR3      :: BitDataReg SYSCFG_CFGR3
  , syscfgRegOPAMP2_CSR :: BitDataReg SYSCFG_OPAMP2_CSR
  , syscfgRegCOMP2_CSR  :: BitDataReg SYSCFG_COMP2_CSR
  , syscfgRegCOMP4_CSR  :: BitDataReg SYSCFG_COMP4_CSR
  , syscfgRegCOMP6_CSR  :: BitDataReg SYSCFG_COMP6_CSR
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
  , syscfgRegCFGR3      = reg 0x50 "cfgr3"
  , syscfgRegOPAMP2_CSR = reg 0x3c "opamp2_csr"
  , syscfgRegCOMP2_CSR  = reg 0x20 "comp2_csr"
  , syscfgRegCOMP4_CSR  = reg 0x28 "comp4_csr"
  , syscfgRegCOMP6_CSR  = reg 0x30 "comp6_csr"
    , syscfgRCCEnable      = rccen
    , syscfgRCCDisable     = rccdis
    }
  where
  reg :: (IvoryIOReg (BitDataRep d)) => Integer -> String -> BitDataReg d
  reg offs name = mkBitDataRegNamed (base + offs) ("syscfg->" ++ name)
