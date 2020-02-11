module Ivory.BSP.STM32F398.RTC (
    rtc
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F398.RCC
import Ivory.BSP.STM32F398.MemoryMap
import qualified Ivory.BSP.STM32F398.Interrupt as F398

import Ivory.BSP.STM32.Peripheral.RTC

rtc :: RTC
rtc = mkRTC
  rtc_periph_base
  rccenable rccdisable
  -- F398.RTC_WKUP F398.RTC_ALARM_IT
  where
  rccenable  = modifyReg rcc_reg_bdcr $ setBit   rcc_bdcr_rtcen
  rccdisable = modifyReg rcc_reg_bdcr $ clearBit rcc_bdcr_rtcen

