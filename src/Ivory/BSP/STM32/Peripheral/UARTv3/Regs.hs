{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32.Peripheral.UARTv3.Regs where

import Ivory.Language
import Ivory.BSP.STM32.Peripheral.UART.RegTypes

-- UART Universal synchronous asynchronous receiver transmitter

-- Base address: 0x40004800

-- Control register 1
--  | offset : 0x0
--  | address: 0x40004800
[ivory|
 bitdata UART_CR1 :: Bits 32 = uart_cr1
  { _              :: Bits 3   -- (Reserved)
  , uart_cr1_m1      :: UART_WordLen  -- Word length
  , uart_cr1_eobie   :: Bit      -- End of Block interrupt enable
  , uart_cr1_rtoie   :: Bit      -- Receiver timeout interrupt enable
  , uart_cr1_deat4   :: Bit      -- Driver Enable assertion time
  , uart_cr1_deat3   :: Bit      -- DEAT3
  , uart_cr1_deat2   :: Bit      -- DEAT2
  , uart_cr1_deat1   :: Bit      -- DEAT1
  , uart_cr1_deat0   :: Bit      -- DEAT0
  , uart_cr1_dedt4   :: Bit      -- Driver Enable de-assertion time
  , uart_cr1_dedt3   :: Bit      -- DEDT3
  , uart_cr1_dedt2   :: Bit      -- DEDT2
  , uart_cr1_dedt1   :: Bit      -- DEDT1
  , uart_cr1_dedt0   :: Bit      -- DEDT0
  , uart_cr1_over8   :: Bit      -- Oversampling mode
  , uart_cr1_cmie    :: Bit      -- Character match interrupt enable
  , uart_cr1_mme     :: Bit      -- Mute mode enable
  , uart_cr1_m0      :: UART_WordLen  -- Word length
  , uart_cr1_wake    :: Bit      -- Receiver wakeup method
  , uart_cr1_pce     :: Bit      -- Parity control enable
  , uart_cr1_ps      :: Bit      -- Parity selection
  , uart_cr1_peie    :: Bit      -- PE interrupt enable
  , uart_cr1_txeie   :: Bit      -- interrupt enable
  , uart_cr1_tcie    :: Bit      -- Transmission complete interrupt enable
  , uart_cr1_rxneie  :: Bit      -- RXNE interrupt enable
  , uart_cr1_idleie  :: Bit      -- IDLE interrupt enable
  , uart_cr1_te      :: Bit      -- Transmitter enable
  , uart_cr1_re      :: Bit      -- Receiver enable
  , _              :: Bit      -- (Reserved)
  , uart_cr1_ue      :: Bit      -- USART enable
  }
|]


-- Control register 2
--  | offset : 0x4
--  | address: 0x40004804
[ivory|
 bitdata UART_CR2 :: Bits 32 = uart_cr2
  { uart_cr2_add4_7    :: Bits 4   -- Address of the USART node
  , uart_cr2_add0_3    :: Bits 4   -- Address of the USART node
  , uart_cr2_rtoen     :: Bit      -- Receiver timeout enable
  , uart_cr2_abrmod1   :: Bit      -- Auto baud rate mode
  , uart_cr2_abrmod0   :: Bit      -- ABRMOD0
  , uart_cr2_abren     :: Bit      -- Auto baud rate enable
  , uart_cr2_msbfirst  :: Bit      -- Most significant bit first
  , uart_cr2_tainv     :: Bit      -- Binary data inversion
  , uart_cr2_txinv     :: Bit      -- TX pin active level inversion
  , uart_cr2_rxinv     :: Bit      -- RX pin active level inversion
  , uart_cr2_swap      :: Bit      -- Swap TX/RX pins
  , uart_cr2_linen     :: Bit      -- LIN mode enable
  , uart_cr2_stop      :: UART_StopBits  -- STOP bits
  , uart_cr2_clken     :: Bit      -- Clock enable
  , uart_cr2_cpol      :: Bit      -- Clock polarity
  , uart_cr2_cpha      :: Bit      -- Clock phase
  , uart_cr2_lbcl      :: Bit      -- Last bit clock pulse
  , _                :: Bit      -- (Reserved)
  , uart_cr2_lbdie     :: Bit      -- LIN break detection interrupt enable
  , uart_cr2_lbdl      :: Bit      -- LIN break detection length
  , uart_cr2_addm7     :: Bit      -- 7-bit Address Detection/4-bit Address Detection
  , _                :: Bits 4   -- (Reserved)
  }
|]


-- Control register 3
--  | offset : 0x8
--  | address: 0x40004808
[ivory|
 bitdata UART_CR3 :: Bits 32 = uart_cr3
  { _               :: Bits 7   -- (Reserved)
  , uart_cr3_tcbgtie  :: Bit      -- Transmission complete before guard time interrupt enable
  , _               :: Bits 4   -- (Reserved)
  , uart_cr3_scarcnt  :: Bits 3   -- Smartcard auto-retry count
  , _               :: Bit      -- (Reserved)
  , uart_cr3_dep      :: Bit      -- Driver enable polarity selection
  , uart_cr3_dem      :: Bit      -- Driver enable mode
  , uart_cr3_ddre     :: Bit      -- DMA Disable on Reception Error
  , uart_cr3_ovrdis   :: Bit      -- Overrun Disable
  , uart_cr3_onebit   :: Bit      -- One sample bit method enable
  , uart_cr3_ctsie    :: Bit      -- CTS interrupt enable
  , uart_cr3_ctse     :: Bit      -- CTS enable
  , uart_cr3_rtse     :: Bit      -- RTS enable
  , uart_cr3_dmat     :: Bit      -- DMA enable transmitter
  , uart_cr3_dmar     :: Bit      -- DMA enable receiver
  , uart_cr3_scen     :: Bit      -- Smartcard mode enable
  , uart_cr3_nack     :: Bit      -- Smartcard NACK enable
  , uart_cr3_hdsel    :: Bit      -- Half-duplex selection
  , uart_cr3_irlp     :: Bit      -- Ir low-power
  , uart_cr3_iren     :: Bit      -- Ir mode enable
  , uart_cr3_eie      :: Bit      -- Error interrupt enable
  }
|]


-- Baud rate register
--  | offset : 0xc
--  | address: 0x4000480c
[ivory|
 bitdata UART_BRR :: Bits 32 = uart_brr
  { _           :: Bits 12  -- (Reserved)
  , uart_brr_brr  :: Bits 20  -- brr divider
  }
|]


-- Guard time and prescaler register
--  | offset : 0x10
--  | address: 0x40004810
[ivory|
 bitdata UART_GTPR :: Bits 32 = uart_gtpr
  { _            :: Bits 16  -- (Reserved)
  , uart_gtpr_gt   :: Bits 8   -- Guard time value
  , uart_gtpr_psc  :: Bits 8   -- Prescaler value
  }
|]


-- Receiver timeout register
--  | offset : 0x14
--  | address: 0x40004814
[ivory|
 bitdata UART_RTOR :: Bits 32 = uart_rtor
  { uart_rtor_blen  :: Bits 8   -- Block Length
  , uart_rtor_rto   :: Bits 24  -- Receiver timeout value
  }
|]


-- Request register
--  | offset : 0x18
--  | address: 0x40004818
[ivory|
 bitdata UART_RQR :: Bits 32 = uart_rqr
  { _             :: Bits 27  -- (Reserved)
  , uart_rqr_txfrq  :: Bit      -- Transmit data flush request
  , uart_rqr_rxfrq  :: Bit      -- Receive data flush request
  , uart_rqr_mmrq   :: Bit      -- Mute mode request
  , uart_rqr_sbkrq  :: Bit      -- Send break request
  , uart_rqr_abrrq  :: Bit      -- Auto baud rate request
  }
|]


-- Interrupt & status register
--  | offset : 0x1c
--  | address: 0x4000481c
[ivory|
 bitdata UART_ISR :: Bits 32 = uart_isr
  { _             :: Bits 6   -- (Reserved)
  , uart_isr_tcbgt  :: Bit      -- Transmission complete before guard time completion
  , _             :: Bits 3   -- (Reserved)
  , uart_isr_teack  :: Bit      -- TEACK
  , _             :: Bits 2   -- (Reserved)
  , uart_isr_sbkf   :: Bit      -- SBKF
  , uart_isr_cmf    :: Bit      -- CMF
  , uart_isr_busy   :: Bit      -- BUSY
  , uart_isr_abrf   :: Bit      -- ABRF
  , uart_isr_abre   :: Bit      -- ABRE
  , _             :: Bit      -- (Reserved)
  , uart_isr_eobf   :: Bit      -- EOBF
  , uart_isr_rtof   :: Bit      -- RTOF
  , uart_isr_cts    :: Bit      -- CTS
  , uart_isr_ctsif  :: Bit      -- CTSIF
  , uart_isr_lbdf   :: Bit      -- LBDF
  , uart_isr_txe    :: Bit      -- TXE
  , uart_isr_tc     :: Bit      -- TC
  , uart_isr_rxne   :: Bit      -- RXNE
  , uart_isr_idle   :: Bit      -- IDLE
  , uart_isr_ore    :: Bit      -- ORE
  , uart_isr_nf     :: Bit      -- NF
  , uart_isr_fe     :: Bit      -- FE
  , uart_isr_pe     :: Bit      -- PE
  }
|]


-- Interrupt flag clear register
--  | offset : 0x20
--  | address: 0x40004820
[ivory|
 bitdata UART_ICR :: Bits 32 = uart_icr
  { _               :: Bits 14  -- (Reserved)
  , uart_icr_cmcf     :: Bit      -- Character match clear flag
  , _               :: Bits 4   -- (Reserved)
  , uart_icr_eobcf    :: Bit      -- End of block clear flag
  , uart_icr_rtocf    :: Bit      -- Receiver timeout clear flag
  , _               :: Bit      -- (Reserved)
  , uart_icr_ctscf    :: Bit      -- CTS clear flag
  , uart_icr_lbdcf    :: Bit      -- LIN break detection clear flag
  , uart_icr_tcbgtcf  :: Bit      -- Transmission completed before guard time clear flag
  , uart_icr_tccf     :: Bit      -- Transmission complete clear flag
  , _               :: Bit      -- (Reserved)
  , uart_icr_idlecf   :: Bit      -- Idle line detected clear flag
  , uart_icr_orecf    :: Bit      -- Overrun error clear flag
  , uart_icr_ncf      :: Bit      -- Noise detected clear flag
  , uart_icr_fecf     :: Bit      -- Framing error clear flag
  , uart_icr_pecf     :: Bit      -- Parity error clear flag
  }
|]


-- Receive data register
--  | offset : 0x24
--  | address: 0x40004824
[ivory|
 bitdata UART_RDR :: Bits 32 = uart_rdr
  { _           :: Bits 24  -- (Reserved)
  , uart_rdr_rdr  :: Bits 8   -- Receive data value
  }
|]


-- Transmit data register
--  | offset : 0x28
--  | address: 0x40004828
[ivory|
 bitdata UART_TDR :: Bits 32 = uart_tdr
  { _           :: Bits 24  -- (Reserved)
  , uart_tdr_tdr  :: Bits 8   -- Transmit data value
  }
|]

