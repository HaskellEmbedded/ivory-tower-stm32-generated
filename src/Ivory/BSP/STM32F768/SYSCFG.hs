{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}

module Ivory.BSP.STM32F768.SYSCFG where

import Ivory.Language
import Ivory.HW
import Ivory.BSP.STM32F768.MemoryMap (syscfg_periph_base)

-- SYSCFG System configuration controller

-- Base address: 0x40013800

-- memory remap register
--  | offset : 0x0
--  | address: 0x40013800
[ivory|
 bitdata SYSCFG_MEMRM :: Bits 32 = syscfg_memrm
  { _                    :: Bits 20  -- (Reserved)
  , syscfg_memrm_swp_fmc   :: Bits 2   -- FMC memory mapping swap
  , _                    :: Bit      -- (Reserved)
  , syscfg_memrm_fb_mode   :: Bit      -- Flash bank mode selection
  , _                    :: Bits 5   -- (Reserved)
  , syscfg_memrm_mem_mode  :: Bits 3   -- Memory mapping selection
  }
|]
syscfg_reg_memrm :: BitDataReg SYSCFG_MEMRM
syscfg_reg_memrm = mkBitDataRegNamed (syscfg_periph_base + 0x0) "memrm"

-- peripheral mode configuration register
--  | offset : 0x4
--  | address: 0x40013804
[ivory|
 bitdata SYSCFG_PMC :: Bits 32 = syscfg_pmc
  { _                      :: Bits 8   -- (Reserved)
  , syscfg_pmc_mii_rmii_sel  :: Bit      -- Ethernet PHY interface selection
  , _                      :: Bits 4   -- (Reserved)
  , syscfg_pmc_adc3dc2       :: Bit      -- ADC3DC2
  , syscfg_pmc_adc2dc2       :: Bit      -- ADC2DC2
  , syscfg_pmc_adc1dc2       :: Bit      -- ADC1DC2
  , _                      :: Bits 16  -- (Reserved)
  }
|]
syscfg_reg_pmc :: BitDataReg SYSCFG_PMC
syscfg_reg_pmc = mkBitDataRegNamed (syscfg_periph_base + 0x4) "pmc"

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
syscfg_reg_exticr1 :: BitDataReg SYSCFG_EXTICR1
syscfg_reg_exticr1 = mkBitDataRegNamed (syscfg_periph_base + 0x8) "exticr1"

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
syscfg_reg_exticr2 :: BitDataReg SYSCFG_EXTICR2
syscfg_reg_exticr2 = mkBitDataRegNamed (syscfg_periph_base + 0xc) "exticr2"

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
syscfg_reg_exticr3 :: BitDataReg SYSCFG_EXTICR3
syscfg_reg_exticr3 = mkBitDataRegNamed (syscfg_periph_base + 0x10) "exticr3"

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
syscfg_reg_exticr4 :: BitDataReg SYSCFG_EXTICR4
syscfg_reg_exticr4 = mkBitDataRegNamed (syscfg_periph_base + 0x14) "exticr4"

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
syscfg_reg_cmpcr :: BitDataReg SYSCFG_CMPCR
syscfg_reg_cmpcr = mkBitDataRegNamed (syscfg_periph_base + 0x20) "cmpcr"

