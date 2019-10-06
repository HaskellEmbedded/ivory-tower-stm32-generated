module Ivory.BSP.STM32G081.RNG (
    rng
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32G081.RCC
import Ivory.BSP.STM32G081.MemoryMap
import qualified Ivory.BSP.STM32G081.Interrupt as G081

import Ivory.BSP.STM32.Peripheral.RNG

rng :: RNG
rng = mkRNG rng_periph_base
                rccenable rccdisable
                G081.AES_RNG
  where
  rccenable  = modifyReg rcc_reg_ahbenr $ setBit   rcc_ahbenr_rngen
  rccdisable = modifyReg rcc_reg_ahbenr $ clearBit rcc_ahbenr_rngen

