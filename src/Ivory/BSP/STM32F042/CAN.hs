module Ivory.BSP.STM32F042.CAN (
    can
  , canFilters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.Peripheral.CAN
import Ivory.BSP.STM32F042.RCC
import Ivory.BSP.STM32F042.MemoryMap
import qualified Ivory.BSP.STM32F042.Interrupt as F042

canFilters :: CANPeriphFilters
canFilters = mkCANPeriphFilters can_periph_base
                rccenable rccdisable
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_canen
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_canen

can :: CANPeriph
can = mkCANPeriph can_periph_base
                rccenable rccdisable
                F042.CEC_CAN F042.CEC_CAN F042.CEC_CAN F042.CEC_CAN
               "can"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_canen
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_canen

