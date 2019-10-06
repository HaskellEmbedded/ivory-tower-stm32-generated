module Ivory.BSP.STM32G041.RNG (
    rng
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32G041.RCC
import Ivory.BSP.STM32G041.MemoryMap
import qualified Ivory.BSP.STM32G041.Interrupt as G041

import Ivory.BSP.STM32.Peripheral.RNG

rng :: RNG
rng = mkRNG rng_periph_base
                rccenable rccdisable
                G041.AES_RNG
  where
  rccenable  = modifyReg rcc_reg_ahbenr $ setBit   rcc_ahbenr_rngen
  rccdisable = modifyReg rcc_reg_ahbenr $ clearBit rcc_ahbenr_rngen

