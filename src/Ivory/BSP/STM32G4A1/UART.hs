module Ivory.BSP.STM32G4A1.UART (
    uart4
  , uart5
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32G4A1.AF
import Ivory.BSP.STM32G4A1.RCC
import Ivory.BSP.STM32G4A1.MemoryMap
import qualified Ivory.BSP.STM32G4A1.Interrupt as G4A1

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.UART

uart4 :: UART
uart4 = mkUARTVersion V3 uart4_periph_base
                rccenable rccdisable
                G4A1.UART4
                PClk1
                (\pin -> findAFByPin pin "uart4" afDB)
                "uart4"
  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_uart4en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_uart4en

uart5 :: UART
uart5 = mkUARTVersion V3 uart5_periph_base
                rccenable rccdisable
                G4A1.UART5
                PClk1
                (\pin -> findAFByPin pin "uart5" afDB)
                "uart5"
  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_uart5en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_uart5en

