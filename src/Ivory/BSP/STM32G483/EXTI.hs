{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32G483.EXTI (exti) where

import Ivory.BSP.STM32G483.MemoryMap
import Ivory.BSP.STM32G483.SYSCFG
import qualified Ivory.BSP.STM32G483.Interrupt as G483

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
      (0, 0, G483.EXTI0)
    , (1, 1, G483.EXTI1)
    , (2, 2, G483.EXTI2)
    , (3, 3, G483.EXTI3)
    , (4, 4, G483.EXTI4)
    , (5, 9, G483.EXTI9_5)
    , (10, 15, G483.EXTI15_10)
  ]
