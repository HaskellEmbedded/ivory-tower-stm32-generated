{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32L412.EXTI (exti) where

import Ivory.BSP.STM32L412.MemoryMap
import Ivory.BSP.STM32L412.SYSCFG
import qualified Ivory.BSP.STM32L412.Interrupt as L412

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
      (0, 0, L412.EXTI0)
    , (1, 1, L412.EXTI1)
    , (2, 2, L412.EXTI2)
    , (3, 3, L412.EXTI3)
    , (4, 4, L412.EXTI4)
    , (5, 9, L412.EXTI9_5)
    , (10, 15, L412.EXTI15_10)
  ]
