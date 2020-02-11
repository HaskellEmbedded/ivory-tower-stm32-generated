{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F103.EXTI (exti) where

import Ivory.BSP.STM32F103.MemoryMap
import Ivory.BSP.STM32F103.AFIO
import qualified Ivory.BSP.STM32F103.Interrupt as F103

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
      (0, 0, F103.EXTI0)
    , (1, 1, F103.EXTI1)
    , (2, 2, F103.EXTI2)
    , (3, 3, F103.EXTI3)
    , (4, 4, F103.EXTI4)
    , (5, 9, F103.EXTI9_5)
    , (10, 15, F103.EXTI15_10)
  ]
