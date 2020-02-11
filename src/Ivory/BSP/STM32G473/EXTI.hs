{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32G473.EXTI (exti) where

import Ivory.BSP.STM32G473.MemoryMap
import Ivory.BSP.STM32G473.SYSCFG
import qualified Ivory.BSP.STM32G473.Interrupt as G473

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
      (0, 0, G473.EXTI0)
    , (1, 1, G473.EXTI1)
    , (2, 2, G473.EXTI2)
    , (3, 3, G473.EXTI3)
    , (4, 4, G473.EXTI4)
    , (5, 9, G473.EXTI9_5)
    , (10, 15, G473.EXTI15_10)
  ]
