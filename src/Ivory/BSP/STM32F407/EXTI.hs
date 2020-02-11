{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F407.EXTI (exti) where

import Ivory.BSP.STM32F407.MemoryMap
import Ivory.BSP.STM32F407.SYSCFG
import qualified Ivory.BSP.STM32F407.Interrupt as F407

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
      (0, 0, F407.EXTI0)
    , (1, 1, F407.EXTI1)
    , (2, 2, F407.EXTI2)
    , (3, 3, F407.EXTI3)
    , (4, 4, F407.EXTI4)
    , (5, 9, F407.EXTI9_5)
    , (10, 15, F407.EXTI15_10)
  ]
