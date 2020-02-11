{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F051.EXTI (exti) where

import Ivory.BSP.STM32F051.MemoryMap
import Ivory.BSP.STM32F051.SYSCFG
import qualified Ivory.BSP.STM32F051.Interrupt as F051

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
      (0, 1, F051.EXTI0_1)
    , (2, 3, F051.EXTI2_3)
    , (4, 15, F051.EXTI4_15)
  ]
