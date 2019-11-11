{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32.Peripheral.IWDG.Regs where

import Ivory.Language

-- IWDG Independent watchdog

-- Base address: 0x40003000

-- Key register
--  | offset : 0x0
--  | address: 0x40003000
[ivory|
 bitdata IWDG_KR :: Bits 32 = iwdg_kr
  { _          :: Bits 16  -- (Reserved)
  , iwdg_kr_key  :: Bits 16  -- Key value
  }
|]


-- Prescaler register
--  | offset : 0x4
--  | address: 0x40003004
[ivory|
 bitdata IWDG_PR :: Bits 32 = iwdg_pr
  { _         :: Bits 29  -- (Reserved)
  , iwdg_pr_pr  :: Bits 3   -- Prescaler divider
  }
|]


-- Reload register
--  | offset : 0x8
--  | address: 0x40003008
[ivory|
 bitdata IWDG_RLR :: Bits 32 = iwdg_rlr
  { _          :: Bits 20  -- (Reserved)
  , iwdg_rlr_rl  :: Bits 12  -- Watchdog counter reload value
  }
|]


-- Status register
--  | offset : 0xc
--  | address: 0x4000300c
[ivory|
 bitdata IWDG_SR :: Bits 32 = iwdg_sr
  { _          :: Bits 29  -- (Reserved)
  , iwdg_sr_wvu  :: Bit      -- Watchdog counter window value update
  , iwdg_sr_rvu  :: Bit      -- Watchdog counter reload value update
  , iwdg_sr_pvu  :: Bit      -- Watchdog prescaler value update
  }
|]


-- Window register
--  | offset : 0x10
--  | address: 0x40003010
[ivory|
 bitdata IWDG_WINR :: Bits 32 = iwdg_winr
  { _            :: Bits 20  -- (Reserved)
  , iwdg_winr_win  :: Bits 12  -- Watchdog counter window value
  }
|]

