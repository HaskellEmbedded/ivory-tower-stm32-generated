{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}

module Ivory.BSP.STM32.Peripheral.SPIv1.Regs where

import Ivory.Language
import Ivory.BSP.STM32.Peripheral.SPI.RegTypes

-- SPI Serial peripheral interface

-- Base address: 0x40013000

-- control register 1
--  | offset : 0x0
--  | address: 0x40013000
[ivory|
 bitdata SPI_CR1 :: Bits 32 = spi_cr1
  { _               :: Bits 16  -- (Reserved)
  , spi_cr1_bidimode  :: Bit      -- Bidirectional data mode enable
  , spi_cr1_bidioe    :: Bit      -- Output enable in bidirectional mode
  , spi_cr1_crcen     :: Bit      -- Hardware CRC calculation enable
  , spi_cr1_crcnext   :: Bit      -- CRC transfer next
  , spi_cr1_dff       :: Bit      -- Data frame format
  , spi_cr1_rxonly    :: Bit      -- Receive only
  , spi_cr1_ssm       :: Bit      -- Software slave management
  , spi_cr1_ssi       :: Bit      -- Internal slave select
  , spi_cr1_lsbfirst  :: Bit      -- Frame format
  , spi_cr1_spe       :: Bit      -- SPI enable
  , spi_cr1_br        :: SPIBaud  -- Baud rate control
  , spi_cr1_mstr      :: Bit      -- Master selection
  , spi_cr1_cpol      :: Bit      -- Clock polarity
  , spi_cr1_cpha      :: Bit      -- Clock phase
  }
|]


-- control register 2
--  | offset : 0x4
--  | address: 0x40013004
[ivory|
 bitdata SPI_CR2 :: Bits 32 = spi_cr2
  { _              :: Bits 24  -- (Reserved)
  , spi_cr2_txeie    :: Bit      -- Tx buffer empty interrupt enable
  , spi_cr2_rxneie   :: Bit      -- RX buffer not empty interrupt enable
  , spi_cr2_errie    :: Bit      -- Error interrupt enable
  , _              :: Bits 2   -- (Reserved)
  , spi_cr2_ssoe     :: Bit      -- SS output enable
  , spi_cr2_txdmaen  :: Bit      -- Tx buffer DMA enable
  , spi_cr2_rxdmaen  :: Bit      -- Rx buffer DMA enable
  }
|]


-- status register
--  | offset : 0x8
--  | address: 0x40013008
[ivory|
 bitdata SPI_SR :: Bits 32 = spi_sr
  { _            :: Bits 24  -- (Reserved)
  , spi_sr_bsy     :: Bit      -- Busy flag
  , spi_sr_ovr     :: Bit      -- Overrun flag
  , spi_sr_modf    :: Bit      -- Mode fault
  , spi_sr_crcerr  :: Bit      -- CRC error flag
  , _            :: Bits 2   -- (Reserved)
  , spi_sr_txe     :: Bit      -- Transmit buffer empty
  , spi_sr_rxne    :: Bit      -- Receive buffer not empty
  }
|]


-- data register
--  | offset : 0xc
--  | address: 0x4001300c
[ivory|
 bitdata SPI_DR :: Bits 8 = spi_dr
  { spi_dr_dr  :: Bits 8   -- Data register
  }
|]


-- CRC polynomial register
--  | offset : 0x10
--  | address: 0x40013010
[ivory|
 bitdata SPI_CRCPR :: Bits 32 = spi_crcpr
  { _                :: Bits 16  -- (Reserved)
  , spi_crcpr_crcpoly  :: Bits 16  -- CRC polynomial register
  }
|]


-- RX CRC register
--  | offset : 0x14
--  | address: 0x40013014
[ivory|
 bitdata SPI_RXCRCR :: Bits 32 = spi_rxcrcr
  { _               :: Bits 16  -- (Reserved)
  , spi_rxcrcr_rxcrc  :: Bits 16  -- Rx CRC register
  }
|]


-- TX CRC register
--  | offset : 0x18
--  | address: 0x40013018
[ivory|
 bitdata SPI_TXCRCR :: Bits 32 = spi_txcrcr
  { _               :: Bits 16  -- (Reserved)
  , spi_txcrcr_txcrc  :: Bits 16  -- Tx CRC register
  }
|]


-- DR register with 16 bit DR field
--  | offset : 0xc
--  | address: 0x4001300c
[ivory|
 bitdata SPI_DR16 :: Bits 32 = spi_dr16
  { _          :: Bits 16  -- (Reserved)
  , spi_dr16_dr  :: Bits 16  -- Data register
  }
|]

