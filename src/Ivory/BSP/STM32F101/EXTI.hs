{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F101.EXTI (exti) where

import Ivory.BSP.STM32F101.MemoryMap
import Ivory.BSP.STM32F101.AFIO
import qualified Ivory.BSP.STM32F101.Interrupt as F101

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
      (0, 0, F101.EXTI0)
    , (1, 1, F101.EXTI1)
    , (2, 2, F101.EXTI2)
    , (3, 3, F101.EXTI3)
    , (4, 4, F101.EXTI4)
    , (5, 9, F101.EXTI9_5)
    , (10, 15, F101.EXTI15_10)
  ]
