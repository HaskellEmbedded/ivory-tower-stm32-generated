module Ivory.BSP.STM32L486.CAN (
    can1
  , canFilters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.Peripheral.CAN
import Ivory.BSP.STM32L486.RCC
import Ivory.BSP.STM32L486.MemoryMap
import qualified Ivory.BSP.STM32L486.Interrupt as L486

canFilters :: CANPeriphFilters
canFilters = mkCANPeriphFilters can1_periph_base
                rccenable rccdisable
  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_can1en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_can1en

can1 :: CANPeriph
can1 = mkCANPeriph can1_periph_base
                rccenable rccdisable
                L486.CAN1_TX L486.CAN1_RX0 L486.CAN1_RX1 L486.CAN1_SCE
               "can1"
  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_can1en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_can1en

