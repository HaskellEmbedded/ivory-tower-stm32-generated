module Ivory.BSP.STM32F722.Clock (
    clockLSI
  , clockHSI
  , clockLSE
  , clockHSE
  ) where

import Data.STM32.Clock

-- External clocks defined here use default values,
-- values for your board may differ
clockLSI :: ClockSource
clockLSI = LSI 32000

clockHSI :: ClockSource
clockHSI = HSI 16000000

clockLSE :: ClockSource
clockLSE = LSE 32768

clockHSE :: ClockSource
clockHSE = HSE 25000000

