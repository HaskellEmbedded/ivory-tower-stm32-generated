{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32L443.EXTI (exti) where

import Ivory.BSP.STM32L443.MemoryMap
import Ivory.BSP.STM32L443.SYSCFG
import qualified Ivory.BSP.STM32L443.Interrupt as L443

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
      (0, 0, L443.EXTI0)
    , (1, 1, L443.EXTI1)
    , (2, 2, L443.EXTI2)
    , (3, 3, L443.EXTI3)
    , (4, 4, L443.EXTI4)
    , (5, 9, L443.EXTI9_5)
    , (10, 15, L443.EXTI15_10)
  ]
