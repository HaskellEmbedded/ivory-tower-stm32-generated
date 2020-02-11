{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32G431.EXTI (exti) where

import Ivory.BSP.STM32G431.MemoryMap
import Ivory.BSP.STM32G431.SYSCFG
import qualified Ivory.BSP.STM32G431.Interrupt as G431

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
      (0, 0, G431.EXTI0)
    , (1, 1, G431.EXTI1)
    , (2, 2, G431.EXTI2)
    , (3, 3, G431.EXTI3)
    , (4, 4, G431.EXTI4)
    , (5, 9, G431.EXTI9_5)
    , (10, 15, G431.EXTI15_10)
  ]
