{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F745.EXTI (exti) where

import Ivory.BSP.STM32F745.MemoryMap
import Ivory.BSP.STM32F745.SYSCFG
import qualified Ivory.BSP.STM32F745.Interrupt as F745

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
      (0, 0, F745.EXTI0)
    , (1, 1, F745.EXTI1)
    , (2, 2, F745.EXTI2)
    , (3, 3, F745.EXTI3)
    , (4, 4, F745.EXTI4)
    , (5, 9, F745.EXTI9_5)
    , (10, 15, F745.EXTI15_10)
  ]
