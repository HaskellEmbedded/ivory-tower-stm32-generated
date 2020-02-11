{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F778.EXTI (exti) where

import Ivory.BSP.STM32F778.MemoryMap
import Ivory.BSP.STM32F778.SYSCFG
import qualified Ivory.BSP.STM32F778.Interrupt as F778

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
      (0, 0, F778.EXTI0)
    , (1, 1, F778.EXTI1)
    , (2, 2, F778.EXTI2)
    , (3, 3, F778.EXTI3)
    , (4, 4, F778.EXTI4)
    , (5, 9, F778.EXTI9_5)
    , (10, 15, F778.EXTI15_10)
  ]
