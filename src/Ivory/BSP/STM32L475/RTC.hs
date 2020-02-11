module Ivory.BSP.STM32L475.RTC (
    rtc
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32L475.RCC
import Ivory.BSP.STM32L475.MemoryMap
import qualified Ivory.BSP.STM32L475.Interrupt as L475

import Ivory.BSP.STM32.Peripheral.RTC

rtc :: RTC
rtc = mkRTC
  rtc_periph_base
  rccenable rccdisable
  -- L475.RTC_TAMP_STAMP L475.RTC_WKUP L475.RTC_ALARM
  where
  rccenable  = modifyReg rcc_reg_bdcr $ setBit   rcc_bdcr_rtcen
  rccdisable = modifyReg rcc_reg_bdcr $ clearBit rcc_bdcr_rtcen

