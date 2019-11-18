
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE Rank2Types #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE TypeOperators #-}

module Ivory.BSP.STM32.Peripheral.UART (
    UART(..)
  , UARTPins(..)
  , UARTVersion(..)
  , mkUARTVersion

  --  module Ivory.BSP.STM32.Peripheral.UART1.Peripheral
  ) where

import Ivory.Language
import Ivory.BSP.STM32.Interrupt
import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32.Peripheral.GPIO (GPIOPin, GPIO_AF)
import Ivory.BSP.STM32.Peripheral.UART.Pins (UARTPins(..))

import qualified Ivory.BSP.STM32.Peripheral.UARTv1.Peripheral as P1
import qualified Ivory.BSP.STM32.Peripheral.UARTv2.Peripheral as P2
import qualified Ivory.BSP.STM32.Peripheral.UARTv3.Peripheral as P3

data UARTVersion =
    V1
  | V2
  | V3

data UART =
    WrappedV1 P1.UART
  | WrappedV2 P2.UART
  | WrappedV3 P3.UART

mkUARTVersion
       :: (STM32Interrupt i)
       => UARTVersion
       -> Integer
       -> (forall eff . Ivory eff ())
       -> (forall eff . Ivory eff ())
       -> i
       -> PClk
       -> (GPIOPin -> GPIO_AF)
       -> String
       -> UART
mkUARTVersion V1 i e1 e2 j c af s = WrappedV1 $ P1.mkUART i e1 e2 j c af s
mkUARTVersion V2 i e1 e2 j c af s = WrappedV2 $ P2.mkUART i e1 e2 j c af s
mkUARTVersion V3 i e1 e2 j c af s = WrappedV3 $ P3.mkUART i e1 e2 j c af s
