module Ivory.BSP.STM32L4R5.RTC (
    rtc
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32L4R5.RCC
import Ivory.BSP.STM32L4R5.MemoryMap
-- we don't use RTC interrupts for now
--import qualified Ivory.BSP.STM32L4R5.Interrupt as L4R5

import Ivory.BSP.STM32.Peripheral.RTC

rtc :: RTC
rtc = mkRTC
  rtc_periph_base
  rccenable rccdisable
  -- L4R5.RTC_WKUP L4R5.RTC_ALARM
  where
  rccenable  = modifyReg rcc_reg_bdcr $ setBit   rcc_bdcr_rtcen
  rccdisable = modifyReg rcc_reg_bdcr $ clearBit rcc_bdcr_rtcen

