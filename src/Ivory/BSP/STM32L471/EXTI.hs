{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32L471.EXTI (exti) where

import Ivory.BSP.STM32L471.MemoryMap
import Ivory.BSP.STM32L471.SYSCFG
import qualified Ivory.BSP.STM32L471.Interrupt as L471

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
      (0, 0, L471.EXTI0)
    , (1, 1, L471.EXTI1)
    , (2, 2, L471.EXTI2)
    , (3, 3, L471.EXTI3)
    , (4, 4, L471.EXTI4)
    , (5, 9, L471.EXTI9_5)
    , (10, 15, L471.EXTI15_10)
  ]
