{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32F042.SYSCFG.Regs where

import Ivory.Language

-- SYSCFG System configuration controller

-- Base address: 0x40010000

-- configuration register 1
--  | offset : 0x0
--  | address: 0x40010000
[ivory|
 bitdata SYSCFG_CFGR1 :: Bits 32 = syscfg_cfgr1
  { _                             :: Bit      -- (Reserved)
  , syscfg_cfgr1_tim3_dma_rmp       :: Bit      -- TIM3 DMA request remapping bit
  , syscfg_cfgr1_tim2_dma_rmp       :: Bit      -- TIM2 DMA request remapping bit
  , syscfg_cfgr1_tim1_dma_rmp       :: Bit      -- TIM1 DMA request remapping bit
  , syscfg_cfgr1_i2c1_dma_rmp       :: Bit      -- I2C1 DMA request remapping bit
  , syscfg_cfgr1_usart3_dma_rmp     :: Bit      -- USART3 DMA request remapping bit
  , syscfg_cfgr1_usart2_dma_rmp     :: Bit      -- USART2 DMA request remapping bit
  , syscfg_cfgr1_spi2_dma_rmp       :: Bit      -- SPI2 DMA request remapping bit
  , _                             :: Bits 2   -- (Reserved)
  , syscfg_cfgr1_i2c2_fm_plus       :: Bit      -- FM+ driving capability activation for I2C2
  , syscfg_cfgr1_i2c1_fm_plus       :: Bit      -- FM+ driving capability activation for I2C1
  , syscfg_cfgr1_i2c_pb9_fm         :: Bit      -- Fast Mode Plus (FM+) driving capability activation bits.
  , syscfg_cfgr1_i2c_pb8_fm         :: Bit      -- Fast Mode Plus (FM+) driving capability activation bits.
  , syscfg_cfgr1_i2c_pb7_fm         :: Bit      -- Fast Mode Plus (FM+) driving capability activation bits.
  , syscfg_cfgr1_i2c_pb6_fm         :: Bit      -- Fast Mode Plus (FM plus) driving capability activation bits.
  , _                             :: Bits 3   -- (Reserved)
  , syscfg_cfgr1_tim17_dma_rmp      :: Bit      -- TIM17 DMA request remapping bit
  , syscfg_cfgr1_tim16_dma_rmp      :: Bit      -- TIM16 DMA request remapping bit
  , syscfg_cfgr1_usart1_rx_dma_rmp  :: Bit      -- USART1_RX DMA request remapping bit
  , syscfg_cfgr1_usart1_tx_dma_rmp  :: Bit      -- USART1_TX DMA remapping bit
  , syscfg_cfgr1_adc_dma_rmp        :: Bit      -- ADC DMA remapping bit
  , _                             :: Bits 6   -- (Reserved)
  , syscfg_cfgr1_mem_mode           :: Bits 2   -- Memory mapping selection bits
  }
|]


-- external interrupt configuration register 1
--  | offset : 0x8
--  | address: 0x40010008
[ivory|
 bitdata SYSCFG_EXTICR1 :: Bits 32 = syscfg_exticr1
  { _                   :: Bits 16  -- (Reserved)
  , syscfg_exticr1_exti3  :: Bits 4   -- EXTI 3 configuration bits
  , syscfg_exticr1_exti2  :: Bits 4   -- EXTI 2 configuration bits
  , syscfg_exticr1_exti1  :: Bits 4   -- EXTI 1 configuration bits
  , syscfg_exticr1_exti0  :: Bits 4   -- EXTI 0 configuration bits
  }
|]


-- external interrupt configuration register 2
--  | offset : 0xc
--  | address: 0x4001000c
[ivory|
 bitdata SYSCFG_EXTICR2 :: Bits 32 = syscfg_exticr2
  { _                   :: Bits 16  -- (Reserved)
  , syscfg_exticr2_exti7  :: Bits 4   -- EXTI 7 configuration bits
  , syscfg_exticr2_exti6  :: Bits 4   -- EXTI 6 configuration bits
  , syscfg_exticr2_exti5  :: Bits 4   -- EXTI 5 configuration bits
  , syscfg_exticr2_exti4  :: Bits 4   -- EXTI 4 configuration bits
  }
|]


-- external interrupt configuration register 3
--  | offset : 0x10
--  | address: 0x40010010
[ivory|
 bitdata SYSCFG_EXTICR3 :: Bits 32 = syscfg_exticr3
  { _                    :: Bits 16  -- (Reserved)
  , syscfg_exticr3_exti11  :: Bits 4   -- EXTI 11 configuration bits
  , syscfg_exticr3_exti10  :: Bits 4   -- EXTI 10 configuration bits
  , syscfg_exticr3_exti9   :: Bits 4   -- EXTI 9 configuration bits
  , syscfg_exticr3_exti8   :: Bits 4   -- EXTI 8 configuration bits
  }
|]


-- external interrupt configuration register 4
--  | offset : 0x14
--  | address: 0x40010014
[ivory|
 bitdata SYSCFG_EXTICR4 :: Bits 32 = syscfg_exticr4
  { _                    :: Bits 16  -- (Reserved)
  , syscfg_exticr4_exti15  :: Bits 4   -- EXTI 15 configuration bits
  , syscfg_exticr4_exti14  :: Bits 4   -- EXTI 14 configuration bits
  , syscfg_exticr4_exti13  :: Bits 4   -- EXTI 13 configuration bits
  , syscfg_exticr4_exti12  :: Bits 4   -- EXTI 12 configuration bits
  }
|]


-- configuration register 2
--  | offset : 0x18
--  | address: 0x40010018
[ivory|
 bitdata SYSCFG_CFGR2 :: Bits 32 = syscfg_cfgr2
  { _                            :: Bits 23  -- (Reserved)
  , syscfg_cfgr2_sram_pef          :: Bit      -- SRAM parity flag
  , _                            :: Bits 5   -- (Reserved)
  , syscfg_cfgr2_pvd_lock          :: Bit      -- PVD lock enable bit
  , syscfg_cfgr2_sram_parity_lock  :: Bit      -- SRAM parity lock bit
  , syscfg_cfgr2_locup_lock        :: Bit      -- Cortex-M0 LOCKUP bit enable bit
  }
|]


-- control and status register
--  | offset : 0x1c
--  | address: 0x4001001c
[ivory|
 bitdata SYSCFG_COMP_CSR :: Bits 32 = syscfg_comp_csr
  { syscfg_comp_csr_comp2lock      :: Bit      -- Comparator 2 lock
  , syscfg_comp_csr_comp2out       :: Bit      -- Comparator 2 output
  , syscfg_comp_csr_comp2hyst      :: Bits 2   -- Comparator 2 hysteresis
  , syscfg_comp_csr_comp2pol       :: Bit      -- Comparator 2 output polarity
  , syscfg_comp_csr_comp2outsel    :: Bits 3   -- Comparator 2 output selection
  , syscfg_comp_csr_wndwen         :: Bit      -- Window mode enable
  , syscfg_comp_csr_comp2insel     :: Bits 3   -- Comparator 2 inverting input selection
  , syscfg_comp_csr_comp2mode      :: Bits 2   -- Comparator 2 mode
  , _                            :: Bit      -- (Reserved)
  , syscfg_comp_csr_comp2en        :: Bit      -- Comparator 2 enable
  , syscfg_comp_csr_comp1lock      :: Bit      -- Comparator 1 lock
  , syscfg_comp_csr_comp1out       :: Bit      -- Comparator 1 output
  , syscfg_comp_csr_comp1hyst      :: Bits 2   -- Comparator 1 hysteresis
  , syscfg_comp_csr_comp1pol       :: Bit      -- Comparator 1 output polarity
  , syscfg_comp_csr_comp1outsel    :: Bits 3   -- Comparator 1 output selection
  , _                            :: Bit      -- (Reserved)
  , syscfg_comp_csr_comp1insel     :: Bits 3   -- Comparator 1 inverting input selection
  , syscfg_comp_csr_comp1mode      :: Bits 2   -- Comparator 1 mode
  , syscfg_comp_csr_comp1_inp_dac  :: Bit      -- COMP1_INP_DAC
  , syscfg_comp_csr_comp1en        :: Bit      -- Comparator 1 enable
  }
|]

