{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32F318.SYSCFG.Regs where

import Ivory.Language

-- SYSCFG System configuration controller

-- Base address: 0x40010000

-- configuration register 1
--  | offset : 0x0
--  | address: 0x40010000
[ivory|
 bitdata SYSCFG_CFGR1 :: Bits 32 = syscfg_cfgr1
  { syscfg_cfgr1_fpu_it             :: Bits 6   -- Interrupt enable bits from FPU
  , _                             :: Bits 2   -- (Reserved)
  , syscfg_cfgr1_encoder_mode       :: Bits 2   -- Encoder mode
  , syscfg_cfgr1_i2c2_fm            :: Bit      -- I2C2 Fast Mode Plus
  , syscfg_cfgr1_i2c1_fm            :: Bit      -- I2C1 Fast Mode Plus
  , syscfg_cfgr1_i2c_pb9_fm         :: Bit      -- Fast Mode Plus (FM+) driving capability activation bits.
  , syscfg_cfgr1_i2c_pb8_fm         :: Bit      -- Fast Mode Plus (FM+) driving capability activation bits.
  , syscfg_cfgr1_i2c_pb7_fm         :: Bit      -- Fast Mode Plus (FM+) driving capability activation bits.
  , syscfg_cfgr1_i2c_pb6_fm         :: Bit      -- Fast Mode Plus (FM+) driving capability activation bits.
  , _                             :: Bit      -- (Reserved)
  , syscfg_cfgr1_tim7_dac2_dma_rmp  :: Bit      -- TIM7 and DAC2 DMA request remapping bit
  , syscfg_cfgr1_tim6_dac1_dma_rmp  :: Bit      -- TIM6 and DAC1 DMA request remapping bit
  , syscfg_cfgr1_tim17_dma_rmp      :: Bit      -- TIM17 DMA request remapping bit
  , syscfg_cfgr1_tim16_dma_rmp      :: Bit      -- TIM16 DMA request remapping bit
  , _                             :: Bits 2   -- (Reserved)
  , syscfg_cfgr1_adc24_dma_rmp      :: Bit      -- ADC24 DMA remapping bit
  , syscfg_cfgr1_dac_trig_rmp       :: Bit      -- DAC trigger remap (when TSEL = 001)
  , syscfg_cfgr1_tim1_itr_rmp       :: Bit      -- Timer 1 ITR3 selection
  , syscfg_cfgr1_usb_it_rmp         :: Bit      -- USB interrupt remap
  , _                             :: Bits 3   -- (Reserved)
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
  , _                            :: Bits 3   -- (Reserved)
  , syscfg_cfgr2_byp_add_par       :: Bit      -- Bypass address bit 29 in parity calculation
  , _                            :: Bit      -- (Reserved)
  , syscfg_cfgr2_pvd_lock          :: Bit      -- PVD lock enable bit
  , syscfg_cfgr2_sram_parity_lock  :: Bit      -- SRAM parity lock bit
  , syscfg_cfgr2_locup_lock        :: Bit      -- Cortex-M0 LOCKUP bit enable bit
  }
|]


-- CCM SRAM protection register
--  | offset : 0x4
--  | address: 0x40010004
[ivory|
 bitdata SYSCFG_RCR :: Bits 32 = syscfg_rcr
  { _                  :: Bits 24  -- (Reserved)
  , syscfg_rcr_page7_wp  :: Bit      -- CCM SRAM page write protection bit
  , syscfg_rcr_page6_wp  :: Bit      -- CCM SRAM page write protection bit
  , syscfg_rcr_page5_wp  :: Bit      -- CCM SRAM page write protection bit
  , syscfg_rcr_page4_wp  :: Bit      -- CCM SRAM page write protection bit
  , syscfg_rcr_page3_wp  :: Bit      -- CCM SRAM page write protection bit
  , syscfg_rcr_page2_wp  :: Bit      -- CCM SRAM page write protection bit
  , syscfg_rcr_page1_wp  :: Bit      -- CCM SRAM page write protection bit
  , syscfg_rcr_page0_wp  :: Bit      -- CCM SRAM page write protection bit
  }
|]


-- configuration register 3
--  | offset : 0x50
--  | address: 0x40010050
[ivory|
 bitdata SYSCFG_CFGR3 :: Bits 32 = syscfg_cfgr3
  { _                           :: Bits 14  -- (Reserved)
  , syscfg_cfgr3_dac1_trig5_rmp   :: Bit      -- DAC1_CH1 / DAC1_CH2 Trigger remap
  , syscfg_cfgr3_dac1_trig3_rmp   :: Bit      -- DAC1_CH1 / DAC1_CH2 Trigger remap
  , _                           :: Bits 6   -- (Reserved)
  , syscfg_cfgr3_adc2_dma_rmp_1   :: Bit      -- ADC2 DMA controller remapping bit
  , _                           :: Bit      -- (Reserved)
  , syscfg_cfgr3_adc2_dma_rmp_0   :: Bits 2   -- ADC2 DMA channel remapping bit
  , syscfg_cfgr3_i2c1_rx_dma_rmp  :: Bits 2   -- I2C1_RX DMA remapping bit
  , syscfg_cfgr3_spi1_tx_dma_rmp  :: Bits 2   -- SPI1_TX DMA remapping bit
  , syscfg_cfgr3_spi1_rx_dma_rmp  :: Bits 2   -- SPI1_RX DMA remapping bit
  }
|]


-- OPAMP2 control register
--  | offset : 0x3c
--  | address: 0x4001003c
[ivory|
 bitdata SYSCFG_OPAMP2_CSR :: Bits 32 = syscfg_opamp2_csr
  { syscfg_opamp2_csr_lock         :: Bit      -- OPAMP 2 lock
  , syscfg_opamp2_csr_outcal       :: Bit      -- OPAMP 2 ouput status flag
  , syscfg_opamp2_csr_tstref       :: Bit      -- TSTREF
  , syscfg_opamp2_csr_trimoffsetn  :: Bits 5   -- Offset trimming value (NMOS)
  , syscfg_opamp2_csr_trimoffsetp  :: Bits 5   -- Offset trimming value (PMOS)
  , syscfg_opamp2_csr_user_trim    :: Bit      -- User trimming enable
  , syscfg_opamp2_csr_pga_gain     :: Bits 4   -- Gain in PGA mode
  , syscfg_opamp2_csr_cal_sel      :: Bits 2   -- Calibration selection
  , syscfg_opamp2_csr_calon        :: Bit      -- Calibration mode enable
  , syscfg_opamp2_csr_vps_sel      :: Bits 2   -- OPAMP2 Non inverting input secondary selection
  , syscfg_opamp2_csr_vms_sel      :: Bit      -- OPAMP2 inverting input secondary selection
  , syscfg_opamp2_csr_tcm_en       :: Bit      -- Timer controlled Mux mode enable
  , syscfg_opamp2_csr_vm_sel       :: Bits 2   -- OPAMP2 inverting input selection
  , _                            :: Bit      -- (Reserved)
  , syscfg_opamp2_csr_vp_sel       :: Bits 2   -- OPAMP2 Non inverting input selection
  , syscfg_opamp2_csr_force_vp     :: Bit      -- FORCE_VP
  , syscfg_opamp2_csr_opamp2en     :: Bit      -- OPAMP2 enable
  }
|]


-- control and status register
--  | offset : 0x20
--  | address: 0x40010020
[ivory|
 bitdata SYSCFG_COMP2_CSR :: Bits 32 = syscfg_comp2_csr
  { syscfg_comp2_csr_comp2lock       :: Bit      -- Comparator 2 lock
  , syscfg_comp2_csr_comp2out        :: Bit      -- Comparator 2 output
  , _                              :: Bits 9   -- (Reserved)
  , syscfg_comp2_csr_comp2_blanking  :: Bits 3   -- Comparator 2 blanking source
  , syscfg_comp2_csr_comp2hyst       :: Bits 2   -- Comparator 2 hysteresis
  , syscfg_comp2_csr_comp2pol        :: Bit      -- Comparator 2 output polarity
  , _                              :: Bit      -- (Reserved)
  , syscfg_comp2_csr_comp2_out_sel   :: Bits 4   -- Comparator 2 output selection
  , syscfg_comp2_csr_comp2inmsel     :: Bit      -- Comparator 1inverting input selection
  , _                              :: Bit      -- (Reserved)
  , syscfg_comp2_csr_comp2inpsel     :: Bit      -- Comparator 2 non inverted input selection
  , syscfg_comp2_csr_comp2insel      :: Bits 3   -- Comparator 2 inverting input selection
  , syscfg_comp2_csr_comp2mode       :: Bits 2   -- Comparator 2 mode
  , _                              :: Bit      -- (Reserved)
  , syscfg_comp2_csr_comp2en         :: Bit      -- Comparator 2 enable
  }
|]


-- control and status register
--  | offset : 0x28
--  | address: 0x40010028
[ivory|
 bitdata SYSCFG_COMP4_CSR :: Bits 32 = syscfg_comp4_csr
  { syscfg_comp4_csr_comp4lock       :: Bit      -- Comparator 4 lock
  , syscfg_comp4_csr_comp4out        :: Bit      -- Comparator 4 output
  , _                              :: Bits 9   -- (Reserved)
  , syscfg_comp4_csr_comp4_blanking  :: Bits 3   -- Comparator 4 blanking source
  , syscfg_comp4_csr_comp4hyst       :: Bits 2   -- Comparator 4 hysteresis
  , syscfg_comp4_csr_comp4pol        :: Bit      -- Comparator 4 output polarity
  , _                              :: Bit      -- (Reserved)
  , syscfg_comp4_csr_comp4_out_sel   :: Bits 4   -- Comparator 4 output selection
  , syscfg_comp4_csr_com4winmode     :: Bit      -- Comparator 4 window mode
  , _                              :: Bit      -- (Reserved)
  , syscfg_comp4_csr_comp4inpsel     :: Bit      -- Comparator 4 non inverted input selection
  , syscfg_comp4_csr_comp4insel      :: Bits 3   -- Comparator 4 inverting input selection
  , syscfg_comp4_csr_comp4mode       :: Bits 2   -- Comparator 4 mode
  , _                              :: Bit      -- (Reserved)
  , syscfg_comp4_csr_comp4en         :: Bit      -- Comparator 4 enable
  }
|]


-- control and status register
--  | offset : 0x30
--  | address: 0x40010030
[ivory|
 bitdata SYSCFG_COMP6_CSR :: Bits 32 = syscfg_comp6_csr
  { syscfg_comp6_csr_comp6lock       :: Bit      -- Comparator 6 lock
  , syscfg_comp6_csr_comp6out        :: Bit      -- Comparator 6 output
  , _                              :: Bits 9   -- (Reserved)
  , syscfg_comp6_csr_comp6_blanking  :: Bits 3   -- Comparator 6 blanking source
  , syscfg_comp6_csr_comp6hyst       :: Bits 2   -- Comparator 6 hysteresis
  , syscfg_comp6_csr_comp6pol        :: Bit      -- Comparator 6 output polarity
  , _                              :: Bit      -- (Reserved)
  , syscfg_comp6_csr_comp6_out_sel   :: Bits 4   -- Comparator 6 output selection
  , syscfg_comp6_csr_com6winmode     :: Bit      -- Comparator 6 window mode
  , _                              :: Bit      -- (Reserved)
  , syscfg_comp6_csr_comp6inpsel     :: Bit      -- Comparator 6 non inverted input selection
  , syscfg_comp6_csr_comp6insel      :: Bits 3   -- Comparator 6 inverting input selection
  , syscfg_comp6_csr_comp6mode       :: Bits 2   -- Comparator 6 mode
  , _                              :: Bit      -- (Reserved)
  , syscfg_comp6_csr_comp6en         :: Bit      -- Comparator 6 enable
  }
|]

