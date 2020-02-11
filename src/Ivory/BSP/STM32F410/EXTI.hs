{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F410.EXTI (exti) where

import Ivory.BSP.STM32F410.MemoryMap
import Ivory.BSP.STM32F410.SYSCFG
import qualified Ivory.BSP.STM32F410.Interrupt as F410

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
      (0, 0, F410.EXTI0)
    , (1, 1, F410.EXTI1)
    , (2, 2, F410.EXTI2)
    , (3, 3, F410.EXTI3)
    , (4, 4, F410.EXTI4)
    , (5, 9, F410.EXTI9_5)
    , (10, 15, F410.EXTI15_10)
    , (17, 17, F410.EXTI17_RTC_ALARM)
  ]
