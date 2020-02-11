{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F732.EXTI (exti) where

import Ivory.BSP.STM32F732.MemoryMap
import Ivory.BSP.STM32F732.SYSCFG
import qualified Ivory.BSP.STM32F732.Interrupt as F732

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
      (0, 0, F732.EXTI0)
    , (1, 1, F732.EXTI1)
    , (2, 2, F732.EXTI2)
    , (3, 3, F732.EXTI3)
    , (4, 4, F732.EXTI4)
    , (5, 9, F732.EXTI9_5)
    , (10, 15, F732.EXTI15_10)
  ]
