{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F777.EXTI (exti) where

import Ivory.BSP.STM32F777.MemoryMap
import Ivory.BSP.STM32F777.SYSCFG
import qualified Ivory.BSP.STM32F777.Interrupt as F777

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
      (0, 0, F777.EXTI0)
    , (1, 1, F777.EXTI1)
    , (2, 2, F777.EXTI2)
    , (3, 3, F777.EXTI3)
    , (4, 4, F777.EXTI4)
    , (5, 9, F777.EXTI9_5)
    , (10, 15, F777.EXTI15_10)
  ]
