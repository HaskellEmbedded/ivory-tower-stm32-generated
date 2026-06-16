module Ivory.BSP.STM32F410.DAC (
    dac
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F410.RCC
import Ivory.BSP.STM32F410.MemoryMap
import qualified Ivory.BSP.STM32F410.Interrupt as F410

import Ivory.BSP.STM32.Peripheral.DAC

dac :: DAC
dac =
  mkDAC
    dac_periph_base
    rccenable
    rccdisable
     F410.TIM6_GLB_IT_DAC1_DAC2
    "dac"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_dacen
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_dacen

