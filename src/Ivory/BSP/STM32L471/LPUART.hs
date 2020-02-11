module Ivory.BSP.STM32L471.LPUART (
    lpuart1
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32L471.AF
import Ivory.BSP.STM32L471.RCC
import Ivory.BSP.STM32L471.MemoryMap
import qualified Ivory.BSP.STM32L471.Interrupt as L471

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.UART

lpuart1 :: UART
lpuart1 = mkUARTVersion V3 lpuart1_periph_base
                rccenable rccdisable
                L471.LPUART1
                PClk1
                (\pin -> findAFByPin pin "lpuart1" afDB)
                "lpuart1"
  where
  rccenable  = modifyReg rcc_reg_apb1enr2 $ setBit   rcc_apb1enr2_lpuart1en
  rccdisable = modifyReg rcc_reg_apb1enr2 $ clearBit rcc_apb1enr2_lpuart1en

