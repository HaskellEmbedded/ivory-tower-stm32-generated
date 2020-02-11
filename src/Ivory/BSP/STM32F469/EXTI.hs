{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F469.EXTI (exti) where

import Ivory.BSP.STM32F469.MemoryMap
import Ivory.BSP.STM32F469.SYSCFG
import qualified Ivory.BSP.STM32F469.Interrupt as F469

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
      (0, 0, F469.EXTI0)
    , (1, 1, F469.EXTI1)
    , (2, 2, F469.EXTI2)
    , (3, 3, F469.EXTI3)
    , (4, 4, F469.EXTI4)
    , (5, 9, F469.EXTI9_5)
    , (10, 15, F469.EXTI15_10)
  ]
