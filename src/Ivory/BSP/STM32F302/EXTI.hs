{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F302.EXTI (exti) where

import Ivory.BSP.STM32F302.MemoryMap
import Ivory.BSP.STM32F302.SYSCFG
import qualified Ivory.BSP.STM32F302.Interrupt as F302

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
      (0, 0, F302.EXTI0)
    , (1, 1, F302.EXTI1)
    , (2, 2, F302.EXTI2_TSC)
    , (3, 3, F302.EXTI3)
    , (4, 4, F302.EXTI4)
    , (5, 9, F302.EXTI9_5)
    , (10, 15, F302.EXTI15_10)
  ]
