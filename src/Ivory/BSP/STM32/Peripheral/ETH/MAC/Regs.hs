{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32.Peripheral.ETH.MAC.Regs where

import Ivory.Language
import Ivory.BSP.STM32.Peripheral.ETH.MAC.RegTypes

-- ETH Ethernet: media access control (MAC)

-- Base address: 0x40028000

-- Ethernet MAC configuration register
--  | offset : 0x0
--  | address: 0x40028000
[ivory|
 bitdata ETH_MACCR :: Bits 32 = eth_maccr
  { _             :: Bits 6   -- (Reserved)
  , eth_maccr_cstf  :: Bit      -- CRC stripping for type frames
  , _             :: Bit      -- (Reserved)
  , eth_maccr_wd    :: Bit      -- Watchdog disable
  , eth_maccr_jd    :: Bit      -- Jabber disable
  , _             :: Bits 2   -- (Reserved)
  , eth_maccr_ifg   :: Bits 3   -- Interframe gap
  , eth_maccr_csd   :: Bit      -- Carrier sense disable
  , _             :: Bit      -- (Reserved)
  , eth_maccr_fes   :: Bit      -- Fast Ethernet speed
  , eth_maccr_rod   :: Bit      -- Receive own disable
  , eth_maccr_lm    :: Bit      -- Loopback mode
  , eth_maccr_dm    :: Bit      -- Duplex mode
  , eth_maccr_ipco  :: Bit      -- IPv4 checksum offload
  , eth_maccr_rd    :: Bit      -- Retry disable
  , _             :: Bit      -- (Reserved)
  , eth_maccr_apcs  :: Bit      -- Automatic pad/CRC stripping
  , eth_maccr_bl    :: Bits 2   -- Back-off limit
  , eth_maccr_dc    :: Bit      -- Deferral check
  , eth_maccr_te    :: Bit      -- Transmitter enable
  , eth_maccr_re    :: Bit      -- Receiver enable
  , _             :: Bits 2   -- (Reserved)
  }
|]


-- Ethernet MAC frame filter register
--  | offset : 0x4
--  | address: 0x40028004
[ivory|
 bitdata ETH_MACFFR :: Bits 32 = eth_macffr
  { eth_macffr_ra    :: Bit      -- Receive all
  , _              :: Bits 20  -- (Reserved)
  , eth_macffr_hpf   :: Bit      -- Hash or perfect filter
  , eth_macffr_saf   :: Bit      -- Source address filter
  , eth_macffr_saif  :: Bit      -- Source address inverse filtering
  , eth_macffr_pcf   :: Bits 2   -- Pass control frames
  , eth_macffr_bfd   :: Bit      -- Broadcast frames disable
  , eth_macffr_pam   :: Bit      -- Pass all multicast
  , eth_macffr_daif  :: Bit      -- Destination address unique filtering
  , eth_macffr_hm    :: Bit      -- Hash multicast
  , eth_macffr_hu    :: Bit      -- Hash unicast
  , eth_macffr_pm    :: Bit      -- Promiscuous mode
  }
|]


-- Ethernet MAC hash table high register
--  | offset : 0x8
--  | address: 0x40028008
[ivory|
 bitdata ETH_MACHTHR :: Bits 32 = eth_machthr
  { eth_machthr_hth  :: Bits 32  -- Upper 32 bits of hash table
  }
|]


-- Ethernet MAC hash table low register
--  | offset : 0xc
--  | address: 0x4002800c
[ivory|
 bitdata ETH_MACHTLR :: Bits 32 = eth_machtlr
  { eth_machtlr_htl  :: Bits 32  -- Lower 32 bits of hash table
  }
|]


-- Ethernet MAC MII address register
--  | offset : 0x10
--  | address: 0x40028010
[ivory|
 bitdata ETH_MACMIIAR :: Bits 32 = eth_macmiiar
  { _              :: Bits 16  -- (Reserved)
  , eth_macmiiar_pa  :: Bits 5   -- PHY address - select which of possible 32 PHYs is being accessed
  , eth_macmiiar_mr  :: Bits 5   -- MII register - select the desired MII register in the PHY device
  , _              :: Bit      -- (Reserved)
  , eth_macmiiar_cr  :: Bits 3   -- Clock range
  , eth_macmiiar_mw  :: Bit      -- MII write
  , eth_macmiiar_mb  :: Bit      -- MII busy
  }
|]


-- Ethernet MAC MII data register
--  | offset : 0x14
--  | address: 0x40028014
[ivory|
 bitdata ETH_MACMIIDR :: Bits 32 = eth_macmiidr
  { _              :: Bits 16  -- (Reserved)
  , eth_macmiidr_md  :: Bits 16  -- MII data read from/written to the PHY
  }
|]


-- Ethernet MAC flow control register
--  | offset : 0x18
--  | address: 0x40028018
[ivory|
 bitdata ETH_MACFCR :: Bits 32 = eth_macfcr
  { eth_macfcr_pt    :: Bits 16  -- Pause time
  , _              :: Bits 8   -- (Reserved)
  , eth_macfcr_zqpd  :: Bit      -- Zero-quanta pause disable
  , _              :: Bit      -- (Reserved)
  , eth_macfcr_plt   :: Bits 2   -- Pause low threshold
  , eth_macfcr_upfd  :: Bit      -- Unicast pause frame detect
  , eth_macfcr_rfce  :: Bit      -- Receive flow control enable
  , eth_macfcr_tfce  :: Bit      -- Transmit flow control enable
  , eth_macfcr_fcb   :: Bit      -- Flow control busy/back pressure activate
  }
|]


-- Ethernet MAC VLAN tag register
--  | offset : 0x1c
--  | address: 0x4002801c
[ivory|
 bitdata ETH_MACVLANTR :: Bits 32 = eth_macvlantr
  { _                   :: Bits 15  -- (Reserved)
  , eth_macvlantr_vlantc  :: Bit      -- 12-bit VLAN tag comparison
  , eth_macvlantr_vlanti  :: Bits 16  -- VLAN tag identifier (for receive frames)
  }
|]


-- Ethernet MAC PMT control and status register
--  | offset : 0x2c
--  | address: 0x4002802c
[ivory|
 bitdata ETH_MACPMTCSR :: Bits 32 = eth_macpmtcsr
  { eth_macpmtcsr_wffrpr  :: Bit      -- Wakeup frame filter register pointer reset
  , _                   :: Bits 21  -- (Reserved)
  , eth_macpmtcsr_gu      :: Bit      -- Global unicast
  , _                   :: Bits 2   -- (Reserved)
  , eth_macpmtcsr_wfr     :: Bit      -- Wakeup frame received
  , eth_macpmtcsr_mpr     :: Bit      -- Magic packet received
  , _                   :: Bits 2   -- (Reserved)
  , eth_macpmtcsr_wfe     :: Bit      -- Wakeup frame enable
  , eth_macpmtcsr_mpe     :: Bit      -- Magic packet enable
  , eth_macpmtcsr_pd      :: Bit      -- Power down
  }
|]


-- Ethernet MAC debug register
--  | offset : 0x34
--  | address: 0x40028034
[ivory|
 bitdata ETH_MACDBGR :: Bits 32 = eth_macdbgr
  { _                  :: Bits 6   -- (Reserved)
  , eth_macdbgr_tff      :: Bit      -- Tx FIFO full
  , eth_macdbgr_tfne     :: Bit      -- Tx FIFO not empty
  , _                  :: Bit      -- (Reserved)
  , eth_macdbgr_tfwa     :: Bit      -- Tx FIFO write active
  , eth_macdbgr_tfrs     :: Bits 2   -- Tx FIFO read status
  , eth_macdbgr_mtp      :: Bit      -- MAC transmitter in pause
  , eth_macdbgr_mtfcs    :: Bits 2   -- MAC transmit frame controller status
  , eth_macdbgr_mmtea    :: Bit      -- MAC MII transmit engine active
  , _                  :: Bits 6   -- (Reserved)
  , eth_macdbgr_rffl     :: Bits 2   -- Rx FIFO fill level
  , _                  :: Bit      -- (Reserved)
  , eth_macdbgr_rfrcs    :: Bits 2   -- Rx FIFO read controller status
  , eth_macdbgr_rfwra    :: Bit      -- Rx FIFO write controller active
  , _                  :: Bit      -- (Reserved)
  , eth_macdbgr_msfrwcs  :: Bits 2   -- MAC small FIFO read/write controllers status
  , eth_macdbgr_mmrpea   :: Bit      -- MAC MII receive protocol engine active
  }
|]


-- Ethernet MAC interrupt status register
--  | offset : 0x38
--  | address: 0x40028038
[ivory|
 bitdata ETH_MACSR :: Bits 32 = eth_macsr
  { _              :: Bits 22  -- (Reserved)
  , eth_macsr_tsts   :: Bit      -- Time stamp trigger status
  , _              :: Bits 2   -- (Reserved)
  , eth_macsr_mmcts  :: Bit      -- MMC transmit status
  , eth_macsr_mmcrs  :: Bit      -- MMC receive status
  , eth_macsr_mmcs   :: Bit      -- MMC status
  , eth_macsr_pmts   :: Bit      -- PMT status
  , _              :: Bits 3   -- (Reserved)
  }
|]


-- Ethernet MAC interrupt mask register
--  | offset : 0x3c
--  | address: 0x4002803c
[ivory|
 bitdata ETH_MACIMR :: Bits 32 = eth_macimr
  { _               :: Bits 22  -- (Reserved)
  , eth_macimr_tstim  :: Bit      -- Time stamp trigger interrupt mask
  , _               :: Bits 5   -- (Reserved)
  , eth_macimr_pmtim  :: Bit      -- PMT interrupt mask
  , _               :: Bits 3   -- (Reserved)
  }
|]


-- Ethernet MAC address 0 high register
--  | offset : 0x40
--  | address: 0x40028040
[ivory|
 bitdata ETH_MACA0HR :: Bits 32 = eth_maca0hr
  { eth_maca0hr_mo      :: Bit      -- Always 1
  , _                 :: Bits 15  -- (Reserved)
  , eth_maca0hr_maca0h  :: Bits 16  -- MAC address0 high
  }
|]


-- Ethernet MAC address 0 low register
--  | offset : 0x44
--  | address: 0x40028044
[ivory|
 bitdata ETH_MACA0LR :: Bits 32 = eth_maca0lr
  { eth_maca0lr_maca0l  :: Bits 32  -- 0
  }
|]


-- Ethernet MAC address 1 high register
--  | offset : 0x48
--  | address: 0x40028048
[ivory|
 bitdata ETH_MACA1HR :: Bits 32 = eth_maca1hr
  { eth_maca1hr_ae      :: Bit      -- AE
  , eth_maca1hr_sa      :: Bit      -- SA
  , eth_maca1hr_mbc     :: Bits 6   -- MBC
  , _                 :: Bits 8   -- (Reserved)
  , eth_maca1hr_maca1h  :: Bits 16  -- MACA1H
  }
|]


-- Ethernet MAC address1 low register
--  | offset : 0x4c
--  | address: 0x4002804c
[ivory|
 bitdata ETH_MACA1LR :: Bits 32 = eth_maca1lr
  { eth_maca1lr_maca1l  :: Bits 32  -- MACA1LR
  }
|]


-- Ethernet MAC address 2 high register
--  | offset : 0x50
--  | address: 0x40028050
[ivory|
 bitdata ETH_MACA2HR :: Bits 32 = eth_maca2hr
  { eth_maca2hr_ae      :: Bit      -- AE
  , eth_maca2hr_sa      :: Bit      -- SA
  , eth_maca2hr_mbc     :: Bits 6   -- MBC
  , _                 :: Bits 8   -- (Reserved)
  , eth_maca2hr_maca2h  :: Bits 16  -- MAC2AH
  }
|]


-- Ethernet MAC address 2 low register
--  | offset : 0x54
--  | address: 0x40028054
[ivory|
 bitdata ETH_MACA2LR :: Bits 32 = eth_maca2lr
  { eth_maca2lr_maca2l  :: Bits 32  -- MACA2L
  }
|]


-- Ethernet MAC address 3 high register
--  | offset : 0x58
--  | address: 0x40028058
[ivory|
 bitdata ETH_MACA3HR :: Bits 32 = eth_maca3hr
  { eth_maca3hr_ae      :: Bit      -- AE
  , eth_maca3hr_sa      :: Bit      -- SA
  , eth_maca3hr_mbc     :: Bits 6   -- MBC
  , _                 :: Bits 8   -- (Reserved)
  , eth_maca3hr_maca3h  :: Bits 16  -- MACA3H
  }
|]


-- Ethernet MAC address 3 low register
--  | offset : 0x5c
--  | address: 0x4002805c
[ivory|
 bitdata ETH_MACA3LR :: Bits 32 = eth_maca3lr
  { eth_maca3lr_maca3l  :: Bits 32  -- MBCA3L
  }
|]


-- Ethernet MAC remote wakeup frame filter register
--  | offset : 0x60
--  | address: 0x40028060
[ivory|
 bitdata ETH_MACRWUFFER :: Bits 32 = eth_macrwuffer
  { eth_macrwuffer_data  :: Bits 32  -- (Reserved)
  }
|]

