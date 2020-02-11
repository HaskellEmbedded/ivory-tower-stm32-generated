{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32L432.EXTI (exti) where

import Ivory.BSP.STM32L432.MemoryMap
import Ivory.BSP.STM32L432.SYSCFG
import qualified Ivory.BSP.STM32L432.Interrupt as L432

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
      (0, 0, L432.EXTI0)
    , (1, 1, L432.EXTI1)
    , (2, 2, L432.EXTI2)
    , (3, 3, L432.EXTI3)
    , (4, 4, L432.EXTI4)
    , (5, 9, L432.EXTI9_5)
    , (10, 15, L432.EXTI15_10)
  ]
