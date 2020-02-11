{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32F730.SYSCFG.Regs where

import Ivory.Language

-- SYSCFG System configuration controller

-- Base address: 0x40013800

-- memory remap register
--  | offset : 0x0
--  | address: 0x40013800
[ivory|
 bitdata SYSCFG_MEMRMP :: Bits 32 = syscfg_memrmp
  { _                     :: Bits 20  -- (Reserved)
  , syscfg_memrmp_swp_fmc   :: Bits 2   -- FMC memory mapping swap
  , _                     :: Bits 9   -- (Reserved)
  , syscfg_memrmp_mem_boot  :: Bit      -- Memory boot mapping
  }
|]


-- peripheral mode configuration register
--  | offset : 0x4
--  | address: 0x40013804
[ivory|
 bitdata SYSCFG_PMC :: Bits 32 = syscfg_pmc
  { _                  :: Bits 13  -- (Reserved)
  , syscfg_pmc_adcdc2    :: Bits 3   -- ADC3DC2
  , _                  :: Bits 8   -- (Reserved)
  , syscfg_pmc_pb9_fmp   :: Bit      -- Fast Mode + Enable
  , syscfg_pmc_pb8_fmp   :: Bit      -- PB8_FMP Fast Mode + Enable
  , syscfg_pmc_pb7_fmp   :: Bit      -- PB7_FMP Fast Mode + Enable
  , syscfg_pmc_pb6_fmp   :: Bit      -- PB6_FMP Fast Mode
  , _                  :: Bit      -- (Reserved)
  , syscfg_pmc_i2c3_fmp  :: Bit      -- I2C3_FMP I2C3 Fast Mode + Enable
  , syscfg_pmc_i2c2_fmp  :: Bit      -- I2C2_FMP I2C2 Fast Mode + Enable
  , syscfg_pmc_i2c1_fmp  :: Bit      -- I2C1_FMP I2C1 Fast Mode + Enable
  }
|]


-- external interrupt configuration register 1
--  | offset : 0x8
--  | address: 0x40013808
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
--  | address: 0x4001380c
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
--  | address: 0x40013810
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
--  | address: 0x40013814
[ivory|
 bitdata SYSCFG_EXTICR4 :: Bits 32 = syscfg_exticr4
  { _                    :: Bits 16  -- (Reserved)
  , syscfg_exticr4_exti15  :: Bits 4   -- EXTI x configuration (x = 12 to 15)
  , syscfg_exticr4_exti14  :: Bits 4   -- EXTI x configuration (x = 12 to 15)
  , syscfg_exticr4_exti13  :: Bits 4   -- EXTI x configuration (x = 12 to 15)
  , syscfg_exticr4_exti12  :: Bits 4   -- EXTI x configuration (x = 12 to 15)
  }
|]


-- Compensation cell control register
--  | offset : 0x20
--  | address: 0x40013820
[ivory|
 bitdata SYSCFG_CMPCR :: Bits 32 = syscfg_cmpcr
  { _                  :: Bits 23  -- (Reserved)
  , syscfg_cmpcr_ready   :: Bit      -- READY
  , _                  :: Bits 7   -- (Reserved)
  , syscfg_cmpcr_cmp_pd  :: Bit      -- Compensation cell power-down
  }
|]

