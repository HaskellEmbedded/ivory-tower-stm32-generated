module Ivory.BSP.STM32F779.DAC (
    dac
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F779.RCC
import Ivory.BSP.STM32F779.MemoryMap
import qualified Ivory.BSP.STM32F779.Interrupt as F779

import Ivory.BSP.STM32.Peripheral.DAC

dac :: DAC
dac =
  mkDAC
    dac_periph_base
    rccenable
    rccdisable
     F779.TIM6_DAC
    "dac"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_dacen
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_dacen

