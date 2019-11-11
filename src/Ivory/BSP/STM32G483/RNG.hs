module Ivory.BSP.STM32G483.RNG (
    rng
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32G483.RCC
import Ivory.BSP.STM32G483.MemoryMap
import qualified Ivory.BSP.STM32G483.Interrupt as G483

import Ivory.BSP.STM32.Peripheral.RNG

rng :: RNG
rng = mkRNG rng_periph_base
                rccenable rccdisable
                G483.RNG
  where
  rccenable  = modifyReg rcc_reg_ahb2enr $ setBit   rcc_ahb2enr_rngen
  rccdisable = modifyReg rcc_reg_ahb2enr $ clearBit rcc_ahb2enr_rngen

