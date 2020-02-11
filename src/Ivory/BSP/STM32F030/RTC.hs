module Ivory.BSP.STM32F030.RTC (
    rtc
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F030.RCC
import Ivory.BSP.STM32F030.MemoryMap
import qualified Ivory.BSP.STM32F030.Interrupt as F030

import Ivory.BSP.STM32.Peripheral.RTC

rtc :: RTC
rtc = mkRTC
  rtc_periph_base
  rccenable rccdisable
  -- F030.RTC
  where
  rccenable  = modifyReg rcc_reg_bdcr $ setBit   rcc_bdcr_rtcen
  rccdisable = modifyReg rcc_reg_bdcr $ clearBit rcc_bdcr_rtcen

