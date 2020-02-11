{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32G471.EXTI (exti) where

import Ivory.BSP.STM32G471.MemoryMap
import Ivory.BSP.STM32G471.SYSCFG
import qualified Ivory.BSP.STM32G471.Interrupt as G471

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
      (0, 0, G471.EXTI0)
    , (1, 1, G471.EXTI1)
    , (2, 2, G471.EXTI2)
    , (3, 3, G471.EXTI3)
    , (4, 4, G471.EXTI4)
    , (5, 9, G471.EXTI9_5)
    , (10, 15, G471.EXTI15_10)
  ]
