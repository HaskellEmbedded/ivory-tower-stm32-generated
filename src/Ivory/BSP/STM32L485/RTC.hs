module Ivory.BSP.STM32L485.RTC (
    rtc
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32L485.RCC
import Ivory.BSP.STM32L485.MemoryMap
import qualified Ivory.BSP.STM32L485.Interrupt as L485

import Ivory.BSP.STM32.Peripheral.RTC

rtc :: RTC
rtc = mkRTC
  rtc_periph_base
  rccenable rccdisable
  -- L485.RTC_TAMP_STAMP L485.RTC_WKUP L485.RTC_ALARM
  where
  rccenable  = modifyReg rcc_reg_bdcr $ setBit   rcc_bdcr_rtcen
  rccdisable = modifyReg rcc_reg_bdcr $ clearBit rcc_bdcr_rtcen

