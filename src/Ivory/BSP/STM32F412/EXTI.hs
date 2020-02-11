{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32F412.EXTI (exti) where

import Ivory.BSP.STM32F412.MemoryMap
import Ivory.BSP.STM32F412.SYSCFG
import qualified Ivory.BSP.STM32F412.Interrupt as F412

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
      (0, 0, F412.EXTI0)
    , (1, 1, F412.EXTI1)
    , (2, 2, F412.EXTI2)
    , (3, 3, F412.EXTI3)
    , (4, 4, F412.EXTI4)
    , (5, 9, F412.EXTI9_5)
    , (10, 15, F412.EXTI15_10)
    , (17, 17, F412.EXTI17_RTC_ALARM)
  ]
