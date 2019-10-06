{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}

module Ivory.BSP.STM32L4S9.PWR where

import Ivory.Language
import Ivory.HW
import Ivory.BSP.STM32L4S9.MemoryMap (pwr_periph_base)

-- PWR Power control

-- Base address: 0x40007000

-- Power control register 1
--  | offset : 0x0
--  | address: 0x40007000
[ivory|
 bitdata PWR_CR1 :: Bits 32 = pwr_cr1
  { _           :: Bits 17  -- (Reserved)
  , pwr_cr1_lpr   :: Bit      -- Low-power run
  , _           :: Bits 3   -- (Reserved)
  , pwr_cr1_vos   :: Bits 2   -- Voltage scaling range selection
  , pwr_cr1_dbp   :: Bit      -- Disable backup domain write protection
  , _           :: Bits 5   -- (Reserved)
  , pwr_cr1_lpms  :: Bits 3   -- Low-power mode selection
  }
|]
pwr_reg_cr1 :: BitDataReg PWR_CR1
pwr_reg_cr1 = mkBitDataRegNamed (pwr_periph_base + 0x0) "cr1"

-- Power control register 2
--  | offset : 0x4
--  | address: 0x40007004
[ivory|
 bitdata PWR_CR2 :: Bits 32 = pwr_cr2
  { _            :: Bits 21  -- (Reserved)
  , pwr_cr2_usv    :: Bit      -- VDDUSB USB supply valid
  , pwr_cr2_iosv   :: Bit      -- VDDIO2 Independent I/Os supply valid
  , _            :: Bit      -- (Reserved)
  , pwr_cr2_pvme4  :: Bit      -- Peripheral voltage monitoring 4 enable: VDDA vs. 2.2V
  , pwr_cr2_pvme3  :: Bit      -- Peripheral voltage monitoring 3 enable: VDDA vs. 1.62V
  , pwr_cr2_pvme2  :: Bit      -- Peripheral voltage monitoring 2 enable: VDDIO2 vs. 0.9V
  , pwr_cr2_pvme1  :: Bit      -- Peripheral voltage monitoring 1 enable: VDDUSB vs. 1.2V
  , pwr_cr2_pls    :: Bits 3   -- Power voltage detector level selection
  , pwr_cr2_pvde   :: Bit      -- Power voltage detector enable
  }
|]
pwr_reg_cr2 :: BitDataReg PWR_CR2
pwr_reg_cr2 = mkBitDataRegNamed (pwr_periph_base + 0x4) "cr2"

-- Power control register 3
--  | offset : 0x8
--  | address: 0x40007008
[ivory|
 bitdata PWR_CR3 :: Bits 32 = pwr_cr3
  { _            :: Bits 16  -- (Reserved)
  , pwr_cr3_ewf    :: Bit      -- Enable internal wakeup line
  , _            :: Bits 4   -- (Reserved)
  , pwr_cr3_apc    :: Bit      -- Apply pull-up and pull-down configuration
  , _            :: Bit      -- (Reserved)
  , pwr_cr3_rrs    :: Bit      -- SRAM2 retention in Standby mode
  , _            :: Bits 3   -- (Reserved)
  , pwr_cr3_ewup5  :: Bit      -- Enable Wakeup pin WKUP5
  , pwr_cr3_ewup4  :: Bit      -- Enable Wakeup pin WKUP4
  , pwr_cr3_ewup3  :: Bit      -- Enable Wakeup pin WKUP3
  , pwr_cr3_ewup2  :: Bit      -- Enable Wakeup pin WKUP2
  , pwr_cr3_ewup1  :: Bit      -- Enable Wakeup pin WKUP1
  }
|]
pwr_reg_cr3 :: BitDataReg PWR_CR3
pwr_reg_cr3 = mkBitDataRegNamed (pwr_periph_base + 0x8) "cr3"

-- Power control register 4
--  | offset : 0xc
--  | address: 0x4000700c
[ivory|
 bitdata PWR_CR4 :: Bits 32 = pwr_cr4
  { _           :: Bits 22  -- (Reserved)
  , pwr_cr4_vbrs  :: Bit      -- VBAT battery charging resistor selection
  , pwr_cr4_vbe   :: Bit      -- VBAT battery charging enable
  , _           :: Bits 3   -- (Reserved)
  , pwr_cr4_wp5   :: Bit      -- Wakeup pin WKUP5 polarity
  , pwr_cr4_wp4   :: Bit      -- Wakeup pin WKUP4 polarity
  , pwr_cr4_wp3   :: Bit      -- Wakeup pin WKUP3 polarity
  , pwr_cr4_wp2   :: Bit      -- Wakeup pin WKUP2 polarity
  , pwr_cr4_wp1   :: Bit      -- Wakeup pin WKUP1 polarity
  }
|]
pwr_reg_cr4 :: BitDataReg PWR_CR4
pwr_reg_cr4 = mkBitDataRegNamed (pwr_periph_base + 0xc) "cr4"

-- Power status register 1
--  | offset : 0x10
--  | address: 0x40007010
[ivory|
 bitdata PWR_SR1 :: Bits 32 = pwr_sr1
  { _            :: Bits 16  -- (Reserved)
  , pwr_sr1_wufi   :: Bit      -- Wakeup flag internal
  , _            :: Bits 6   -- (Reserved)
  , pwr_sr1_csbf   :: Bit      -- Standby flag
  , _            :: Bits 3   -- (Reserved)
  , pwr_sr1_cwuf5  :: Bit      -- Wakeup flag 5
  , pwr_sr1_cwuf4  :: Bit      -- Wakeup flag 4
  , pwr_sr1_cwuf3  :: Bit      -- Wakeup flag 3
  , pwr_sr1_cwuf2  :: Bit      -- Wakeup flag 2
  , pwr_sr1_cwuf1  :: Bit      -- Wakeup flag 1
  }
|]
pwr_reg_sr1 :: BitDataReg PWR_SR1
pwr_reg_sr1 = mkBitDataRegNamed (pwr_periph_base + 0x10) "sr1"

-- Power status register 2
--  | offset : 0x14
--  | address: 0x40007014
[ivory|
 bitdata PWR_SR2 :: Bits 32 = pwr_sr2
  { _             :: Bits 16  -- (Reserved)
  , pwr_sr2_pvmo4   :: Bit      -- Peripheral voltage monitoring output: VDDA vs. 2.2 V
  , pwr_sr2_pvmo3   :: Bit      -- Peripheral voltage monitoring output: VDDA vs. 1.62 V
  , pwr_sr2_pvmo2   :: Bit      -- Peripheral voltage monitoring output: VDDIO2 vs. 0.9 V
  , pwr_sr2_pvmo1   :: Bit      -- Peripheral voltage monitoring output: VDDUSB vs. 1.2 V
  , pwr_sr2_pvdo    :: Bit      -- Power voltage detector output
  , pwr_sr2_vosf    :: Bit      -- Voltage scaling flag
  , pwr_sr2_reglpf  :: Bit      -- Low-power regulator flag
  , pwr_sr2_reglps  :: Bit      -- Low-power regulator started
  , _             :: Bits 8   -- (Reserved)
  }
|]
pwr_reg_sr2 :: BitDataReg PWR_SR2
pwr_reg_sr2 = mkBitDataRegNamed (pwr_periph_base + 0x14) "sr2"

-- Power status clear register
--  | offset : 0x18
--  | address: 0x40007018
[ivory|
 bitdata PWR_SCR :: Bits 32 = pwr_scr
  { _           :: Bits 23  -- (Reserved)
  , pwr_scr_sbf   :: Bit      -- Clear standby flag
  , _           :: Bits 3   -- (Reserved)
  , pwr_scr_wuf5  :: Bit      -- Clear wakeup flag 5
  , pwr_scr_wuf4  :: Bit      -- Clear wakeup flag 4
  , pwr_scr_wuf3  :: Bit      -- Clear wakeup flag 3
  , pwr_scr_wuf2  :: Bit      -- Clear wakeup flag 2
  , pwr_scr_wuf1  :: Bit      -- Clear wakeup flag 1
  }
|]
pwr_reg_scr :: BitDataReg PWR_SCR
pwr_reg_scr = mkBitDataRegNamed (pwr_periph_base + 0x18) "scr"

-- Power Port A pull-up control register
--  | offset : 0x20
--  | address: 0x40007020
[ivory|
 bitdata PWR_PUCRA :: Bits 32 = pwr_pucra
  { _             :: Bits 16  -- (Reserved)
  , pwr_pucra_pu15  :: Bit      -- Port A pull-up bit y (y=0..15)
  , pwr_pucra_pu14  :: Bit      -- Port A pull-up bit y (y=0..15)
  , pwr_pucra_pu13  :: Bit      -- Port A pull-up bit y (y=0..15)
  , pwr_pucra_pu12  :: Bit      -- Port A pull-up bit y (y=0..15)
  , pwr_pucra_pu11  :: Bit      -- Port A pull-up bit y (y=0..15)
  , pwr_pucra_pu10  :: Bit      -- Port A pull-up bit y (y=0..15)
  , pwr_pucra_pu9   :: Bit      -- Port A pull-up bit y (y=0..15)
  , pwr_pucra_pu8   :: Bit      -- Port A pull-up bit y (y=0..15)
  , pwr_pucra_pu7   :: Bit      -- Port A pull-up bit y (y=0..15)
  , pwr_pucra_pu6   :: Bit      -- Port A pull-up bit y (y=0..15)
  , pwr_pucra_pu5   :: Bit      -- Port A pull-up bit y (y=0..15)
  , pwr_pucra_pu4   :: Bit      -- Port A pull-up bit y (y=0..15)
  , pwr_pucra_pu3   :: Bit      -- Port A pull-up bit y (y=0..15)
  , pwr_pucra_pu2   :: Bit      -- Port A pull-up bit y (y=0..15)
  , pwr_pucra_pu1   :: Bit      -- Port A pull-up bit y (y=0..15)
  , pwr_pucra_pu0   :: Bit      -- Port A pull-up bit y (y=0..15)
  }
|]
pwr_reg_pucra :: BitDataReg PWR_PUCRA
pwr_reg_pucra = mkBitDataRegNamed (pwr_periph_base + 0x20) "pucra"

-- Power Port A pull-down control register
--  | offset : 0x24
--  | address: 0x40007024
[ivory|
 bitdata PWR_PDCRA :: Bits 32 = pwr_pdcra
  { _             :: Bits 16  -- (Reserved)
  , pwr_pdcra_pd15  :: Bit      -- Port A pull-down bit y (y=0..15)
  , pwr_pdcra_pd14  :: Bit      -- Port A pull-down bit y (y=0..15)
  , pwr_pdcra_pd13  :: Bit      -- Port A pull-down bit y (y=0..15)
  , pwr_pdcra_pd12  :: Bit      -- Port A pull-down bit y (y=0..15)
  , pwr_pdcra_pd11  :: Bit      -- Port A pull-down bit y (y=0..15)
  , pwr_pdcra_pd10  :: Bit      -- Port A pull-down bit y (y=0..15)
  , pwr_pdcra_pd9   :: Bit      -- Port A pull-down bit y (y=0..15)
  , pwr_pdcra_pd8   :: Bit      -- Port A pull-down bit y (y=0..15)
  , pwr_pdcra_pd7   :: Bit      -- Port A pull-down bit y (y=0..15)
  , pwr_pdcra_pd6   :: Bit      -- Port A pull-down bit y (y=0..15)
  , pwr_pdcra_pd5   :: Bit      -- Port A pull-down bit y (y=0..15)
  , pwr_pdcra_pd4   :: Bit      -- Port A pull-down bit y (y=0..15)
  , pwr_pdcra_pd3   :: Bit      -- Port A pull-down bit y (y=0..15)
  , pwr_pdcra_pd2   :: Bit      -- Port A pull-down bit y (y=0..15)
  , pwr_pdcra_pd1   :: Bit      -- Port A pull-down bit y (y=0..15)
  , pwr_pdcra_pd0   :: Bit      -- Port A pull-down bit y (y=0..15)
  }
|]
pwr_reg_pdcra :: BitDataReg PWR_PDCRA
pwr_reg_pdcra = mkBitDataRegNamed (pwr_periph_base + 0x24) "pdcra"

-- Power Port B pull-up control register
--  | offset : 0x28
--  | address: 0x40007028
[ivory|
 bitdata PWR_PUCRB :: Bits 32 = pwr_pucrb
  { _             :: Bits 16  -- (Reserved)
  , pwr_pucrb_pu15  :: Bit      -- Port B pull-up bit y (y=0..15)
  , pwr_pucrb_pu14  :: Bit      -- Port B pull-up bit y (y=0..15)
  , pwr_pucrb_pu13  :: Bit      -- Port B pull-up bit y (y=0..15)
  , pwr_pucrb_pu12  :: Bit      -- Port B pull-up bit y (y=0..15)
  , pwr_pucrb_pu11  :: Bit      -- Port B pull-up bit y (y=0..15)
  , pwr_pucrb_pu10  :: Bit      -- Port B pull-up bit y (y=0..15)
  , pwr_pucrb_pu9   :: Bit      -- Port B pull-up bit y (y=0..15)
  , pwr_pucrb_pu8   :: Bit      -- Port B pull-up bit y (y=0..15)
  , pwr_pucrb_pu7   :: Bit      -- Port B pull-up bit y (y=0..15)
  , pwr_pucrb_pu6   :: Bit      -- Port B pull-up bit y (y=0..15)
  , pwr_pucrb_pu5   :: Bit      -- Port B pull-up bit y (y=0..15)
  , pwr_pucrb_pu4   :: Bit      -- Port B pull-up bit y (y=0..15)
  , pwr_pucrb_pu3   :: Bit      -- Port B pull-up bit y (y=0..15)
  , pwr_pucrb_pu2   :: Bit      -- Port B pull-up bit y (y=0..15)
  , pwr_pucrb_pu1   :: Bit      -- Port B pull-up bit y (y=0..15)
  , pwr_pucrb_pu0   :: Bit      -- Port B pull-up bit y (y=0..15)
  }
|]
pwr_reg_pucrb :: BitDataReg PWR_PUCRB
pwr_reg_pucrb = mkBitDataRegNamed (pwr_periph_base + 0x28) "pucrb"

-- Power Port B pull-down control register
--  | offset : 0x2c
--  | address: 0x4000702c
[ivory|
 bitdata PWR_PDCRB :: Bits 32 = pwr_pdcrb
  { _             :: Bits 16  -- (Reserved)
  , pwr_pdcrb_pd15  :: Bit      -- Port B pull-down bit y (y=0..15)
  , pwr_pdcrb_pd14  :: Bit      -- Port B pull-down bit y (y=0..15)
  , pwr_pdcrb_pd13  :: Bit      -- Port B pull-down bit y (y=0..15)
  , pwr_pdcrb_pd12  :: Bit      -- Port B pull-down bit y (y=0..15)
  , pwr_pdcrb_pd11  :: Bit      -- Port B pull-down bit y (y=0..15)
  , pwr_pdcrb_pd10  :: Bit      -- Port B pull-down bit y (y=0..15)
  , pwr_pdcrb_pd9   :: Bit      -- Port B pull-down bit y (y=0..15)
  , pwr_pdcrb_pd8   :: Bit      -- Port B pull-down bit y (y=0..15)
  , pwr_pdcrb_pd7   :: Bit      -- Port B pull-down bit y (y=0..15)
  , pwr_pdcrb_pd6   :: Bit      -- Port B pull-down bit y (y=0..15)
  , pwr_pdcrb_pd5   :: Bit      -- Port B pull-down bit y (y=0..15)
  , pwr_pdcrb_pd4   :: Bit      -- Port B pull-down bit y (y=0..15)
  , pwr_pdcrb_pd3   :: Bit      -- Port B pull-down bit y (y=0..15)
  , pwr_pdcrb_pd2   :: Bit      -- Port B pull-down bit y (y=0..15)
  , pwr_pdcrb_pd1   :: Bit      -- Port B pull-down bit y (y=0..15)
  , pwr_pdcrb_pd0   :: Bit      -- Port B pull-down bit y (y=0..15)
  }
|]
pwr_reg_pdcrb :: BitDataReg PWR_PDCRB
pwr_reg_pdcrb = mkBitDataRegNamed (pwr_periph_base + 0x2c) "pdcrb"

-- Power Port C pull-up control register
--  | offset : 0x30
--  | address: 0x40007030
[ivory|
 bitdata PWR_PUCRC :: Bits 32 = pwr_pucrc
  { _             :: Bits 16  -- (Reserved)
  , pwr_pucrc_pu15  :: Bit      -- Port C pull-up bit y (y=0..15)
  , pwr_pucrc_pu14  :: Bit      -- Port C pull-up bit y (y=0..15)
  , pwr_pucrc_pu13  :: Bit      -- Port C pull-up bit y (y=0..15)
  , pwr_pucrc_pu12  :: Bit      -- Port C pull-up bit y (y=0..15)
  , pwr_pucrc_pu11  :: Bit      -- Port C pull-up bit y (y=0..15)
  , pwr_pucrc_pu10  :: Bit      -- Port C pull-up bit y (y=0..15)
  , pwr_pucrc_pu9   :: Bit      -- Port C pull-up bit y (y=0..15)
  , pwr_pucrc_pu8   :: Bit      -- Port C pull-up bit y (y=0..15)
  , pwr_pucrc_pu7   :: Bit      -- Port C pull-up bit y (y=0..15)
  , pwr_pucrc_pu6   :: Bit      -- Port C pull-up bit y (y=0..15)
  , pwr_pucrc_pu5   :: Bit      -- Port C pull-up bit y (y=0..15)
  , pwr_pucrc_pu4   :: Bit      -- Port C pull-up bit y (y=0..15)
  , pwr_pucrc_pu3   :: Bit      -- Port C pull-up bit y (y=0..15)
  , pwr_pucrc_pu2   :: Bit      -- Port C pull-up bit y (y=0..15)
  , pwr_pucrc_pu1   :: Bit      -- Port C pull-up bit y (y=0..15)
  , pwr_pucrc_pu0   :: Bit      -- Port C pull-up bit y (y=0..15)
  }
|]
pwr_reg_pucrc :: BitDataReg PWR_PUCRC
pwr_reg_pucrc = mkBitDataRegNamed (pwr_periph_base + 0x30) "pucrc"

-- Power Port C pull-down control register
--  | offset : 0x34
--  | address: 0x40007034
[ivory|
 bitdata PWR_PDCRC :: Bits 32 = pwr_pdcrc
  { _             :: Bits 16  -- (Reserved)
  , pwr_pdcrc_pd15  :: Bit      -- Port C pull-down bit y (y=0..15)
  , pwr_pdcrc_pd14  :: Bit      -- Port C pull-down bit y (y=0..15)
  , pwr_pdcrc_pd13  :: Bit      -- Port C pull-down bit y (y=0..15)
  , pwr_pdcrc_pd12  :: Bit      -- Port C pull-down bit y (y=0..15)
  , pwr_pdcrc_pd11  :: Bit      -- Port C pull-down bit y (y=0..15)
  , pwr_pdcrc_pd10  :: Bit      -- Port C pull-down bit y (y=0..15)
  , pwr_pdcrc_pd9   :: Bit      -- Port C pull-down bit y (y=0..15)
  , pwr_pdcrc_pd8   :: Bit      -- Port C pull-down bit y (y=0..15)
  , pwr_pdcrc_pd7   :: Bit      -- Port C pull-down bit y (y=0..15)
  , pwr_pdcrc_pd6   :: Bit      -- Port C pull-down bit y (y=0..15)
  , pwr_pdcrc_pd5   :: Bit      -- Port C pull-down bit y (y=0..15)
  , pwr_pdcrc_pd4   :: Bit      -- Port C pull-down bit y (y=0..15)
  , pwr_pdcrc_pd3   :: Bit      -- Port C pull-down bit y (y=0..15)
  , pwr_pdcrc_pd2   :: Bit      -- Port C pull-down bit y (y=0..15)
  , pwr_pdcrc_pd1   :: Bit      -- Port C pull-down bit y (y=0..15)
  , pwr_pdcrc_pd0   :: Bit      -- Port C pull-down bit y (y=0..15)
  }
|]
pwr_reg_pdcrc :: BitDataReg PWR_PDCRC
pwr_reg_pdcrc = mkBitDataRegNamed (pwr_periph_base + 0x34) "pdcrc"

-- Power Port D pull-up control register
--  | offset : 0x38
--  | address: 0x40007038
[ivory|
 bitdata PWR_PUCRD :: Bits 32 = pwr_pucrd
  { _             :: Bits 16  -- (Reserved)
  , pwr_pucrd_pu15  :: Bit      -- Port D pull-up bit y (y=0..15)
  , pwr_pucrd_pu14  :: Bit      -- Port D pull-up bit y (y=0..15)
  , pwr_pucrd_pu13  :: Bit      -- Port D pull-up bit y (y=0..15)
  , pwr_pucrd_pu12  :: Bit      -- Port D pull-up bit y (y=0..15)
  , pwr_pucrd_pu11  :: Bit      -- Port D pull-up bit y (y=0..15)
  , pwr_pucrd_pu10  :: Bit      -- Port D pull-up bit y (y=0..15)
  , pwr_pucrd_pu9   :: Bit      -- Port D pull-up bit y (y=0..15)
  , pwr_pucrd_pu8   :: Bit      -- Port D pull-up bit y (y=0..15)
  , pwr_pucrd_pu7   :: Bit      -- Port D pull-up bit y (y=0..15)
  , pwr_pucrd_pu6   :: Bit      -- Port D pull-up bit y (y=0..15)
  , pwr_pucrd_pu5   :: Bit      -- Port D pull-up bit y (y=0..15)
  , pwr_pucrd_pu4   :: Bit      -- Port D pull-up bit y (y=0..15)
  , pwr_pucrd_pu3   :: Bit      -- Port D pull-up bit y (y=0..15)
  , pwr_pucrd_pu2   :: Bit      -- Port D pull-up bit y (y=0..15)
  , pwr_pucrd_pu1   :: Bit      -- Port D pull-up bit y (y=0..15)
  , pwr_pucrd_pu0   :: Bit      -- Port D pull-up bit y (y=0..15)
  }
|]
pwr_reg_pucrd :: BitDataReg PWR_PUCRD
pwr_reg_pucrd = mkBitDataRegNamed (pwr_periph_base + 0x38) "pucrd"

-- Power Port D pull-down control register
--  | offset : 0x3c
--  | address: 0x4000703c
[ivory|
 bitdata PWR_PDCRD :: Bits 32 = pwr_pdcrd
  { _             :: Bits 16  -- (Reserved)
  , pwr_pdcrd_pd15  :: Bit      -- Port D pull-down bit y (y=0..15)
  , pwr_pdcrd_pd14  :: Bit      -- Port D pull-down bit y (y=0..15)
  , pwr_pdcrd_pd13  :: Bit      -- Port D pull-down bit y (y=0..15)
  , pwr_pdcrd_pd12  :: Bit      -- Port D pull-down bit y (y=0..15)
  , pwr_pdcrd_pd11  :: Bit      -- Port D pull-down bit y (y=0..15)
  , pwr_pdcrd_pd10  :: Bit      -- Port D pull-down bit y (y=0..15)
  , pwr_pdcrd_pd9   :: Bit      -- Port D pull-down bit y (y=0..15)
  , pwr_pdcrd_pd8   :: Bit      -- Port D pull-down bit y (y=0..15)
  , pwr_pdcrd_pd7   :: Bit      -- Port D pull-down bit y (y=0..15)
  , pwr_pdcrd_pd6   :: Bit      -- Port D pull-down bit y (y=0..15)
  , pwr_pdcrd_pd5   :: Bit      -- Port D pull-down bit y (y=0..15)
  , pwr_pdcrd_pd4   :: Bit      -- Port D pull-down bit y (y=0..15)
  , pwr_pdcrd_pd3   :: Bit      -- Port D pull-down bit y (y=0..15)
  , pwr_pdcrd_pd2   :: Bit      -- Port D pull-down bit y (y=0..15)
  , pwr_pdcrd_pd1   :: Bit      -- Port D pull-down bit y (y=0..15)
  , pwr_pdcrd_pd0   :: Bit      -- Port D pull-down bit y (y=0..15)
  }
|]
pwr_reg_pdcrd :: BitDataReg PWR_PDCRD
pwr_reg_pdcrd = mkBitDataRegNamed (pwr_periph_base + 0x3c) "pdcrd"

-- Power Port E pull-up control register
--  | offset : 0x40
--  | address: 0x40007040
[ivory|
 bitdata PWR_PUCRE :: Bits 32 = pwr_pucre
  { _             :: Bits 16  -- (Reserved)
  , pwr_pucre_pu15  :: Bit      -- Port E pull-up bit y (y=0..15)
  , pwr_pucre_pu14  :: Bit      -- Port E pull-up bit y (y=0..15)
  , pwr_pucre_pu13  :: Bit      -- Port E pull-up bit y (y=0..15)
  , pwr_pucre_pu12  :: Bit      -- Port E pull-up bit y (y=0..15)
  , pwr_pucre_pu11  :: Bit      -- Port E pull-up bit y (y=0..15)
  , pwr_pucre_pu10  :: Bit      -- Port E pull-up bit y (y=0..15)
  , pwr_pucre_pu9   :: Bit      -- Port E pull-up bit y (y=0..15)
  , pwr_pucre_pu8   :: Bit      -- Port E pull-up bit y (y=0..15)
  , pwr_pucre_pu7   :: Bit      -- Port E pull-up bit y (y=0..15)
  , pwr_pucre_pu6   :: Bit      -- Port E pull-up bit y (y=0..15)
  , pwr_pucre_pu5   :: Bit      -- Port E pull-up bit y (y=0..15)
  , pwr_pucre_pu4   :: Bit      -- Port E pull-up bit y (y=0..15)
  , pwr_pucre_pu3   :: Bit      -- Port E pull-up bit y (y=0..15)
  , pwr_pucre_pu2   :: Bit      -- Port E pull-up bit y (y=0..15)
  , pwr_pucre_pu1   :: Bit      -- Port E pull-up bit y (y=0..15)
  , pwr_pucre_pu0   :: Bit      -- Port E pull-up bit y (y=0..15)
  }
|]
pwr_reg_pucre :: BitDataReg PWR_PUCRE
pwr_reg_pucre = mkBitDataRegNamed (pwr_periph_base + 0x40) "pucre"

-- Power Port E pull-down control register
--  | offset : 0x44
--  | address: 0x40007044
[ivory|
 bitdata PWR_PDCRE :: Bits 32 = pwr_pdcre
  { _             :: Bits 16  -- (Reserved)
  , pwr_pdcre_pd15  :: Bit      -- Port E pull-down bit y (y=0..15)
  , pwr_pdcre_pd14  :: Bit      -- Port E pull-down bit y (y=0..15)
  , pwr_pdcre_pd13  :: Bit      -- Port E pull-down bit y (y=0..15)
  , pwr_pdcre_pd12  :: Bit      -- Port E pull-down bit y (y=0..15)
  , pwr_pdcre_pd11  :: Bit      -- Port E pull-down bit y (y=0..15)
  , pwr_pdcre_pd10  :: Bit      -- Port E pull-down bit y (y=0..15)
  , pwr_pdcre_pd9   :: Bit      -- Port E pull-down bit y (y=0..15)
  , pwr_pdcre_pd8   :: Bit      -- Port E pull-down bit y (y=0..15)
  , pwr_pdcre_pd7   :: Bit      -- Port E pull-down bit y (y=0..15)
  , pwr_pdcre_pd6   :: Bit      -- Port E pull-down bit y (y=0..15)
  , pwr_pdcre_pd5   :: Bit      -- Port E pull-down bit y (y=0..15)
  , pwr_pdcre_pd4   :: Bit      -- Port E pull-down bit y (y=0..15)
  , pwr_pdcre_pd3   :: Bit      -- Port E pull-down bit y (y=0..15)
  , pwr_pdcre_pd2   :: Bit      -- Port E pull-down bit y (y=0..15)
  , pwr_pdcre_pd1   :: Bit      -- Port E pull-down bit y (y=0..15)
  , pwr_pdcre_pd0   :: Bit      -- Port E pull-down bit y (y=0..15)
  }
|]
pwr_reg_pdcre :: BitDataReg PWR_PDCRE
pwr_reg_pdcre = mkBitDataRegNamed (pwr_periph_base + 0x44) "pdcre"

-- Power Port F pull-up control register
--  | offset : 0x48
--  | address: 0x40007048
[ivory|
 bitdata PWR_PUCRF :: Bits 32 = pwr_pucrf
  { _             :: Bits 16  -- (Reserved)
  , pwr_pucrf_pu15  :: Bit      -- Port F pull-up bit y (y=0..15)
  , pwr_pucrf_pu14  :: Bit      -- Port F pull-up bit y (y=0..15)
  , pwr_pucrf_pu13  :: Bit      -- Port F pull-up bit y (y=0..15)
  , pwr_pucrf_pu12  :: Bit      -- Port F pull-up bit y (y=0..15)
  , pwr_pucrf_pu11  :: Bit      -- Port F pull-up bit y (y=0..15)
  , pwr_pucrf_pu10  :: Bit      -- Port F pull-up bit y (y=0..15)
  , pwr_pucrf_pu9   :: Bit      -- Port F pull-up bit y (y=0..15)
  , pwr_pucrf_pu8   :: Bit      -- Port F pull-up bit y (y=0..15)
  , pwr_pucrf_pu7   :: Bit      -- Port F pull-up bit y (y=0..15)
  , pwr_pucrf_pu6   :: Bit      -- Port F pull-up bit y (y=0..15)
  , pwr_pucrf_pu5   :: Bit      -- Port F pull-up bit y (y=0..15)
  , pwr_pucrf_pu4   :: Bit      -- Port F pull-up bit y (y=0..15)
  , pwr_pucrf_pu3   :: Bit      -- Port F pull-up bit y (y=0..15)
  , pwr_pucrf_pu2   :: Bit      -- Port F pull-up bit y (y=0..15)
  , pwr_pucrf_pu1   :: Bit      -- Port F pull-up bit y (y=0..15)
  , pwr_pucrf_pu0   :: Bit      -- Port F pull-up bit y (y=0..15)
  }
|]
pwr_reg_pucrf :: BitDataReg PWR_PUCRF
pwr_reg_pucrf = mkBitDataRegNamed (pwr_periph_base + 0x48) "pucrf"

-- Power Port F pull-down control register
--  | offset : 0x4c
--  | address: 0x4000704c
[ivory|
 bitdata PWR_PDCRF :: Bits 32 = pwr_pdcrf
  { _             :: Bits 16  -- (Reserved)
  , pwr_pdcrf_pd15  :: Bit      -- Port F pull-down bit y (y=0..15)
  , pwr_pdcrf_pd14  :: Bit      -- Port F pull-down bit y (y=0..15)
  , pwr_pdcrf_pd13  :: Bit      -- Port F pull-down bit y (y=0..15)
  , pwr_pdcrf_pd12  :: Bit      -- Port F pull-down bit y (y=0..15)
  , pwr_pdcrf_pd11  :: Bit      -- Port F pull-down bit y (y=0..15)
  , pwr_pdcrf_pd10  :: Bit      -- Port F pull-down bit y (y=0..15)
  , pwr_pdcrf_pd9   :: Bit      -- Port F pull-down bit y (y=0..15)
  , pwr_pdcrf_pd8   :: Bit      -- Port F pull-down bit y (y=0..15)
  , pwr_pdcrf_pd7   :: Bit      -- Port F pull-down bit y (y=0..15)
  , pwr_pdcrf_pd6   :: Bit      -- Port F pull-down bit y (y=0..15)
  , pwr_pdcrf_pd5   :: Bit      -- Port F pull-down bit y (y=0..15)
  , pwr_pdcrf_pd4   :: Bit      -- Port F pull-down bit y (y=0..15)
  , pwr_pdcrf_pd3   :: Bit      -- Port F pull-down bit y (y=0..15)
  , pwr_pdcrf_pd2   :: Bit      -- Port F pull-down bit y (y=0..15)
  , pwr_pdcrf_pd1   :: Bit      -- Port F pull-down bit y (y=0..15)
  , pwr_pdcrf_pd0   :: Bit      -- Port F pull-down bit y (y=0..15)
  }
|]
pwr_reg_pdcrf :: BitDataReg PWR_PDCRF
pwr_reg_pdcrf = mkBitDataRegNamed (pwr_periph_base + 0x4c) "pdcrf"

-- Power Port G pull-up control register
--  | offset : 0x50
--  | address: 0x40007050
[ivory|
 bitdata PWR_PUCRG :: Bits 32 = pwr_pucrg
  { _             :: Bits 16  -- (Reserved)
  , pwr_pucrg_pu15  :: Bit      -- Port G pull-up bit y (y=0..15)
  , pwr_pucrg_pu14  :: Bit      -- Port G pull-up bit y (y=0..15)
  , pwr_pucrg_pu13  :: Bit      -- Port G pull-up bit y (y=0..15)
  , pwr_pucrg_pu12  :: Bit      -- Port G pull-up bit y (y=0..15)
  , pwr_pucrg_pu11  :: Bit      -- Port G pull-up bit y (y=0..15)
  , pwr_pucrg_pu10  :: Bit      -- Port G pull-up bit y (y=0..15)
  , pwr_pucrg_pu9   :: Bit      -- Port G pull-up bit y (y=0..15)
  , pwr_pucrg_pu8   :: Bit      -- Port G pull-up bit y (y=0..15)
  , pwr_pucrg_pu7   :: Bit      -- Port G pull-up bit y (y=0..15)
  , pwr_pucrg_pu6   :: Bit      -- Port G pull-up bit y (y=0..15)
  , pwr_pucrg_pu5   :: Bit      -- Port G pull-up bit y (y=0..15)
  , pwr_pucrg_pu4   :: Bit      -- Port G pull-up bit y (y=0..15)
  , pwr_pucrg_pu3   :: Bit      -- Port G pull-up bit y (y=0..15)
  , pwr_pucrg_pu2   :: Bit      -- Port G pull-up bit y (y=0..15)
  , pwr_pucrg_pu1   :: Bit      -- Port G pull-up bit y (y=0..15)
  , pwr_pucrg_pu0   :: Bit      -- Port G pull-up bit y (y=0..15)
  }
|]
pwr_reg_pucrg :: BitDataReg PWR_PUCRG
pwr_reg_pucrg = mkBitDataRegNamed (pwr_periph_base + 0x50) "pucrg"

-- Power Port G pull-down control register
--  | offset : 0x54
--  | address: 0x40007054
[ivory|
 bitdata PWR_PDCRG :: Bits 32 = pwr_pdcrg
  { _             :: Bits 16  -- (Reserved)
  , pwr_pdcrg_pd15  :: Bit      -- Port G pull-down bit y (y=0..15)
  , pwr_pdcrg_pd14  :: Bit      -- Port G pull-down bit y (y=0..15)
  , pwr_pdcrg_pd13  :: Bit      -- Port G pull-down bit y (y=0..15)
  , pwr_pdcrg_pd12  :: Bit      -- Port G pull-down bit y (y=0..15)
  , pwr_pdcrg_pd11  :: Bit      -- Port G pull-down bit y (y=0..15)
  , pwr_pdcrg_pd10  :: Bit      -- Port G pull-down bit y (y=0..15)
  , pwr_pdcrg_pd9   :: Bit      -- Port G pull-down bit y (y=0..15)
  , pwr_pdcrg_pd8   :: Bit      -- Port G pull-down bit y (y=0..15)
  , pwr_pdcrg_pd7   :: Bit      -- Port G pull-down bit y (y=0..15)
  , pwr_pdcrg_pd6   :: Bit      -- Port G pull-down bit y (y=0..15)
  , pwr_pdcrg_pd5   :: Bit      -- Port G pull-down bit y (y=0..15)
  , pwr_pdcrg_pd4   :: Bit      -- Port G pull-down bit y (y=0..15)
  , pwr_pdcrg_pd3   :: Bit      -- Port G pull-down bit y (y=0..15)
  , pwr_pdcrg_pd2   :: Bit      -- Port G pull-down bit y (y=0..15)
  , pwr_pdcrg_pd1   :: Bit      -- Port G pull-down bit y (y=0..15)
  , pwr_pdcrg_pd0   :: Bit      -- Port G pull-down bit y (y=0..15)
  }
|]
pwr_reg_pdcrg :: BitDataReg PWR_PDCRG
pwr_reg_pdcrg = mkBitDataRegNamed (pwr_periph_base + 0x54) "pdcrg"

-- Power Port H pull-up control register
--  | offset : 0x58
--  | address: 0x40007058
[ivory|
 bitdata PWR_PUCRH :: Bits 32 = pwr_pucrh
  { _            :: Bits 30  -- (Reserved)
  , pwr_pucrh_pu1  :: Bit      -- Port H pull-up bit y (y=0..1)
  , pwr_pucrh_pu0  :: Bit      -- Port H pull-up bit y (y=0..1)
  }
|]
pwr_reg_pucrh :: BitDataReg PWR_PUCRH
pwr_reg_pucrh = mkBitDataRegNamed (pwr_periph_base + 0x58) "pucrh"

-- Power Port H pull-down control register
--  | offset : 0x5c
--  | address: 0x4000705c
[ivory|
 bitdata PWR_PDCRH :: Bits 32 = pwr_pdcrh
  { _            :: Bits 30  -- (Reserved)
  , pwr_pdcrh_pd1  :: Bit      -- Port H pull-down bit y (y=0..1)
  , pwr_pdcrh_pd0  :: Bit      -- Port H pull-down bit y (y=0..1)
  }
|]
pwr_reg_pdcrh :: BitDataReg PWR_PDCRH
pwr_reg_pdcrh = mkBitDataRegNamed (pwr_periph_base + 0x5c) "pdcrh"

