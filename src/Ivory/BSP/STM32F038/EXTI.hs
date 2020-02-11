{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F038.EXTI (exti) where

import Ivory.BSP.STM32F038.MemoryMap
import Ivory.BSP.STM32F038.SYSCFG
import qualified Ivory.BSP.STM32F038.Interrupt as F038

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
      (0, 1, F038.EXTI0_1)
    , (2, 3, F038.EXTI2_3)
    , (4, 15, F038.EXTI4_15)
  ]
