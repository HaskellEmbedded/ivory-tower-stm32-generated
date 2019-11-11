{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32.Peripheral.GPIOv1.Regs where

import Ivory.Language
import Ivory.BSP.STM32.Peripheral.GPIOv1.RegTypes

-- GPIO General purpose I/O

-- Base address: 0x40010800

-- Port configuration register low (GPIOn_CRL)
--  | offset : 0x0
--  | address: 0x40010800
[ivory|
 bitdata GPIO_CRL :: Bits 32 = gpio_crl
  { gpio_crl_cnf7   :: Bits 2   -- Port n.7 configuration bits
  , gpio_crl_mode7  :: GPIOF1_Mode  -- Port n.7 mode bits
  , gpio_crl_cnf6   :: Bits 2   -- Port n.6 configuration bits
  , gpio_crl_mode6  :: GPIOF1_Mode  -- Port n.6 mode bits
  , gpio_crl_cnf5   :: Bits 2   -- Port n.5 configuration bits
  , gpio_crl_mode5  :: GPIOF1_Mode  -- Port n.5 mode bits
  , gpio_crl_cnf4   :: Bits 2   -- Port n.4 configuration bits
  , gpio_crl_mode4  :: GPIOF1_Mode  -- Port n.4 mode bits
  , gpio_crl_cnf3   :: Bits 2   -- Port n.3 configuration bits
  , gpio_crl_mode3  :: GPIOF1_Mode  -- Port n.3 mode bits
  , gpio_crl_cnf2   :: Bits 2   -- Port n.2 configuration bits
  , gpio_crl_mode2  :: GPIOF1_Mode  -- Port n.2 mode bits
  , gpio_crl_cnf1   :: Bits 2   -- Port n.1 configuration bits
  , gpio_crl_mode1  :: GPIOF1_Mode  -- Port n.1 mode bits
  , gpio_crl_cnf0   :: Bits 2   -- Port n.0 configuration bits
  , gpio_crl_mode0  :: GPIOF1_Mode  -- Port n.0 mode bits
  }
|]


-- Port configuration register high (GPIOn_CRL)
--  | offset : 0x4
--  | address: 0x40010804
[ivory|
 bitdata GPIO_CRH :: Bits 32 = gpio_crh
  { gpio_crh_cnf15   :: Bits 2   -- Port n.15 configuration bits
  , gpio_crh_mode15  :: GPIOF1_Mode  -- Port n.15 mode bits
  , gpio_crh_cnf14   :: Bits 2   -- Port n.14 configuration bits
  , gpio_crh_mode14  :: GPIOF1_Mode  -- Port n.14 mode bits
  , gpio_crh_cnf13   :: Bits 2   -- Port n.13 configuration bits
  , gpio_crh_mode13  :: GPIOF1_Mode  -- Port n.13 mode bits
  , gpio_crh_cnf12   :: Bits 2   -- Port n.12 configuration bits
  , gpio_crh_mode12  :: GPIOF1_Mode  -- Port n.12 mode bits
  , gpio_crh_cnf11   :: Bits 2   -- Port n.11 configuration bits
  , gpio_crh_mode11  :: GPIOF1_Mode  -- Port n.11 mode bits
  , gpio_crh_cnf10   :: Bits 2   -- Port n.10 configuration bits
  , gpio_crh_mode10  :: GPIOF1_Mode  -- Port n.10 mode bits
  , gpio_crh_cnf9    :: Bits 2   -- Port n.9 configuration bits
  , gpio_crh_mode9   :: GPIOF1_Mode  -- Port n.9 mode bits
  , gpio_crh_cnf8    :: Bits 2   -- Port n.8 configuration bits
  , gpio_crh_mode8   :: GPIOF1_Mode  -- Port n.8 mode bits
  }
|]


-- Port input data register (GPIOn_IDR)
--  | offset : 0x8
--  | address: 0x40010808
[ivory|
 bitdata GPIO_IDR :: Bits 32 = gpio_idr
  { _             :: Bits 16  -- (Reserved)
  , gpio_idr_idr15  :: Bit      -- Port input data
  , gpio_idr_idr14  :: Bit      -- Port input data
  , gpio_idr_idr13  :: Bit      -- Port input data
  , gpio_idr_idr12  :: Bit      -- Port input data
  , gpio_idr_idr11  :: Bit      -- Port input data
  , gpio_idr_idr10  :: Bit      -- Port input data
  , gpio_idr_idr9   :: Bit      -- Port input data
  , gpio_idr_idr8   :: Bit      -- Port input data
  , gpio_idr_idr7   :: Bit      -- Port input data
  , gpio_idr_idr6   :: Bit      -- Port input data
  , gpio_idr_idr5   :: Bit      -- Port input data
  , gpio_idr_idr4   :: Bit      -- Port input data
  , gpio_idr_idr3   :: Bit      -- Port input data
  , gpio_idr_idr2   :: Bit      -- Port input data
  , gpio_idr_idr1   :: Bit      -- Port input data
  , gpio_idr_idr0   :: Bit      -- Port input data
  }
|]


-- Port output data register (GPIOn_ODR)
--  | offset : 0xc
--  | address: 0x4001080c
[ivory|
 bitdata GPIO_ODR :: Bits 32 = gpio_odr
  { _             :: Bits 16  -- (Reserved)
  , gpio_odr_odr15  :: Bit      -- Port output data
  , gpio_odr_odr14  :: Bit      -- Port output data
  , gpio_odr_odr13  :: Bit      -- Port output data
  , gpio_odr_odr12  :: Bit      -- Port output data
  , gpio_odr_odr11  :: Bit      -- Port output data
  , gpio_odr_odr10  :: Bit      -- Port output data
  , gpio_odr_odr9   :: Bit      -- Port output data
  , gpio_odr_odr8   :: Bit      -- Port output data
  , gpio_odr_odr7   :: Bit      -- Port output data
  , gpio_odr_odr6   :: Bit      -- Port output data
  , gpio_odr_odr5   :: Bit      -- Port output data
  , gpio_odr_odr4   :: Bit      -- Port output data
  , gpio_odr_odr3   :: Bit      -- Port output data
  , gpio_odr_odr2   :: Bit      -- Port output data
  , gpio_odr_odr1   :: Bit      -- Port output data
  , gpio_odr_odr0   :: Bit      -- Port output data
  }
|]


-- Port bit set/reset register (GPIOn_BSRR)
--  | offset : 0x10
--  | address: 0x40010810
[ivory|
 bitdata GPIO_BSRR :: Bits 32 = gpio_bsrr
  { gpio_bsrr_br15  :: Bit      -- Reset bit 15
  , gpio_bsrr_br14  :: Bit      -- Reset bit 14
  , gpio_bsrr_br13  :: Bit      -- Reset bit 13
  , gpio_bsrr_br12  :: Bit      -- Reset bit 12
  , gpio_bsrr_br11  :: Bit      -- Reset bit 11
  , gpio_bsrr_br10  :: Bit      -- Reset bit 10
  , gpio_bsrr_br9   :: Bit      -- Reset bit 9
  , gpio_bsrr_br8   :: Bit      -- Reset bit 8
  , gpio_bsrr_br7   :: Bit      -- Reset bit 7
  , gpio_bsrr_br6   :: Bit      -- Reset bit 6
  , gpio_bsrr_br5   :: Bit      -- Reset bit 5
  , gpio_bsrr_br4   :: Bit      -- Reset bit 4
  , gpio_bsrr_br3   :: Bit      -- Reset bit 3
  , gpio_bsrr_br2   :: Bit      -- Reset bit 2
  , gpio_bsrr_br1   :: Bit      -- Reset bit 1
  , gpio_bsrr_br0   :: Bit      -- Reset bit 0
  , gpio_bsrr_bs15  :: Bit      -- Set bit 15
  , gpio_bsrr_bs14  :: Bit      -- Set bit 14
  , gpio_bsrr_bs13  :: Bit      -- Set bit 13
  , gpio_bsrr_bs12  :: Bit      -- Set bit 12
  , gpio_bsrr_bs11  :: Bit      -- Set bit 11
  , gpio_bsrr_bs10  :: Bit      -- Set bit 10
  , gpio_bsrr_bs9   :: Bit      -- Set bit 9
  , gpio_bsrr_bs8   :: Bit      -- Set bit 8
  , gpio_bsrr_bs7   :: Bit      -- Set bit 7
  , gpio_bsrr_bs6   :: Bit      -- Set bit 6
  , gpio_bsrr_bs5   :: Bit      -- Set bit 5
  , gpio_bsrr_bs4   :: Bit      -- Set bit 4
  , gpio_bsrr_bs3   :: Bit      -- Set bit 3
  , gpio_bsrr_bs2   :: Bit      -- Set bit 1
  , gpio_bsrr_bs1   :: Bit      -- Set bit 1
  , gpio_bsrr_bs0   :: Bit      -- Set bit 0
  }
|]


-- Port bit reset register (GPIOn_BRR)
--  | offset : 0x14
--  | address: 0x40010814
[ivory|
 bitdata GPIO_BRR :: Bits 32 = gpio_brr
  { _            :: Bits 16  -- (Reserved)
  , gpio_brr_br15  :: Bit      -- Reset bit 15
  , gpio_brr_br14  :: Bit      -- Reset bit 14
  , gpio_brr_br13  :: Bit      -- Reset bit 13
  , gpio_brr_br12  :: Bit      -- Reset bit 12
  , gpio_brr_br11  :: Bit      -- Reset bit 11
  , gpio_brr_br10  :: Bit      -- Reset bit 10
  , gpio_brr_br9   :: Bit      -- Reset bit 9
  , gpio_brr_br8   :: Bit      -- Reset bit 8
  , gpio_brr_br7   :: Bit      -- Reset bit 7
  , gpio_brr_br6   :: Bit      -- Reset bit 6
  , gpio_brr_br5   :: Bit      -- Reset bit 5
  , gpio_brr_br4   :: Bit      -- Reset bit 4
  , gpio_brr_br3   :: Bit      -- Reset bit 3
  , gpio_brr_br2   :: Bit      -- Reset bit 1
  , gpio_brr_br1   :: Bit      -- Reset bit 1
  , gpio_brr_br0   :: Bit      -- Reset bit 0
  }
|]


-- Port configuration lock register
--  | offset : 0x18
--  | address: 0x40010818
[ivory|
 bitdata GPIO_LCKR :: Bits 32 = gpio_lckr
  { _              :: Bits 15  -- (Reserved)
  , gpio_lckr_lckk   :: Bit      -- Lock key
  , gpio_lckr_lck15  :: Bit      -- Port A Lock bit 15
  , gpio_lckr_lck14  :: Bit      -- Port A Lock bit 14
  , gpio_lckr_lck13  :: Bit      -- Port A Lock bit 13
  , gpio_lckr_lck12  :: Bit      -- Port A Lock bit 12
  , gpio_lckr_lck11  :: Bit      -- Port A Lock bit 11
  , gpio_lckr_lck10  :: Bit      -- Port A Lock bit 10
  , gpio_lckr_lck9   :: Bit      -- Port A Lock bit 9
  , gpio_lckr_lck8   :: Bit      -- Port A Lock bit 8
  , gpio_lckr_lck7   :: Bit      -- Port A Lock bit 7
  , gpio_lckr_lck6   :: Bit      -- Port A Lock bit 6
  , gpio_lckr_lck5   :: Bit      -- Port A Lock bit 5
  , gpio_lckr_lck4   :: Bit      -- Port A Lock bit 4
  , gpio_lckr_lck3   :: Bit      -- Port A Lock bit 3
  , gpio_lckr_lck2   :: Bit      -- Port A Lock bit 2
  , gpio_lckr_lck1   :: Bit      -- Port A Lock bit 1
  , gpio_lckr_lck0   :: Bit      -- Port A Lock bit 0
  }
|]

