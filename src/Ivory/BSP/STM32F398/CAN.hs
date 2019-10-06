module Ivory.BSP.STM32F398.CAN (
    can
  , canFilters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.Peripheral.CAN
import Ivory.BSP.STM32F398.RCC
import Ivory.BSP.STM32F398.MemoryMap
import qualified Ivory.BSP.STM32F398.Interrupt as F398

canFilters :: CANPeriphFilters
canFilters = mkCANPeriphFilters can_periph_base
                rccenable rccdisable
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_canen
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_canen

can :: CANPeriph
can = mkCANPeriph can_periph_base
                rccenable rccdisable
                F398.CAN_TX F398.CAN_RXD F398.CAN_RXI F398.CAN_SCE
               "can"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_canen
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_canen

