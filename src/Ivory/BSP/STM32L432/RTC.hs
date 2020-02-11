module Ivory.BSP.STM32L432.RTC (
    rtc
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32L432.RCC
import Ivory.BSP.STM32L432.MemoryMap
import qualified Ivory.BSP.STM32L432.Interrupt as L432

import Ivory.BSP.STM32.Peripheral.RTC

rtc :: RTC
rtc = mkRTC
  rtc_periph_base
  rccenable rccdisable
  -- L432.RTC_TAMP_STAMP L432.RTC_WKUP L432.RTC_ALARM
  where
  rccenable  = modifyReg rcc_reg_bdcr $ setBit   rcc_bdcr_rtcen
  rccdisable = modifyReg rcc_reg_bdcr $ clearBit rcc_bdcr_rtcen

