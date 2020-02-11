{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE Rank2Types #-}

module Ivory.BSP.STM32G441.SYSCFG.Peripheral where

import Ivory.Language

import Ivory.HW

import Ivory.BSP.STM32G441.SYSCFG.Regs

-- Convenience type synonyms
data SYSCFG = SYSCFG
  { syscfgRegMEMRMP  :: BitDataReg SYSCFG_MEMRMP
  , syscfgRegCFGR1   :: BitDataReg SYSCFG_CFGR1
  , syscfgRegEXTICR1 :: BitDataReg SYSCFG_EXTICR1
  , syscfgRegEXTICR2 :: BitDataReg SYSCFG_EXTICR2
  , syscfgRegEXTICR3 :: BitDataReg SYSCFG_EXTICR3
  , syscfgRegEXTICR4 :: BitDataReg SYSCFG_EXTICR4
  , syscfgRegSCSR    :: BitDataReg SYSCFG_SCSR
  , syscfgRegCFGR2   :: BitDataReg SYSCFG_CFGR2
  , syscfgRegSWPR    :: BitDataReg SYSCFG_SWPR
  , syscfgRegSKR     :: BitDataReg SYSCFG_SKR
  , syscfgRCCEnable       :: forall eff . Ivory eff ()
  , syscfgRCCDisable      :: forall eff . Ivory eff ()
  }

-- | Create SYSCFG given the base register address.
mkSYSCFG  :: Integer
       -> (forall eff . Ivory eff ())
       -> (forall eff . Ivory eff ())
       -> SYSCFG
mkSYSCFG base rccen rccdis = SYSCFG
  { syscfgRegMEMRMP  = reg 0x0 "memrmp"
  , syscfgRegCFGR1   = reg 0x4 "cfgr1"
  , syscfgRegEXTICR1 = reg 0x8 "exticr1"
  , syscfgRegEXTICR2 = reg 0xc "exticr2"
  , syscfgRegEXTICR3 = reg 0x10 "exticr3"
  , syscfgRegEXTICR4 = reg 0x14 "exticr4"
  , syscfgRegSCSR    = reg 0x18 "scsr"
  , syscfgRegCFGR2   = reg 0x1c "cfgr2"
  , syscfgRegSWPR    = reg 0x20 "swpr"
  , syscfgRegSKR     = reg 0x24 "skr"
    , syscfgRCCEnable      = rccen
    , syscfgRCCDisable     = rccdis
    }
  where
  reg :: (IvoryIOReg (BitDataRep d)) => Integer -> String -> BitDataReg d
  reg offs name = mkBitDataRegNamed (base + offs) ("syscfg->" ++ name)
