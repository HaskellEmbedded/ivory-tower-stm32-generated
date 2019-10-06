module Ivory.BSP.STM32F730.CAN (
    can1
  , canFilters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.Peripheral.CAN
import Ivory.BSP.STM32F730.RCC
import Ivory.BSP.STM32F730.MemoryMap
import qualified Ivory.BSP.STM32F730.Interrupt as F730

canFilters :: CANPeriphFilters
canFilters = mkCANPeriphFilters can1_periph_base
                rccenable rccdisable
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can1en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can1en

can1 :: CANPeriph
can1 = mkCANPeriph can1_periph_base
                rccenable rccdisable
                F730.CAN1_TX F730.CAN1_RX0 F730.CAN1_RX1 F730.CAN1_SCE
               "can1"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can1en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can1en

