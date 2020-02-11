{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32.Peripheral.EXTIv1.Regs where

import Ivory.Language
import Ivory.BSP.STM32.Peripheral.EXTI.RegTypes

-- EXTI External interrupt/event controller

-- Base address: 0x40010400

-- Interrupt mask register (EXTI_IMR)
--  | offset : 0x0
--  | address: 0x40010400
[ivory|
 bitdata EXTI_IMR :: Bits 32 = exti_imr
  { exti_imr_data  :: Bits 32  -- Data
  }
|]


-- Event mask register (EXTI_EMR)
--  | offset : 0x4
--  | address: 0x40010404
[ivory|
 bitdata EXTI_EMR :: Bits 32 = exti_emr
  { exti_emr_data  :: Bits 32  -- Data
  }
|]


-- Rising Trigger selection register (EXTI_RTSR)
--  | offset : 0x8
--  | address: 0x40010408
[ivory|
 bitdata EXTI_RTSR :: Bits 32 = exti_rtsr
  { exti_rtsr_data  :: Bits 32  -- Data
  }
|]


-- Falling Trigger selection register (EXTI_FTSR)
--  | offset : 0xc
--  | address: 0x4001040c
[ivory|
 bitdata EXTI_FTSR :: Bits 32 = exti_ftsr
  { exti_ftsr_data  :: Bits 32  -- Data
  }
|]


-- Software interrupt event register (EXTI_SWIER)
--  | offset : 0x10
--  | address: 0x40010410
[ivory|
 bitdata EXTI_SWIER :: Bits 32 = exti_swier
  { exti_swier_data  :: Bits 32  -- Data
  }
|]


-- Pending register (EXTI_PR)
--  | offset : 0x14
--  | address: 0x40010414
[ivory|
 bitdata EXTI_PR :: Bits 32 = exti_pr
  { exti_pr_data  :: Bits 32  -- Data
  }
|]

