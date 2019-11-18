module Ivory.BSP.STM32F469.USART (
    usart1
  , usart2
  , usart3
  , usart6
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32F469.AF
import Ivory.BSP.STM32F469.RCC
import Ivory.BSP.STM32F469.MemoryMap
import qualified Ivory.BSP.STM32F469.Interrupt as F469

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.UART

usart1 :: UART
usart1 = mkUARTVersion V2 usart1_periph_base
                rccenable rccdisable
                F469.USART1
                PClk1
                (\pin -> findAFByPin pin "usart1" afDB)
                "usart1"
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_usart1en
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_usart1en

usart2 :: UART
usart2 = mkUARTVersion V2 usart2_periph_base
                rccenable rccdisable
                F469.USART2
                PClk1
                (\pin -> findAFByPin pin "usart2" afDB)
                "usart2"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_usart2en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_usart2en

usart3 :: UART
usart3 = mkUARTVersion V2 usart3_periph_base
                rccenable rccdisable
                F469.USART3
                PClk1
                (\pin -> findAFByPin pin "usart3" afDB)
                "usart3"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_usart3en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_usart3en

usart6 :: UART
usart6 = mkUARTVersion V2 usart6_periph_base
                rccenable rccdisable
                F469.USART6
                PClk1
                (\pin -> findAFByPin pin "usart6" afDB)
                "usart6"
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_usart6en
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_usart6en

