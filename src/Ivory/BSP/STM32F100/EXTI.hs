{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F100.EXTI (exti) where

import Ivory.BSP.STM32F100.MemoryMap
import Ivory.BSP.STM32F100.AFIO
import qualified Ivory.BSP.STM32F100.Interrupt as F100

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
      (0, 0, F100.EXTI0)
    , (1, 1, F100.EXTI1)
    , (2, 2, F100.EXTI2)
    , (3, 3, F100.EXTI3)
    , (4, 4, F100.EXTI4)
    , (5, 9, F100.EXTI9_5)
    , (10, 15, F100.EXTI15_10)
  ]
