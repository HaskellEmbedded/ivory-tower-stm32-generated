{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F301.EXTI (exti) where

import Ivory.BSP.STM32F301.MemoryMap
import Ivory.BSP.STM32F301.SYSCFG
import qualified Ivory.BSP.STM32F301.Interrupt as F301

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
      (0, 0, F301.EXTI0)
    , (1, 1, F301.EXTI1)
    , (2, 2, F301.EXTI2_RI)
    , (3, 3, F301.EXTI3)
    , (4, 4, F301.EXTI4)
    , (5, 9, F301.EXTI5_9)
    , (10, 15, F301.EXTI15_10)
  ]
