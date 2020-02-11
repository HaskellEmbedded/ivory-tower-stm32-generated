{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32L486.EXTI (exti) where

import Ivory.BSP.STM32L486.MemoryMap
import Ivory.BSP.STM32L486.SYSCFG
import qualified Ivory.BSP.STM32L486.Interrupt as L486

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
      (0, 0, L486.EXTI0)
    , (1, 1, L486.EXTI1)
    , (2, 2, L486.EXTI2)
    , (3, 3, L486.EXTI3)
    , (4, 4, L486.EXTI4)
    , (5, 9, L486.EXTI9_5)
    , (10, 15, L486.EXTI15_10)
  ]
