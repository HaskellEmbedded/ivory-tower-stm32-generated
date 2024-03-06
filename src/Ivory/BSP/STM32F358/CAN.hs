module Ivory.BSP.STM32F358.CAN (
    can
  , canFilters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F358.AF
import Ivory.BSP.STM32F358.RCC
import Ivory.BSP.STM32F358.MemoryMap
import qualified Ivory.BSP.STM32F358.Interrupt as F358

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.CAN

can :: CANPeriph
can = mkCANPeriph can_periph_base
                rccenable rccdisable
                F358.CAN_TX F358.CAN_RXD F358.CAN_RXI F358.CAN_SCE
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

