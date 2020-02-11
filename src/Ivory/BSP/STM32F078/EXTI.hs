{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F078.EXTI (exti) where

import Ivory.BSP.STM32F078.MemoryMap
import Ivory.BSP.STM32F078.SYSCFG
import qualified Ivory.BSP.STM32F078.Interrupt as F078

import Ivory.BSP.STM32.Peripheral.EXTI

exti :: EXTI
exti = mkEXTIVersion
  V1
  exti_periph_base
  (syscfgRCCEnable syscfg)
  (syscfgRCCDisable syscfg)
  (cvtReg $ syscfgRegEXTICR1 syscfg)
  (cvtReg $ syscfgRegEXTICR2 syscfg)
  (cvtReg $ syscfgRegEXTICR3 syscfg)
  (cvtReg $ syscfgRegEXTICR4 syscfg)
  [
      (0, 1, F078.EXTI0_1)
    , (2, 3, F078.EXTI2_3)
    , (4, 15, F078.EXTI4_15)
  ]
