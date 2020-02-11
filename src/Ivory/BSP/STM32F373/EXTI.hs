{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F373.EXTI (exti) where

import Ivory.BSP.STM32F373.MemoryMap
import Ivory.BSP.STM32F373.SYSCFG
import qualified Ivory.BSP.STM32F373.Interrupt as F373

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
      (0, 0, F373.EXTI0)
    , (1, 1, F373.EXTI1)
    , (2, 2, F373.EXTI2_TS)
    , (3, 3, F373.EXTI3)
    , (4, 4, F373.EXTI4)
    , (5, 9, F373.EXTI5_9)
    , (10, 15, F373.EXTI15_10)
  ]
