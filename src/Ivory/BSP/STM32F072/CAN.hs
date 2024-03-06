module Ivory.BSP.STM32F072.CAN (
    can
  , canFilters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F072.AF
import Ivory.BSP.STM32F072.RCC
import Ivory.BSP.STM32F072.MemoryMap
import qualified Ivory.BSP.STM32F072.Interrupt as F072

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.CAN

can :: CANPeriph
can = mkCANPeriph can_periph_base
                rccenable rccdisable
                F072.CEC_CAN F072.CEC_CAN F072.CEC_CAN F072.CEC_CAN
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

