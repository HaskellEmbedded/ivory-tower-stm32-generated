{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F730.EXTI (exti) where

import Ivory.BSP.STM32F730.MemoryMap
import Ivory.BSP.STM32F730.SYSCFG
import qualified Ivory.BSP.STM32F730.Interrupt as F730

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
      (0, 0, F730.EXTI0)
    , (1, 1, F730.EXTI1)
    , (2, 2, F730.EXTI2)
    , (3, 3, F730.EXTI3)
    , (4, 4, F730.EXTI4)
    , (5, 9, F730.EXTI9_5)
    , (10, 15, F730.EXTI15_10)
  ]
