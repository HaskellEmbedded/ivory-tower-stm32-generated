module Ivory.BSP.STM32F302.USART (
    usart1
  , usart2
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32F302.AF
import Ivory.BSP.STM32F302.RCC
import Ivory.BSP.STM32F302.MemoryMap
import qualified Ivory.BSP.STM32F302.Interrupt as F302

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.UART

usart1 :: UART
usart1 = mkUARTVersion V3 usart1_periph_base
                rccenable rccdisable
                F302.USART1_EXTI25
                PClk1
                (\pin -> findAFByPin pin "usart1" afDB)
                "usart1"
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_usart1en
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_usart1en

usart2 :: UART
usart2 = mkUARTVersion V3 usart2_periph_base
                rccenable rccdisable
                F302.USART2_EXTI26
                PClk1
                (\pin -> findAFByPin pin "usart2" afDB)
                "usart2"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_usart2en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_usart2en

