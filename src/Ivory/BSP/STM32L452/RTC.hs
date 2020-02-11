module Ivory.BSP.STM32L452.RTC (
    rtc
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32L452.RCC
import Ivory.BSP.STM32L452.MemoryMap
import qualified Ivory.BSP.STM32L452.Interrupt as L452

import Ivory.BSP.STM32.Peripheral.RTC

rtc :: RTC
rtc = mkRTC
  rtc_periph_base
  rccenable rccdisable
  -- L452.RTC_TAMP_STAMP L452.RTC_WKUP L452.RTC_ALARM
  where
  rccenable  = modifyReg rcc_reg_bdcr $ setBit   rcc_bdcr_rtcen
  rccdisable = modifyReg rcc_reg_bdcr $ clearBit rcc_bdcr_rtcen

