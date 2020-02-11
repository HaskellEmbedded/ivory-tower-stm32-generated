module Ivory.BSP.STM32F358.RTC (
    rtc
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F358.RCC
import Ivory.BSP.STM32F358.MemoryMap
import qualified Ivory.BSP.STM32F358.Interrupt as F358

import Ivory.BSP.STM32.Peripheral.RTC

rtc :: RTC
rtc = mkRTC
  rtc_periph_base
  rccenable rccdisable
  -- F358.RTC_WKUP F358.RTC_ALARM_IT
  where
  rccenable  = modifyReg rcc_reg_bdcr $ setBit   rcc_bdcr_rtcen
  rccdisable = modifyReg rcc_reg_bdcr $ clearBit rcc_bdcr_rtcen

