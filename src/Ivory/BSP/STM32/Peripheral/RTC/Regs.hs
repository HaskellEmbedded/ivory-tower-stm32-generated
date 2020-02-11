{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32.Peripheral.RTC.Regs where

import Ivory.Language

-- RTC Real-time clock

-- Base address: 0x40002800

-- time register
--  | offset : 0x0
--  | address: 0x40002800
[ivory|
 bitdata RTC_TR :: Bits 32 = rtc_tr
  { _         :: Bits 9   -- (Reserved)
  , rtc_tr_pm   :: Bit      -- AM/PM notation
  , rtc_tr_ht   :: Bits 2   -- Hour tens in BCD format
  , rtc_tr_hu   :: Bits 4   -- Hour units in BCD format
  , _         :: Bit      -- (Reserved)
  , rtc_tr_mnt  :: Bits 3   -- Minute tens in BCD format
  , rtc_tr_mnu  :: Bits 4   -- Minute units in BCD format
  , _         :: Bit      -- (Reserved)
  , rtc_tr_st   :: Bits 3   -- Second tens in BCD format
  , rtc_tr_su   :: Bits 4   -- Second units in BCD format
  }
|]


-- date register
--  | offset : 0x4
--  | address: 0x40002804
[ivory|
 bitdata RTC_DR :: Bits 32 = rtc_dr
  { _         :: Bits 8   -- (Reserved)
  , rtc_dr_yt   :: Bits 4   -- Year tens in BCD format
  , rtc_dr_yu   :: Bits 4   -- Year units in BCD format
  , rtc_dr_wdu  :: Bits 3   -- Week day units
  , rtc_dr_mt   :: Bit      -- Month tens in BCD format
  , rtc_dr_mu   :: Bits 4   -- Month units in BCD format
  , _         :: Bits 2   -- (Reserved)
  , rtc_dr_dt   :: Bits 2   -- Date tens in BCD format
  , rtc_dr_du   :: Bits 4   -- Date units in BCD format
  }
|]


-- control register
--  | offset : 0x8
--  | address: 0x40002808
[ivory|
 bitdata RTC_CR :: Bits 32 = rtc_cr
  { _             :: Bits 8   -- (Reserved)
  , rtc_cr_coe      :: Bit      -- Calibration output enable
  , rtc_cr_osel     :: Bits 2   -- Output selection
  , rtc_cr_pol      :: Bit      -- Output polarity
  , rtc_cr_cosel    :: Bit      -- Calibration output selection
  , rtc_cr_bkp      :: Bit      -- Backup
  , rtc_cr_sub1h    :: Bit      -- Subtract 1 hour (winter time change)
  , rtc_cr_add1h    :: Bit      -- Add 1 hour (summer time change)
  , rtc_cr_tsie     :: Bit      -- Time-stamp interrupt enable
  , _             :: Bits 2   -- (Reserved)
  , rtc_cr_alraie   :: Bit      -- Alarm A interrupt enable
  , rtc_cr_tse      :: Bit      -- timestamp enable
  , _             :: Bits 2   -- (Reserved)
  , rtc_cr_alrae    :: Bit      -- Alarm A enable
  , _             :: Bit      -- (Reserved)
  , rtc_cr_fmt      :: Bit      -- Hour format
  , rtc_cr_bypshad  :: Bit      -- Bypass the shadow registers
  , rtc_cr_refckon  :: Bit      -- RTC_REFIN reference clock detection enable (50 or 60 Hz)
  , rtc_cr_tsedge   :: Bit      -- Time-stamp event active edge
  , _             :: Bits 3   -- (Reserved)
  }
|]


-- initialization and status register
--  | offset : 0xc
--  | address: 0x4000280c
[ivory|
 bitdata RTC_ISR :: Bits 32 = rtc_isr
  { _              :: Bits 15  -- (Reserved)
  , rtc_isr_recalpf  :: Bit      -- Recalibration pending Flag
  , _              :: Bit      -- (Reserved)
  , rtc_isr_tamp2f   :: Bit      -- RTC_TAMP2 detection flag
  , rtc_isr_tamp1f   :: Bit      -- RTC_TAMP1 detection flag
  , rtc_isr_tsovf    :: Bit      -- Time-stamp overflow flag
  , rtc_isr_tsf      :: Bit      -- Time-stamp flag
  , _              :: Bits 2   -- (Reserved)
  , rtc_isr_alraf    :: Bit      -- Alarm A flag
  , rtc_isr_init     :: Bit      -- Initialization mode
  , rtc_isr_initf    :: Bit      -- Initialization flag
  , rtc_isr_rsf      :: Bit      -- Registers synchronization flag
  , rtc_isr_inits    :: Bit      -- Initialization status flag
  , rtc_isr_shpf     :: Bit      -- Shift operation pending
  , _              :: Bits 2   -- (Reserved)
  , rtc_isr_alrawf   :: Bit      -- Alarm A write flag
  }
|]


-- prescaler register
--  | offset : 0x10
--  | address: 0x40002810
[ivory|
 bitdata RTC_PRER :: Bits 32 = rtc_prer
  { _                :: Bits 9   -- (Reserved)
  , rtc_prer_prediv_a  :: Bits 7   -- Asynchronous prescaler factor
  , _                :: Bit      -- (Reserved)
  , rtc_prer_prediv_s  :: Bits 15  -- Synchronous prescaler factor
  }
|]


-- alarm A register
--  | offset : 0x1c
--  | address: 0x4000281c
[ivory|
 bitdata RTC_ALRMAR :: Bits 32 = rtc_alrmar
  { rtc_alrmar_msk4   :: Bit      -- Alarm A date mask
  , rtc_alrmar_wdsel  :: Bit      -- Week day selection
  , rtc_alrmar_dt     :: Bits 2   -- Date tens in BCD format.
  , rtc_alrmar_du     :: Bits 4   -- Date units or day in BCD format.
  , rtc_alrmar_msk3   :: Bit      -- Alarm A hours mask
  , rtc_alrmar_pm     :: Bit      -- AM/PM notation
  , rtc_alrmar_ht     :: Bits 2   -- Hour tens in BCD format.
  , rtc_alrmar_hu     :: Bits 4   -- Hour units in BCD format.
  , rtc_alrmar_msk2   :: Bit      -- Alarm A minutes mask
  , rtc_alrmar_mnt    :: Bits 3   -- Minute tens in BCD format.
  , rtc_alrmar_mnu    :: Bits 4   -- Minute units in BCD format.
  , rtc_alrmar_msk1   :: Bit      -- Alarm A seconds mask
  , rtc_alrmar_st     :: Bits 3   -- Second tens in BCD format.
  , rtc_alrmar_su     :: Bits 4   -- Second units in BCD format.
  }
|]


-- write protection register
--  | offset : 0x24
--  | address: 0x40002824
[ivory|
 bitdata RTC_WPR :: Bits 32 = rtc_wpr
  { _          :: Bits 24  -- (Reserved)
  , rtc_wpr_key  :: Bits 8   -- Write protection key
  }
|]


-- sub second register
--  | offset : 0x28
--  | address: 0x40002828
[ivory|
 bitdata RTC_SSR :: Bits 32 = rtc_ssr
  { _         :: Bits 16  -- (Reserved)
  , rtc_ssr_ss  :: Bits 16  -- Sub second value
  }
|]


-- shift control register
--  | offset : 0x2c
--  | address: 0x4000282c
[ivory|
 bitdata RTC_SHIFTR :: Bits 32 = rtc_shiftr
  { rtc_shiftr_add1s  :: Bit      -- Add one second
  , _               :: Bits 16  -- (Reserved)
  , rtc_shiftr_subfs  :: Bits 15  -- Subtract a fraction of a second
  }
|]


-- timestamp time register
--  | offset : 0x30
--  | address: 0x40002830
[ivory|
 bitdata RTC_TSTR :: Bits 32 = rtc_tstr
  { _           :: Bits 9   -- (Reserved)
  , rtc_tstr_pm   :: Bit      -- AM/PM notation
  , rtc_tstr_ht   :: Bits 2   -- Hour tens in BCD format.
  , rtc_tstr_hu   :: Bits 4   -- Hour units in BCD format.
  , _           :: Bit      -- (Reserved)
  , rtc_tstr_mnt  :: Bits 3   -- Minute tens in BCD format.
  , rtc_tstr_mnu  :: Bits 4   -- Minute units in BCD format.
  , _           :: Bit      -- (Reserved)
  , rtc_tstr_st   :: Bits 3   -- Second tens in BCD format.
  , rtc_tstr_su   :: Bits 4   -- Second units in BCD format.
  }
|]


-- timestamp date register
--  | offset : 0x34
--  | address: 0x40002834
[ivory|
 bitdata RTC_TSDR :: Bits 32 = rtc_tsdr
  { _           :: Bits 16  -- (Reserved)
  , rtc_tsdr_wdu  :: Bits 3   -- Week day units
  , rtc_tsdr_mt   :: Bit      -- Month tens in BCD format
  , rtc_tsdr_mu   :: Bits 4   -- Month units in BCD format
  , _           :: Bits 2   -- (Reserved)
  , rtc_tsdr_dt   :: Bits 2   -- Date tens in BCD format
  , rtc_tsdr_du   :: Bits 4   -- Date units in BCD format
  }
|]


-- time-stamp sub second register
--  | offset : 0x38
--  | address: 0x40002838
[ivory|
 bitdata RTC_TSSSR :: Bits 32 = rtc_tsssr
  { _           :: Bits 16  -- (Reserved)
  , rtc_tsssr_ss  :: Bits 16  -- Sub second value
  }
|]


-- calibration register
--  | offset : 0x3c
--  | address: 0x4000283c
[ivory|
 bitdata RTC_CALR :: Bits 32 = rtc_calr
  { _              :: Bits 16  -- (Reserved)
  , rtc_calr_calp    :: Bit      -- Use an 8-second calibration cycle period
  , rtc_calr_calw8   :: Bit      -- Use a 16-second calibration cycle period
  , rtc_calr_calw16  :: Bit      -- Use a 16-second calibration cycle period
  , _              :: Bits 4   -- (Reserved)
  , rtc_calr_calm    :: Bits 9   -- Calibration minus
  }
|]


-- tamper and alternate function configuration register
--  | offset : 0x40
--  | address: 0x40002840
[ivory|
 bitdata RTC_TAFCR :: Bits 32 = rtc_tafcr
  { _                   :: Bits 8   -- (Reserved)
  , rtc_tafcr_pc15mode    :: Bit      -- PC15 mode
  , rtc_tafcr_pc15value   :: Bit      -- PC15 value
  , rtc_tafcr_pc14mode    :: Bit      -- PC14 mode
  , rtc_tafcr_pc14value   :: Bit      -- PC14 value
  , rtc_tafcr_pc13mode    :: Bit      -- PC13 mode
  , rtc_tafcr_pc13value   :: Bit      -- RTC_ALARM output type/PC13 value
  , _                   :: Bits 2   -- (Reserved)
  , rtc_tafcr_tamp_pudis  :: Bit      -- RTC_TAMPx pull-up disable
  , rtc_tafcr_tamp_prch   :: Bits 2   -- RTC_TAMPx precharge duration
  , rtc_tafcr_tampflt     :: Bits 2   -- RTC_TAMPx filter count
  , rtc_tafcr_tampfreq    :: Bits 3   -- Tamper sampling frequency
  , rtc_tafcr_tampts      :: Bit      -- Activate timestamp on tamper detection event
  , _                   :: Bits 2   -- (Reserved)
  , rtc_tafcr_tamp2_trg   :: Bit      -- Active level for RTC_TAMP2 input
  , rtc_tafcr_tamp2e      :: Bit      -- RTC_TAMP2 input detection enable
  , rtc_tafcr_tampie      :: Bit      -- Tamper interrupt enable
  , rtc_tafcr_tamp1trg    :: Bit      -- Active level for RTC_TAMP1 input
  , rtc_tafcr_tamp1e      :: Bit      -- RTC_TAMP1 input detection enable
  }
|]


-- alarm A sub second register
--  | offset : 0x44
--  | address: 0x40002844
[ivory|
 bitdata RTC_ALRMASSR :: Bits 32 = rtc_alrmassr
  { _                  :: Bits 4   -- (Reserved)
  , rtc_alrmassr_maskss  :: Bits 4   -- Mask the most-significant bits starting at this bit
  , _                  :: Bits 9   -- (Reserved)
  , rtc_alrmassr_ss      :: Bits 15  -- Sub seconds value
  }
|]


-- backup register
--  | offset : 0x50
--  | address: 0x40002850
[ivory|
 bitdata RTC_BKP0R :: Bits 32 = rtc_bkp0r
  { rtc_bkp0r_bkp  :: Bits 32  -- BKP
  }
|]


-- backup register
--  | offset : 0x54
--  | address: 0x40002854
[ivory|
 bitdata RTC_BKP1R :: Bits 32 = rtc_bkp1r
  { rtc_bkp1r_bkp  :: Bits 32  -- BKP
  }
|]


-- backup register
--  | offset : 0x58
--  | address: 0x40002858
[ivory|
 bitdata RTC_BKP2R :: Bits 32 = rtc_bkp2r
  { rtc_bkp2r_bkp  :: Bits 32  -- BKP
  }
|]


-- backup register
--  | offset : 0x5c
--  | address: 0x4000285c
[ivory|
 bitdata RTC_BKP3R :: Bits 32 = rtc_bkp3r
  { rtc_bkp3r_bkp  :: Bits 32  -- BKP
  }
|]


-- backup register
--  | offset : 0x60
--  | address: 0x40002860
[ivory|
 bitdata RTC_BKP4R :: Bits 32 = rtc_bkp4r
  { rtc_bkp4r_bkp  :: Bits 32  -- BKP
  }
|]

