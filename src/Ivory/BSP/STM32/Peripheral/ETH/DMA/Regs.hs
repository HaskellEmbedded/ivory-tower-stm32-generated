{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32.Peripheral.ETH.DMA.Regs where

import Ivory.Language
import Ivory.BSP.STM32.Peripheral.ETH.DMA.RegTypes

-- ETH Ethernet: DMA controller operation

-- Base address: 0x40029000

-- Ethernet DMA bus mode register
--  | offset : 0x0
--  | address: 0x40029000
[ivory|
 bitdata ETH_DMABMR :: Bits 32 = eth_dmabmr
  { _               :: Bits 5    -- (Reserved)
  , eth_dmabmr_mb   :: Bit       -- Mixed burst
  , eth_dmabmr_aab  :: Bit       -- Address-aligned beats
  , eth_dmabmr_fpm  :: Bit       -- 4xPBL mode
  , eth_dmabmr_usp  :: Bit       -- Use separate PBL
  , eth_dmabmr_rdp  :: Bits 6    -- Rx DMA PBL
  , eth_dmabmr_fb   :: Bit       -- Fixed burst
  , eth_dmabmr_pm   :: RxTxRatio -- Rx-Tx priority ratio
  , eth_dmabmr_pbl  :: Bits 6    -- Programmable burst length
  , eth_dmabmr_edfe :: Bit       -- Enhanced descriptor format enable
  , eth_dmabmr_dsl  :: Bits 5    -- Descriptor skip length
  , eth_dmabmr_da   :: Bit       -- DMA arbitration
  , eth_dmabmr_sr   :: Bit       -- Software reset
  }
|]

-- Ethernet DMA transmit poll demand register
--  | offset : 0x4
--  | address: 0x40029004
[ivory|
 bitdata ETH_DMATPDR :: Bits 32 = eth_dmatpdr
  { eth_dmatpdr_tpd :: Bits 32 -- Transmit poll demand
  }
|]

-- EHERNET DMA receive poll demand register
--  | offset : 0x8
--  | address: 0x40029008
[ivory|
 bitdata ETH_DMARPDR :: Bits 32 = eth_dmarpdr
  { eth_dmarpdr_rpd :: Bits 32 -- Receive poll demand
  }
|]

-- Ethernet DMA receive descriptor list address register
--  | offset : 0xc
--  | address: 0x4002900c
[ivory|
 bitdata ETH_DMARDLAR :: Bits 32 = eth_dmardlar
  { eth_dmardlar_srl :: Bits 32 -- Start of receive list
  }
|]

-- Ethernet DMA transmit descriptor list address register
--  | offset : 0x10
--  | address: 0x40029010
[ivory|
 bitdata ETH_DMATDLAR :: Bits 32 = eth_dmatdlar
  { eth_dmatdlar_stl :: Bits 32 -- Start of transmit list
  }
|]

-- Ethernet DMA status register
--  | offset : 0x14
--  | address: 0x40029014
[ivory|
 bitdata ETH_DMASR :: Bits 32 = eth_dmasr
  { _              :: Bits 2               -- (Reserved)
  , eth_dmasr_tsts :: Bit                  -- Time stamp trigger status
  , eth_dmasr_pmts :: Bit                  -- PMT status
  , eth_dmasr_mmcs :: Bit                  -- MMC status
  , _              :: Bit                  -- (Reserved)
  , eth_dmasr_ebs  :: Bits 3               -- Error bits status
  , eth_dmasr_tps  :: TransmitProcessState -- Transmit process state
  , eth_dmasr_rps  :: ReceiveProcessState  -- Receive process state
  , eth_dmasr_nis  :: Bit                  -- Normal interrupt summary
  , eth_dmasr_ais  :: Bit                  -- Abnormal interrupt summary
  , eth_dmasr_ers  :: Bit                  -- Early receive status
  , eth_dmasr_fbes :: Bit                  -- Fatal bus error status
  , _              :: Bits 2               -- (Reserved)
  , eth_dmasr_ets  :: Bit                  -- Early transmit status
  , eth_dmasr_pwts :: Bit                  -- PWTS
  , eth_dmasr_rpss :: Bit                  -- Receive process stopped status
  , eth_dmasr_rbus :: Bit                  -- Receive buffer unavailable status
  , eth_dmasr_rs   :: Bit                  -- Receive status
  , eth_dmasr_tus  :: Bit                  -- Transmit underflow status
  , eth_dmasr_ros  :: Bit                  -- Receive overflow status
  , eth_dmasr_tjts :: Bit                  -- Transmit jabber timeout status
  , eth_dmasr_tbus :: Bit                  -- Transmit buffer unavailable status
  , eth_dmasr_tpss :: Bit                  -- Transmit process stopped status
  , eth_dmasr_ts   :: Bit                  -- Transmit status
  }
|]

-- Ethernet DMA operation mode register
--  | offset : 0x18
--  | address: 0x40029018
[ivory|
 bitdata ETH_DMAOMR :: Bits 32 = eth_dmaomr
  { _                 :: Bits 5 -- (Reserved)
  , eth_dmaomr_dtcefd :: Bit    -- Dropping of TCP/IP checksum error frames disable
  , eth_dmaomr_rsf    :: Bit    -- Receive store and forward
  , eth_dmaomr_dfrf   :: Bit    -- Disable flushing of received frames
  , _                 :: Bits 2 -- (Reserved)
  , eth_dmaomr_tsf    :: Bit    -- Transmit store and forward
  , eth_dmaomr_ftf    :: Bit    -- Flush transmit FIFO
  , _                 :: Bits 3 -- (Reserved)
  , eth_dmaomr_ttc    :: Bits 3 -- Transmit threshold control
  , eth_dmaomr_st     :: Bit    -- Start/stop transmission
  , _                 :: Bits 5 -- (Reserved)
  , eth_dmaomr_fef    :: Bit    -- Forward error frames
  , eth_dmaomr_fugf   :: Bit    -- Forward undersized good frames
  , _                 :: Bit    -- (Reserved)
  , eth_dmaomr_rtc    :: Bits 2 -- Receive threshold control
  , eth_dmaomr_osf    :: Bit    -- Operate on second frame
  , eth_dmaomr_sr     :: Bit    -- Start/stop receive
  , _                 :: Bit    -- (Reserved)
  }
|]

-- Ethernet DMA interrupt enable register
--  | offset : 0x1c
--  | address: 0x4002901c
[ivory|
 bitdata ETH_DMAIER :: Bits 32 = eth_dmaier
  { _                :: Bits 15 -- (Reserved)
  , eth_dmaier_nise  :: Bit     -- Normal interrupt summary enable
  , eth_dmaier_aise  :: Bit     -- Abnormal interrupt summary enable
  , eth_dmaier_erie  :: Bit     -- Early receive interrupt enable
  , eth_dmaier_fbeie :: Bit     -- Fatal bus error interrupt enable
  , _                :: Bits 2  -- (Reserved)
  , eth_dmaier_etie  :: Bit     -- Early transmit interrupt enable
  , eth_dmaier_rwtie :: Bit     -- Receive watchdog timeout interrupt enable
  , eth_dmaier_rpsie :: Bit     -- Receive process stopped interrupt enable
  , eth_dmaier_rbuie :: Bit     -- Receive buffer unavailable interrupt enable
  , eth_dmaier_rie   :: Bit     -- Receive interrupt enable
  , eth_dmaier_tuie  :: Bit     -- Transmit underflow interrupt enable
  , eth_dmaier_roie  :: Bit     -- Receive overflow interrupt enable
  , eth_dmaier_tjtie :: Bit     -- Transmit jabber timeout interrupt enable
  , eth_dmaier_tbuie :: Bit     -- Transmit buffer unavailable interrupt enable
  , eth_dmaier_tpsie :: Bit     -- Transmit process stopped interrupt enable
  , eth_dmaier_tie   :: Bit     -- Transmit interrupt enable
  }
|]

-- Ethernet DMA missed frame and buffer overflow counter register
--  | offset : 0x20
--  | address: 0x40029020
[ivory|
 bitdata ETH_DMAMFBOCR :: Bits 32 = eth_dmamfbocr
  { _                  :: Bits 3  -- (Reserved)
  , eth_dmamfbocr_ofoc :: Bit     -- Overflow bit for FIFO overflow counter
  , eth_dmamfbocr_mfa  :: Bits 11 -- Missed frames by the application
  , eth_dmamfbocr_omfc :: Bit     -- Overflow bit for missed frame counter
  , eth_dmamfbocr_mfc  :: Bits 16 -- Missed frames by the controller
  }
|]

-- Ethernet DMA receive status watchdog timer register
--  | offset : 0x24
--  | address: 0x40029024
[ivory|
 bitdata ETH_DMARSWTR :: Bits 32 = eth_dmarswtr
  { _                  :: Bits 24 -- (Reserved)
  , eth_dmarswtr_rswtc :: Bits 8  -- Receive status watchdog timer count
  }
|]

-- Ethernet DMA current host transmit descriptor register
--  | offset : 0x48
--  | address: 0x40029048
[ivory|
 bitdata ETH_DMACHTDR :: Bits 32 = eth_dmachtdr
  { eth_dmachtdr_htdap :: Bits 32 -- Host transmit descriptor address pointer
  }
|]

-- Ethernet DMA current host receive descriptor register
--  | offset : 0x4c
--  | address: 0x4002904c
[ivory|
 bitdata ETH_DMACHRDR :: Bits 32 = eth_dmachrdr
  { eth_dmachrdr_hrdap :: Bits 32 -- Host receive descriptor address pointer
  }
|]

-- Ethernet DMA current host transmit buffer address register
--  | offset : 0x50
--  | address: 0x40029050
[ivory|
 bitdata ETH_DMACHTBAR :: Bits 32 = eth_dmachtbar
  { eth_dmachtbar_htbap :: Bits 32 -- Host transmit buffer address pointer
  }
|]

-- Ethernet DMA current host receive buffer address register
--  | offset : 0x54
--  | address: 0x40029054
[ivory|
 bitdata ETH_DMACHRBAR :: Bits 32 = eth_dmachrbar
  { eth_dmachrbar_hrbap :: Bits 32 -- Host receive buffer address pointer
  }
|]
