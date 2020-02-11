{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F328.EXTI (exti) where

import Ivory.BSP.STM32F328.MemoryMap
import Ivory.BSP.STM32F328.SYSCFG
import qualified Ivory.BSP.STM32F328.Interrupt as F328

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
      (0, 0, F328.EXTI0)
    , (1, 1, F328.EXTI1)
    , (2, 2, F328.EXTI2_TSC)
    , (3, 3, F328.EXTI3)
    , (4, 4, F328.EXTI4)
    , (5, 9, F328.EXTI9_5)
    , (10, 15, F328.EXTI15_10)
  ]
