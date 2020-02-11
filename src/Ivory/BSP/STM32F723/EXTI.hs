{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F723.EXTI (exti) where

import Ivory.BSP.STM32F723.MemoryMap
import Ivory.BSP.STM32F723.SYSCFG
import qualified Ivory.BSP.STM32F723.Interrupt as F723

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
      (0, 0, F723.EXTI0)
    , (1, 1, F723.EXTI1)
    , (2, 2, F723.EXTI2)
    , (3, 3, F723.EXTI3)
    , (4, 4, F723.EXTI4)
    , (5, 9, F723.EXTI9_5)
    , (10, 15, F723.EXTI15_10)
  ]
