module Ivory.BSP.STM32F722.CAN (
    can1
  , canFilters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F722.AF
import Ivory.BSP.STM32F722.RCC
import Ivory.BSP.STM32F722.MemoryMap
import qualified Ivory.BSP.STM32F722.Interrupt as F722

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.CAN

canFilters :: CANPeriphFilters
canFilters = mkCANPeriphFilters can1_periph_base
                rccenable rccdisable
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can1en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can1en

can1 :: CANPeriph
can1 = mkCANPeriph can1_periph_base
                rccenable rccdisable
                F722.CAN1_TX F722.CAN1_RX0 F722.CAN1_RX1 F722.CAN1_SCE
               (\pin -> findAFByPin pin "can1" afDB)
               "can1"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can1en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can1en

