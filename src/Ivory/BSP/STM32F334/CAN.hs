module Ivory.BSP.STM32F334.CAN (
    can
  , canFilters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.Peripheral.CAN
import Ivory.BSP.STM32F334.RCC
import Ivory.BSP.STM32F334.MemoryMap
import qualified Ivory.BSP.STM32F334.Interrupt as F334

canFilters :: CANPeriphFilters
canFilters = mkCANPeriphFilters can_periph_base
                rccenable rccdisable
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_canen
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_canen

can :: CANPeriph
can = mkCANPeriph can_periph_base
                rccenable rccdisable
                F334.USB_HP_CAN_TX F334.USB_LP_CAN_RX0 F334.CAN_RX1 F334.CAN_SCE
               "can"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_canen
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_canen

