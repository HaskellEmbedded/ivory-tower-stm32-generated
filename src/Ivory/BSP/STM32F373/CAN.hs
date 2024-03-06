module Ivory.BSP.STM32F373.CAN (
    can
  , canFilters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F373.AF
import Ivory.BSP.STM32F373.RCC
import Ivory.BSP.STM32F373.MemoryMap
import qualified Ivory.BSP.STM32F373.Interrupt as F373

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.CAN

can :: CANPeriph
can = mkCANPeriph can_periph_base
                rccenable rccdisable
                F373.CAN_TX F373.CAN_RXD F373.CAN_RXI F373.CAN_SCE
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

