module Ivory.BSP.STM32L451.RTC (
    rtc
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32L451.RCC
import Ivory.BSP.STM32L451.MemoryMap
import qualified Ivory.BSP.STM32L451.Interrupt as L451

import Ivory.BSP.STM32.Peripheral.RTC

rtc :: RTC
rtc = mkRTC
  rtc_periph_base
  rccenable rccdisable
  -- L451.RTC_TAMP_STAMP L451.RTC_WKUP L451.RTC_ALARM
  where
  rccenable  = modifyReg rcc_reg_bdcr $ setBit   rcc_bdcr_rtcen
  rccdisable = modifyReg rcc_reg_bdcr $ clearBit rcc_bdcr_rtcen

