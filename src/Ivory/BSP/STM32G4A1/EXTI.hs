{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32G4A1.EXTI (exti) where

import Ivory.BSP.STM32G4A1.MemoryMap
import Ivory.BSP.STM32G4A1.SYSCFG
import qualified Ivory.BSP.STM32G4A1.Interrupt as G4A1

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
      (0, 0, G4A1.EXTI0)
    , (1, 1, G4A1.EXTI1)
    , (2, 2, G4A1.EXTI2)
    , (3, 3, G4A1.EXTI3)
    , (4, 4, G4A1.EXTI4)
    , (5, 9, G4A1.EXTI9_5)
    , (10, 15, G4A1.EXTI15_10)
  ]
