module Ivory.BSP.STM32G041.USART (
    usart1
  , usart2
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32G041.AF
import Ivory.BSP.STM32G041.RCC
import Ivory.BSP.STM32G041.MemoryMap
import qualified Ivory.BSP.STM32G041.Interrupt as G041

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.UART

usart1 :: UART
usart1 = mkUARTVersion V3 usart1_periph_base
                rccenable rccdisable
                G041.USART1
                PClk1
                (\pin -> findAFByPin pin "usart1" afDB)
                "usart1"
  where
  rccenable  = modifyReg rcc_reg_apbenr2 $ setBit   rcc_apbenr2_usart1en
  rccdisable = modifyReg rcc_reg_apbenr2 $ clearBit rcc_apbenr2_usart1en

usart2 :: UART
usart2 = mkUARTVersion V3 usart2_periph_base
                rccenable rccdisable
                G041.USART2
                PClk1
                (\pin -> findAFByPin pin "usart2" afDB)
                "usart2"
  where
  rccenable  = modifyReg rcc_reg_apbenr1 $ setBit   rcc_apbenr1_usart2en
  rccdisable = modifyReg rcc_reg_apbenr1 $ clearBit rcc_apbenr1_usart2en

