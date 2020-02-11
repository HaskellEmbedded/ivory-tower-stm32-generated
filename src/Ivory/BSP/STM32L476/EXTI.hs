{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32L476.EXTI (exti) where

import Ivory.BSP.STM32L476.MemoryMap
import Ivory.BSP.STM32L476.SYSCFG
import qualified Ivory.BSP.STM32L476.Interrupt as L476

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
      (0, 0, L476.EXTI0)
    , (1, 1, L476.EXTI1)
    , (2, 2, L476.EXTI2)
    , (3, 3, L476.EXTI3)
    , (4, 4, L476.EXTI4)
    , (5, 9, L476.EXTI9_5)
    , (10, 15, L476.EXTI15_10)
  ]
