module Ivory.BSP.STM32F427.Clock (
    clockHSE
  , clockHSI
  , clockLSE
  , clockLSI
  ) where

import Data.STM32.Clock

-- External clocks defined here use default values,
-- values for your board may differ
clockHSE :: ClockSource
clockHSE = HSE 25000000

clockHSI :: ClockSource
clockHSI = HSI 16000000

clockLSE :: ClockSource
clockLSE = LSE 32768

clockLSI :: ClockSource
clockLSI = LSI 32000

