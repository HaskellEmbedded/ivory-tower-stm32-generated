{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F779.EXTI (exti) where

import Ivory.BSP.STM32F779.MemoryMap
import Ivory.BSP.STM32F779.SYSCFG
import qualified Ivory.BSP.STM32F779.Interrupt as F779

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
      (0, 0, F779.EXTI0)
    , (1, 1, F779.EXTI1)
    , (2, 2, F779.EXTI2)
    , (3, 3, F779.EXTI3)
    , (4, 4, F779.EXTI4)
    , (5, 9, F779.EXTI9_5)
    , (10, 15, F779.EXTI15_10)
  ]
