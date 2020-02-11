{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32L4S7.EXTI (exti) where

import Ivory.BSP.STM32L4S7.MemoryMap
import Ivory.BSP.STM32L4S7.SYSCFG
import qualified Ivory.BSP.STM32L4S7.Interrupt as L4S7

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
      (0, 0, L4S7.EXTI0)
    , (1, 1, L4S7.EXTI1)
    , (2, 2, L4S7.EXTI2)
    , (3, 3, L4S7.EXTI3)
    , (4, 4, L4S7.EXTI4)
    , (5, 9, L4S7.EXTI9_5)
    , (10, 15, L4S7.EXTI15_10)
  ]
