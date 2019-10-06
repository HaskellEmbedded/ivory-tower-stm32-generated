module Ivory.BSP.STM32L4R7.RNG (
    rng
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32L4R7.RCC
import Ivory.BSP.STM32L4R7.MemoryMap
import qualified Ivory.BSP.STM32L4R7.Interrupt as L4R7

import Ivory.BSP.STM32.Peripheral.RNG

rng :: RNG
rng = mkRNG rng_periph_base
                rccenable rccdisable
                L4R7.RNG_HASH
  where
  rccenable  = modifyReg rcc_reg_ahb2enr $ setBit   rcc_ahb2enr_rngen
  rccdisable = modifyReg rcc_reg_ahb2enr $ clearBit rcc_ahb2enr_rngen

