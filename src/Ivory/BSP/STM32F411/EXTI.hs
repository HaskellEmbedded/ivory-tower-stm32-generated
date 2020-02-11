{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F411.EXTI (exti) where

import Ivory.BSP.STM32F411.MemoryMap
import Ivory.BSP.STM32F411.SYSCFG
import qualified Ivory.BSP.STM32F411.Interrupt as F411

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
      (0, 0, F411.EXTI0)
    , (1, 1, F411.EXTI1)
    , (2, 2, F411.EXTI2)
    , (3, 3, F411.EXTI3)
    , (4, 4, F411.EXTI4)
    , (5, 9, F411.EXTI9_5)
    , (10, 15, F411.EXTI15_10)
    , (17, 17, F411.EXTI17_RTC_ALARM)
  ]
