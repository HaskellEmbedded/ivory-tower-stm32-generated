module Ivory.BSP.STM32F328.RTC (
    rtc
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F328.RCC
import Ivory.BSP.STM32F328.MemoryMap
import qualified Ivory.BSP.STM32F328.Interrupt as F328

import Ivory.BSP.STM32.Peripheral.RTC

rtc :: RTC
rtc = mkRTC
  rtc_periph_base
  rccenable rccdisable
  -- F328.RTC_WKUP F328.RTC_ALARM_IT
  where
  rccenable  = modifyReg rcc_reg_bdcr $ setBit   rcc_bdcr_rtcen
  rccdisable = modifyReg rcc_reg_bdcr $ clearBit rcc_bdcr_rtcen

