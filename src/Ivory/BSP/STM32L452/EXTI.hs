{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32L452.EXTI (exti) where

import Ivory.BSP.STM32L452.MemoryMap
import Ivory.BSP.STM32L452.SYSCFG
import qualified Ivory.BSP.STM32L452.Interrupt as L452

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
      (0, 0, L452.EXTI0)
    , (1, 1, L452.EXTI1)
    , (2, 2, L452.EXTI2)
    , (3, 3, L452.EXTI3)
    , (4, 4, L452.EXTI4)
    , (5, 9, L452.EXTI9_5)
    , (10, 15, L452.EXTI15_10)
  ]
