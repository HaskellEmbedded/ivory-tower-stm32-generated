{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32L485.EXTI (exti) where

import Ivory.BSP.STM32L485.MemoryMap
import Ivory.BSP.STM32L485.SYSCFG
import qualified Ivory.BSP.STM32L485.Interrupt as L485

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
      (0, 0, L485.EXTI0)
    , (1, 1, L485.EXTI1)
    , (2, 2, L485.EXTI2)
    , (3, 3, L485.EXTI3)
    , (4, 4, L485.EXTI4)
    , (5, 9, L485.EXTI9_5)
    , (10, 15, L485.EXTI15_10)
  ]
