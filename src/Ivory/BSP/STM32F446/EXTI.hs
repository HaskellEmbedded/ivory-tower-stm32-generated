{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F446.EXTI (exti) where

import Ivory.BSP.STM32F446.MemoryMap
import Ivory.BSP.STM32F446.SYSCFG
import qualified Ivory.BSP.STM32F446.Interrupt as F446

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
      (0, 0, F446.EXTI0)
    , (1, 1, F446.EXTI1)
    , (2, 2, F446.EXTI2)
    , (3, 3, F446.EXTI3)
    , (4, 4, F446.EXTI4)
    , (5, 9, F446.EXTI9_5)
    , (10, 15, F446.EXTI15_10)
  ]
