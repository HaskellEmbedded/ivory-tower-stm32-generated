module Ivory.BSP.STM32F750.UART (
    uart4
  , uart5
  , uart7
  , uart8
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32F750.AF
import Ivory.BSP.STM32F750.RCC
import Ivory.BSP.STM32F750.MemoryMap
import qualified Ivory.BSP.STM32F750.Interrupt as F750

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.UART

uart4 :: UART
uart4 = mkUARTVersion V3 uart4_periph_base
                rccenable rccdisable
                F750.UART4
                PClk1
                (\pin -> findAFByPin pin "uart4" afDB)
                "uart4"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_uart4en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_uart4en

uart5 :: UART
uart5 = mkUARTVersion V3 uart5_periph_base
                rccenable rccdisable
                F750.UART5
                PClk1
                (\pin -> findAFByPin pin "uart5" afDB)
                "uart5"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_uart5en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_uart5en

uart7 :: UART
uart7 = mkUARTVersion V3 uart7_periph_base
                rccenable rccdisable
                F750.UART7
                PClk1
                (\pin -> findAFByPin pin "uart7" afDB)
                "uart7"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_uart7en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_uart7en

uart8 :: UART
uart8 = mkUARTVersion V3 uart8_periph_base
                rccenable rccdisable
                F750.UART8
                PClk1
                (\pin -> findAFByPin pin "uart8" afDB)
                "uart8"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_uart8en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_uart8en

