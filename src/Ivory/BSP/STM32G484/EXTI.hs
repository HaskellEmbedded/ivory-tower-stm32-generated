{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32G484.EXTI (exti) where

import Ivory.BSP.STM32G484.MemoryMap
import Ivory.BSP.STM32G484.SYSCFG
import qualified Ivory.BSP.STM32G484.Interrupt as G484

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
      (0, 0, G484.EXTI0)
    , (1, 1, G484.EXTI1)
    , (2, 2, G484.EXTI2)
    , (3, 3, G484.EXTI3)
    , (4, 4, G484.EXTI4)
    , (5, 9, G484.EXTI9_5)
    , (10, 15, G484.EXTI15_10)
  ]
