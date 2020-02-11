module Ivory.BSP.STM32G081.LPUART (
    lpuart1
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32G081.AF
import Ivory.BSP.STM32G081.RCC
import Ivory.BSP.STM32G081.MemoryMap
import qualified Ivory.BSP.STM32G081.Interrupt as G081

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.UART

lpuart1 :: UART
lpuart1 = mkUARTVersion V3 lpuart1_periph_base
                rccenable rccdisable
                G081.USART3_USART4_LPUART1
                PClk1
                (\pin -> findAFByPin pin "lpuart1" afDB)
                "lpuart1"
  where
  rccenable  = modifyReg rcc_reg_apbenr1 $ setBit   rcc_apbenr1_lpuart1en
  rccdisable = modifyReg rcc_reg_apbenr1 $ clearBit rcc_apbenr1_lpuart1en

