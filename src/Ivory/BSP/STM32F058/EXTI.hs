{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F058.EXTI (exti) where

import Ivory.BSP.STM32F058.MemoryMap
import Ivory.BSP.STM32F058.SYSCFG
import qualified Ivory.BSP.STM32F058.Interrupt as F058

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
      (0, 1, F058.EXTI0_1)
    , (2, 3, F058.EXTI2_3)
    , (4, 15, F058.EXTI4_15)
  ]
