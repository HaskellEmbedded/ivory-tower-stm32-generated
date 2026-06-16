module Ivory.BSP.STM32F732.DAC (
    dac
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F732.RCC
import Ivory.BSP.STM32F732.MemoryMap
import qualified Ivory.BSP.STM32F732.Interrupt as F732

import Ivory.BSP.STM32.Peripheral.DAC

dac :: DAC
dac =
  mkDAC
    dac_periph_base
    rccenable
    rccdisable
     F732.TIM6_DAC
    "dac"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_dacen
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_dacen

