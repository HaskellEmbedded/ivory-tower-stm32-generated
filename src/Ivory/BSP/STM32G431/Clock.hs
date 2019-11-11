module Ivory.BSP.STM32G431.Clock (
    clockHSE
  , clockLSE
  , clockLSI
  , clockHSI
  ) where

import Data.STM32.Clock

-- External clocks defined here use default values,
-- values for your board may differ
clockHSE :: ClockSource
clockHSE = HSE 1000000

clockLSE :: ClockSource
clockLSE = LSE 32768

clockLSI :: ClockSource
clockLSI = LSI 32000

clockHSI :: ClockSource
clockHSI = HSI 16000000

