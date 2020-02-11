{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F378.EXTI (exti) where

import Ivory.BSP.STM32F378.MemoryMap
import Ivory.BSP.STM32F378.SYSCFG
import qualified Ivory.BSP.STM32F378.Interrupt as F378

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
      (0, 0, F378.EXTI0)
    , (1, 1, F378.EXTI1)
    , (2, 2, F378.EXTI2_TSC)
    , (3, 3, F378.EXTI3)
    , (4, 4, F378.EXTI4)
    , (5, 9, F378.EXTI9_5)
    , (10, 15, F378.EXTI15_10)
  ]
