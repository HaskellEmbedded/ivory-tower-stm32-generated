module Ivory.BSP.STM32F302.RTC (
    rtc
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F302.RCC
import Ivory.BSP.STM32F302.MemoryMap
import qualified Ivory.BSP.STM32F302.Interrupt as F302

import Ivory.BSP.STM32.Peripheral.RTC

rtc :: RTC
rtc = mkRTC
  rtc_periph_base
  rccenable rccdisable
  -- F302.RTC_WKUP F302.RTCALARM
  where
  rccenable  = modifyReg rcc_reg_bdcr $ setBit   rcc_bdcr_rtcen
  rccdisable = modifyReg rcc_reg_bdcr $ clearBit rcc_bdcr_rtcen

