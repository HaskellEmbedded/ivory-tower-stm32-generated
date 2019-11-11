{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32.Peripheral.I2Cv2.Regs where

import Ivory.Language
import Ivory.BSP.STM32.Peripheral.I2C.RegTypes

-- I2C Inter-integrated circuit

-- Base address: 0x40005400

-- Control register 1
--  | offset : 0x0
--  | address: 0x40005400
[ivory|
 bitdata I2C_CR1 :: Bits 32 = i2c_cr1
  { _                :: Bits 8   -- (Reserved)
  , i2c_cr1_pecen      :: Bit      -- PEC enable
  , i2c_cr1_alerten    :: Bit      -- SMBUS alert enable
  , i2c_cr1_smbden     :: Bit      -- SMBus Device Default address enable
  , i2c_cr1_smbhen     :: Bit      -- SMBus Host address enable
  , i2c_cr1_gcen       :: Bit      -- General call enable
  , i2c_cr1_wupen      :: Bit      -- Wakeup from STOP enable
  , i2c_cr1_nostretch  :: Bit      -- Clock stretching disable
  , i2c_cr1_sbc        :: Bit      -- Slave byte control
  , i2c_cr1_rxdmaen    :: Bit      -- DMA reception requests enable
  , i2c_cr1_txdmaen    :: Bit      -- DMA transmission requests enable
  , i2c_cr1_swrst      :: Bit      -- Software reset
  , i2c_cr1_anfoff     :: Bit      -- Analog noise filter OFF
  , i2c_cr1_dnf        :: Bits 4   -- Digital noise filter
  , i2c_cr1_errie      :: Bit      -- Error interrupts enable
  , i2c_cr1_tcie       :: Bit      -- Transfer Complete interrupt enable
  , i2c_cr1_stopie     :: Bit      -- STOP detection Interrupt enable
  , i2c_cr1_nackie     :: Bit      -- Not acknowledge received interrupt enable
  , i2c_cr1_addrie     :: Bit      -- Address match interrupt enable (slave only)
  , i2c_cr1_rxie       :: Bit      -- RX Interrupt enable
  , i2c_cr1_txie       :: Bit      -- TX Interrupt enable
  , i2c_cr1_pe         :: Bit      -- Peripheral enable
  }
|]


-- Control register 2
--  | offset : 0x4
--  | address: 0x40005404
[ivory|
 bitdata I2C_CR2 :: Bits 32 = i2c_cr2
  { _              :: Bits 5   -- (Reserved)
  , i2c_cr2_pecbyte  :: Bit      -- Packet error checking byte
  , i2c_cr2_autoend  :: Bit      -- Automatic end mode (master mode)
  , i2c_cr2_reload   :: Bit      -- NBYTES reload mode
  , i2c_cr2_nbytes   :: Bits 8   -- Number of bytes
  , i2c_cr2_nack     :: Bit      -- NACK generation (slave mode)
  , i2c_cr2_stop     :: Bit      -- Stop generation (master mode)
  , i2c_cr2_start    :: Bit      -- Start generation
  , i2c_cr2_head10r  :: Bit      -- 10-bit address header only read direction (master receiver mode)
  , i2c_cr2_add10    :: Bit      -- 10-bit addressing mode (master mode)
  , i2c_cr2_rd_wrn   :: Bit      -- Transfer direction (master mode)
  , i2c_cr2_sadd8    :: Bits 2   -- Slave address bit 9:8 (master mode)
  , i2c_cr2_sadd1    :: Bits 7   -- Slave address bit 7:1 (master mode)
  , i2c_cr2_sadd0    :: Bit      -- Slave address bit 0 (master mode)
  }
|]


-- Own address register 1
--  | offset : 0x8
--  | address: 0x40005408
[ivory|
 bitdata I2C_OAR1 :: Bits 32 = i2c_oar1
  { _               :: Bits 16  -- (Reserved)
  , i2c_oar1_oa1en    :: Bit      -- Own Address 1 enable
  , _               :: Bits 4   -- (Reserved)
  , i2c_oar1_oa1mode  :: Bit      -- Own Address 1 10-bit mode
  , i2c_oar1_oa1_8    :: Bits 2   -- Interface address
  , i2c_oar1_oa1_1    :: Bits 7   -- Interface address
  , i2c_oar1_oa1_0    :: Bit      -- Interface address
  }
|]


-- Own address register 2
--  | offset : 0xc
--  | address: 0x4000540c
[ivory|
 bitdata I2C_OAR2 :: Bits 32 = i2c_oar2
  { _              :: Bits 16  -- (Reserved)
  , i2c_oar2_oa2en   :: Bit      -- Own Address 2 enable
  , _              :: Bits 4   -- (Reserved)
  , i2c_oar2_oa2msk  :: Bits 3   -- Own Address 2 masks
  , i2c_oar2_oa2     :: Bits 7   -- Interface address
  , _              :: Bit      -- (Reserved)
  }
|]


-- Timing register
--  | offset : 0x10
--  | address: 0x40005410
[ivory|
 bitdata I2C_TIMINGR :: Bits 32 = i2c_timingr
  { i2c_timingr_presc   :: Bits 4   -- Timing prescaler
  , _                 :: Bits 4   -- (Reserved)
  , i2c_timingr_scldel  :: Bits 4   -- Data setup time
  , i2c_timingr_sdadel  :: Bits 4   -- Data hold time
  , i2c_timingr_sclh    :: Bits 8   -- SCL high period (master mode)
  , i2c_timingr_scll    :: Bits 8   -- SCL low period (master mode)
  }
|]


-- Status register 1
--  | offset : 0x14
--  | address: 0x40005414
[ivory|
 bitdata I2C_TIMEOUTR :: Bits 32 = i2c_timeoutr
  { i2c_timeoutr_texten    :: Bit      -- Extended clock timeout enable
  , _                    :: Bits 3   -- (Reserved)
  , i2c_timeoutr_timeoutb  :: Bits 12  -- Bus timeout B
  , i2c_timeoutr_timouten  :: Bit      -- Clock timeout enable
  , _                    :: Bits 2   -- (Reserved)
  , i2c_timeoutr_tidle     :: Bit      -- Idle clock timeout detection
  , i2c_timeoutr_timeouta  :: Bits 12  -- Bus timeout A
  }
|]


-- Interrupt and Status register
--  | offset : 0x18
--  | address: 0x40005418
[ivory|
 bitdata I2C_ISR :: Bits 32 = i2c_isr
  { _              :: Bits 8   -- (Reserved)
  , i2c_isr_addcode  :: Bits 7   -- Address match code (Slave mode)
  , i2c_isr_dir      :: Bit      -- Transfer direction (Slave mode)
  , i2c_isr_busy     :: Bit      -- Bus busy
  , _              :: Bit      -- (Reserved)
  , i2c_isr_alert    :: Bit      -- SMBus alert
  , i2c_isr_timeout  :: Bit      -- Timeout or t_low detection flag
  , i2c_isr_pecerr   :: Bit      -- PEC Error in reception
  , i2c_isr_ovr      :: Bit      -- Overrun/Underrun (slave mode)
  , i2c_isr_arlo     :: Bit      -- Arbitration lost
  , i2c_isr_berr     :: Bit      -- Bus error
  , i2c_isr_tcr      :: Bit      -- Transfer Complete Reload
  , i2c_isr_tc       :: Bit      -- Transfer Complete (master mode)
  , i2c_isr_stopf    :: Bit      -- Stop detection flag
  , i2c_isr_nackf    :: Bit      -- Not acknowledge received flag
  , i2c_isr_addr     :: Bit      -- Address matched (slave mode)
  , i2c_isr_rxne     :: Bit      -- Receive data register not empty (receivers)
  , i2c_isr_txis     :: Bit      -- Transmit interrupt status (transmitters)
  , i2c_isr_txe      :: Bit      -- Transmit data register empty (transmitters)
  }
|]


-- Interrupt clear register
--  | offset : 0x1c
--  | address: 0x4000541c
[ivory|
 bitdata I2C_ICR :: Bits 32 = i2c_icr
  { _               :: Bits 18  -- (Reserved)
  , i2c_icr_alertcf   :: Bit      -- Alert flag clear
  , i2c_icr_timoutcf  :: Bit      -- Timeout detection flag clear
  , i2c_icr_peccf     :: Bit      -- PEC Error flag clear
  , i2c_icr_ovrcf     :: Bit      -- Overrun/Underrun flag clear
  , i2c_icr_arlocf    :: Bit      -- Arbitration lost flag clear
  , i2c_icr_berrcf    :: Bit      -- Bus error flag clear
  , _               :: Bits 2   -- (Reserved)
  , i2c_icr_stopcf    :: Bit      -- Stop detection flag clear
  , i2c_icr_nackcf    :: Bit      -- Not Acknowledge flag clear
  , i2c_icr_addrcf    :: Bit      -- Address Matched flag clear
  , _               :: Bits 3   -- (Reserved)
  }
|]


-- PEC register
--  | offset : 0x20
--  | address: 0x40005420
[ivory|
 bitdata I2C_PECR :: Bits 32 = i2c_pecr
  { _           :: Bits 24  -- (Reserved)
  , i2c_pecr_pec  :: Bits 8   -- Packet error checking register
  }
|]


-- Receive data register
--  | offset : 0x24
--  | address: 0x40005424
[ivory|
 bitdata I2C_RXDR :: Bits 32 = i2c_rxdr
  { _              :: Bits 24  -- (Reserved)
  , i2c_rxdr_rxdata  :: Bits 8   -- 8-bit receive data
  }
|]


-- Transmit data register
--  | offset : 0x28
--  | address: 0x40005428
[ivory|
 bitdata I2C_TXDR :: Bits 32 = i2c_txdr
  { _              :: Bits 24  -- (Reserved)
  , i2c_txdr_txdata  :: Bits 8   -- 8-bit transmit data
  }
|]

