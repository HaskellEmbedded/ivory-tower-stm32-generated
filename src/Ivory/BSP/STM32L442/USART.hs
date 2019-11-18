module Ivory.BSP.STM32L442.USART (
    usart1
  , usart2
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32L442.AF
import Ivory.BSP.STM32L442.RCC
import Ivory.BSP.STM32L442.MemoryMap
import qualified Ivory.BSP.STM32L442.Interrupt as L442

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.UART

usart1 :: UART
usart1 = mkUARTVersion V3 usart1_periph_base
                rccenable rccdisable
                L442.USART1
                PClk1
                (\pin -> findAFByPin pin "usart1" afDB)
                "usart1"
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_usart1en
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_usart1en

usart2 :: UART
usart2 = mkUARTVersion V3 usart2_periph_base
                rccenable rccdisable
                L442.USART2
                PClk1
                (\pin -> findAFByPin pin "usart2" afDB)
                "usart2"
  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_usart2en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_usart2en

