{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32.Peripheral.I2Cv1.Regs where

import Ivory.Language
import Ivory.BSP.STM32.Peripheral.I2C.RegTypes

-- I2C Inter integrated circuit

-- Base address: 0x40005400

-- Control register 1
--  | offset : 0x0
--  | address: 0x40005400
[ivory|
 bitdata I2C_CR1 :: Bits 32 = i2c_cr1
  { _                :: Bits 16  -- (Reserved)
  , i2c_cr1_swrst      :: Bit      -- Software reset
  , _                :: Bit      -- (Reserved)
  , i2c_cr1_alert      :: Bit      -- SMBus alert
  , i2c_cr1_pec        :: Bit      -- Packet error checking
  , i2c_cr1_pos        :: Bit      -- Acknowledge/PEC Position (for data reception)
  , i2c_cr1_ack        :: Bit      -- Acknowledge enable
  , i2c_cr1_stop       :: Bit      -- Stop generation
  , i2c_cr1_start      :: Bit      -- Start generation
  , i2c_cr1_nostretch  :: Bit      -- Clock stretching disable (Slave mode)
  , i2c_cr1_engc       :: Bit      -- General call enable
  , i2c_cr1_enpec      :: Bit      -- PEC enable
  , i2c_cr1_enarp      :: Bit      -- ARP enable
  , i2c_cr1_smbtype    :: Bit      -- SMBus type
  , _                :: Bit      -- (Reserved)
  , i2c_cr1_smbus      :: Bit      -- SMBus mode
  , i2c_cr1_pe         :: Bit      -- Peripheral enable
  }
|]


-- Control register 2
--  | offset : 0x4
--  | address: 0x40005404
[ivory|
 bitdata I2C_CR2 :: Bits 32 = i2c_cr2
  { _              :: Bits 19  -- (Reserved)
  , i2c_cr2_last     :: Bit      -- DMA last transfer
  , i2c_cr2_dmaen    :: Bit      -- DMA requests enable
  , i2c_cr2_itbufen  :: Bit      -- Buffer interrupt enable
  , i2c_cr2_itevten  :: Bit      -- Event interrupt enable
  , i2c_cr2_iterren  :: Bit      -- Error interrupt enable
  , _              :: Bits 2   -- (Reserved)
  , i2c_cr2_freq     :: Bits 6   -- Peripheral clock frequency
  }
|]


-- Own address register 1
--  | offset : 0x8
--  | address: 0x40005408
[ivory|
 bitdata I2C_OAR1 :: Bits 32 = i2c_oar1
  { _               :: Bits 16  -- (Reserved)
  , i2c_oar1_addmode  :: Bit      -- Addressing mode (slave mode)
  , _               :: Bits 5   -- (Reserved)
  , i2c_oar1_add10    :: Bits 2   -- Interface address
  , i2c_oar1_add7     :: Bits 7   -- Interface address
  , i2c_oar1_add0     :: Bit      -- Interface address
  }
|]


-- Own address register 2
--  | offset : 0xc
--  | address: 0x4000540c
[ivory|
 bitdata I2C_OAR2 :: Bits 32 = i2c_oar2
  { _              :: Bits 24  -- (Reserved)
  , i2c_oar2_add2    :: Bits 7   -- Interface address
  , i2c_oar2_endual  :: Bit      -- Dual addressing mode enable
  }
|]


-- Data register
--  | offset : 0x10
--  | address: 0x40005410
[ivory|
 bitdata I2C_DR :: Bits 32 = i2c_dr
  { _        :: Bits 24  -- (Reserved)
  , i2c_dr_dr  :: Bits 8   -- 8-bit data register
  }
|]


-- Status register 1
--  | offset : 0x14
--  | address: 0x40005414
[ivory|
 bitdata I2C_SR1 :: Bits 32 = i2c_sr1
  { _               :: Bits 16  -- (Reserved)
  , i2c_sr1_smbalert  :: Bit      -- SMBus alert
  , i2c_sr1_timeout   :: Bit      -- Timeout or Tlow error
  , _               :: Bit      -- (Reserved)
  , i2c_sr1_pecerr    :: Bit      -- PEC Error in reception
  , i2c_sr1_ovr       :: Bit      -- Overrun/Underrun
  , i2c_sr1_af        :: Bit      -- Acknowledge failure
  , i2c_sr1_arlo      :: Bit      -- Arbitration lost (master mode)
  , i2c_sr1_berr      :: Bit      -- Bus error
  , i2c_sr1_txe       :: Bit      -- Data register empty (transmitters)
  , i2c_sr1_rxne      :: Bit      -- Data register not empty (receivers)
  , _               :: Bit      -- (Reserved)
  , i2c_sr1_stopf     :: Bit      -- Stop detection (slave mode)
  , i2c_sr1_add10     :: Bit      -- 10-bit header sent (Master mode)
  , i2c_sr1_btf       :: Bit      -- Byte transfer finished
  , i2c_sr1_addr      :: Bit      -- Address sent (master mode)/matched (slave mode)
  , i2c_sr1_sb        :: Bit      -- Start bit (Master mode)
  }
|]


-- Status register 2
--  | offset : 0x18
--  | address: 0x40005418
[ivory|
 bitdata I2C_SR2 :: Bits 32 = i2c_sr2
  { _                 :: Bits 16  -- (Reserved)
  , i2c_sr2_pec         :: Bits 8   -- acket error checking register
  , i2c_sr2_dualf       :: Bit      -- Dual flag (Slave mode)
  , i2c_sr2_smbhost     :: Bit      -- SMBus host header (Slave mode)
  , i2c_sr2_smbdefault  :: Bit      -- SMBus device default address (Slave mode)
  , i2c_sr2_gencall     :: Bit      -- General call address (Slave mode)
  , _                 :: Bit      -- (Reserved)
  , i2c_sr2_tra         :: Bit      -- Transmitter/receiver
  , i2c_sr2_busy        :: Bit      -- Bus busy
  , i2c_sr2_msl         :: Bit      -- Master/slave
  }
|]


-- Clock control register
--  | offset : 0x1c
--  | address: 0x4000541c
[ivory|
 bitdata I2C_CCR :: Bits 32 = i2c_ccr
  { _           :: Bits 16  -- (Reserved)
  , i2c_ccr_f_s   :: Bit      -- I2C master mode selection
  , i2c_ccr_duty  :: Bit      -- Fast mode duty cycle
  , _           :: Bits 2   -- (Reserved)
  , i2c_ccr_ccr   :: Bits 12  -- Clock control register in Fast/Standard mode (Master mode)
  }
|]


-- TRISE register
--  | offset : 0x20
--  | address: 0x40005420
[ivory|
 bitdata I2C_TRISE :: Bits 32 = i2c_trise
  { _              :: Bits 26  -- (Reserved)
  , i2c_trise_trise  :: Bits 6   -- Maximum rise time in Fast/Standard mode (Master mode)
  }
|]

