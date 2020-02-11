{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F722.EXTI (exti) where

import Ivory.BSP.STM32F722.MemoryMap
import Ivory.BSP.STM32F722.SYSCFG
import qualified Ivory.BSP.STM32F722.Interrupt as F722

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
      (0, 0, F722.EXTI0)
    , (1, 1, F722.EXTI1)
    , (2, 2, F722.EXTI2)
    , (3, 3, F722.EXTI3)
    , (4, 4, F722.EXTI4)
    , (5, 9, F722.EXTI9_5)
    , (10, 15, F722.EXTI15_10)
  ]
