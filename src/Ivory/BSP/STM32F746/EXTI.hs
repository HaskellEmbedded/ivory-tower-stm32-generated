{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F746.EXTI (exti) where

import Ivory.BSP.STM32F746.MemoryMap
import Ivory.BSP.STM32F746.SYSCFG
import qualified Ivory.BSP.STM32F746.Interrupt as F746

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
      (0, 0, F746.EXTI0)
    , (1, 1, F746.EXTI1)
    , (2, 2, F746.EXTI2)
    , (3, 3, F746.EXTI3)
    , (4, 4, F746.EXTI4)
    , (5, 9, F746.EXTI9_5)
    , (10, 15, F746.EXTI15_10)
  ]
