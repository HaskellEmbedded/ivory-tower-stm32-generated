module Ivory.BSP.STM32F091.CAN (
    can
  , canFilters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.Peripheral.CAN
import Ivory.BSP.STM32F091.RCC
import Ivory.BSP.STM32F091.MemoryMap
import qualified Ivory.BSP.STM32F091.Interrupt as F091

canFilters :: CANPeriphFilters
canFilters = mkCANPeriphFilters can_periph_base
                rccenable rccdisable
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_canen
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_canen

can :: CANPeriph
can = mkCANPeriph can_periph_base
                rccenable rccdisable
                F091.CEC_CAN F091.CEC_CAN F091.CEC_CAN F091.CEC_CAN
               "can"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_canen
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_canen

