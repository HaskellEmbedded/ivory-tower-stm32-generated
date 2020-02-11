{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F429.EXTI (exti) where

import Ivory.BSP.STM32F429.MemoryMap
import Ivory.BSP.STM32F429.SYSCFG
import qualified Ivory.BSP.STM32F429.Interrupt as F429

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
      (0, 0, F429.EXTI0)
    , (1, 1, F429.EXTI1)
    , (2, 2, F429.EXTI2)
    , (3, 3, F429.EXTI3)
    , (4, 4, F429.EXTI4)
    , (5, 9, F429.EXTI9_5)
    , (10, 15, F429.EXTI15_10)
  ]
