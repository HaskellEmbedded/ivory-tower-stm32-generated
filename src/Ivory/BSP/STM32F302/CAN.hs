module Ivory.BSP.STM32F302.CAN (
    can
  , canFilters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F302.AF
import Ivory.BSP.STM32F302.RCC
import Ivory.BSP.STM32F302.MemoryMap
import qualified Ivory.BSP.STM32F302.Interrupt as F302

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.CAN

can :: CANPeriph
can = mkCANPeriph can_periph_base
                rccenable rccdisable
                F302.USB_HP_CAN_TX F302.USB_LP_CAN_RX0 F302.CAN_RX1 F302.CAN_SCE
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

