module Ivory.BSP.STM32F767.CAN (
    can1
  , can2
  , can3
  , canFilters
  , can3Filters
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F767.AF
import Ivory.BSP.STM32F767.RCC
import Ivory.BSP.STM32F767.MemoryMap
import qualified Ivory.BSP.STM32F767.Interrupt as F767

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.CAN

can1 :: CANPeriph
can1 = mkCANPeriph can1_periph_base
                rccenable rccdisable
                F767.CAN1_TX F767.CAN1_RX0 F767.CAN1_RX1 F767.CAN1_SCE
               (\pin -> findAFByPin pin "can1" afDB)
               "can1"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can1en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can1en

can2 :: CANPeriph
can2 = mkCANPeriph can2_periph_base
                rccenable rccdisable
                F767.CAN2_TX F767.CAN2_RX0 F767.CAN2_RX1 F767.CAN2_SCE
               (\pin -> findAFByPin pin "can2" afDB)
               "can2"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can2en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can2en

can3 :: CANPeriph
can3 = mkCANPeriph can3_periph_base
                rccenable rccdisable
                F767.CAN3_TX F767.CAN3_RX0 F767.CAN3_RX1 F767.CAN3_SCE
               (\pin -> findAFByPin pin "can3" afDB)
               "can3"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can3en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can3en


canFilters :: CANPeriphFilters
canFilters =
  mkCANPeriphFilters
    can1_periph_base
    rccenable
    rccdisable
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can1en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can1en

can3Filters :: CANPeriphFilters
can3Filters =
  mkCANPeriphFilters
    can3_periph_base
    rccenable
    rccdisable
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_can3en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_can3en

