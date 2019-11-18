module Ivory.BSP.STM32F413.UART (
    uart5
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

