{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F427.EXTI (exti) where

import Ivory.BSP.STM32F427.MemoryMap
import Ivory.BSP.STM32F427.SYSCFG
import qualified Ivory.BSP.STM32F427.Interrupt as F427

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
      (0, 0, F427.EXTI0)
    , (1, 1, F427.EXTI1)
    , (2, 2, F427.EXTI2)
    , (3, 3, F427.EXTI3)
    , (4, 4, F427.EXTI4)
    , (5, 9, F427.EXTI9_5)
    , (10, 15, F427.EXTI15_10)
  ]
