{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32G441.EXTI (exti) where

import Ivory.BSP.STM32G441.MemoryMap
import Ivory.BSP.STM32G441.SYSCFG
import qualified Ivory.BSP.STM32G441.Interrupt as G441

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
      (0, 0, G441.EXTI0)
    , (1, 1, G441.EXTI1)
    , (2, 2, G441.EXTI2)
    , (3, 3, G441.EXTI3)
    , (4, 4, G441.EXTI4)
    , (5, 9, G441.EXTI9_5)
    , (10, 15, G441.EXTI15_10)
  ]
