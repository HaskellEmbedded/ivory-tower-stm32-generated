module Ivory.BSP.STM32F410.RNG (
    rng
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F410.RCC
import Ivory.BSP.STM32F410.MemoryMap
import qualified Ivory.BSP.STM32F410.Interrupt as F410

import Ivory.BSP.STM32.Peripheral.RNG

rng :: RNG
rng = mkRNG rng_periph_base
                rccenable rccdisable
                F410.RNG
  where
  rccenable  = modifyReg rcc_reg_ahb1enr $ setBit   rcc_ahb1enr_rngen
  rccdisable = modifyReg rcc_reg_ahb1enr $ clearBit rcc_ahb1enr_rngen

