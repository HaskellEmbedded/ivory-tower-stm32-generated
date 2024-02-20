{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32F303.SYSCFG.Regs where

import Ivory.Language

-- SYSCFG System configuration controller

-- Base address: 0x40010000

-- configuration register 1
--  | offset : 0x0
--  | address: 0x40010000
[ivory|
 bitdata SYSCFG_CFGR1 :: Bits 32 = syscfg_cfgr1
  { syscfg_cfgr1_fpu_ie5                :: Bit      -- Inexact interrupt enable
  , syscfg_cfgr1_fpu_ie4                :: Bit      -- Input denormal interrupt enable
  , syscfg_cfgr1_fpu_ie3                :: Bit      -- Overflow interrupt enable
  , syscfg_cfgr1_fpu_ie2                :: Bit      -- Underflow interrupt enable
  , syscfg_cfgr1_fpu_ie1                :: Bit      -- Devide-by-zero interrupt enable
  , syscfg_cfgr1_fpu_ie0                :: Bit      -- Invalid operation interrupt enable
  , _                                 :: Bit      -- (Reserved)
  , syscfg_cfgr1_i2c3_fmp               :: Bit      -- I2C3 Fast Mode Plus
  , syscfg_cfgr1_encoder_mode           :: Bits 2   -- Encoder mode
  , syscfg_cfgr1_i2c2_fmp               :: Bit      -- I2C2 Fast Mode Plus
  , syscfg_cfgr1_i2c1_fmp               :: Bit      -- I2C1 Fast Mode Plus
  , syscfg_cfgr1_i2c_pb9_fmp            :: Bit      -- Fast Mode Plus (FM+) driving capability activation bits.
  , syscfg_cfgr1_i2c_pb8_fmp            :: Bit      -- Fast Mode Plus (FM+) driving capability activation bits.
  , syscfg_cfgr1_i2c_pb7_fmp            :: Bit      -- Fast Mode Plus (FM+) driving capability activation bits.
  , syscfg_cfgr1_i2c_pb6_fmp            :: Bit      -- Fast Mode Plus (FM+) driving capability activation bits.
  , syscfg_cfgr1_dac2_ch1_dma_rmp       :: Bit      -- DAC2 channel1 DMA remap
  , syscfg_cfgr1_tim7_dac1_ch2_dma_rmp  :: Bit      -- TIM7 and DAC2 DMA request remapping bit
  , syscfg_cfgr1_tim6_dac1_ch1_dma_rmp  :: Bit      -- TIM6 and DAC1 DMA request remapping bit
  , syscfg_cfgr1_tim17_dma_rmp          :: Bit      -- TIM17 DMA request remapping bit
  , syscfg_cfgr1_tim16_dma_rmp          :: Bit      -- TIM16 DMA request remapping bit
  , _                                 :: Bits 2   -- (Reserved)
  , syscfg_cfgr1_adc2_dma_rmp           :: Bit      -- ADC24 DMA remapping bit
  , syscfg_cfgr1_dac1_trig_rmp          :: Bit      -- DAC trigger remap (when TSEL = 001)
  , syscfg_cfgr1_tim1_itr3_rmp          :: Bit      -- Timer 1 ITR3 selection
  , syscfg_cfgr1_usb_it_rmp             :: Bit      -- USB interrupt remap
  , _                                 :: Bits 2   -- (Reserved)
  , syscfg_cfgr1_mem_mode               :: Bits 3   -- Memory mapping selection bits
  }
|]


-- CCM SRAM protection register
--  | offset : 0x4
--  | address: 0x40010004
[ivory|
 bitdata SYSCFG_RCR :: Bits 32 = syscfg_rcr
  { _                   :: Bits 16  -- (Reserved)
  , syscfg_rcr_page15_wp  :: Bit      -- CCM SRAM page write protection bit
  , syscfg_rcr_page14_wp  :: Bit      -- CCM SRAM page write protection bit
  , syscfg_rcr_page13_wp  :: Bit      -- CCM SRAM page write protection bit
  , syscfg_rcr_page12_wp  :: Bit      -- CCM SRAM page write protection bit
  , syscfg_rcr_page11_wp  :: Bit      -- CCM SRAM page write protection bit
  , syscfg_rcr_page10_wp  :: Bit      -- CCM SRAM page write protection bit
  , syscfg_rcr_page9_wp   :: Bit      -- CCM SRAM page write protection bit
  , syscfg_rcr_page8_wp   :: Bit      -- CCM SRAM page write protection bit
  , syscfg_rcr_page7_wp   :: Bit      -- CCM SRAM page write protection bit
  , syscfg_rcr_page6_wp   :: Bit      -- CCM SRAM page write protection bit
  , syscfg_rcr_page5_wp   :: Bit      -- CCM SRAM page write protection bit
  , syscfg_rcr_page4_wp   :: Bit      -- CCM SRAM page write protection bit
  , syscfg_rcr_page3_wp   :: Bit      -- CCM SRAM page write protection bit
  , syscfg_rcr_page2_wp   :: Bit      -- CCM SRAM page write protection bit
  , syscfg_rcr_page1_wp   :: Bit      -- CCM SRAM page write protection bit
  , syscfg_rcr_page0_wp   :: Bit      -- CCM SRAM page write protection bit
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
  , _                            :: Bits 3   -- (Reserved)
  , syscfg_cfgr2_byp_addr_par      :: Bit      -- Bypass address bit 29 in parity calculation
  , _                            :: Bit      -- (Reserved)
  , syscfg_cfgr2_pvd_lock          :: Bit      -- PVD lock enable bit
  , syscfg_cfgr2_sram_parity_lock  :: Bit      -- SRAM parity lock bit
  , syscfg_cfgr2_lockup_lock       :: Bit      -- Cortex-M0 LOCKUP bit enable bit
  }
|]


-- configuration register 4
--  | offset : 0x48
--  | address: 0x40010048
[ivory|
 bitdata SYSCFG_CFGR4 :: Bits 32 = syscfg_cfgr4
  { _                            :: Bits 18  -- (Reserved)
  , syscfg_cfgr4_adc34_jext14_rmp  :: Bit      -- Controls the Input trigger of ADC34 injected channel JEXT14
  , syscfg_cfgr4_adc34_jext11_rmp  :: Bit      -- Controls the Input trigger of ADC34 injected channel JEXT11
  , syscfg_cfgr4_adc34_jext5_rmp   :: Bit      -- Controls the Input trigger of ADC34 injected channel JEXT5
  , syscfg_cfgr4_adc34_ext15_rmp   :: Bit      -- Controls the Input trigger of ADC34 regular channel EXT15
  , syscfg_cfgr4_adc34_ext6_rmp    :: Bit      -- Controls the Input trigger of ADC34 regular channel EXT6
  , syscfg_cfgr4_adc34_ext5_rmp    :: Bit      -- Controls the Input trigger of ADC34 regular channel EXT5
  , syscfg_cfgr4_adc12_jext13_rmp  :: Bit      -- Controls the Input trigger of ADC12 injected channel JEXT13
  , syscfg_cfgr4_adc12_jext6_rmp   :: Bit      -- Controls the Input trigger of ADC12 injected channel JEXT6
  , syscfg_cfgr4_adc12_jext3_rmp   :: Bit      -- Controls the Input trigger of ADC12 injected channel JEXT3
  , syscfg_cfgr4_adc12_ext15_rmp   :: Bit      -- Controls the Input trigger of ADC12 regular channel EXT15
  , syscfg_cfgr4_adc12_ext13_rmp   :: Bit      -- Controls the Input trigger of ADC12 regular channel EXT13
  , syscfg_cfgr4_adc12_ext5_rmp    :: Bit      -- Controls the Input trigger of ADC12 regular channel EXT5
  , syscfg_cfgr4_adc12_ext3_rmp    :: Bit      -- Controls the Input trigger of ADC12 regular channel EXT3
  , syscfg_cfgr4_adc12_ext2_rmp    :: Bit      -- Controls the Input trigger of ADC12 regular channel EXT2
  }
|]


-- configuration register 3
--  | offset : 0x50
--  | address: 0x40010050
[ivory|
 bitdata SYSCFG_CFGR3 :: Bits 32 = syscfg_cfgr3
  { _                           :: Bits 22  -- (Reserved)
  , syscfg_cfgr3_adc2_dma_rmp     :: Bits 2   -- ADC2 DMA remapping bit
  , syscfg_cfgr3_i2c1_tx_dma_rmp  :: Bits 2   -- I2C1_TX DMA remapping bit
  , syscfg_cfgr3_i2c1_rx_dma_rmp  :: Bits 2   -- I2C1_RX DMA remapping bit
  , syscfg_cfgr3_spi1_tx_dma_rmp  :: Bits 2   -- SPI1_TX DMA remapping bit
  , syscfg_cfgr3_spi1_rx_dma_rmp  :: Bits 2   -- SPI1_RX DMA remapping bit
  }
|]

