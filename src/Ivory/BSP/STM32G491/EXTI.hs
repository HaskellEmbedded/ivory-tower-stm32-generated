{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32G491.EXTI (exti) where

import Ivory.BSP.STM32G491.MemoryMap
import Ivory.BSP.STM32G491.SYSCFG
import qualified Ivory.BSP.STM32G491.Interrupt as G491

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
      (0, 0, G491.EXTI0)
    , (1, 1, G491.EXTI1)
    , (2, 2, G491.EXTI2)
    , (3, 3, G491.EXTI3)
    , (4, 4, G491.EXTI4)
    , (5, 9, G491.EXTI9_5)
    , (10, 15, G491.EXTI15_10)
  ]
