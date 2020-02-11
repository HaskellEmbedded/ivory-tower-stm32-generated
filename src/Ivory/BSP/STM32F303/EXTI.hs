{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F303.EXTI (exti) where

import Ivory.BSP.STM32F303.MemoryMap
import Ivory.BSP.STM32F303.SYSCFG
import qualified Ivory.BSP.STM32F303.Interrupt as F303

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
      (0, 0, F303.EXTI0)
    , (1, 1, F303.EXTI1)
    , (2, 2, F303.EXTI2_TSC)
    , (3, 3, F303.EXTI3)
    , (4, 4, F303.EXTI4)
    , (5, 9, F303.EXTI9_5)
    , (10, 15, F303.EXTI15_10)
  ]
