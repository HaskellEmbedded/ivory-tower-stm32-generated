module Ivory.BSP.STM32F732.CAN (
    can1
  , canFilters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F732.AF
import Ivory.BSP.STM32F732.RCC
import Ivory.BSP.STM32F732.MemoryMap
import qualified Ivory.BSP.STM32F732.Interrupt as F732

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.CAN

can1 :: CANPeriph
can1 = mkCANPeriph can1_periph_base
                rccenable rccdisable
                F732.CAN1_TX F732.CAN1_RX0 F732.CAN1_RX1 F732.CAN1_SCE
               (\pin -> findAFByPin pin "can1" afDB)
               "can1"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can1en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can1en


canFilters :: CANPeriphFilters
canFilters =
  mkCANPeriphFilters
    can1_periph_base
    rccenable
    rccdisable
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can1en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can1en

