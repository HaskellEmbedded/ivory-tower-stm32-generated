module Ivory.BSP.STM32L4S7.RTC (
    rtc
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32L4S7.RCC
import Ivory.BSP.STM32L4S7.MemoryMap
-- we don't use RTC interrupts for now
--import qualified Ivory.BSP.STM32L4S7.Interrupt as L4S7

import Ivory.BSP.STM32.Peripheral.RTC

rtc :: RTC
rtc = mkRTC
  rtc_periph_base
  rccenable rccdisable
  -- L4S7.RTC_WKUP L4S7.RTC_ALARM
  where
  rccenable  = modifyReg rcc_reg_bdcr $ setBit   rcc_bdcr_rtcen
  rccdisable = modifyReg rcc_reg_bdcr $ clearBit rcc_bdcr_rtcen

