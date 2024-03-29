module Ivory.BSP.STM32F328.CAN (
    can
  , canFilters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F328.AF
import Ivory.BSP.STM32F328.RCC
import Ivory.BSP.STM32F328.MemoryMap
import qualified Ivory.BSP.STM32F328.Interrupt as F328

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.CAN

can :: CANPeriph
can = mkCANPeriph can_periph_base
                rccenable rccdisable
                F328.CAN_TX F328.CAN_RXD F328.CAN_RXI F328.CAN_SCE
               (\pin -> findAFByPin pin "can" afDB)
               "can"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_canen
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_canen


canFilters :: CANPeriphFilters
canFilters =
  mkCANPeriphFilters
    can_periph_base
    rccenable
    rccdisable
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_canen
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_canen

