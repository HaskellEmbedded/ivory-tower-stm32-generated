{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32F070.SYSCFG.Regs where

import Ivory.Language

-- SYSCFG System configuration controller

-- Base address: 0x40010000

-- configuration register 1
--  | offset : 0x0
--  | address: 0x40010000
[ivory|
 bitdata SYSCFG_CFGR1 :: Bits 32 = syscfg_cfgr1
  { _                              :: Bits 5 -- (Reserved)
  , syscfg_cfgr1_usart3_dma_rmp    :: Bit    -- USART3 DMA request remapping bit
  , _                              :: Bits 2 -- (Reserved)
  , syscfg_cfgr1_i2c_pa10_fmp      :: Bit    -- Fast Mode Plus (FM+) driving capability activation bits
  , syscfg_cfgr1_i2c_pa9_fmp       :: Bit    -- Fast Mode Plus (FM+) driving capability activation bits
  , _                              :: Bit    -- (Reserved)
  , syscfg_cfgr1_i2c1_fmp          :: Bit    -- FM+ driving capability activation for I2C1
  , syscfg_cfgr1_i2c_pb9_fmp       :: Bit    -- Fast Mode Plus (FM+) driving capability activation bits.
  , syscfg_cfgr1_i2c_pb8_fmp       :: Bit    -- Fast Mode Plus (FM+) driving capability activation bits.
  , syscfg_cfgr1_i2c_pb7_fmp       :: Bit    -- Fast Mode Plus (FM+) driving capability activation bits.
  , syscfg_cfgr1_i2c_pb6_fmp       :: Bit    -- Fast Mode Plus (FM plus) driving capability activation bits.
  , _                              :: Bits 3 -- (Reserved)
  , syscfg_cfgr1_tim17_dma_rmp     :: Bit    -- TIM17 DMA request remapping bit
  , syscfg_cfgr1_tim16_dma_rmp     :: Bit    -- TIM16 DMA request remapping bit
  , syscfg_cfgr1_usart1_rx_dma_rmp :: Bit    -- USART1_RX DMA request remapping bit
  , syscfg_cfgr1_usart1_tx_dma_rmp :: Bit    -- USART1_TX DMA remapping bit
  , syscfg_cfgr1_adc_dma_rmp       :: Bit    -- ADC DMA remapping bit
  , _                              :: Bits 3 -- (Reserved)
  , syscfg_cfgr1_pa11_pa12_rmp     :: Bit    -- PA11 and PA12 remapping bit for small packages (28 and 20 pins)
  , _                              :: Bits 2 -- (Reserved)
  , syscfg_cfgr1_mem_mode          :: Bits 2 -- Memory mapping selection bits
  }
|]

-- external interrupt configuration register 1
--  | offset : 0x8
--  | address: 0x40010008
[ivory|
 bitdata SYSCFG_EXTICR1 :: Bits 32 = syscfg_exticr1
  { _                    :: Bits 16 -- (Reserved)
  , syscfg_exticr1_exti3 :: Bits 4  -- EXTI 3 configuration bits
  , syscfg_exticr1_exti2 :: Bits 4  -- EXTI 2 configuration bits
  , syscfg_exticr1_exti1 :: Bits 4  -- EXTI 1 configuration bits
  , syscfg_exticr1_exti0 :: Bits 4  -- EXTI 0 configuration bits
  }
|]

-- external interrupt configuration register 2
--  | offset : 0xc
--  | address: 0x4001000c
[ivory|
 bitdata SYSCFG_EXTICR2 :: Bits 32 = syscfg_exticr2
  { _                    :: Bits 16 -- (Reserved)
  , syscfg_exticr2_exti7 :: Bits 4  -- EXTI 7 configuration bits
  , syscfg_exticr2_exti6 :: Bits 4  -- EXTI 6 configuration bits
  , syscfg_exticr2_exti5 :: Bits 4  -- EXTI 5 configuration bits
  , syscfg_exticr2_exti4 :: Bits 4  -- EXTI 4 configuration bits
  }
|]

-- external interrupt configuration register 3
--  | offset : 0x10
--  | address: 0x40010010
[ivory|
 bitdata SYSCFG_EXTICR3 :: Bits 32 = syscfg_exticr3
  { _                     :: Bits 16 -- (Reserved)
  , syscfg_exticr3_exti11 :: Bits 4  -- EXTI 11 configuration bits
  , syscfg_exticr3_exti10 :: Bits 4  -- EXTI 10 configuration bits
  , syscfg_exticr3_exti9  :: Bits 4  -- EXTI 9 configuration bits
  , syscfg_exticr3_exti8  :: Bits 4  -- EXTI 8 configuration bits
  }
|]

-- external interrupt configuration register 4
--  | offset : 0x14
--  | address: 0x40010014
[ivory|
 bitdata SYSCFG_EXTICR4 :: Bits 32 = syscfg_exticr4
  { _                     :: Bits 16 -- (Reserved)
  , syscfg_exticr4_exti15 :: Bits 4  -- EXTI 15 configuration bits
  , syscfg_exticr4_exti14 :: Bits 4  -- EXTI 14 configuration bits
  , syscfg_exticr4_exti13 :: Bits 4  -- EXTI 13 configuration bits
  , syscfg_exticr4_exti12 :: Bits 4  -- EXTI 12 configuration bits
  }
|]

-- configuration register 2
--  | offset : 0x18
--  | address: 0x40010018
[ivory|
 bitdata SYSCFG_CFGR2 :: Bits 32 = syscfg_cfgr2
  { _                             :: Bits 23 -- (Reserved)
  , syscfg_cfgr2_sram_pef         :: Bit     -- SRAM parity flag
  , _                             :: Bits 6  -- (Reserved)
  , syscfg_cfgr2_sram_parity_lock :: Bit     -- SRAM parity lock bit
  , syscfg_cfgr2_lockup_lock      :: Bit     -- Cortex-M0 LOCKUP bit enable bit
  }
|]
