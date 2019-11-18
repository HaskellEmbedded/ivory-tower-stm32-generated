module Ivory.BSP.STM32F107.UART (
    uart4
  , uart5
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32F107.AF
import Ivory.BSP.STM32F107.RCC
import Ivory.BSP.STM32F107.MemoryMap
import qualified Ivory.BSP.STM32F107.Interrupt as F107

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.UART

uart4 :: UART
uart4 = mkUARTVersion V1 uart4_periph_base
                rccenable rccdisable
                F107.UART4
                PClk1
                (\pin -> findAFByPin pin "uart4" afDB)
                "uart4"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_uart4en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_uart4en

uart5 :: UART
uart5 = mkUARTVersion V1 uart5_periph_base
                rccenable rccdisable
                F107.UART5
                PClk1
                (\pin -> findAFByPin pin "uart5" afDB)
                "uart5"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_uart5en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_uart5en

