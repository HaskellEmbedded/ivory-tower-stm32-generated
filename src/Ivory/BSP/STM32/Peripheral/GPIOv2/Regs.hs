{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32.Peripheral.GPIOv2.Regs where

import Ivory.Language
import Ivory.BSP.STM32.Peripheral.GPIOv2.RegTypes

-- GPIO General-purpose I/Os

-- Base address: 0x40020000

-- GPIO port mode register
--  | offset : 0x0
--  | address: 0x40020000
[ivory|
 bitdata GPIO_MODER :: Bits 32 = gpio_moder
  { gpio_moder_moder15  :: GPIO_Mode  -- Port x configuration pin 15
  , gpio_moder_moder14  :: GPIO_Mode  -- Port x configuration pin 14
  , gpio_moder_moder13  :: GPIO_Mode  -- Port x configuration pin 13
  , gpio_moder_moder12  :: GPIO_Mode  -- Port x configuration pin 12
  , gpio_moder_moder11  :: GPIO_Mode  -- Port x configuration pin 11
  , gpio_moder_moder10  :: GPIO_Mode  -- Port x configuration pin 10
  , gpio_moder_moder9   :: GPIO_Mode  -- Port x configuration pin 9
  , gpio_moder_moder8   :: GPIO_Mode  -- Port x configuration pin 8
  , gpio_moder_moder7   :: GPIO_Mode  -- Port x configuration pin 7
  , gpio_moder_moder6   :: GPIO_Mode  -- Port x configuration pin 6
  , gpio_moder_moder5   :: GPIO_Mode  -- Port x configuration pin 5
  , gpio_moder_moder4   :: GPIO_Mode  -- Port x configuration pin 4
  , gpio_moder_moder3   :: GPIO_Mode  -- Port x configuration pin 3
  , gpio_moder_moder2   :: GPIO_Mode  -- Port x configuration pin 2
  , gpio_moder_moder1   :: GPIO_Mode  -- Port x configuration pin 1
  , gpio_moder_moder0   :: GPIO_Mode  -- Port x configuration pin 0
  }
|]


-- GPIO port output type register
--  | offset : 0x4
--  | address: 0x40020004
[ivory|
 bitdata GPIO_OTYPER :: Bits 32 = gpio_otyper
  { _               :: Bits 16  -- (Reserved)
  , gpio_otyper_ot15  :: GPIO_OutputType  -- Port x configuration pin 15
  , gpio_otyper_ot14  :: GPIO_OutputType  -- Port x configuration pin 14
  , gpio_otyper_ot13  :: GPIO_OutputType  -- Port x configuration pin 13
  , gpio_otyper_ot12  :: GPIO_OutputType  -- Port x configuration pin 12
  , gpio_otyper_ot11  :: GPIO_OutputType  -- Port x configuration pin 11
  , gpio_otyper_ot10  :: GPIO_OutputType  -- Port x configuration pin 10
  , gpio_otyper_ot9   :: GPIO_OutputType  -- Port x configuration pin 9
  , gpio_otyper_ot8   :: GPIO_OutputType  -- Port x configuration pin 8
  , gpio_otyper_ot7   :: GPIO_OutputType  -- Port x configuration pin 7
  , gpio_otyper_ot6   :: GPIO_OutputType  -- Port x configuration pin 6
  , gpio_otyper_ot5   :: GPIO_OutputType  -- Port x configuration pin 5
  , gpio_otyper_ot4   :: GPIO_OutputType  -- Port x configuration pin 4
  , gpio_otyper_ot3   :: GPIO_OutputType  -- Port x configuration pin 3
  , gpio_otyper_ot2   :: GPIO_OutputType  -- Port x configuration pin 2
  , gpio_otyper_ot1   :: GPIO_OutputType  -- Port x configuration pin 1
  , gpio_otyper_ot0   :: GPIO_OutputType  -- Port x configuration pin 0
  }
|]


-- GPIO port output speed register
--  | offset : 0x8
--  | address: 0x40020008
[ivory|
 bitdata GPIO_OSPEEDR :: Bits 32 = gpio_ospeedr
  { gpio_ospeedr_ospeedr15  :: GPIO_Speed  -- Port x configuration pin 15
  , gpio_ospeedr_ospeedr14  :: GPIO_Speed  -- Port x configuration pin 14
  , gpio_ospeedr_ospeedr13  :: GPIO_Speed  -- Port x configuration pin 13
  , gpio_ospeedr_ospeedr12  :: GPIO_Speed  -- Port x configuration pin 12
  , gpio_ospeedr_ospeedr11  :: GPIO_Speed  -- Port x configuration pin 11
  , gpio_ospeedr_ospeedr10  :: GPIO_Speed  -- Port x configuration pin 10
  , gpio_ospeedr_ospeedr9   :: GPIO_Speed  -- Port x configuration pin 9
  , gpio_ospeedr_ospeedr8   :: GPIO_Speed  -- Port x configuration pin 8
  , gpio_ospeedr_ospeedr7   :: GPIO_Speed  -- Port x configuration pin 7
  , gpio_ospeedr_ospeedr6   :: GPIO_Speed  -- Port x configuration pin 6
  , gpio_ospeedr_ospeedr5   :: GPIO_Speed  -- Port x configuration pin 5
  , gpio_ospeedr_ospeedr4   :: GPIO_Speed  -- Port x configuration pin 4
  , gpio_ospeedr_ospeedr3   :: GPIO_Speed  -- Port x configuration pin 3
  , gpio_ospeedr_ospeedr2   :: GPIO_Speed  -- Port x configuration pin 2
  , gpio_ospeedr_ospeedr1   :: GPIO_Speed  -- Port x configuration pin 1
  , gpio_ospeedr_ospeedr0   :: GPIO_Speed  -- Port x configuration pin 0
  }
|]


-- GPIO port pull-up/pull-down register
--  | offset : 0xc
--  | address: 0x4002000c
[ivory|
 bitdata GPIO_PUPDR :: Bits 32 = gpio_pupdr
  { gpio_pupdr_pupdr15  :: GPIO_PUPD  -- Port x configuration pin 15
  , gpio_pupdr_pupdr14  :: GPIO_PUPD  -- Port x configuration pin 14
  , gpio_pupdr_pupdr13  :: GPIO_PUPD  -- Port x configuration pin 13
  , gpio_pupdr_pupdr12  :: GPIO_PUPD  -- Port x configuration pin 12
  , gpio_pupdr_pupdr11  :: GPIO_PUPD  -- Port x configuration pin 11
  , gpio_pupdr_pupdr10  :: GPIO_PUPD  -- Port x configuration pin 10
  , gpio_pupdr_pupdr9   :: GPIO_PUPD  -- Port x configuration pin 9
  , gpio_pupdr_pupdr8   :: GPIO_PUPD  -- Port x configuration pin 8
  , gpio_pupdr_pupdr7   :: GPIO_PUPD  -- Port x configuration pin 7
  , gpio_pupdr_pupdr6   :: GPIO_PUPD  -- Port x configuration pin 6
  , gpio_pupdr_pupdr5   :: GPIO_PUPD  -- Port x configuration pin 5
  , gpio_pupdr_pupdr4   :: GPIO_PUPD  -- Port x configuration pin 4
  , gpio_pupdr_pupdr3   :: GPIO_PUPD  -- Port x configuration pin 3
  , gpio_pupdr_pupdr2   :: GPIO_PUPD  -- Port x configuration pin 2
  , gpio_pupdr_pupdr1   :: GPIO_PUPD  -- Port x configuration pin 1
  , gpio_pupdr_pupdr0   :: GPIO_PUPD  -- Port x configuration pin 0
  }
|]


-- GPIO port input data register
--  | offset : 0x10
--  | address: 0x40020010
[ivory|
 bitdata GPIO_IDR :: Bits 32 = gpio_idr
  { _             :: Bits 16  -- (Reserved)
  , gpio_idr_idr15  :: Bit      -- Port input data pin 15
  , gpio_idr_idr14  :: Bit      -- Port input data pin 14
  , gpio_idr_idr13  :: Bit      -- Port input data pin 13
  , gpio_idr_idr12  :: Bit      -- Port input data pin 12
  , gpio_idr_idr11  :: Bit      -- Port input data pin 11
  , gpio_idr_idr10  :: Bit      -- Port input data pin 10
  , gpio_idr_idr9   :: Bit      -- Port input data pin 9
  , gpio_idr_idr8   :: Bit      -- Port input data pin 8
  , gpio_idr_idr7   :: Bit      -- Port input data pin 7
  , gpio_idr_idr6   :: Bit      -- Port input data pin 6
  , gpio_idr_idr5   :: Bit      -- Port input data pin 5
  , gpio_idr_idr4   :: Bit      -- Port input data pin 4
  , gpio_idr_idr3   :: Bit      -- Port input data pin 3
  , gpio_idr_idr2   :: Bit      -- Port input data pin 2
  , gpio_idr_idr1   :: Bit      -- Port input data pin 1
  , gpio_idr_idr0   :: Bit      -- Port input data pin 0
  }
|]


-- GPIO port output data register
--  | offset : 0x14
--  | address: 0x40020014
[ivory|
 bitdata GPIO_ODR :: Bits 32 = gpio_odr
  { _             :: Bits 16  -- (Reserved)
  , gpio_odr_odr15  :: Bit      -- Port output data pin 15
  , gpio_odr_odr14  :: Bit      -- Port output data pin 14
  , gpio_odr_odr13  :: Bit      -- Port output data pin 13
  , gpio_odr_odr12  :: Bit      -- Port output data pin 12
  , gpio_odr_odr11  :: Bit      -- Port output data pin 11
  , gpio_odr_odr10  :: Bit      -- Port output data pin 10
  , gpio_odr_odr9   :: Bit      -- Port output data pin 9
  , gpio_odr_odr8   :: Bit      -- Port output data pin 8
  , gpio_odr_odr7   :: Bit      -- Port output data pin 7
  , gpio_odr_odr6   :: Bit      -- Port output data pin 6
  , gpio_odr_odr5   :: Bit      -- Port output data pin 5
  , gpio_odr_odr4   :: Bit      -- Port output data pin 4
  , gpio_odr_odr3   :: Bit      -- Port output data pin 3
  , gpio_odr_odr2   :: Bit      -- Port output data pin 2
  , gpio_odr_odr1   :: Bit      -- Port output data pin 1
  , gpio_odr_odr0   :: Bit      -- Port output data pin 0
  }
|]


-- GPIO port bit set/reset register
--  | offset : 0x18
--  | address: 0x40020018
[ivory|
 bitdata GPIO_BSRR :: Bits 32 = gpio_bsrr
  { gpio_bsrr_br15  :: Bit      -- Port x reset pin 15
  , gpio_bsrr_br14  :: Bit      -- Port x reset pin 14
  , gpio_bsrr_br13  :: Bit      -- Port x reset pin 13
  , gpio_bsrr_br12  :: Bit      -- Port x reset pin 12
  , gpio_bsrr_br11  :: Bit      -- Port x reset pin 11
  , gpio_bsrr_br10  :: Bit      -- Port x reset pin 10
  , gpio_bsrr_br9   :: Bit      -- Port x reset pin 9
  , gpio_bsrr_br8   :: Bit      -- Port x reset pin 8
  , gpio_bsrr_br7   :: Bit      -- Port x reset pin 7
  , gpio_bsrr_br6   :: Bit      -- Port x reset pin 6
  , gpio_bsrr_br5   :: Bit      -- Port x reset pin 5
  , gpio_bsrr_br4   :: Bit      -- Port x reset pin 4
  , gpio_bsrr_br3   :: Bit      -- Port x reset pin 3
  , gpio_bsrr_br2   :: Bit      -- Port x reset pin 2
  , gpio_bsrr_br1   :: Bit      -- Port x reset pin 1
  , gpio_bsrr_br0   :: Bit      -- Port x reset pin 0
  , gpio_bsrr_bs15  :: Bit      -- Port x set pin 15
  , gpio_bsrr_bs14  :: Bit      -- Port x set pin 14
  , gpio_bsrr_bs13  :: Bit      -- Port x set pin 13
  , gpio_bsrr_bs12  :: Bit      -- Port x set pin 12
  , gpio_bsrr_bs11  :: Bit      -- Port x set pin 11
  , gpio_bsrr_bs10  :: Bit      -- Port x set pin 10
  , gpio_bsrr_bs9   :: Bit      -- Port x set pin 9
  , gpio_bsrr_bs8   :: Bit      -- Port x set pin 8
  , gpio_bsrr_bs7   :: Bit      -- Port x set pin 7
  , gpio_bsrr_bs6   :: Bit      -- Port x set pin 6
  , gpio_bsrr_bs5   :: Bit      -- Port x set pin 5
  , gpio_bsrr_bs4   :: Bit      -- Port x set pin 4
  , gpio_bsrr_bs3   :: Bit      -- Port x set pin 3
  , gpio_bsrr_bs2   :: Bit      -- Port x set pin 2
  , gpio_bsrr_bs1   :: Bit      -- Port x set pin 1
  , gpio_bsrr_bs0   :: Bit      -- Port x set pin 0
  }
|]


-- GPIO port configuration lock register
--  | offset : 0x1c
--  | address: 0x4002001c
[ivory|
 bitdata GPIO_LCKR :: Bits 32 = gpio_lckr
  { _              :: Bits 15  -- (Reserved)
  , gpio_lckr_lckk   :: Bit      -- Port x lock bit y (y= 0..15)
  , gpio_lckr_lck15  :: Bit      -- Port x lock pin 15
  , gpio_lckr_lck14  :: Bit      -- Port x lock pin 14
  , gpio_lckr_lck13  :: Bit      -- Port x lock pin 13
  , gpio_lckr_lck12  :: Bit      -- Port x lock pin 12
  , gpio_lckr_lck11  :: Bit      -- Port x lock pin 11
  , gpio_lckr_lck10  :: Bit      -- Port x lock pin 10
  , gpio_lckr_lck9   :: Bit      -- Port x lock pin 9
  , gpio_lckr_lck8   :: Bit      -- Port x lock pin 8
  , gpio_lckr_lck7   :: Bit      -- Port x lock pin 7
  , gpio_lckr_lck6   :: Bit      -- Port x lock pin 6
  , gpio_lckr_lck5   :: Bit      -- Port x lock pin 5
  , gpio_lckr_lck4   :: Bit      -- Port x lock pin 4
  , gpio_lckr_lck3   :: Bit      -- Port x lock pin 3
  , gpio_lckr_lck2   :: Bit      -- Port x lock pin 2
  , gpio_lckr_lck1   :: Bit      -- Port x lock pin 1
  , gpio_lckr_lck0   :: Bit      -- Port x lock pin 0
  }
|]


-- GPIO alternate function low register
--  | offset : 0x20
--  | address: 0x40020020
[ivory|
 bitdata GPIO_AFRL :: Bits 32 = gpio_afrl
  { gpio_afrl_afrl7  :: GPIO_AF  -- Alternate function selection for port x bit y (y = 0..7)
  , gpio_afrl_afrl6  :: GPIO_AF  -- Alternate function selection for port x bit y (y = 0..7)
  , gpio_afrl_afrl5  :: GPIO_AF  -- Alternate function selection for port x bit y (y = 0..7)
  , gpio_afrl_afrl4  :: GPIO_AF  -- Alternate function selection for port x bit y (y = 0..7)
  , gpio_afrl_afrl3  :: GPIO_AF  -- Alternate function selection for port x bit y (y = 0..7)
  , gpio_afrl_afrl2  :: GPIO_AF  -- Alternate function selection for port x bit y (y = 0..7)
  , gpio_afrl_afrl1  :: GPIO_AF  -- Alternate function selection for port x bit y (y = 0..7)
  , gpio_afrl_afrl0  :: GPIO_AF  -- Alternate function selection for port x bit y (y = 0..7)
  }
|]


-- GPIO alternate function high register
--  | offset : 0x24
--  | address: 0x40020024
[ivory|
 bitdata GPIO_AFRH :: Bits 32 = gpio_afrh
  { gpio_afrh_afrh15  :: GPIO_AF  -- Alternate function selection for port x bit y (y = 8..15)
  , gpio_afrh_afrh14  :: GPIO_AF  -- Alternate function selection for port x bit y (y = 8..15)
  , gpio_afrh_afrh13  :: GPIO_AF  -- Alternate function selection for port x bit y (y = 8..15)
  , gpio_afrh_afrh12  :: GPIO_AF  -- Alternate function selection for port x bit y (y = 8..15)
  , gpio_afrh_afrh11  :: GPIO_AF  -- Alternate function selection for port x bit y (y = 8..15)
  , gpio_afrh_afrh10  :: GPIO_AF  -- Alternate function selection for port x bit y (y = 8..15)
  , gpio_afrh_afrh9   :: GPIO_AF  -- Alternate function selection for port x bit y (y = 8..15)
  , gpio_afrh_afrh8   :: GPIO_AF  -- Alternate function selection for port x bit y (y = 8..15)
  }
|]


-- GPIO port bit reset register
--  | offset : 0x28
--  | address: 0x40020028
[ivory|
 bitdata GPIO_BRR :: Bits 32 = gpio_brr
  { _            :: Bits 16  -- (Reserved)
  , gpio_brr_br15  :: Bit      -- Port x reset pin 15
  , gpio_brr_br14  :: Bit      -- Port x reset pin 14
  , gpio_brr_br13  :: Bit      -- Port x reset pin 13
  , gpio_brr_br12  :: Bit      -- Port x reset pin 12
  , gpio_brr_br11  :: Bit      -- Port x reset pin 11
  , gpio_brr_br10  :: Bit      -- Port x reset pin 10
  , gpio_brr_br9   :: Bit      -- Port x reset pin 9
  , gpio_brr_br8   :: Bit      -- Port x reset pin 8
  , gpio_brr_br7   :: Bit      -- Port x reset pin 7
  , gpio_brr_br6   :: Bit      -- Port x reset pin 6
  , gpio_brr_br5   :: Bit      -- Port x reset pin 5
  , gpio_brr_br4   :: Bit      -- Port x reset pin 4
  , gpio_brr_br3   :: Bit      -- Port x reset pin 3
  , gpio_brr_br2   :: Bit      -- Port x reset pin 2
  , gpio_brr_br1   :: Bit      -- Port x reset pin 1
  , gpio_brr_br0   :: Bit      -- Port x reset pin 0
  }
|]

