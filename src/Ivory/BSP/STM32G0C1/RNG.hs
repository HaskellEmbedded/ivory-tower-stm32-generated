module Ivory.BSP.STM32G0C1.RNG (
    rng
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32G0C1.RCC
import Ivory.BSP.STM32G0C1.MemoryMap
import qualified Ivory.BSP.STM32G0C1.Interrupt as G0C1

import Ivory.BSP.STM32.Peripheral.RNG

rng :: RNG
rng = mkRNG rng_periph_base
                rccenable rccdisable
                G0C1.AES_RNG
  where
  rccenable  = modifyReg rcc_reg_ahbenr $ setBit   rcc_ahbenr_rngen
  rccdisable = modifyReg rcc_reg_ahbenr $ clearBit rcc_ahbenr_rngen

