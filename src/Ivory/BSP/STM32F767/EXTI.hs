{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F767.EXTI (exti) where

import Ivory.BSP.STM32F767.MemoryMap
import Ivory.BSP.STM32F767.SYSCFG
import qualified Ivory.BSP.STM32F767.Interrupt as F767

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
      (0, 0, F767.EXTI0)
    , (1, 1, F767.EXTI1)
    , (2, 2, F767.EXTI2)
    , (3, 3, F767.EXTI3)
    , (4, 4, F767.EXTI4)
    , (5, 9, F767.EXTI9_5)
    , (10, 15, F767.EXTI15_10)
  ]
