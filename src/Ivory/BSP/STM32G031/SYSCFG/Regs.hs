{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32G031.SYSCFG.Regs where

import Ivory.Language

-- SYSCFG System configuration controller

-- Base address: 0x40010000

-- SYSCFG configuration register 1
--  | offset : 0x0
--  | address: 0x40010000
[ivory|
 bitdata SYSCFG_CFGR1 :: Bits 32 = syscfg_cfgr1
  { _                         :: Bits 8   -- (Reserved)
  , syscfg_cfgr1_i2c_pax_fmp    :: Bits 2   -- Fast Mode Plus (FM+) driving capability activation bits
  , syscfg_cfgr1_i2c2_fmp       :: Bit      -- FM+ driving capability activation for I2C2
  , syscfg_cfgr1_i2c1_fmp       :: Bit      -- FM+ driving capability activation for I2C1
  , syscfg_cfgr1_i2c_pbx_fmp    :: Bits 4   -- Fast Mode Plus (FM+) driving capability activation bits
  , _                         :: Bits 7   -- (Reserved)
  , syscfg_cfgr1_boosten        :: Bit      -- I/O analog switch voltage booster enable
  , syscfg_cfgr1_ir_mod         :: Bits 2   -- IR Modulation Envelope signal selection.
  , syscfg_cfgr1_ir_pol         :: Bit      -- IR output polarity selection
  , syscfg_cfgr1_pa11_pa12_rmp  :: Bit      -- PA11 and PA12 remapping bit.
  , _                         :: Bits 2   -- (Reserved)
  , syscfg_cfgr1_mem_mode       :: Bits 2   -- Memory mapping selection bits
  }
|]


-- SYSCFG configuration register 1
--  | offset : 0x18
--  | address: 0x40010018
[ivory|
 bitdata SYSCFG_CFGR2 :: Bits 32 = syscfg_cfgr2
  { _                            :: Bits 8   -- (Reserved)
  , syscfg_cfgr2_pb2_cden          :: Bit      -- PB2_CDEN
  , syscfg_cfgr2_pb1_cden          :: Bit      -- PB1_CDEN
  , syscfg_cfgr2_pb0_cden          :: Bit      -- PB0_CDEN
  , syscfg_cfgr2_pa13_cden         :: Bit      -- PA13_CDEN
  , syscfg_cfgr2_pa6_cden          :: Bit      -- PA6_CDEN
  , syscfg_cfgr2_pa5_cden          :: Bit      -- PA5_CDEN
  , syscfg_cfgr2_pa3_cden          :: Bit      -- PA3_CDEN
  , syscfg_cfgr2_pa1_cden          :: Bit      -- PA1_CDEN
  , _                            :: Bits 7   -- (Reserved)
  , syscfg_cfgr2_sram_pef          :: Bit      -- SRAM parity error flag
  , _                            :: Bits 4   -- (Reserved)
  , syscfg_cfgr2_ecc_lock          :: Bit      -- ECC error lock bit
  , syscfg_cfgr2_pvd_lock          :: Bit      -- PVD lock enable bit
  , syscfg_cfgr2_sram_parity_lock  :: Bit      -- SRAM parity lock bit
  , syscfg_cfgr2_lockup_lock       :: Bit      -- Cortex-M0+ LOCKUP bit enable bit
  }
|]

