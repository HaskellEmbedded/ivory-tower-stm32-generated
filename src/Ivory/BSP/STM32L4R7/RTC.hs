module Ivory.BSP.STM32L4R7.RTC (
    rtc
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32L4R7.RCC
import Ivory.BSP.STM32L4R7.MemoryMap
import qualified Ivory.BSP.STM32L4R7.Interrupt as L4R7

import Ivory.BSP.STM32.Peripheral.RTC

rtc :: RTC
rtc = mkRTC
  rtc_periph_base
  rccenable rccdisable
  -- L4R7.RTC_WKUP L4R7.RTC_ALARM
  where
  rccenable  = modifyReg rcc_reg_bdcr $ setBit   rcc_bdcr_rtcen
  rccdisable = modifyReg rcc_reg_bdcr $ clearBit rcc_bdcr_rtcen

