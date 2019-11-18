module Ivory.BSP.STM32G081.USART (
    usart1
  , usart2
  , usart3
  , usart4
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

usart1 :: UART
usart1 = mkUARTVersion V3 usart1_periph_base
                rccenable rccdisable
                G081.USART1
                PClk1
                (\pin -> findAFByPin pin "usart1" afDB)
                "usart1"
  where
  rccenable  = modifyReg rcc_reg_apbenr2 $ setBit   rcc_apbenr2_usart1en
  rccdisable = modifyReg rcc_reg_apbenr2 $ clearBit rcc_apbenr2_usart1en

usart2 :: UART
usart2 = mkUARTVersion V3 usart2_periph_base
                rccenable rccdisable
                G081.USART2
                PClk1
                (\pin -> findAFByPin pin "usart2" afDB)
                "usart2"
  where
  rccenable  = modifyReg rcc_reg_apbenr1 $ setBit   rcc_apbenr1_usart2en
  rccdisable = modifyReg rcc_reg_apbenr1 $ clearBit rcc_apbenr1_usart2en

usart3 :: UART
usart3 = mkUARTVersion V3 usart3_periph_base
                rccenable rccdisable
                G081.USART3_USART4_LPUART1
                PClk1
                (\pin -> findAFByPin pin "usart3" afDB)
                "usart3"
  where
  rccenable  = modifyReg rcc_reg_apbenr1 $ setBit   rcc_apbenr1_usart3en
  rccdisable = modifyReg rcc_reg_apbenr1 $ clearBit rcc_apbenr1_usart3en

usart4 :: UART
usart4 = mkUARTVersion V3 usart4_periph_base
                rccenable rccdisable
                G081.USART3_USART4_LPUART1
                PClk1
                (\pin -> findAFByPin pin "usart4" afDB)
                "usart4"
  where
  rccenable  = modifyReg rcc_reg_apbenr1 $ setBit   rcc_apbenr1_usart4en
  rccdisable = modifyReg rcc_reg_apbenr1 $ clearBit rcc_apbenr1_usart4en

