module Ivory.BSP.STM32L4A6.CAN (
    can1
  , can2
  , canFilters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32L4A6.AF
import Ivory.BSP.STM32L4A6.RCC
import Ivory.BSP.STM32L4A6.MemoryMap
import qualified Ivory.BSP.STM32L4A6.Interrupt as L4A6

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.CAN

can1 :: CANPeriph
can1 = mkCANPeriph can1_periph_base
                rccenable rccdisable
                L4A6.CAN1_TX L4A6.CAN1_RX0 L4A6.CAN1_RX1 L4A6.CAN1_SCE
               (\pin -> findAFByPin pin "can1" afDB)
               "can1"
  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_can1en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_can1en

can2 :: CANPeriph
can2 = mkCANPeriph can2_periph_base
                rccenable rccdisable
                L4A6.CAN2_TX L4A6.CAN2_RX0 L4A6.CAN2_RX1 L4A6.CAN2_SCE
               (\pin -> findAFByPin pin "can2" afDB)
               "can2"
  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_can2en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_can2en


canFilters :: CANPeriphFilters
canFilters =
  mkCANPeriphFilters
    can1_periph_base
    rccenable
    rccdisable
  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_can1en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_can1en

