module Ivory.BSP.STM32L451.CAN (
    can1
  , canFilters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.Peripheral.CAN
import Ivory.BSP.STM32L451.RCC
import Ivory.BSP.STM32L451.MemoryMap
import qualified Ivory.BSP.STM32L451.Interrupt as L451

canFilters :: CANPeriphFilters
canFilters = mkCANPeriphFilters can1_periph_base
                rccenable rccdisable
  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_can1en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_can1en

can1 :: CANPeriph
can1 = mkCANPeriph can1_periph_base
                rccenable rccdisable
                L451.CAN1_TX L451.CAN1_RX0 L451.CAN1_RX1 L451.CAN1_SCE
               "can1"
  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_can1en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_can1en

