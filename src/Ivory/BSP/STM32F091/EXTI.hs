{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F091.EXTI (exti) where

import Ivory.BSP.STM32F091.MemoryMap
import Ivory.BSP.STM32F091.SYSCFG
import qualified Ivory.BSP.STM32F091.Interrupt as F091

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
      (0, 1, F091.EXTI0_1)
    , (2, 3, F091.EXTI2_3)
    , (4, 15, F091.EXTI4_15)
  ]
