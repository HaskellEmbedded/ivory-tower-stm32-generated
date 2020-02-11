{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F765.EXTI (exti) where

import Ivory.BSP.STM32F765.MemoryMap
import Ivory.BSP.STM32F765.SYSCFG
import qualified Ivory.BSP.STM32F765.Interrupt as F765

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
      (0, 0, F765.EXTI0)
    , (1, 1, F765.EXTI1)
    , (2, 2, F765.EXTI2)
    , (3, 3, F765.EXTI3)
    , (4, 4, F765.EXTI4)
    , (5, 9, F765.EXTI9_5)
    , (10, 15, F765.EXTI15_10)
  ]
