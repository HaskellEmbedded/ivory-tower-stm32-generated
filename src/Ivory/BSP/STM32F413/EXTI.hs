{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F413.EXTI (exti) where

import Ivory.BSP.STM32F413.MemoryMap
import Ivory.BSP.STM32F413.SYSCFG
import qualified Ivory.BSP.STM32F413.Interrupt as F413

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
      (0, 0, F413.EXTI0)
    , (1, 1, F413.EXTI1)
    , (2, 2, F413.EXTI2)
    , (3, 3, F413.EXTI3)
    , (4, 4, F413.EXTI4)
    , (5, 9, F413.EXTI9_5)
    , (10, 15, F413.EXTI15_10)
    , (17, 17, F413.EXTI17_RTC_ALARM)
  ]
