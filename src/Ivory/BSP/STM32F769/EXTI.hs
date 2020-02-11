{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F769.EXTI (exti) where

import Ivory.BSP.STM32F769.MemoryMap
import Ivory.BSP.STM32F769.SYSCFG
import qualified Ivory.BSP.STM32F769.Interrupt as F769

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
      (0, 0, F769.EXTI0)
    , (1, 1, F769.EXTI1)
    , (2, 2, F769.EXTI2)
    , (3, 3, F769.EXTI3)
    , (4, 4, F769.EXTI4)
    , (5, 9, F769.EXTI9_5)
    , (10, 15, F769.EXTI15_10)
  ]
