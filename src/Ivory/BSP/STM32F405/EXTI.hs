{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F405.EXTI (exti) where

import Ivory.BSP.STM32F405.MemoryMap
import Ivory.BSP.STM32F405.SYSCFG
import qualified Ivory.BSP.STM32F405.Interrupt as F405

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
      (0, 0, F405.EXTI0)
    , (1, 1, F405.EXTI1)
    , (2, 2, F405.EXTI2)
    , (3, 3, F405.EXTI3)
    , (4, 4, F405.EXTI4)
    , (5, 9, F405.EXTI9_5)
    , (10, 15, F405.EXTI15_10)
  ]
