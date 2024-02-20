module Ivory.BSP.STM32G0C1.LPUART (
    lpuart1
  , lpuart2
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32G0C1.AF
import Ivory.BSP.STM32G0C1.RCC
import Ivory.BSP.STM32G0C1.MemoryMap
import qualified Ivory.BSP.STM32G0C1.Interrupt as G0C1

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.UART

lpuart1 :: UART
lpuart1 = mkUARTVersion V3 lpuart1_periph_base
                rccenable rccdisable
                G0C1.USART3_USART4_USART5_USART6_LPUART1
                PClk1
                (\pin -> findAFByPin pin "lpuart1" afDB)
                "lpuart1"
  where
  rccenable  = modifyReg rcc_reg_apbenr1 $ setBit   rcc_apbenr1_lpuart1en
  rccdisable = modifyReg rcc_reg_apbenr1 $ clearBit rcc_apbenr1_lpuart1en

lpuart2 :: UART
lpuart2 = mkUARTVersion V3 lpuart2_periph_base
                rccenable rccdisable
                G0C1.USART2_LPUART2
                PClk1
                (\pin -> findAFByPin pin "lpuart2" afDB)
                "lpuart2"
  where
  rccenable  = modifyReg rcc_reg_apbenr1 $ setBit   rcc_apbenr1_lpuart2en
  rccdisable = modifyReg rcc_reg_apbenr1 $ clearBit rcc_apbenr1_lpuart2en

