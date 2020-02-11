{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F031.EXTI (exti) where

import Ivory.BSP.STM32F031.MemoryMap
import Ivory.BSP.STM32F031.SYSCFG
import qualified Ivory.BSP.STM32F031.Interrupt as F031

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
      (0, 1, F031.EXTI0_1)
    , (2, 3, F031.EXTI2_3)
    , (4, 15, F031.EXTI4_15)
  ]
