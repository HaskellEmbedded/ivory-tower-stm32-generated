{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32.Peripheral.EXTIv2.Regs where

import Ivory.Language
import Ivory.BSP.STM32.Peripheral.EXTI.RegTypes

-- EXTI External interrupt/event controller

-- Base address: 0x40021800

-- EXTI rising trigger selection register
--  | offset : 0x0
--  | address: 0x40021800
[ivory|
 bitdata EXTI_RTSR1 :: Bits 32 = exti_rtsr1
  { exti_rtsr1_data  :: Bits 32  -- Data
  }
|]


-- EXTI falling trigger selection register
--  | offset : 0x4
--  | address: 0x40021804
[ivory|
 bitdata EXTI_FTSR1 :: Bits 32 = exti_ftsr1
  { exti_ftsr1_data  :: Bits 32  -- Data
  }
|]


-- EXTI software interrupt event register
--  | offset : 0x8
--  | address: 0x40021808
[ivory|
 bitdata EXTI_SWIER1 :: Bits 32 = exti_swier1
  { exti_swier1_data  :: Bits 32  -- Data
  }
|]


-- EXTI rising edge pending register
--  | offset : 0xc
--  | address: 0x4002180c
[ivory|
 bitdata EXTI_RPR1 :: Bits 32 = exti_rpr1
  { exti_rpr1_data  :: Bits 32  -- Data
  }
|]


-- EXTI falling edge pending register
--  | offset : 0x10
--  | address: 0x40021810
[ivory|
 bitdata EXTI_FPR1 :: Bits 32 = exti_fpr1
  { exti_fpr1_data  :: Bits 32  -- Data
  }
|]


-- EXTI external interrupt selection register
--  | offset : 0x60
--  | address: 0x40021860
[ivory|
 bitdata EXTI_EXTICR1 :: Bits 32 = exti_exticr1
  { exti_exticr1_data  :: Bits 32  -- Data
  }
|]


-- EXTI external interrupt selection register
--  | offset : 0x64
--  | address: 0x40021864
[ivory|
 bitdata EXTI_EXTICR2 :: Bits 32 = exti_exticr2
  { exti_exticr2_data  :: Bits 32  -- Data
  }
|]


-- EXTI external interrupt selection register
--  | offset : 0x68
--  | address: 0x40021868
[ivory|
 bitdata EXTI_EXTICR3 :: Bits 32 = exti_exticr3
  { exti_exticr3_data  :: Bits 32  -- Data
  }
|]


-- EXTI external interrupt selection register
--  | offset : 0x6c
--  | address: 0x4002186c
[ivory|
 bitdata EXTI_EXTICR4 :: Bits 32 = exti_exticr4
  { exti_exticr4_data  :: Bits 32  -- Data
  }
|]


-- EXTI CPU wakeup with interrupt mask register
--  | offset : 0x80
--  | address: 0x40021880
[ivory|
 bitdata EXTI_IMR1 :: Bits 32 = exti_imr1
  { exti_imr1_data  :: Bits 32  -- Data
  }
|]


-- EXTI CPU wakeup with event mask register
--  | offset : 0x84
--  | address: 0x40021884
[ivory|
 bitdata EXTI_EMR1 :: Bits 32 = exti_emr1
  { exti_emr1_data  :: Bits 32  -- Data
  }
|]

