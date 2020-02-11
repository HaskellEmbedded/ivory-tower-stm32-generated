{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32L431.EXTI (exti) where

import Ivory.BSP.STM32L431.MemoryMap
import Ivory.BSP.STM32L431.SYSCFG
import qualified Ivory.BSP.STM32L431.Interrupt as L431

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
      (0, 0, L431.EXTI0)
    , (1, 1, L431.EXTI1)
    , (2, 2, L431.EXTI2)
    , (3, 3, L431.EXTI3)
    , (4, 4, L431.EXTI4)
    , (5, 9, L431.EXTI9_5)
    , (10, 15, L431.EXTI15_10)
  ]
