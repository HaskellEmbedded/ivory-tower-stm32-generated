{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F318.EXTI (exti) where

import Ivory.BSP.STM32F318.MemoryMap
import Ivory.BSP.STM32F318.SYSCFG
import qualified Ivory.BSP.STM32F318.Interrupt as F318

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
      (0, 0, F318.EXTI0)
    , (1, 1, F318.EXTI1)
    , (2, 2, F318.EXTI2_TSC)
    , (3, 3, F318.EXTI3)
    , (4, 4, F318.EXTI4)
    , (5, 9, F318.EXTI9_5)
    , (10, 15, F318.EXTI15_10)
  ]
