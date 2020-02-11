module Ivory.BSP.STM32L412.LPUART (
    lpuart1
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32L412.AF
import Ivory.BSP.STM32L412.RCC
import Ivory.BSP.STM32L412.MemoryMap
import qualified Ivory.BSP.STM32L412.Interrupt as L412

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.UART

lpuart1 :: UART
lpuart1 = mkUARTVersion V3 lpuart1_periph_base
                rccenable rccdisable
                L412.LPUART1
                PClk1
                (\pin -> findAFByPin pin "lpuart1" afDB)
                "lpuart1"
  where
  rccenable  = modifyReg rcc_reg_apb1enr2 $ setBit   rcc_apb1enr2_lpuart1en
  rccdisable = modifyReg rcc_reg_apb1enr2 $ clearBit rcc_apb1enr2_lpuart1en

