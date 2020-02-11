{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F107.EXTI (exti) where

import Ivory.BSP.STM32F107.MemoryMap
import Ivory.BSP.STM32F107.AFIO
import qualified Ivory.BSP.STM32F107.Interrupt as F107

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
      (0, 0, F107.EXTI0)
    , (1, 1, F107.EXTI1)
    , (2, 2, F107.EXTI2)
    , (3, 3, F107.EXTI3)
    , (4, 4, F107.EXTI4)
    , (5, 9, F107.EXTI9_5)
    , (10, 15, F107.EXTI15_10)
  ]
