{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32L442.EXTI (exti) where

import Ivory.BSP.STM32L442.MemoryMap
import Ivory.BSP.STM32L442.SYSCFG
import qualified Ivory.BSP.STM32L442.Interrupt as L442

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
      (0, 0, L442.EXTI0)
    , (1, 1, L442.EXTI1)
    , (2, 2, L442.EXTI2)
    , (3, 3, L442.EXTI3)
    , (4, 4, L442.EXTI4)
    , (5, 9, L442.EXTI9_5)
    , (10, 15, L442.EXTI15_10)
  ]
