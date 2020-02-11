{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F733.EXTI (exti) where

import Ivory.BSP.STM32F733.MemoryMap
import Ivory.BSP.STM32F733.SYSCFG
import qualified Ivory.BSP.STM32F733.Interrupt as F733

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
      (0, 0, F733.EXTI0)
    , (1, 1, F733.EXTI1)
    , (2, 2, F733.EXTI2)
    , (3, 3, F733.EXTI3)
    , (4, 4, F733.EXTI4)
    , (5, 9, F733.EXTI9_5)
    , (10, 15, F733.EXTI15_10)
  ]
