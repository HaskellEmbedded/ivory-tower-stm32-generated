{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F401.EXTI (exti) where

import Ivory.BSP.STM32F401.MemoryMap
import Ivory.BSP.STM32F401.SYSCFG
import qualified Ivory.BSP.STM32F401.Interrupt as F401

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
      (0, 0, F401.EXTI0)
    , (1, 1, F401.EXTI1)
    , (2, 2, F401.EXTI2)
    , (3, 3, F401.EXTI3)
    , (4, 4, F401.EXTI4)
    , (5, 9, F401.EXTI9_5)
    , (10, 15, F401.EXTI15_10)
  ]
