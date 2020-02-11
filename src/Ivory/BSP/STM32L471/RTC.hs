module Ivory.BSP.STM32L471.RTC (
    rtc
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32L471.RCC
import Ivory.BSP.STM32L471.MemoryMap
import qualified Ivory.BSP.STM32L471.Interrupt as L471

import Ivory.BSP.STM32.Peripheral.RTC

rtc :: RTC
rtc = mkRTC
  rtc_periph_base
  rccenable rccdisable
  -- L471.RTC_TAMP_STAMP L471.RTC_WKUP L471.RTC_ALARM
  where
  rccenable  = modifyReg rcc_reg_bdcr $ setBit   rcc_bdcr_rtcen
  rccdisable = modifyReg rcc_reg_bdcr $ clearBit rcc_bdcr_rtcen

