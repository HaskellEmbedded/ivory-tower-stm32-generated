module Ivory.BSP.STM32L431.RTC (
    rtc
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32L431.RCC
import Ivory.BSP.STM32L431.MemoryMap
-- we don't use RTC interrupts for now
--import qualified Ivory.BSP.STM32L431.Interrupt as L431

import Ivory.BSP.STM32.Peripheral.RTC

rtc :: RTC
rtc = mkRTC
  rtc_periph_base
  rccenable rccdisable
  -- L431.RTC_TAMP_STAMP L431.RTC_WKUP L431.RTC_ALARM
  where
  rccenable  = modifyReg rcc_reg_bdcr $ setBit   rcc_bdcr_rtcen
  rccdisable = modifyReg rcc_reg_bdcr $ clearBit rcc_bdcr_rtcen

