module Ivory.BSP.STM32L4R5.Clock (
    clockHSE
  , clockLSE
  , clockLSI
  , clockMSI
  , clockHSI
  ) where

import Data.STM32.Clock

-- External clocks defined here use default values,
-- values for your board may differ
clockHSE :: ClockSource
clockHSE = HSE 8000000

clockLSE :: ClockSource
clockLSE = LSE 32768

clockLSI :: ClockSource
clockLSI = LSI 32000

clockMSI :: ClockSource
clockMSI = MSI 4000000

clockHSI :: ClockSource
clockHSI = HSI 16000000

