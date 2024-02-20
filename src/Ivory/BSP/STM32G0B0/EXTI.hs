{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32G0B0.EXTI (exti) where

import Ivory.BSP.STM32G0B0.MemoryMap
import qualified Ivory.BSP.STM32G0B0.Interrupt as G0B0

import Ivory.BSP.STM32.Peripheral.EXTI

exti :: EXTI
exti = mkEXTIVersion
  V2
  exti_periph_base
  undefined -- syscfg rcc enable not required
  undefined -- syscfg rcc disable not required
  undefined -- extiCRx is set via `fix` in EXTIv2.Peripheral to point to internal regs
  undefined
  undefined
  undefined
  [
      (0, 1, G0B0.EXTI0_1)
    , (2, 3, G0B0.EXTI2_3)
    , (4, 15, G0B0.EXTI4_15)
  ]
