module Ivory.BSP.STM32L476.CAN (
    can1
  , canFilters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32L476.AF
import Ivory.BSP.STM32L476.RCC
import Ivory.BSP.STM32L476.MemoryMap
import qualified Ivory.BSP.STM32L476.Interrupt as L476

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.CAN

can1 :: CANPeriph
can1 = mkCANPeriph can1_periph_base
                rccenable rccdisable
                L476.CAN1_TX L476.CAN1_RX0 L476.CAN1_RX1 L476.CAN1_SCE
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

