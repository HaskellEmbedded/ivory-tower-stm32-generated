{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32L422.EXTI (exti) where

import Ivory.BSP.STM32L422.MemoryMap
import Ivory.BSP.STM32L422.SYSCFG
import qualified Ivory.BSP.STM32L422.Interrupt as L422

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
      (0, 0, L422.EXTI0)
    , (1, 1, L422.EXTI1)
    , (2, 2, L422.EXTI2)
    , (3, 3, L422.EXTI3)
    , (4, 4, L422.EXTI4)
    , (5, 9, L422.EXTI9_5)
    , (10, 15, L422.EXTI15_10)
  ]
