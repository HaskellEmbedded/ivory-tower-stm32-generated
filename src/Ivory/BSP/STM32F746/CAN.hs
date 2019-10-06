module Ivory.BSP.STM32F746.CAN (
    can1
  , can2
  , canFilters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.Peripheral.CAN
import Ivory.BSP.STM32F746.RCC
import Ivory.BSP.STM32F746.MemoryMap
import qualified Ivory.BSP.STM32F746.Interrupt as F746

canFilters :: CANPeriphFilters
canFilters = mkCANPeriphFilters can1_periph_base
                rccenable rccdisable
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can1en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can1en

can1 :: CANPeriph
can1 = mkCANPeriph can1_periph_base
                rccenable rccdisable
                F746.CAN1_TX F746.CAN1_RX0 F746.CAN1_RX1 F746.CAN1_SCE
               "can1"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can1en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can1en

can2 :: CANPeriph
can2 = mkCANPeriph can2_periph_base
                rccenable rccdisable
                F746.CAN2_TX F746.CAN2_RX0 F746.CAN2_RX1 F746.CAN2_SCE
               "can2"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can2en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can2en

