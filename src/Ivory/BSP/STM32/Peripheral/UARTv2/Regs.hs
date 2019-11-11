{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32.Peripheral.UARTv2.Regs where

import Ivory.Language
import Ivory.BSP.STM32.Peripheral.UART.RegTypes

-- UART Universal synchronous asynchronous receiver transmitter

-- Base address: 0x40011000

-- Status register
--  | offset : 0x0
--  | address: 0x40011000
[ivory|
 bitdata UART_SR :: Bits 32 = uart_sr
  { _           :: Bits 22  -- (Reserved)
  , uart_sr_cts   :: Bit      -- CTS flag
  , uart_sr_lbd   :: Bit      -- LIN break detection flag
  , uart_sr_txe   :: Bit      -- Transmit data register empty
  , uart_sr_tc    :: Bit      -- Transmission complete
  , uart_sr_rxne  :: Bit      -- Read data register not empty
  , uart_sr_idle  :: Bit      -- IDLE line detected
  , uart_sr_ore   :: Bit      -- Overrun error
  , uart_sr_nf    :: Bit      -- Noise detected flag
  , uart_sr_fe    :: Bit      -- Framing error
  , uart_sr_pe    :: Bit      -- Parity error
  }
|]


-- Data register
--  | offset : 0x4
--  | address: 0x40011004
[ivory|
 bitdata UART_DR :: Bits 32 = uart_dr
  { _         :: Bits 24  -- (Reserved)
  , uart_dr_dr  :: Bits 8   -- Data value
  }
|]


-- Baud rate register
--  | offset : 0x8
--  | address: 0x40011008
[ivory|
 bitdata UART_BRR :: Bits 32 = uart_brr
  { _           :: Bits 16  -- (Reserved)
  , uart_brr_div  :: Bits 16  -- divider
  }
|]


-- Control register 1
--  | offset : 0xc
--  | address: 0x4001100c
[ivory|
 bitdata UART_CR1 :: Bits 32 = uart_cr1
  { _              :: Bits 16  -- (Reserved)
  , uart_cr1_over8   :: Bit      -- Oversampling mode
  , _              :: Bit      -- (Reserved)
  , uart_cr1_ue      :: Bit      -- USART enable
  , uart_cr1_m       :: UART_WordLen  -- Word length
  , uart_cr1_wake    :: Bit      -- Wakeup method
  , uart_cr1_pce     :: Bit      -- Parity control enable
  , uart_cr1_ps      :: Bit      -- Parity selection
  , uart_cr1_peie    :: Bit      -- PE interrupt enable
  , uart_cr1_txeie   :: Bit      -- TXE interrupt enable
  , uart_cr1_tcie    :: Bit      -- Transmission complete interrupt enable
  , uart_cr1_rxneie  :: Bit      -- RXNE interrupt enable
  , uart_cr1_idleie  :: Bit      -- IDLE interrupt enable
  , uart_cr1_te      :: Bit      -- Transmitter enable
  , uart_cr1_re      :: Bit      -- Receiver enable
  , uart_cr1_rwu     :: Bit      -- Receiver wakeup
  , uart_cr1_sbk     :: Bit      -- Send break
  }
|]


-- Control register 2
--  | offset : 0x10
--  | address: 0x40011010
[ivory|
 bitdata UART_CR2 :: Bits 32 = uart_cr2
  { _             :: Bits 17  -- (Reserved)
  , uart_cr2_linen  :: Bit      -- LIN mode enable
  , uart_cr2_stop   :: UART_StopBits  -- STOP bits
  , uart_cr2_clken  :: Bit      -- Clock enable
  , uart_cr2_cpol   :: Bit      -- Clock polarity
  , uart_cr2_cpha   :: Bit      -- Clock phase
  , uart_cr2_lbcl   :: Bit      -- Last bit clock pulse
  , _             :: Bit      -- (Reserved)
  , uart_cr2_lbdie  :: Bit      -- LIN break detection interrupt enable
  , uart_cr2_lbdl   :: Bit      -- lin break detection length
  , _             :: Bit      -- (Reserved)
  , uart_cr2_add    :: Bits 4   -- Address of the USART node
  }
|]


-- Control register 3
--  | offset : 0x14
--  | address: 0x40011014
[ivory|
 bitdata UART_CR3 :: Bits 32 = uart_cr3
  { _              :: Bits 20  -- (Reserved)
  , uart_cr3_onebit  :: Bit      -- One sample bit method enable
  , uart_cr3_ctsie   :: Bit      -- CTS interrupt enable
  , uart_cr3_ctse    :: Bit      -- CTS enable
  , uart_cr3_rtse    :: Bit      -- RTS enable
  , uart_cr3_dmat    :: Bit      -- DMA enable transmitter
  , uart_cr3_dmar    :: Bit      -- DMA enable receiver
  , uart_cr3_scen    :: Bit      -- Smartcard mode enable
  , uart_cr3_nack    :: Bit      -- Smartcard NACK enable
  , uart_cr3_hdsel   :: Bit      -- Half-duplex selection
  , uart_cr3_irlp    :: Bit      -- IrDA low-power
  , uart_cr3_iren    :: Bit      -- IrDA mode enable
  , uart_cr3_eie     :: Bit      -- Error interrupt enable
  }
|]


-- Guard time and prescaler register
--  | offset : 0x18
--  | address: 0x40011018
[ivory|
 bitdata UART_GTPR :: Bits 32 = uart_gtpr
  { _            :: Bits 16  -- (Reserved)
  , uart_gtpr_gt   :: Bits 8   -- Guard time value
  , uart_gtpr_psc  :: Bits 8   -- Prescaler value
  }
|]

