{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32L475.EXTI (exti) where

import Ivory.BSP.STM32L475.MemoryMap
import Ivory.BSP.STM32L475.SYSCFG
import qualified Ivory.BSP.STM32L475.Interrupt as L475

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
      (0, 0, L475.EXTI0)
    , (1, 1, L475.EXTI1)
    , (2, 2, L475.EXTI2)
    , (3, 3, L475.EXTI3)
    , (4, 4, L475.EXTI4)
    , (5, 9, L475.EXTI9_5)
    , (10, 15, L475.EXTI15_10)
  ]
