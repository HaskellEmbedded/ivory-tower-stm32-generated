{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32G474.EXTI (exti) where

import Ivory.BSP.STM32G474.MemoryMap
import Ivory.BSP.STM32G474.SYSCFG
import qualified Ivory.BSP.STM32G474.Interrupt as G474

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
      (0, 0, G474.EXTI0)
    , (1, 1, G474.EXTI1)
    , (2, 2, G474.EXTI2)
    , (3, 3, G474.EXTI3)
    , (4, 4, G474.EXTI4)
    , (5, 9, G474.EXTI9_5)
    , (10, 15, G474.EXTI15_10)
  ]
