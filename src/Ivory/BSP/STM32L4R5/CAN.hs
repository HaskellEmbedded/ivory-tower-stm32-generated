module Ivory.BSP.STM32L4R5.CAN (
    can1
  , canFilters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32L4R5.AF
import Ivory.BSP.STM32L4R5.RCC
import Ivory.BSP.STM32L4R5.MemoryMap
import qualified Ivory.BSP.STM32L4R5.Interrupt as L4R5

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.CAN

can1 :: CANPeriph
can1 = mkCANPeriph can1_periph_base
                rccenable rccdisable
                L4R5.CAN1_TX L4R5.CAN1_RX0 L4R5.CAN1_RX1 L4R5.CAN1_SCE
               (\pin -> findAFByPin pin "can1" afDB)
               "can1"
  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_can1en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_can1en


canFilters :: CANPeriphFilters
canFilters =
  mkCANPeriphFilters
    can1_periph_base
    rccenable
    rccdisable
  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_can1en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_can1en

