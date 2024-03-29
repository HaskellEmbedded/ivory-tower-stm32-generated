module Ivory.BSP.STM32G471.USART (
    usart1
  , usart2
  , usart3
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32G471.AF
import Ivory.BSP.STM32G471.RCC
import Ivory.BSP.STM32G471.MemoryMap
import qualified Ivory.BSP.STM32G471.Interrupt as G471

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.UART

usart1 :: UART
usart1 = mkUARTVersion V3 usart1_periph_base
                rccenable rccdisable
                G471.USART1
                PClk2
                (\pin -> findAFByPin pin "usart1" afDB)
                "usart1"
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_usart1en
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_usart1en

usart2 :: UART
usart2 = mkUARTVersion V3 usart2_periph_base
                rccenable rccdisable
                G471.USART2
                PClk1
                (\pin -> findAFByPin pin "usart2" afDB)
                "usart2"
  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_usart2en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_usart2en

usart3 :: UART
usart3 = mkUARTVersion V3 usart3_periph_base
                rccenable rccdisable
                G471.USART3
                PClk1
                (\pin -> findAFByPin pin "usart3" afDB)
                "usart3"
  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_usart3en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_usart3en

