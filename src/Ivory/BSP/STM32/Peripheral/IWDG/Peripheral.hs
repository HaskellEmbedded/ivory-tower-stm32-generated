{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE Rank2Types #-}

module Ivory.BSP.STM32.Peripheral.IWDG.Peripheral where

import Ivory.Language

import Ivory.HW

import Ivory.BSP.STM32.ClockConfig
import Ivory.BSP.STM32.Peripheral.IWDG.Regs

-- Convenience type synonyms
data IWDG = IWDG
  { iwdgRegKR      :: BitDataReg IWDG_KR
  , iwdgRegPR      :: BitDataReg IWDG_PR
  , iwdgRegRLR     :: BitDataReg IWDG_RLR
  , iwdgRegSR      :: BitDataReg IWDG_SR
  , iwdgRegWINR    :: BitDataReg IWDG_WINR
  , iwdgClock :: ClockSource
  }

-- | Create an IWDG given the base register address.
mkIWDG  :: Integer -> ClockSource -> IWDG
mkIWDG base clk = IWDG
  { iwdgRegKR      = reg 0x0 "kr"
  , iwdgRegPR      = reg 0x4 "pr"
  , iwdgRegRLR     = reg 0x8 "rlr"
  , iwdgRegSR      = reg 0xc "sr"
  , iwdgRegWINR    = reg 0x10 "winr"
  , iwdgClock = clk
  }
  where
  reg :: (IvoryIOReg (BitDataRep d)) => Integer -> String -> BitDataReg d
  reg offs name = mkBitDataRegNamed (base + offs) ("iwdg->" ++ name)

