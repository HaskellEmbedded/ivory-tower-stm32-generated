{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32.Peripheral.ADC.Regs where

import Ivory.Language
import Ivory.BSP.STM32.Peripheral.ADC.RegTypes

-- ADC Analog-to-digital converter

-- Base address: 0x40012000

-- status register
--  | offset : 0x0
--  | address: 0x40012000
[ivory|
 bitdata ADC_SR :: Bits 32 = adc_sr
  { _            :: Bits 26 -- (Reserved)
  , adc_sr_ovr   :: Bit     -- Overrun
  , adc_sr_strt  :: Bit     -- Regular channel start flag
  , adc_sr_jstrt :: Bit     -- Injected channel start flag
  , adc_sr_jeoc  :: Bit     -- Injected channel end of conversion
  , adc_sr_eoc   :: Bit     -- Regular channel end of conversion
  , adc_sr_awd   :: Bit     -- Analog watchdog flag
  }
|]

-- control register 1
--  | offset : 0x4
--  | address: 0x40012004
[ivory|
 bitdata ADC_CR1 :: Bits 32 = adc_cr1
  { _               :: Bits 5        -- (Reserved)
  , adc_cr1_ovrie   :: Bit           -- Overrun interrupt enable
  , adc_cr1_res     :: ADCResolution -- Resolution
  , adc_cr1_awden   :: Bit           -- Analog watchdog enable on regular channels
  , adc_cr1_jawden  :: Bit           -- Analog watchdog enable on injected channels
  , _               :: Bits 6        -- (Reserved)
  , adc_cr1_discnum :: Bits 3        -- Discontinuous mode channel count
  , adc_cr1_jdiscen :: Bit           -- Discontinuous mode on injected channels
  , adc_cr1_discen  :: Bit           -- Discontinuous mode on regular channels
  , adc_cr1_jauto   :: Bit           -- Automatic injected group conversion
  , adc_cr1_awdsgl  :: Bit           -- Enable the watchdog on a single channel in scan mode
  , adc_cr1_scan    :: Bit           -- Scan mode
  , adc_cr1_jeocie  :: Bit           -- Interrupt enable for injected channels
  , adc_cr1_awdie   :: Bit           -- Analog watchdog interrupt enable
  , adc_cr1_eocie   :: Bit           -- Interrupt enable for EOC
  , adc_cr1_awdch   :: Bits 5        -- Analog watchdog channel select bits
  }
|]

-- control register 2
--  | offset : 0x8
--  | address: 0x40012008
[ivory|
 bitdata ADC_CR2 :: Bits 32 = adc_cr2
  { _                :: Bit        -- (Reserved)
  , adc_cr2_swstart  :: Bit        -- Start conversion of regular channels
  , adc_cr2_exten    :: ADCExtEn   -- External trigger enable for regular channels
  , adc_cr2_extsel   :: ADCExtSel  -- External event select for regular group
  , _                :: Bit        -- (Reserved)
  , adc_cr2_jswstart :: Bit        -- Start conversion of injected channels
  , adc_cr2_jexten   :: ADCExtEn   -- External trigger enable for injected channels
  , adc_cr2_jextsel  :: ADCJExtSel -- External event select for injected group
  , _                :: Bits 4     -- (Reserved)
  , adc_cr2_align    :: Bit        -- Data alignment
  , adc_cr2_eocs     :: Bit        -- End of conversion selection
  , adc_cr2_dds      :: Bit        -- DMA disable selection (for single ADC mode)
  , adc_cr2_dma      :: Bit        -- Direct memory access mode (for single ADC mode)
  , _                :: Bits 6     -- (Reserved)
  , adc_cr2_cont     :: Bit        -- Continuous conversion
  , adc_cr2_adon     :: Bit        -- A/D Converter ON / OFF
  }
|]

-- sample time register 1
--  | offset : 0xc
--  | address: 0x4001200c
[ivory|
 bitdata ADC_SMPR1 :: Bits 32 = adc_smpr1
  { _               :: Bits 5 -- (Reserved)
  , adc_smpr1_smp18 :: Bits 3 -- Channel 18 sampling time selection
  , adc_smpr1_smp17 :: Bits 3 -- Channel 17 sampling time selection
  , adc_smpr1_smp16 :: Bits 3 -- Channel 16 sampling time selection
  , adc_smpr1_smp15 :: Bits 3 -- Channel 15 sampling time selection
  , adc_smpr1_smp14 :: Bits 3 -- Channel 14 sampling time selection
  , adc_smpr1_smp13 :: Bits 3 -- Channel 13 sampling time selection
  , adc_smpr1_smp12 :: Bits 3 -- Channel 12 sampling time selection
  , adc_smpr1_smp11 :: Bits 3 -- Channel 11 sampling time selection
  , adc_smpr1_smp10 :: Bits 3 -- Channel 10 sampling time selection
  }
|]

-- sample time register 2
--  | offset : 0x10
--  | address: 0x40012010
[ivory|
 bitdata ADC_SMPR2 :: Bits 32 = adc_smpr2
  { _              :: Bits 2 -- (Reserved)
  , adc_smpr2_smp9 :: Bits 3 -- Channel 9 sampling time selection
  , adc_smpr2_smp8 :: Bits 3 -- Channel 8 sampling time selection
  , adc_smpr2_smp7 :: Bits 3 -- Channel 7 sampling time selection
  , adc_smpr2_smp6 :: Bits 3 -- Channel 6 sampling time selection
  , adc_smpr2_smp5 :: Bits 3 -- Channel 5 sampling time selection
  , adc_smpr2_smp4 :: Bits 3 -- Channel 4 sampling time selection
  , adc_smpr2_smp3 :: Bits 3 -- Channel 3 sampling time selection
  , adc_smpr2_smp2 :: Bits 3 -- Channel 2 sampling time selection
  , adc_smpr2_smp1 :: Bits 3 -- Channel 1 sampling time selection
  , adc_smpr2_smp0 :: Bits 3 -- Channel 0 sampling time selection
  }
|]

-- injected channel data offset register x
--  | offset : 0x14
--  | address: 0x40012014
[ivory|
 bitdata ADC_JOFR1 :: Bits 32 = adc_jofr1
  { _                 :: Bits 20 -- (Reserved)
  , adc_jofr1_joffset :: Bits 12 -- Data offset for injected channel x
  }
|]

-- injected channel data offset register x
--  | offset : 0x18
--  | address: 0x40012018
[ivory|
 bitdata ADC_JOFR2 :: Bits 32 = adc_jofr2
  { _                 :: Bits 20 -- (Reserved)
  , adc_jofr2_joffset :: Bits 12 -- Data offset for injected channel x
  }
|]

-- injected channel data offset register x
--  | offset : 0x1c
--  | address: 0x4001201c
[ivory|
 bitdata ADC_JOFR3 :: Bits 32 = adc_jofr3
  { _                 :: Bits 20 -- (Reserved)
  , adc_jofr3_joffset :: Bits 12 -- Data offset for injected channel x
  }
|]

-- injected channel data offset register x
--  | offset : 0x20
--  | address: 0x40012020
[ivory|
 bitdata ADC_JOFR4 :: Bits 32 = adc_jofr4
  { _                 :: Bits 20 -- (Reserved)
  , adc_jofr4_joffset :: Bits 12 -- Data offset for injected channel x
  }
|]

-- watchdog higher threshold register
--  | offset : 0x24
--  | address: 0x40012024
[ivory|
 bitdata ADC_HTR :: Bits 32 = adc_htr
  { _          :: Bits 20 -- (Reserved)
  , adc_htr_ht :: Bits 12 -- Analog watchdog higher threshold
  }
|]

-- watchdog lower threshold register
--  | offset : 0x28
--  | address: 0x40012028
[ivory|
 bitdata ADC_LTR :: Bits 32 = adc_ltr
  { _          :: Bits 20 -- (Reserved)
  , adc_ltr_lt :: Bits 12 -- Analog watchdog lower threshold
  }
|]

-- regular sequence register 1
--  | offset : 0x2c
--  | address: 0x4001202c
[ivory|
 bitdata ADC_SQR1 :: Bits 32 = adc_sqr1
  { _             :: Bits 8 -- (Reserved)
  , adc_sqr1_l    :: Bits 4 -- Regular channel sequence length
  , adc_sqr1_sq16 :: Bits 5 -- 16th conversion in regular sequence
  , adc_sqr1_sq15 :: Bits 5 -- 15th conversion in regular sequence
  , adc_sqr1_sq14 :: Bits 5 -- 14th conversion in regular sequence
  , adc_sqr1_sq13 :: Bits 5 -- 13th conversion in regular sequence
  }
|]

-- regular sequence register 2
--  | offset : 0x30
--  | address: 0x40012030
[ivory|
 bitdata ADC_SQR2 :: Bits 32 = adc_sqr2
  { _             :: Bits 2 -- (Reserved)
  , adc_sqr2_sq12 :: Bits 5 -- 12th conversion in regular sequence
  , adc_sqr2_sq11 :: Bits 5 -- 11th conversion in regular sequence
  , adc_sqr2_sq10 :: Bits 5 -- 10th conversion in regular sequence
  , adc_sqr2_sq9  :: Bits 5 -- 9th conversion in regular sequence
  , adc_sqr2_sq8  :: Bits 5 -- 8th conversion in regular sequence
  , adc_sqr2_sq7  :: Bits 5 -- 7th conversion in regular sequence
  }
|]

-- regular sequence register 3
--  | offset : 0x34
--  | address: 0x40012034
[ivory|
 bitdata ADC_SQR3 :: Bits 32 = adc_sqr3
  { _            :: Bits 2 -- (Reserved)
  , adc_sqr3_sq6 :: Bits 5 -- 6th conversion in regular sequence
  , adc_sqr3_sq5 :: Bits 5 -- 5th conversion in regular sequence
  , adc_sqr3_sq4 :: Bits 5 -- 4th conversion in regular sequence
  , adc_sqr3_sq3 :: Bits 5 -- 3rd conversion in regular sequence
  , adc_sqr3_sq2 :: Bits 5 -- 2nd conversion in regular sequence
  , adc_sqr3_sq1 :: Bits 5 -- 1st conversion in regular sequence
  }
|]

-- injected sequence register
--  | offset : 0x38
--  | address: 0x40012038
[ivory|
 bitdata ADC_JSQR :: Bits 32 = adc_jsqr
  { _             :: Bits 10 -- (Reserved)
  , adc_jsqr_jl   :: ADCJL   -- Injected sequence length
  , adc_jsqr_jsq4 :: Bits 5  -- 4th conversion in injected sequence
  , adc_jsqr_jsq3 :: Bits 5  -- 3rd conversion in injected sequence
  , adc_jsqr_jsq2 :: Bits 5  -- 2nd conversion in injected sequence
  , adc_jsqr_jsq1 :: Bits 5  -- 1st conversion in injected sequence
  }
|]

-- injected data register x
--  | offset : 0x3c
--  | address: 0x4001203c
[ivory|
 bitdata ADC_JDR1 :: Bits 32 = adc_jdr1
  { _              :: Bits 16 -- (Reserved)
  , adc_jdr1_jdata :: Bits 16 -- Injected data
  }
|]

-- injected data register x
--  | offset : 0x40
--  | address: 0x40012040
[ivory|
 bitdata ADC_JDR2 :: Bits 32 = adc_jdr2
  { _              :: Bits 16 -- (Reserved)
  , adc_jdr2_jdata :: Bits 16 -- Injected data
  }
|]

-- injected data register x
--  | offset : 0x44
--  | address: 0x40012044
[ivory|
 bitdata ADC_JDR3 :: Bits 32 = adc_jdr3
  { _              :: Bits 16 -- (Reserved)
  , adc_jdr3_jdata :: Bits 16 -- Injected data
  }
|]

-- injected data register x
--  | offset : 0x48
--  | address: 0x40012048
[ivory|
 bitdata ADC_JDR4 :: Bits 32 = adc_jdr4
  { _              :: Bits 16 -- (Reserved)
  , adc_jdr4_jdata :: Bits 16 -- Injected data
  }
|]

-- regular data register
--  | offset : 0x4c
--  | address: 0x4001204c
[ivory|
 bitdata ADC_DR :: Bits 32 = adc_dr
  { _           :: Bits 16 -- (Reserved)
  , adc_dr_data :: Bits 16 -- Regular data
  }
|]
