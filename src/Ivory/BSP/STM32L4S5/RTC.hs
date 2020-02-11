module Ivory.BSP.STM32L4S5.RTC (
    rtc
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32L4S5.RCC
import Ivory.BSP.STM32L4S5.MemoryMap
import qualified Ivory.BSP.STM32L4S5.Interrupt as L4S5

import Ivory.BSP.STM32.Peripheral.RTC

rtc :: RTC
rtc = mkRTC
  rtc_periph_base
  rccenable rccdisable
  -- L4S5.RTC_WKUP L4S5.RTC_ALARM
  where
  rccenable  = modifyReg rcc_reg_bdcr $ setBit   rcc_bdcr_rtcen
  rccdisable = modifyReg rcc_reg_bdcr $ clearBit rcc_bdcr_rtcen

