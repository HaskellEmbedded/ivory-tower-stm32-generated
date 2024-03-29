module Ivory.BSP.STM32F745.CAN (
    can1
  , can2
  , canFilters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F745.AF
import Ivory.BSP.STM32F745.RCC
import Ivory.BSP.STM32F745.MemoryMap
import qualified Ivory.BSP.STM32F745.Interrupt as F745

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.CAN

can1 :: CANPeriph
can1 = mkCANPeriph can1_periph_base
                rccenable rccdisable
                F745.CAN1_TX F745.CAN1_RX0 F745.CAN1_RX1 F745.CAN1_SCE
               (\pin -> findAFByPin pin "can1" afDB)
               "can1"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can1en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can1en

can2 :: CANPeriph
can2 = mkCANPeriph can2_periph_base
                rccenable rccdisable
                F745.CAN2_TX F745.CAN2_RX0 F745.CAN2_RX1 F745.CAN2_SCE
               (\pin -> findAFByPin pin "can2" afDB)
               "can2"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can2en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can2en


canFilters :: CANPeriphFilters
canFilters =
  mkCANPeriphFilters
    can1_periph_base
    rccenable
    rccdisable
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can1en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can1en

