module Ivory.BSP.STM32F756.ADC (
    adc1
  , adc2
  , adc3
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F756.RCC
import Ivory.BSP.STM32F756.MemoryMap
import qualified Ivory.BSP.STM32F756.Interrupt as F756

import Ivory.BSP.STM32.Peripheral.ADC

adc1 :: ADC
adc1 =
  mkADC
    adc1_periph_base
    adc1_periph_base
    rccenable
    rccdisable
     F756.ADC
    "adc1"
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_adc1en
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_adc1en

adc2 :: ADC
adc2 =
  mkADC
    adc2_periph_base
    adc1_periph_base
    rccenable
    rccdisable
     F756.ADC
    "adc2"
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_adc2en
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_adc2en

adc3 :: ADC
adc3 =
  mkADC
    adc3_periph_base
    adc1_periph_base
    rccenable
    rccdisable
     F756.ADC
    "adc3"
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_adc3en
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_adc3en

