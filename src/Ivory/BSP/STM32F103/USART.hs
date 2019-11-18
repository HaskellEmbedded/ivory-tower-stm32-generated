module Ivory.BSP.STM32F103.USART (
    usart1
  , usart2
  , usart3
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32F103.AF
import Ivory.BSP.STM32F103.RCC
import Ivory.BSP.STM32F103.MemoryMap
import qualified Ivory.BSP.STM32F103.Interrupt as F103

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.UART

usart1 :: UART
usart1 = mkUARTVersion V1 usart1_periph_base
                rccenable rccdisable
                F103.USART1
                PClk1
                (\pin -> findAFByPin pin "usart1" afDB)
                "usart1"
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_usart1en
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_usart1en

usart2 :: UART
usart2 = mkUARTVersion V1 usart2_periph_base
                rccenable rccdisable
                F103.USART2
                PClk1
                (\pin -> findAFByPin pin "usart2" afDB)
                "usart2"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_usart2en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_usart2en

usart3 :: UART
usart3 = mkUARTVersion V1 usart3_periph_base
                rccenable rccdisable
                F103.USART3
                PClk1
                (\pin -> findAFByPin pin "usart3" afDB)
                "usart3"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_usart3en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_usart3en

