{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32L496.EXTI (exti) where

import Ivory.BSP.STM32L496.MemoryMap
import Ivory.BSP.STM32L496.SYSCFG
import qualified Ivory.BSP.STM32L496.Interrupt as L496

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
      (0, 0, L496.EXTI0)
    , (1, 1, L496.EXTI1)
    , (2, 2, L496.EXTI2)
    , (3, 3, L496.EXTI3)
    , (4, 4, L496.EXTI4)
    , (5, 9, L496.EXTI9_5)
    , (10, 15, L496.EXTI15_10)
  ]
