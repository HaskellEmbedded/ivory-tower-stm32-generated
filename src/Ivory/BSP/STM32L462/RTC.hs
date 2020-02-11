module Ivory.BSP.STM32L462.RTC (
    rtc
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32L462.RCC
import Ivory.BSP.STM32L462.MemoryMap
import qualified Ivory.BSP.STM32L462.Interrupt as L462

import Ivory.BSP.STM32.Peripheral.RTC

rtc :: RTC
rtc = mkRTC
  rtc_periph_base
  rccenable rccdisable
  -- L462.RTC_TAMP_STAMP L462.RTC_WKUP L462.RTC_ALARM
  where
  rccenable  = modifyReg rcc_reg_bdcr $ setBit   rcc_bdcr_rtcen
  rccdisable = modifyReg rcc_reg_bdcr $ clearBit rcc_bdcr_rtcen

