{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F756.EXTI (exti) where

import Ivory.BSP.STM32F756.MemoryMap
import Ivory.BSP.STM32F756.SYSCFG
import qualified Ivory.BSP.STM32F756.Interrupt as F756

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
      (0, 0, F756.EXTI0)
    , (1, 1, F756.EXTI1)
    , (2, 2, F756.EXTI2)
    , (3, 3, F756.EXTI3)
    , (4, 4, F756.EXTI4)
    , (5, 9, F756.EXTI9_5)
    , (10, 15, F756.EXTI15_10)
  ]
