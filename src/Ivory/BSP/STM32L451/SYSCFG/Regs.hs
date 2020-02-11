{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32L451.SYSCFG.Regs where

import Ivory.Language

-- SYSCFG System configuration controller

-- Base address: 0x40010000

-- memory remap register
--  | offset : 0x0
--  | address: 0x40010000
[ivory|
 bitdata SYSCFG_MEMRMP :: Bits 32 = syscfg_memrmp
  { _                     :: Bits 23  -- (Reserved)
  , syscfg_memrmp_fb_mode   :: Bit      -- Flash Bank mode selection
  , _                     :: Bits 4   -- (Reserved)
  , syscfg_memrmp_qfs       :: Bit      -- QUADSPI memory mapping swap
  , syscfg_memrmp_mem_mode  :: Bits 3   -- Memory mapping selection
  }
|]


-- configuration register 1
--  | offset : 0x4
--  | address: 0x40010004
[ivory|
 bitdata SYSCFG_CFGR1 :: Bits 32 = syscfg_cfgr1
  { syscfg_cfgr1_fpu_ie       :: Bits 6   -- Floating Point Unit interrupts enable bits
  , _                       :: Bits 3   -- (Reserved)
  , syscfg_cfgr1_i2c3_fmp     :: Bit      -- I2C3 Fast-mode Plus driving capability activation
  , syscfg_cfgr1_i2c2_fmp     :: Bit      -- I2C2 Fast-mode Plus driving capability activation
  , syscfg_cfgr1_i2c1_fmp     :: Bit      -- I2C1 Fast-mode Plus driving capability activation
  , syscfg_cfgr1_i2c_pb9_fmp  :: Bit      -- Fast-mode Plus (Fm+) driving capability activation on PB9
  , syscfg_cfgr1_i2c_pb8_fmp  :: Bit      -- Fast-mode Plus (Fm+) driving capability activation on PB8
  , syscfg_cfgr1_i2c_pb7_fmp  :: Bit      -- Fast-mode Plus (Fm+) driving capability activation on PB7
  , syscfg_cfgr1_i2c_pb6_fmp  :: Bit      -- Fast-mode Plus (Fm+) driving capability activation on PB6
  , _                       :: Bits 7   -- (Reserved)
  , syscfg_cfgr1_boosten      :: Bit      -- I/O analog switch voltage booster enable
  , _                       :: Bits 7   -- (Reserved)
  , syscfg_cfgr1_fwdis        :: Bit      -- Firewall disable
  }
|]


-- external interrupt configuration register 1
--  | offset : 0x8
--  | address: 0x40010008
[ivory|
 bitdata SYSCFG_EXTICR1 :: Bits 32 = syscfg_exticr1
  { _                   :: Bits 17  -- (Reserved)
  , syscfg_exticr1_exti3  :: Bits 3   -- EXTI 3 configuration bits
  , _                   :: Bit      -- (Reserved)
  , syscfg_exticr1_exti2  :: Bits 3   -- EXTI 2 configuration bits
  , _                   :: Bit      -- (Reserved)
  , syscfg_exticr1_exti1  :: Bits 3   -- EXTI 1 configuration bits
  , _                   :: Bit      -- (Reserved)
  , syscfg_exticr1_exti0  :: Bits 3   -- EXTI 0 configuration bits
  }
|]


-- external interrupt configuration register 2
--  | offset : 0xc
--  | address: 0x4001000c
[ivory|
 bitdata SYSCFG_EXTICR2 :: Bits 32 = syscfg_exticr2
  { _                   :: Bits 17  -- (Reserved)
  , syscfg_exticr2_exti7  :: Bits 3   -- EXTI 7 configuration bits
  , _                   :: Bit      -- (Reserved)
  , syscfg_exticr2_exti6  :: Bits 3   -- EXTI 6 configuration bits
  , _                   :: Bit      -- (Reserved)
  , syscfg_exticr2_exti5  :: Bits 3   -- EXTI 5 configuration bits
  , _                   :: Bit      -- (Reserved)
  , syscfg_exticr2_exti4  :: Bits 3   -- EXTI 4 configuration bits
  }
|]


-- external interrupt configuration register 3
--  | offset : 0x10
--  | address: 0x40010010
[ivory|
 bitdata SYSCFG_EXTICR3 :: Bits 32 = syscfg_exticr3
  { _                    :: Bits 17  -- (Reserved)
  , syscfg_exticr3_exti11  :: Bits 3   -- EXTI 11 configuration bits
  , _                    :: Bit      -- (Reserved)
  , syscfg_exticr3_exti10  :: Bits 3   -- EXTI 10 configuration bits
  , _                    :: Bit      -- (Reserved)
  , syscfg_exticr3_exti9   :: Bits 3   -- EXTI 9 configuration bits
  , _                    :: Bit      -- (Reserved)
  , syscfg_exticr3_exti8   :: Bits 3   -- EXTI 8 configuration bits
  }
|]


-- external interrupt configuration register 4
--  | offset : 0x14
--  | address: 0x40010014
[ivory|
 bitdata SYSCFG_EXTICR4 :: Bits 32 = syscfg_exticr4
  { _                    :: Bits 17  -- (Reserved)
  , syscfg_exticr4_exti15  :: Bits 3   -- EXTI15 configuration bits
  , _                    :: Bit      -- (Reserved)
  , syscfg_exticr4_exti14  :: Bits 3   -- EXTI14 configuration bits
  , _                    :: Bit      -- (Reserved)
  , syscfg_exticr4_exti13  :: Bits 3   -- EXTI13 configuration bits
  , _                    :: Bit      -- (Reserved)
  , syscfg_exticr4_exti12  :: Bits 3   -- EXTI12 configuration bits
  }
|]


-- SCSR
--  | offset : 0x18
--  | address: 0x40010018
[ivory|
 bitdata SYSCFG_SCSR :: Bits 32 = syscfg_scsr
  { _                   :: Bits 30  -- (Reserved)
  , syscfg_scsr_sram2bsy  :: Bit      -- SRAM2 busy by erase operation
  , syscfg_scsr_sram2er   :: Bit      -- SRAM2 Erase
  }
|]


-- CFGR2
--  | offset : 0x1c
--  | address: 0x4001001c
[ivory|
 bitdata SYSCFG_CFGR2 :: Bits 32 = syscfg_cfgr2
  { _                :: Bits 23  -- (Reserved)
  , syscfg_cfgr2_spf   :: Bit      -- SRAM2 parity error flag
  , _                :: Bits 4   -- (Reserved)
  , syscfg_cfgr2_eccl  :: Bit      -- ECC Lock
  , syscfg_cfgr2_pvdl  :: Bit      -- PVD lock enable bit
  , syscfg_cfgr2_spl   :: Bit      -- SRAM2 parity lock bit
  , syscfg_cfgr2_cll   :: Bit      -- OCKUP (Hardfault) output enable bit
  }
|]


-- SWPR
--  | offset : 0x20
--  | address: 0x40010020
[ivory|
 bitdata SYSCFG_SWPR :: Bits 32 = syscfg_swpr
  { syscfg_swpr_p31wp  :: Bit      -- SRAM2 page 31 write protection
  , syscfg_swpr_p30wp  :: Bit      -- P30WP
  , syscfg_swpr_p29wp  :: Bit      -- P29WP
  , syscfg_swpr_p28wp  :: Bit      -- P28WP
  , syscfg_swpr_p27wp  :: Bit      -- P27WP
  , syscfg_swpr_p26wp  :: Bit      -- P26WP
  , syscfg_swpr_p25wp  :: Bit      -- P25WP
  , syscfg_swpr_p24wp  :: Bit      -- P24WP
  , syscfg_swpr_p23wp  :: Bit      -- P23WP
  , syscfg_swpr_p22wp  :: Bit      -- P22WP
  , syscfg_swpr_p21wp  :: Bit      -- P21WP
  , syscfg_swpr_p20wp  :: Bit      -- P20WP
  , syscfg_swpr_p19wp  :: Bit      -- P19WP
  , syscfg_swpr_p18wp  :: Bit      -- P18WP
  , syscfg_swpr_p17wp  :: Bit      -- P17WP
  , syscfg_swpr_p16wp  :: Bit      -- P16WP
  , syscfg_swpr_p15wp  :: Bit      -- P15WP
  , syscfg_swpr_p14wp  :: Bit      -- P14WP
  , syscfg_swpr_p13wp  :: Bit      -- P13WP
  , syscfg_swpr_p12wp  :: Bit      -- P12WP
  , syscfg_swpr_p11wp  :: Bit      -- P11WP
  , syscfg_swpr_p10wp  :: Bit      -- P10WP
  , syscfg_swpr_p9wp   :: Bit      -- P9WP
  , syscfg_swpr_p8wp   :: Bit      -- P8WP
  , syscfg_swpr_p7wp   :: Bit      -- P7WP
  , syscfg_swpr_p6wp   :: Bit      -- P6WP
  , syscfg_swpr_p5wp   :: Bit      -- P5WP
  , syscfg_swpr_p4wp   :: Bit      -- P4WP
  , syscfg_swpr_p3wp   :: Bit      -- P3WP
  , syscfg_swpr_p2wp   :: Bit      -- P2WP
  , syscfg_swpr_p1wp   :: Bit      -- P1WP
  , syscfg_swpr_p0wp   :: Bit      -- P0WP
  }
|]


-- SKR
--  | offset : 0x24
--  | address: 0x40010024
[ivory|
 bitdata SYSCFG_SKR :: Bits 32 = syscfg_skr
  { _             :: Bits 24  -- (Reserved)
  , syscfg_skr_key  :: Bits 8   -- SRAM2 write protection key for software erase
  }
|]

