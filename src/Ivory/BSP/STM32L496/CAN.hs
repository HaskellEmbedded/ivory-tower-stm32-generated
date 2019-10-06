module Ivory.BSP.STM32L496.CAN (
    can1
  , can2
  , canFilters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.Peripheral.CAN
import Ivory.BSP.STM32L496.RCC
import Ivory.BSP.STM32L496.MemoryMap
import qualified Ivory.BSP.STM32L496.Interrupt as L496

canFilters :: CANPeriphFilters
canFilters = mkCANPeriphFilters can1_periph_base
                rccenable rccdisable
  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_can1en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_can1en

can1 :: CANPeriph
can1 = mkCANPeriph can1_periph_base
                rccenable rccdisable
                L496.CAN1_TX L496.CAN1_RX0 L496.CAN1_RX1 L496.CAN1_SCE
               "can1"
  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_can1en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_can1en

can2 :: CANPeriph
can2 = mkCANPeriph can2_periph_base
                rccenable rccdisable
                L496.CAN2_TX L496.CAN2_RX0 L496.CAN2_RX1 L496.CAN2_SCE
               "can2"
  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_can2en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_can2en

