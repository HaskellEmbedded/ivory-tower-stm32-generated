module Ivory.BSP.STM32F091.Clock (
    clockHSI
  , clockLSI
  , clockHSE
  , clockLSE
  ) where

import Data.STM32.Clock

-- External clocks defined here use default values,
-- values for your board may differ
clockHSI :: ClockSource
clockHSI = HSI 8000000

clockLSI :: ClockSource
clockLSI = LSI 40000

clockHSE :: ClockSource
clockHSE = HSE 8000000

clockLSE :: ClockSource
clockLSE = LSE 32768

