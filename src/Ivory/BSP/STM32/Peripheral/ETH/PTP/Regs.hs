{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32.Peripheral.ETH.PTP.Regs where

import Ivory.Language
import Ivory.BSP.STM32.Peripheral.ETH.PTP.RegTypes

-- ETH Ethernet: Precision time protocol

-- Base address: 0x40028700

-- Ethernet PTP time stamp control register
--  | offset : 0x0
--  | address: 0x40028700
[ivory|
 bitdata ETH_PTPTSCR :: Bits 32 = eth_ptptscr
  { _                     :: Bits 13  -- (Reserved)
  , eth_ptptscr_tspffmae    :: Bit      -- TSPFFMAE
  , eth_ptptscr_tscnt       :: Bits 2   -- TSCNT
  , eth_ptptscr_tssmrme     :: Bit      -- TSSMRME
  , eth_ptptscr_tsseme      :: Bit      -- TSSEME
  , eth_ptptscr_tssipv4fe   :: Bit      -- TSSIPV4FE
  , eth_ptptscr_tssipv6fe   :: Bit      -- TSSIPV6FE
  , eth_ptptscr_tssptpoefe  :: Bit      -- TSSPTPOEFE
  , eth_ptptscr_tsptppsv2e  :: Bit      -- TSPTPPSV2E
  , eth_ptptscr_tsssr       :: Bit      -- TSSSR
  , eth_ptptscr_tssarfe     :: Bit      -- TSSARFE
  , _                     :: Bits 2   -- (Reserved)
  , eth_ptptscr_ttsaru      :: Bit      -- TTSARU
  , eth_ptptscr_tsite       :: Bit      -- TSITE
  , eth_ptptscr_tsstu       :: Bit      -- TSSTU
  , eth_ptptscr_tssti       :: Bit      -- TSSTI
  , eth_ptptscr_tsfcu       :: Bit      -- TSFCU
  , eth_ptptscr_tse         :: Bit      -- TSE
  }
|]

-- Ethernet PTP subsecond increment register
--  | offset : 0x4
--  | address: 0x40028704
[ivory|
 bitdata ETH_PTPSSIR :: Bits 32 = eth_ptpssir
  { _                :: Bits 24  -- (Reserved)
  , eth_ptpssir_stssi  :: Bits 8   -- STSSI
  }
|]

-- Ethernet PTP time stamp high register
--  | offset : 0x8
--  | address: 0x40028708
[ivory|
 bitdata ETH_PTPTSHR :: Bits 32 = eth_ptptshr
  { eth_ptptshr_sts  :: Bits 32  -- STS
  }
|]

-- Ethernet PTP time stamp low register
--  | offset : 0xc
--  | address: 0x4002870c
[ivory|
 bitdata ETH_PTPTSLR :: Bits 32 = eth_ptptslr
  { eth_ptptslr_stpns  :: Bit      -- STPNS
  , eth_ptptslr_stss   :: Bits 31  -- STSS
  }
|]

-- Ethernet PTP time stamp high update register
--  | offset : 0x10
--  | address: 0x40028710
[ivory|
 bitdata ETH_PTPTSHUR :: Bits 32 = eth_ptptshur
  { eth_ptptshur_tsus  :: Bits 32  -- TSUS
  }
|]

-- Ethernet PTP time stamp low update register
--  | offset : 0x14
--  | address: 0x40028714
[ivory|
 bitdata ETH_PTPTSLUR :: Bits 32 = eth_ptptslur
  { eth_ptptslur_tsupns  :: Bit      -- TSUPNS
  , eth_ptptslur_tsuss   :: Bits 31  -- TSUSS
  }
|]

-- Ethernet PTP time stamp addend register
--  | offset : 0x18
--  | address: 0x40028718
[ivory|
 bitdata ETH_PTPTSAR :: Bits 32 = eth_ptptsar
  { eth_ptptsar_tsa  :: Bits 32  -- TSA
  }
|]

-- Ethernet PTP target time high register
--  | offset : 0x1c
--  | address: 0x4002871c
[ivory|
 bitdata ETH_PTPTTHR :: Bits 32 = eth_ptptthr
  { eth_ptptthr_ttsh  :: Bits 32  -- 0
  }
|]

-- Ethernet PTP target time low register
--  | offset : 0x20
--  | address: 0x40028720
[ivory|
 bitdata ETH_PTPTTLR :: Bits 32 = eth_ptpttlr
  { eth_ptpttlr_ttsl  :: Bits 32  -- TTSL
  }
|]

-- Ethernet PTP time stamp status register
--  | offset : 0x28
--  | address: 0x40028728
[ivory|
 bitdata ETH_PTPTSSR :: Bits 32 = eth_ptptssr
  { _                :: Bits 30  -- (Reserved)
  , eth_ptptssr_tsttr  :: Bit      -- TSSO
  , eth_ptptssr_tsso   :: Bit      -- TSSO
  }
|]

-- Ethernet PTP PPS control register
--  | offset : 0x2c
--  | address: 0x4002872c
[ivory|
 bitdata ETH_PTPPPSCR :: Bits 32 = eth_ptpppscr
  { _                   :: Bits 28  -- (Reserved)
  , eth_ptpppscr_ppsfreq  :: Bits 4   -- PPS frequency selection
  }
|]
 
