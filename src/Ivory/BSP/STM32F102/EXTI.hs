{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F102.EXTI (exti) where

import Ivory.BSP.STM32F102.MemoryMap
import Ivory.BSP.STM32F102.AFIO
import qualified Ivory.BSP.STM32F102.Interrupt as F102

import Ivory.BSP.STM32.Peripheral.EXTI

exti :: EXTI
exti = mkEXTIVersion
  V1
  exti_periph_base
  (afioRCCEnable afio)
  (afioRCCDisable afio)
  (cvtReg $ afioRegEXTICR1 afio)
  (cvtReg $ afioRegEXTICR2 afio)
  (cvtReg $ afioRegEXTICR3 afio)
  (cvtReg $ afioRegEXTICR4 afio)
  [
      (0, 0, F102.EXTI0)
    , (1, 1, F102.EXTI1)
    , (2, 2, F102.EXTI2)
    , (3, 3, F102.EXTI3)
    , (4, 4, F102.EXTI4)
    , (5, 9, F102.EXTI9_5)
    , (10, 15, F102.EXTI15_10)
  ]
