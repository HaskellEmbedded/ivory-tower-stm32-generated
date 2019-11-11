{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32.Peripheral.CAN.Regs where

import Ivory.Language
import Ivory.BSP.STM32.Peripheral.CAN.RegTypes

-- CAN Controller area network

-- Base address: 0x40006400

-- CAN_MCR
--  | offset : 0x0
--  | address: 0x40006400
[ivory|
 bitdata CAN_MCR :: Bits 32 = can_mcr
  { _            :: Bits 15  -- (Reserved)
  , can_mcr_dbf    :: Bit      -- DBF
  , can_mcr_reset  :: Bit      -- RESET
  , _            :: Bits 7   -- (Reserved)
  , can_mcr_ttcm   :: Bit      -- TTCM
  , can_mcr_abom   :: Bit      -- ABOM
  , can_mcr_awum   :: Bit      -- AWUM
  , can_mcr_nart   :: Bit      -- NART
  , can_mcr_rflm   :: Bit      -- RFLM
  , can_mcr_txfp   :: Bit      -- TXFP
  , can_mcr_sleep  :: Bit      -- SLEEP
  , can_mcr_inrq   :: Bit      -- INRQ
  }
|]


-- CAN_MSR
--  | offset : 0x4
--  | address: 0x40006404
[ivory|
 bitdata CAN_MSR :: Bits 32 = can_msr
  { _            :: Bits 20  -- (Reserved)
  , can_msr_rx     :: Bit      -- RX
  , can_msr_samp   :: Bit      -- SAMP
  , can_msr_rxm    :: Bit      -- RXM
  , can_msr_txm    :: Bit      -- TXM
  , _            :: Bits 3   -- (Reserved)
  , can_msr_slaki  :: Bit      -- SLAKI
  , can_msr_wkui   :: Bit      -- WKUI
  , can_msr_erri   :: Bit      -- ERRI
  , can_msr_slak   :: Bit      -- SLAK
  , can_msr_inak   :: Bit      -- INAK
  }
|]


-- CAN_TSR
--  | offset : 0x8
--  | address: 0x40006408
[ivory|
 bitdata CAN_TSR :: Bits 32 = can_tsr
  { can_tsr_low2   :: Bit      -- Lowest priority flag for mailbox 2
  , can_tsr_low1   :: Bit      -- Lowest priority flag for mailbox 1
  , can_tsr_low0   :: Bit      -- Lowest priority flag for mailbox 0
  , can_tsr_tme2   :: Bit      -- Lowest priority flag for mailbox 2
  , can_tsr_tme1   :: Bit      -- Lowest priority flag for mailbox 1
  , can_tsr_tme0   :: Bit      -- Lowest priority flag for mailbox 0
  , can_tsr_code   :: Bits 2   -- CODE
  , can_tsr_abrq2  :: Bit      -- ABRQ2
  , _            :: Bits 3   -- (Reserved)
  , can_tsr_terr2  :: Bit      -- TERR2
  , can_tsr_alst2  :: Bit      -- ALST2
  , can_tsr_txok2  :: Bit      -- TXOK2
  , can_tsr_rqcp2  :: Bit      -- RQCP2
  , can_tsr_abrq1  :: Bit      -- ABRQ1
  , _            :: Bits 3   -- (Reserved)
  , can_tsr_terr1  :: Bit      -- TERR1
  , can_tsr_alst1  :: Bit      -- ALST1
  , can_tsr_txok1  :: Bit      -- TXOK1
  , can_tsr_rqcp1  :: Bit      -- RQCP1
  , can_tsr_abrq0  :: Bit      -- ABRQ0
  , _            :: Bits 3   -- (Reserved)
  , can_tsr_terr0  :: Bit      -- TERR0
  , can_tsr_alst0  :: Bit      -- ALST0
  , can_tsr_txok0  :: Bit      -- TXOK0
  , can_tsr_rqcp0  :: Bit      -- RQCP0
  }
|]


-- CAN_RF0R
--  | offset : 0xc
--  | address: 0x4000640c
[ivory|
 bitdata CAN_RFR :: Bits 32 = can_rfr
  { _           :: Bits 26  -- (Reserved)
  , can_rfr_rfom  :: Bit      -- RFOM0
  , can_rfr_fovr  :: Bit      -- FOVR0
  , can_rfr_full  :: Bit      -- FULL0
  , _           :: Bit      -- (Reserved)
  , can_rfr_fmp   :: Bits 2   -- FMP0
  }
|]


-- CAN_IER
--  | offset : 0x14
--  | address: 0x40006414
[ivory|
 bitdata CAN_IER :: Bits 32 = can_ier
  { _             :: Bits 14  -- (Reserved)
  , can_ier_slkie   :: Bit      -- SLKIE
  , can_ier_wkuie   :: Bit      -- WKUIE
  , can_ier_errie   :: Bit      -- ERRIE
  , _             :: Bits 3   -- (Reserved)
  , can_ier_lecie   :: Bit      -- LECIE
  , can_ier_bofie   :: Bit      -- BOFIE
  , can_ier_epvie   :: Bit      -- EPVIE
  , can_ier_ewgie   :: Bit      -- EWGIE
  , _             :: Bit      -- (Reserved)
  , can_ier_fovie1  :: Bit      -- FOVIE1
  , can_ier_ffie1   :: Bit      -- FFIE1
  , can_ier_fmpie1  :: Bit      -- FMPIE1
  , can_ier_fovie0  :: Bit      -- FOVIE0
  , can_ier_ffie0   :: Bit      -- FFIE0
  , can_ier_fmpie0  :: Bit      -- FMPIE0
  , can_ier_tmeie   :: Bit      -- TMEIE
  }
|]


-- CAN_ESR
--  | offset : 0x18
--  | address: 0x40006418
[ivory|
 bitdata CAN_ESR :: Bits 32 = can_esr
  { can_esr_rec   :: Bits 8   -- REC
  , can_esr_tec   :: Bits 8   -- TEC
  , _           :: Bits 9   -- (Reserved)
  , can_esr_lec   :: Bits 3   -- LEC
  , _           :: Bit      -- (Reserved)
  , can_esr_boff  :: Bit      -- BOFF
  , can_esr_epvf  :: Bit      -- EPVF
  , can_esr_ewgf  :: Bit      -- EWGF
  }
|]


-- CAN BTR
--  | offset : 0x1c
--  | address: 0x4000641c
[ivory|
 bitdata CAN_BTR :: Bits 32 = can_btr
  { can_btr_silm  :: Bit      -- SILM
  , can_btr_lbkm  :: Bit      -- LBKM
  , _           :: Bits 4   -- (Reserved)
  , can_btr_sjw   :: Bits 2   -- SJW
  , _           :: Bit      -- (Reserved)
  , can_btr_ts2   :: Bits 3   -- TS2
  , can_btr_ts1   :: Bits 4   -- TS1
  , _           :: Bits 6   -- (Reserved)
  , can_btr_brp   :: Bits 10  -- BRP
  }
|]


-- CAN_TI0R
--  | offset : 0x180
--  | address: 0x40006580
[ivory|
 bitdata CAN_TIR :: Bits 32 = can_tir
  { can_tir_id    :: Bits 29  -- EXID
  , can_tir_ide   :: Bit      -- IDE
  , can_tir_rtr   :: Bit      -- RTR
  , can_tir_txrq  :: Bit      -- TXRQ
  }
|]


-- CAN_TDT0R
--  | offset : 0x184
--  | address: 0x40006584
[ivory|
 bitdata CAN_TDTR :: Bits 32 = can_tdtr
  { can_tdtr_time  :: Bits 16  -- TIME
  , _            :: Bits 7   -- (Reserved)
  , can_tdtr_tgt   :: Bit      -- TGT
  , _            :: Bits 4   -- (Reserved)
  , can_tdtr_dlc   :: Bits 4   -- DLC
  }
|]


-- CAN_TDL0R
--  | offset : 0x188
--  | address: 0x40006588
[ivory|
 bitdata CAN_TDLR :: Bits 32 = can_tdlr
  { can_tdlr_data3  :: Bits 8   -- DATA3
  , can_tdlr_data2  :: Bits 8   -- DATA2
  , can_tdlr_data1  :: Bits 8   -- DATA1
  , can_tdlr_data0  :: Bits 8   -- DATA0
  }
|]


-- CAN_TDH0R
--  | offset : 0x18c
--  | address: 0x4000658c
[ivory|
 bitdata CAN_TDHR :: Bits 32 = can_tdhr
  { can_tdhr_data7  :: Bits 8   -- DATA7
  , can_tdhr_data6  :: Bits 8   -- DATA6
  , can_tdhr_data5  :: Bits 8   -- DATA5
  , can_tdhr_data4  :: Bits 8   -- DATA4
  }
|]


-- CAN_RI0R
--  | offset : 0x1b0
--  | address: 0x400065b0
[ivory|
 bitdata CAN_RIR :: Bits 32 = can_rir
  { can_rir_id   :: Bits 29  -- EXID
  , can_rir_ide  :: Bit      -- IDE
  , can_rir_rtr  :: Bit      -- RTR
  , _          :: Bit      -- (Reserved)
  }
|]


-- CAN_RDT0R
--  | offset : 0x1b4
--  | address: 0x400065b4
[ivory|
 bitdata CAN_RDTR :: Bits 32 = can_rdtr
  { can_rdtr_time  :: Bits 16  -- TIME
  , can_rdtr_fmi   :: Bits 8   -- FMI
  , _            :: Bits 4   -- (Reserved)
  , can_rdtr_dlc   :: Bits 4   -- DLC
  }
|]


-- CAN_RDL0R
--  | offset : 0x1b8
--  | address: 0x400065b8
[ivory|
 bitdata CAN_RDLR :: Bits 32 = can_rdlr
  { can_rdlr_data3  :: Bits 8   -- DATA3
  , can_rdlr_data2  :: Bits 8   -- DATA2
  , can_rdlr_data1  :: Bits 8   -- DATA1
  , can_rdlr_data0  :: Bits 8   -- DATA0
  }
|]


-- CAN_RDH0R
--  | offset : 0x1bc
--  | address: 0x400065bc
[ivory|
 bitdata CAN_RDHR :: Bits 32 = can_rdhr
  { can_rdhr_data7  :: Bits 8   -- DATA7
  , can_rdhr_data6  :: Bits 8   -- DATA6
  , can_rdhr_data5  :: Bits 8   -- DATA5
  , can_rdhr_data4  :: Bits 8   -- DATA4
  }
|]


-- CAN_FMR
--  | offset : 0x200
--  | address: 0x40006600
[ivory|
 bitdata CAN_FMR :: Bits 32 = can_fmr
  { _             :: Bits 18  -- (Reserved)
  , can_fmr_can2sb  :: Bits 6   -- CAN2SB
  , _             :: Bits 7   -- (Reserved)
  , can_fmr_finit   :: Bit      -- FINIT
  }
|]


-- CAN_FM1R
--  | offset : 0x204
--  | address: 0x40006604
[ivory|
 bitdata CAN_FM1R :: Bits 32 = can_fm1r
  { _           :: Bits 4   -- (Reserved)
  , can_fm1r_fbm  :: BitArray 28 Bit  -- Filter mode
  }
|]


-- CAN_FS1R
--  | offset : 0x20c
--  | address: 0x4000660c
[ivory|
 bitdata CAN_FS1R :: Bits 32 = can_fs1r
  { _           :: Bits 4   -- (Reserved)
  , can_fs1r_fsc  :: BitArray 28 Bit  -- Filter scale configuration
  }
|]


-- CAN_FFA1R
--  | offset : 0x214
--  | address: 0x40006614
[ivory|
 bitdata CAN_FFA1R :: Bits 32 = can_ffa1r
  { _            :: Bits 4   -- (Reserved)
  , can_ffa1r_ffa  :: BitArray 28 Bit  -- Filter FIFO assignment for filter 0
  }
|]


-- CAN_FA1R
--  | offset : 0x21c
--  | address: 0x4000661c
[ivory|
 bitdata CAN_FA1R :: Bits 32 = can_fa1r
  { _            :: Bits 4   -- (Reserved)
  , can_fa1r_fact  :: BitArray 28 Bit  -- Filter active
  }
|]


-- 
--  | offset : 0x0
--  | address: 0x40006400
[ivory|
 bitdata CAN_FIRX16 :: Bits 32 = can_firx16
  { can_firx16_stid1  :: Bits 11  -- 
  , can_firx16_rtr1   :: Bit      -- 
  , can_firx16_ide1   :: Bit      -- 
  , can_firx16_exid1  :: Bits 3   -- 
  , can_firx16_stid0  :: Bits 11  -- 
  , can_firx16_rtr0   :: Bit      -- 
  , can_firx16_ide0   :: Bit      -- 
  , can_firx16_exid0  :: Bits 3   -- 
  }
|]


-- 
--  | offset : 0x0
--  | address: 0x40006400
[ivory|
 bitdata CAN_FIRX32 :: Bits 32 = can_firx32
  { can_firx32_stid  :: Bits 11  -- 
  , can_firx32_exid  :: Bits 18  -- 
  , can_firx32_ide   :: Bit      -- 
  , can_firx32_rtr   :: Bit      -- 
  , reserved       :: Bit      -- 
  }
|]

