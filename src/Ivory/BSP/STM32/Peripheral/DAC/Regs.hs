{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32.Peripheral.DAC.Regs where

import Ivory.Language
import Ivory.BSP.STM32.Peripheral.DAC.RegTypes

-- DAC Digital-to-analog converter

-- Base address: 0x40007400

-- control register
--  | offset : 0x0
--  | address: 0x40007400
[ivory|
 bitdata DAC_CR :: Bits 32 = dac_cr
  { _                :: Bits 2  -- (Reserved)
  , dac_cr_dmaudrie2 :: Bit     -- DAC channel2 DMA underrun interrupt enable
  , dac_cr_dmaen2    :: Bit     -- DAC channel2 DMA enable
  , dac_cr_mamp2     :: DACMAMP -- DAC channel2 mask/amplitude selector
  , dac_cr_wave2     :: DACWAVE -- DAC channel2 noise/triangle wave generation enable
  , dac_cr_tsel2     :: DACTSEL -- DAC channel2 trigger selection
  , dac_cr_ten2      :: Bit     -- DAC channel2 trigger enable
  , dac_cr_boff2     :: Bit     -- DAC channel2 output buffer disable
  , dac_cr_en2       :: Bit     -- DAC channel2 enable
  , _                :: Bits 2  -- (Reserved)
  , dac_cr_dmaudrie1 :: Bit     -- DAC channel1 DMA Underrun Interrupt enable
  , dac_cr_dmaen1    :: Bit     -- DAC channel1 DMA enable
  , dac_cr_mamp1     :: DACMAMP -- DAC channel1 mask/amplitude selector
  , dac_cr_wave1     :: DACWAVE -- DAC channel1 noise/triangle wave generation enable
  , dac_cr_tsel1     :: DACTSEL -- DAC channel1 trigger selection
  , dac_cr_ten1      :: Bit     -- DAC channel1 trigger enable
  , dac_cr_boff1     :: Bit     -- DAC channel1 output buffer disable
  , dac_cr_en1       :: Bit     -- DAC channel1 enable
  }
|]

-- software trigger register
--  | offset : 0x4
--  | address: 0x40007404
[ivory|
 bitdata DAC_SWTRIGR :: Bits 32 = dac_swtrigr
  { _                   :: Bits 30 -- (Reserved)
  , dac_swtrigr_swtrig2 :: Bit     -- DAC channel2 software trigger
  , dac_swtrigr_swtrig1 :: Bit     -- DAC channel1 software trigger
  }
|]

-- channel1 12-bit right-aligned data holding register
--  | offset : 0x8
--  | address: 0x40007408
[ivory|
 bitdata DAC_DHR12R1 :: Bits 32 = dac_dhr12r1
  { _                    :: Bits 20 -- (Reserved)
  , dac_dhr12r1_dacc1dhr :: Bits 12 -- DAC channel1 12-bit right-aligned data
  }
|]

-- channel1 12-bit left aligned data holding register
--  | offset : 0xc
--  | address: 0x4000740c
[ivory|
 bitdata DAC_DHR12L1 :: Bits 32 = dac_dhr12l1
  { _                    :: Bits 16 -- (Reserved)
  , dac_dhr12l1_dacc1dhr :: Bits 12 -- DAC channel1 12-bit left-aligned data
  , _                    :: Bits 4  -- (Reserved)
  }
|]

-- channel1 8-bit right aligned data holding register
--  | offset : 0x10
--  | address: 0x40007410
[ivory|
 bitdata DAC_DHR8R1 :: Bits 32 = dac_dhr8r1
  { _                   :: Bits 24 -- (Reserved)
  , dac_dhr8r1_dacc1dhr :: Bits 8  -- DAC channel1 8-bit right-aligned data
  }
|]

-- channel2 12-bit right aligned data holding register
--  | offset : 0x14
--  | address: 0x40007414
[ivory|
 bitdata DAC_DHR12R2 :: Bits 32 = dac_dhr12r2
  { _                    :: Bits 20 -- (Reserved)
  , dac_dhr12r2_dacc2dhr :: Bits 12 -- DAC channel2 12-bit right-aligned data
  }
|]

-- channel2 12-bit left aligned data holding register
--  | offset : 0x18
--  | address: 0x40007418
[ivory|
 bitdata DAC_DHR12L2 :: Bits 32 = dac_dhr12l2
  { _                    :: Bits 16 -- (Reserved)
  , dac_dhr12l2_dacc2dhr :: Bits 12 -- DAC channel2 12-bit left-aligned data
  , _                    :: Bits 4  -- (Reserved)
  }
|]

-- channel2 8-bit right-aligned data holding register
--  | offset : 0x1c
--  | address: 0x4000741c
[ivory|
 bitdata DAC_DHR8R2 :: Bits 32 = dac_dhr8r2
  { _                   :: Bits 24 -- (Reserved)
  , dac_dhr8r2_dacc2dhr :: Bits 8  -- DAC channel2 8-bit right-aligned data
  }
|]

-- Dual DAC 12-bit right-aligned data holding register
--  | offset : 0x20
--  | address: 0x40007420
[ivory|
 bitdata DAC_DHR12RD :: Bits 32 = dac_dhr12rd
  { _                    :: Bits 4  -- (Reserved)
  , dac_dhr12rd_dacc2dhr :: Bits 12 -- DAC channel2 12-bit right-aligned data
  , _                    :: Bits 4  -- (Reserved)
  , dac_dhr12rd_dacc1dhr :: Bits 12 -- DAC channel1 12-bit right-aligned data
  }
|]

-- DUAL DAC 12-bit left aligned data holding register
--  | offset : 0x24
--  | address: 0x40007424
[ivory|
 bitdata DAC_DHR12LD :: Bits 32 = dac_dhr12ld
  { dac_dhr12ld_dacc2dhr :: Bits 12 -- DAC channel2 12-bit left-aligned data
  , _                    :: Bits 4  -- (Reserved)
  , dac_dhr12ld_dacc1dhr :: Bits 12 -- DAC channel1 12-bit left-aligned data
  , _                    :: Bits 4  -- (Reserved)
  }
|]

-- DUAL DAC 8-bit right aligned data holding register
--  | offset : 0x28
--  | address: 0x40007428
[ivory|
 bitdata DAC_DHR8RD :: Bits 32 = dac_dhr8rd
  { _                   :: Bits 16 -- (Reserved)
  , dac_dhr8rd_dacc2dhr :: Bits 8  -- DAC channel2 8-bit right-aligned data
  , dac_dhr8rd_dacc1dhr :: Bits 8  -- DAC channel1 8-bit right-aligned data
  }
|]

-- channel1 data output register
--  | offset : 0x2c
--  | address: 0x4000742c
[ivory|
 bitdata DAC_DOR1 :: Bits 32 = dac_dor1
  { _                 :: Bits 20 -- (Reserved)
  , dac_dor1_dacc1dor :: Bits 12 -- DAC channel1 data output
  }
|]

-- channel2 data output register
--  | offset : 0x30
--  | address: 0x40007430
[ivory|
 bitdata DAC_DOR2 :: Bits 32 = dac_dor2
  { _                 :: Bits 20 -- (Reserved)
  , dac_dor2_dacc2dor :: Bits 12 -- DAC channel2 data output
  }
|]

-- status register
--  | offset : 0x34
--  | address: 0x40007434
[ivory|
 bitdata DAC_SR :: Bits 32 = dac_sr
  { _              :: Bits 2  -- (Reserved)
  , dac_sr_dmaudr2 :: Bit     -- DAC channel2 DMA underrun flag
  , _              :: Bits 15 -- (Reserved)
  , dac_sr_dmaudr1 :: Bit     -- DAC channel1 DMA underrun flag
  , _              :: Bits 13 -- (Reserved)
  }
|]
