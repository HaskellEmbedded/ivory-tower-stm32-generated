module Ivory.BSP.STM32F777.CAN (
    can1
  , can2
  , can3
  , canFilters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F777.AF
import Ivory.BSP.STM32F777.RCC
import Ivory.BSP.STM32F777.MemoryMap
import qualified Ivory.BSP.STM32F777.Interrupt as F777

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.CAN

canFilters :: CANPeriphFilters
canFilters = mkCANPeriphFilters can1_periph_base
                rccenable rccdisable
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can1en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can1en

can1 :: CANPeriph
can1 = mkCANPeriph can1_periph_base
                rccenable rccdisable
                F777.CAN1_TX F777.CAN1_RX0 F777.CAN1_RX1 F777.CAN1_SCE
               (\pin -> findAFByPin pin "can1" afDB)
               "can1"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can1en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can1en

can2 :: CANPeriph
can2 = mkCANPeriph can2_periph_base
                rccenable rccdisable
                F777.CAN2_TX F777.CAN2_RX0 F777.CAN2_RX1 F777.CAN2_SCE
               (\pin -> findAFByPin pin "can2" afDB)
               "can2"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can2en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can2en

can3 :: CANPeriph
can3 = mkCANPeriph can3_periph_base
                rccenable rccdisable
                F777.CAN3_TX F777.CAN3_RX0 F777.CAN3_RX1 F777.CAN3_SCE
               (\pin -> findAFByPin pin "can3" afDB)
               "can3"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can3en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can3en

