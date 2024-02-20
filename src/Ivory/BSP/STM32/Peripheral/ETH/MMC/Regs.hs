{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32.Peripheral.ETH.MMC.Regs where

import Ivory.Language
import Ivory.BSP.STM32.Peripheral.ETH.MMC.RegTypes

-- ETH Ethernet: MAC management counters

-- Base address: 0x40028100

-- Ethernet MMC control register
--  | offset : 0x0
--  | address: 0x40028100
[ivory|
 bitdata ETH_MMCCR :: Bits 32 = eth_mmccr
  { _              :: Bits 26  -- (Reserved)
  , eth_mmccr_mcfhp  :: Bit      -- MMC counter Full-Half preset
  , eth_mmccr_mcp    :: Bit      -- MMC counter preset
  , eth_mmccr_mcf    :: Bit      -- MMC counter freeze
  , eth_mmccr_ror    :: Bit      -- Reset on read
  , eth_mmccr_csr    :: Bit      -- Counter stop rollover
  , eth_mmccr_cr     :: Bit      -- Counter reset
  }
|]


-- Ethernet MMC receive interrupt register
--  | offset : 0x4
--  | address: 0x40028104
[ivory|
 bitdata ETH_MMCRIR :: Bits 32 = eth_mmcrir
  { _               :: Bits 14  -- (Reserved)
  , eth_mmcrir_rgufs  :: Bit      -- Received good Unicast frames status
  , _               :: Bits 10  -- (Reserved)
  , eth_mmcrir_rfaes  :: Bit      -- Received frames alignment error status
  , eth_mmcrir_rfces  :: Bit      -- Received frames CRC error status
  , _               :: Bits 5   -- (Reserved)
  }
|]


-- Ethernet MMC transmit interrupt register
--  | offset : 0x8
--  | address: 0x40028108
[ivory|
 bitdata ETH_MMCTIR :: Bits 32 = eth_mmctir
  { _                 :: Bits 10  -- (Reserved)
  , eth_mmctir_tgfs     :: Bit      -- Transmitted good frames status
  , _                 :: Bits 5   -- (Reserved)
  , eth_mmctir_tgfmscs  :: Bit      -- Transmitted good frames more than single collision status
  , eth_mmctir_tgfscs   :: Bit      -- Transmitted good frames single collision status
  , _                 :: Bits 14  -- (Reserved)
  }
|]


-- Ethernet MMC receive interrupt mask register
--  | offset : 0xc
--  | address: 0x4002810c
[ivory|
 bitdata ETH_MMCRIMR :: Bits 32 = eth_mmcrimr
  { _                :: Bits 14  -- (Reserved)
  , eth_mmcrimr_rgufm  :: Bit      -- Received good Unicast frames mask
  , _                :: Bits 10  -- (Reserved)
  , eth_mmcrimr_rfaem  :: Bit      -- Received frames alignment error mask
  , eth_mmcrimr_rfcem  :: Bit      -- Received frame CRC error mask
  , _                :: Bits 5   -- (Reserved)
  }
|]


-- Ethernet MMC transmit interrupt mask register
--  | offset : 0x10
--  | address: 0x40028110
[ivory|
 bitdata ETH_MMCTIMR :: Bits 32 = eth_mmctimr
  { _                  :: Bits 10  -- (Reserved)
  , eth_mmctimr_tgfm     :: Bit      -- Transmitted good frames mask
  , _                  :: Bits 5   -- (Reserved)
  , eth_mmctimr_tgfmscm  :: Bit      -- Transmitted good frames more than single collision mask
  , eth_mmctimr_tgfscm   :: Bit      -- Transmitted good frames single collision mask
  , _                  :: Bits 14  -- (Reserved)
  }
|]


-- Ethernet MMC transmitted good frames after a single collision counter
--  | offset : 0x4c
--  | address: 0x4002814c
[ivory|
 bitdata ETH_MMCTGFSCCR :: Bits 32 = eth_mmctgfsccr
  { eth_mmctgfsccr_tgfscc  :: Bits 32  -- Transmitted good frames single collision counter
  }
|]


-- Ethernet MMC transmitted good frames after more than a single collision
--  | offset : 0x50
--  | address: 0x40028150
[ivory|
 bitdata ETH_MMCTGFMSCCR :: Bits 32 = eth_mmctgfmsccr
  { eth_mmctgfmsccr_tgfmscc  :: Bits 32  -- TGFMSCC
  }
|]


-- Ethernet MMC transmitted good frames counter register
--  | offset : 0x68
--  | address: 0x40028168
[ivory|
 bitdata ETH_MMCTGFCR :: Bits 32 = eth_mmctgfcr
  { eth_mmctgfcr_tgfc  :: Bits 32  -- HTL
  }
|]


-- Ethernet MMC received frames with CRC error counter register
--  | offset : 0x94
--  | address: 0x40028194
[ivory|
 bitdata ETH_MMCRFCECR :: Bits 32 = eth_mmcrfcecr
  { eth_mmcrfcecr_rfcfc  :: Bits 32  -- RFCFC
  }
|]


-- Ethernet MMC received frames with alignment error counter register
--  | offset : 0x98
--  | address: 0x40028198
[ivory|
 bitdata ETH_MMCRFAECR :: Bits 32 = eth_mmcrfaecr
  { eth_mmcrfaecr_rfaec  :: Bits 32  -- RFAEC
  }
|]


-- MMC received good unicast frames counter register
--  | offset : 0xc4
--  | address: 0x400281c4
[ivory|
 bitdata ETH_MMCRGUFCR :: Bits 32 = eth_mmcrgufcr
  { eth_mmcrgufcr_rgufc  :: Bits 32  -- RGUFC
  }
|]

