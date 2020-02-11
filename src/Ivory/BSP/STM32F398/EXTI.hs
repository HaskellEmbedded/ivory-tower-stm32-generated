{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F398.EXTI (exti) where

import Ivory.BSP.STM32F398.MemoryMap
import Ivory.BSP.STM32F398.SYSCFG
import qualified Ivory.BSP.STM32F398.Interrupt as F398

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
      (0, 0, F398.EXTI0)
    , (1, 1, F398.EXTI1)
    , (2, 2, F398.EXTI2_TSC)
    , (3, 3, F398.EXTI3)
    , (4, 4, F398.EXTI4)
    , (5, 9, F398.EXTI9_5)
    , (10, 15, F398.EXTI15_10)
  ]
