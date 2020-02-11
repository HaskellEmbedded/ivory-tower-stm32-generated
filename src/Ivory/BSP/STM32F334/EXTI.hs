{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F334.EXTI (exti) where

import Ivory.BSP.STM32F334.MemoryMap
import Ivory.BSP.STM32F334.SYSCFG
import qualified Ivory.BSP.STM32F334.Interrupt as F334

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
      (0, 0, F334.EXTI0)
    , (1, 1, F334.EXTI1)
    , (2, 2, F334.EXTI2_TSC)
    , (3, 3, F334.EXTI3)
    , (4, 4, F334.EXTI4)
    , (5, 9, F334.EXTI9_5)
    , (10, 15, F334.EXTI15_10)
  ]
