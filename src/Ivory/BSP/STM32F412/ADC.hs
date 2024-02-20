module Ivory.BSP.STM32F412.ADC (
    adc1
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F412.RCC
import Ivory.BSP.STM32F412.MemoryMap
import qualified Ivory.BSP.STM32F412.Interrupt as F412

import Ivory.BSP.STM32.Peripheral.ADC

adc1 :: ADC
adc1 =
  mkADC
    adc1_periph_base
    adc1_periph_base
    rccenable
    rccdisable
     F412.ADC
    "adc1"
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_adc1en
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_adc1en

