module Ivory.BSP.STM32F378.CAN (
    can
  , canFilters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.Peripheral.CAN
import Ivory.BSP.STM32F378.RCC
import Ivory.BSP.STM32F378.MemoryMap
import qualified Ivory.BSP.STM32F378.Interrupt as F378

canFilters :: CANPeriphFilters
canFilters = mkCANPeriphFilters can_periph_base
                rccenable rccdisable
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_canen
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_canen

can :: CANPeriph
can = mkCANPeriph can_periph_base
                rccenable rccdisable
                F378.CAN_TX F378.CAN_RXD F378.CAN_RXI F378.CAN_SCE
               "can"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_canen
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_canen

