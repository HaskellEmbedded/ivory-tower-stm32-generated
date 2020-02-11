{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32L433.EXTI (exti) where

import Ivory.BSP.STM32L433.MemoryMap
import Ivory.BSP.STM32L433.SYSCFG
import qualified Ivory.BSP.STM32L433.Interrupt as L433

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
      (0, 0, L433.EXTI0)
    , (1, 1, L433.EXTI1)
    , (2, 2, L433.EXTI2)
    , (3, 3, L433.EXTI3)
    , (4, 4, L433.EXTI4)
    , (5, 9, L433.EXTI9_5)
    , (10, 15, L433.EXTI15_10)
  ]
