{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32G070.EXTI (exti) where

import Ivory.BSP.STM32G070.MemoryMap
import qualified Ivory.BSP.STM32G070.Interrupt as G070

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
      (0, 1, G070.EXTI0_1)
    , (2, 3, G070.EXTI2_3)
    , (4, 15, G070.EXTI4_15)
  ]
