module Ivory.BSP.STM32G491.RNG (
    rng
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32G491.RCC
import Ivory.BSP.STM32G491.MemoryMap
import qualified Ivory.BSP.STM32G491.Interrupt as G491

import Ivory.BSP.STM32.Peripheral.RNG

rng :: RNG
rng = mkRNG rng_periph_base
                rccenable rccdisable
                G491.RNG
  where
  rccenable  = modifyReg rcc_reg_ahb2enr $ setBit   rcc_ahb2enr_rngen
  rccdisable = modifyReg rcc_reg_ahb2enr $ clearBit rcc_ahb2enr_rngen

