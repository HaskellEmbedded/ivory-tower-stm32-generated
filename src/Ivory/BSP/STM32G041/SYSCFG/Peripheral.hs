{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE Rank2Types #-}

module Ivory.BSP.STM32G041.SYSCFG.Peripheral where

import Ivory.Language

import Ivory.HW

import Ivory.BSP.STM32G041.SYSCFG.Regs

-- Convenience type synonyms
data SYSCFG = SYSCFG
  { syscfgRegCFGR1   :: BitDataReg SYSCFG_CFGR1
  , syscfgRegCFGR2   :: BitDataReg SYSCFG_CFGR2
  , syscfgRCCEnable       :: forall eff . Ivory eff ()
  , syscfgRCCDisable      :: forall eff . Ivory eff ()
  }

-- | Create SYSCFG given the base register address.
mkSYSCFG  :: Integer
       -> (forall eff . Ivory eff ())
       -> (forall eff . Ivory eff ())
       -> SYSCFG
mkSYSCFG base rccen rccdis = SYSCFG
  { syscfgRegCFGR1   = reg 0x0 "cfgr1"
  , syscfgRegCFGR2   = reg 0x18 "cfgr2"
    , syscfgRCCEnable      = rccen
    , syscfgRCCDisable     = rccdis
    }
  where
  reg :: (IvoryIOReg (BitDataRep d)) => Integer -> String -> BitDataReg d
  reg offs name = mkBitDataRegNamed (base + offs) ("syscfg->" ++ name)
