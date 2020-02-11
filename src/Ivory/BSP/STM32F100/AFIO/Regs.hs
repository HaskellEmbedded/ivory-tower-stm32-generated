{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32F100.AFIO.Regs where

import Ivory.Language

-- AFIO Alternate function I/O

-- Base address: 0x40010000

-- Event Control Register (AFIO_EVCR)
--  | offset : 0x0
--  | address: 0x40010000
[ivory|
 bitdata AFIO_EVCR :: Bits 32 = afio_evcr
  { _             :: Bits 24  -- (Reserved)
  , afio_evcr_evoe  :: Bit      -- Event Output Enable
  , afio_evcr_port  :: Bits 3   -- Port selection
  , afio_evcr_pin   :: Bits 4   -- Pin selection
  }
|]


-- AF remap and debug I/O configuration register (AFIO_MAPR)
--  | offset : 0x4
--  | address: 0x40010004
[ivory|
 bitdata AFIO_MAPR :: Bits 32 = afio_mapr
  { _                       :: Bits 5   -- (Reserved)
  , afio_mapr_swj_cfg         :: Bits 3   -- Serial wire JTAG configuration
  , _                       :: Bits 7   -- (Reserved)
  , afio_mapr_tim5ch4_iremap  :: Bit      -- Set and cleared by software
  , afio_mapr_pd01_remap      :: Bit      -- Port D0/Port D1 mapping on OSCIN/OSCOUT
  , _                       :: Bits 2   -- (Reserved)
  , afio_mapr_tim4_remap      :: Bit      -- TIM4 remapping
  , afio_mapr_tim3_remap      :: Bits 2   -- TIM3 remapping
  , afio_mapr_tim2_remap      :: Bits 2   -- TIM2 remapping
  , afio_mapr_tim1_remap      :: Bits 2   -- TIM1 remapping
  , afio_mapr_usart3_remap    :: Bits 2   -- USART3 remapping
  , afio_mapr_usart2_remap    :: Bit      -- USART2 remapping
  , afio_mapr_usart1_remap    :: Bit      -- USART1 remapping
  , afio_mapr_i2c1_remap      :: Bit      -- I2C1 remapping
  , afio_mapr_spi1_remap      :: Bit      -- SPI1 remapping
  }
|]


-- External interrupt configuration register 1 (AFIO_EXTICR1)
--  | offset : 0x8
--  | address: 0x40010008
[ivory|
 bitdata AFIO_EXTICR1 :: Bits 32 = afio_exticr1
  { _                 :: Bits 16  -- (Reserved)
  , afio_exticr1_exti3  :: Bits 4   -- EXTI3 configuration
  , afio_exticr1_exti2  :: Bits 4   -- EXTI2 configuration
  , afio_exticr1_exti1  :: Bits 4   -- EXTI1 configuration
  , afio_exticr1_exti0  :: Bits 4   -- EXTI0 configuration
  }
|]


-- External interrupt configuration register 2 (AFIO_EXTICR2)
--  | offset : 0xc
--  | address: 0x4001000c
[ivory|
 bitdata AFIO_EXTICR2 :: Bits 32 = afio_exticr2
  { _                 :: Bits 16  -- (Reserved)
  , afio_exticr2_exti7  :: Bits 4   -- EXTI7 configuration
  , afio_exticr2_exti6  :: Bits 4   -- EXTI6 configuration
  , afio_exticr2_exti5  :: Bits 4   -- EXTI5 configuration
  , afio_exticr2_exti4  :: Bits 4   -- EXTI4 configuration
  }
|]


-- External interrupt configuration register 3 (AFIO_EXTICR3)
--  | offset : 0x10
--  | address: 0x40010010
[ivory|
 bitdata AFIO_EXTICR3 :: Bits 32 = afio_exticr3
  { _                  :: Bits 16  -- (Reserved)
  , afio_exticr3_exti11  :: Bits 4   -- EXTI11 configuration
  , afio_exticr3_exti10  :: Bits 4   -- EXTI10 configuration
  , afio_exticr3_exti9   :: Bits 4   -- EXTI9 configuration
  , afio_exticr3_exti8   :: Bits 4   -- EXTI8 configuration
  }
|]


-- External interrupt configuration register 4 (AFIO_EXTICR4)
--  | offset : 0x14
--  | address: 0x40010014
[ivory|
 bitdata AFIO_EXTICR4 :: Bits 32 = afio_exticr4
  { _                  :: Bits 16  -- (Reserved)
  , afio_exticr4_exti15  :: Bits 4   -- EXTI15 configuration
  , afio_exticr4_exti14  :: Bits 4   -- EXTI14 configuration
  , afio_exticr4_exti13  :: Bits 4   -- EXTI13 configuration
  , afio_exticr4_exti12  :: Bits 4   -- EXTI12 configuration
  }
|]


-- AF remap and debug I/O configuration register
--  | offset : 0x1c
--  | address: 0x4001001c
[ivory|
 bitdata AFIO_MAPR2 :: Bits 32 = afio_mapr2
  { _                             :: Bits 18  -- (Reserved)
  , afio_mapr2_misc_remap           :: Bit      -- Miscellaneous features remapping
  , afio_mapr2_tim12_remap          :: Bit      -- TIM12 remapping
  , afio_mapr2_tim67_dac_dma_remap  :: Bit      -- TIM67_DAC DMA remapping
  , afio_mapr2_fsmc_nadv            :: Bit      -- NADV connect/disconnect
  , afio_mapr2_tim14_remap          :: Bit      -- TIM14 remapping
  , afio_mapr2_tim13_remap          :: Bit      -- TIM13 remapping
  , _                             :: Bits 3   -- (Reserved)
  , afio_mapr2_tim1_dma_remap       :: Bit      -- TIM1 DMA remapping
  , afio_mapr2_cec_remap            :: Bit      -- CEC remapping
  , afio_mapr2_tim17_remap          :: Bit      -- TIM17 remapping
  , afio_mapr2_tim16_remap          :: Bit      -- TIM16 remapping
  , afio_mapr2_tim15_remap          :: Bit      -- TIM15 remapping
  }
|]

