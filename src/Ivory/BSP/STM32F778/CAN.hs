module Ivory.BSP.STM32F778.CAN (
    can1
  , can2
  , canFilters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.Peripheral.CAN
import Ivory.BSP.STM32F778.RCC
import Ivory.BSP.STM32F778.MemoryMap
import qualified Ivory.BSP.STM32F778.Interrupt as F778

canFilters :: CANPeriphFilters
canFilters = mkCANPeriphFilters can1_periph_base
                rccenable rccdisable
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can1en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can1en

can1 :: CANPeriph
can1 = mkCANPeriph can1_periph_base
                rccenable rccdisable
                F778.CAN1_TX F778.CAN1_RX0 F778.CAN1_RX1 F778.CAN1_SCE
               "can1"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can1en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can1en

can2 :: CANPeriph
can2 = mkCANPeriph can2_periph_base
                rccenable rccdisable
                F778.CAN2_TX F778.CAN2_RX0 F778.CAN2_RX1 F778.CAN2_SCE
               "can2"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can2en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can2en

