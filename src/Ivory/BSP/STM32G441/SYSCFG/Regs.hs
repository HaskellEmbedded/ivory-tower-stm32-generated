{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32G441.SYSCFG.Regs where

import Ivory.Language

-- SYSCFG System configuration controller

-- Base address: 0x40010000

-- Remap Memory register
--  | offset : 0x0
--  | address: 0x40010000
[ivory|
 bitdata SYSCFG_MEMRMP :: Bits 32 = syscfg_memrmp
  { _                     :: Bits 23  -- (Reserved)
  , syscfg_memrmp_fb_mode   :: Bit      -- User Flash Bank mode
  , _                     :: Bits 5   -- (Reserved)
  , syscfg_memrmp_mem_mode  :: Bits 3   -- Memory mapping selection
  }
|]


-- peripheral mode configuration register
--  | offset : 0x4
--  | address: 0x40010004
[ivory|
 bitdata SYSCFG_CFGR1 :: Bits 32 = syscfg_cfgr1
  { syscfg_cfgr1_fpu_ie       :: Bits 6   -- FPU Interrupts Enable
  , _                       :: Bits 2   -- (Reserved)
  , syscfg_cfgr1_i2c4_fmp     :: Bit      -- I2C1 FM+ drive capability enable
  , syscfg_cfgr1_i2c3_fmp     :: Bit      -- I2C1 FM+ drive capability enable
  , syscfg_cfgr1_i2c2_fmp     :: Bit      -- I2C1 FM+ drive capability enable
  , syscfg_cfgr1_i2c1_fmp     :: Bit      -- I2C1 FM+ drive capability enable
  , syscfg_cfgr1_i2c_pb9_fmp  :: Bit      -- FM+ drive capability on PB6
  , syscfg_cfgr1_i2c_pb8_fmp  :: Bit      -- FM+ drive capability on PB6
  , syscfg_cfgr1_i2c_pb7_fmp  :: Bit      -- FM+ drive capability on PB6
  , syscfg_cfgr1_i2c_pb6_fmp  :: Bit      -- FM+ drive capability on PB6
  , _                       :: Bits 6   -- (Reserved)
  , syscfg_cfgr1_anaswvdd     :: Bit      -- GPIO analog switch control voltage selection
  , syscfg_cfgr1_boosten      :: Bit      -- BOOSTEN
  , _                       :: Bits 8   -- (Reserved)
  }
|]


-- external interrupt configuration register 1
--  | offset : 0x8
--  | address: 0x40010008
[ivory|
 bitdata SYSCFG_EXTICR1 :: Bits 32 = syscfg_exticr1
  { _                   :: Bits 16  -- (Reserved)
  , syscfg_exticr1_exti3  :: Bits 4   -- EXTI x configuration (x = 0 to 3)
  , syscfg_exticr1_exti2  :: Bits 4   -- EXTI x configuration (x = 0 to 3)
  , syscfg_exticr1_exti1  :: Bits 4   -- EXTI x configuration (x = 0 to 3)
  , syscfg_exticr1_exti0  :: Bits 4   -- EXTI x configuration (x = 0 to 3)
  }
|]


-- external interrupt configuration register 2
--  | offset : 0xc
--  | address: 0x4001000c
[ivory|
 bitdata SYSCFG_EXTICR2 :: Bits 32 = syscfg_exticr2
  { _                   :: Bits 16  -- (Reserved)
  , syscfg_exticr2_exti7  :: Bits 4   -- EXTI x configuration (x = 4 to 7)
  , syscfg_exticr2_exti6  :: Bits 4   -- EXTI x configuration (x = 4 to 7)
  , syscfg_exticr2_exti5  :: Bits 4   -- EXTI x configuration (x = 4 to 7)
  , syscfg_exticr2_exti4  :: Bits 4   -- EXTI x configuration (x = 4 to 7)
  }
|]


-- external interrupt configuration register 3
--  | offset : 0x10
--  | address: 0x40010010
[ivory|
 bitdata SYSCFG_EXTICR3 :: Bits 32 = syscfg_exticr3
  { _                    :: Bits 16  -- (Reserved)
  , syscfg_exticr3_exti11  :: Bits 4   -- EXTI x configuration (x = 8 to 11)
  , syscfg_exticr3_exti10  :: Bits 4   -- EXTI10
  , syscfg_exticr3_exti9   :: Bits 4   -- EXTI x configuration (x = 8 to 11)
  , syscfg_exticr3_exti8   :: Bits 4   -- EXTI x configuration (x = 8 to 11)
  }
|]


-- external interrupt configuration register 4
--  | offset : 0x14
--  | address: 0x40010014
[ivory|
 bitdata SYSCFG_EXTICR4 :: Bits 32 = syscfg_exticr4
  { _                    :: Bits 16  -- (Reserved)
  , syscfg_exticr4_exti15  :: Bits 4   -- EXTI x configuration (x = 12 to 15)
  , syscfg_exticr4_exti14  :: Bits 4   -- EXTI x configuration (x = 12 to 15)
  , syscfg_exticr4_exti13  :: Bits 4   -- EXTI x configuration (x = 12 to 15)
  , syscfg_exticr4_exti12  :: Bits 4   -- EXTI x configuration (x = 12 to 15)
  }
|]


-- CCM SRAM control and status register
--  | offset : 0x18
--  | address: 0x40010018
[ivory|
 bitdata SYSCFG_SCSR :: Bits 32 = syscfg_scsr
  { _                 :: Bits 30  -- (Reserved)
  , syscfg_scsr_ccmbsy  :: Bit      -- CCM SRAM busy by erase operation
  , syscfg_scsr_ccmer   :: Bit      -- CCM SRAM Erase
  }
|]


-- configuration register 2
--  | offset : 0x1c
--  | address: 0x4001001c
[ivory|
 bitdata SYSCFG_CFGR2 :: Bits 32 = syscfg_cfgr2
  { _                :: Bits 23  -- (Reserved)
  , syscfg_cfgr2_spf   :: Bit      -- SRAM Parity Flag
  , _                :: Bits 4   -- (Reserved)
  , syscfg_cfgr2_eccl  :: Bit      -- ECC Lock
  , syscfg_cfgr2_pvdl  :: Bit      -- PVD Lock
  , syscfg_cfgr2_spl   :: Bit      -- SRAM Parity Lock
  , syscfg_cfgr2_cll   :: Bit      -- Core Lockup Lock
  }
|]


-- SRAM Write protection register 1
--  | offset : 0x20
--  | address: 0x40010020
[ivory|
 bitdata SYSCFG_SWPR :: Bits 32 = syscfg_swpr
  { syscfg_swpr_page31_wp  :: Bit      -- Write protection
  , syscfg_swpr_page30_wp  :: Bit      -- Write protection
  , syscfg_swpr_page29_wp  :: Bit      -- Write protection
  , syscfg_swpr_page28_wp  :: Bit      -- Write protection
  , syscfg_swpr_page27_wp  :: Bit      -- Write protection
  , syscfg_swpr_page26_wp  :: Bit      -- Write protection
  , syscfg_swpr_page25_wp  :: Bit      -- Write protection
  , syscfg_swpr_page24_wp  :: Bit      -- Write protection
  , syscfg_swpr_page23_wp  :: Bit      -- Write protection
  , syscfg_swpr_page22_wp  :: Bit      -- Write protection
  , syscfg_swpr_page21_wp  :: Bit      -- Write protection
  , syscfg_swpr_page20_wp  :: Bit      -- Write protection
  , syscfg_swpr_page19_wp  :: Bit      -- Write protection
  , syscfg_swpr_page18_wp  :: Bit      -- Write protection
  , syscfg_swpr_page17_wp  :: Bit      -- Write protection
  , syscfg_swpr_page16_wp  :: Bit      -- Write protection
  , syscfg_swpr_page15_wp  :: Bit      -- Write protection
  , syscfg_swpr_page14_wp  :: Bit      -- Write protection
  , syscfg_swpr_page13_wp  :: Bit      -- Write protection
  , syscfg_swpr_page12_wp  :: Bit      -- Write protection
  , syscfg_swpr_page11_wp  :: Bit      -- Write protection
  , syscfg_swpr_page10_wp  :: Bit      -- Write protection
  , syscfg_swpr_page9_wp   :: Bit      -- Write protection
  , syscfg_swpr_page8_wp   :: Bit      -- Write protection
  , syscfg_swpr_page7_wp   :: Bit      -- Write protection
  , syscfg_swpr_page6_wp   :: Bit      -- Write protection
  , syscfg_swpr_page5_wp   :: Bit      -- Write protection
  , syscfg_swpr_page4_wp   :: Bit      -- Write protection
  , syscfg_swpr_page3_wp   :: Bit      -- Write protection
  , syscfg_swpr_page2_wp   :: Bit      -- Write protection
  , syscfg_swpr_page1_wp   :: Bit      -- Write protection
  , syscfg_swpr_page0_wp   :: Bit      -- Write protection
  }
|]


-- SRAM2 Key Register
--  | offset : 0x24
--  | address: 0x40010024
[ivory|
 bitdata SYSCFG_SKR :: Bits 32 = syscfg_skr
  { _             :: Bits 24  -- (Reserved)
  , syscfg_skr_key  :: Bits 8   -- SRAM2 Key for software erase
  }
|]

