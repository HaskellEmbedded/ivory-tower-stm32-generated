module Ivory.BSP.STM32L442.RTC (
    rtc
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32L442.RCC
import Ivory.BSP.STM32L442.MemoryMap
import qualified Ivory.BSP.STM32L442.Interrupt as L442

import Ivory.BSP.STM32.Peripheral.RTC

rtc :: RTC
rtc = mkRTC
  rtc_periph_base
  rccenable rccdisable
  -- L442.RTC_TAMP_STAMP L442.RTC_WKUP L442.RTC_ALARM
  where
  rccenable  = modifyReg rcc_reg_bdcr $ setBit   rcc_bdcr_rtcen
  rccdisable = modifyReg rcc_reg_bdcr $ clearBit rcc_bdcr_rtcen

