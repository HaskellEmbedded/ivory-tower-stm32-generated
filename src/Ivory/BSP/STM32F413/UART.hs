module Ivory.BSP.STM32F413.UART (
    uart4
  , uart5
  , uart7
  , uart8
  , uart9
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32F413.AF
import Ivory.BSP.STM32F413.RCC
import Ivory.BSP.STM32F413.MemoryMap
import qualified Ivory.BSP.STM32F413.Interrupt as F413

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.UART

uart4 :: UART
uart4 = mkUARTVersion V2 uart4_periph_base
                rccenable rccdisable
                F413.UART4
                PClk1
                (\pin -> findAFByPin pin "uart4" afDB)
                "uart4"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_uart4en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_uart4en

uart5 :: UART
uart5 = mkUARTVersion V2 uart5_periph_base
                rccenable rccdisable
                F413.UART5
                PClk1
                (\pin -> findAFByPin pin "uart5" afDB)
                "uart5"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_uart5en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_uart5en

uart7 :: UART
uart7 = mkUARTVersion V2 uart7_periph_base
                rccenable rccdisable
                F413.UART7
                PClk1
                (\pin -> findAFByPin pin "uart7" afDB)
                "uart7"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_uart7en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_uart7en

uart8 :: UART
uart8 = mkUARTVersion V2 uart8_periph_base
                rccenable rccdisable
                F413.UART8
                PClk1
                (\pin -> findAFByPin pin "uart8" afDB)
                "uart8"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_uart8en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_uart8en

uart9 :: UART
uart9 = mkUARTVersion V2 uart9_periph_base
                rccenable rccdisable
                F413.UART9
                PClk2
                (\pin -> findAFByPin pin "uart9" afDB)
                "uart9"
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_uart9en
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_uart9en

