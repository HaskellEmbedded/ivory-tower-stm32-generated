module Ivory.BSP.STM32F405.DAC (
    dac
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F405.RCC
import Ivory.BSP.STM32F405.MemoryMap
import qualified Ivory.BSP.STM32F405.Interrupt as F405

import Ivory.BSP.STM32.Peripheral.DAC

dac :: DAC
dac =
  mkDAC
    dac_periph_base
    rccenable
    rccdisable
     F405.TIM6_DAC
    "dac"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_dacen
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_dacen

