{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE RecordWildCards #-}

module Ivory.BSP.STM32.Driver.UART
  ( uartTower
  ) where

import Ivory.Language
import Ivory.Tower
import Ivory.Tower.HAL.Bus.Interface

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32.Peripheral.UART

import qualified Ivory.BSP.STM32.Driver.UARTv1 as V1
import qualified Ivory.BSP.STM32.Driver.UARTv2 as V2
import qualified Ivory.BSP.STM32.Driver.UARTv3 as V3

uartTower :: IvoryString s
          => (e -> ClockConfig)
          -> UART
          -> UARTPins
          -> Integer
          -> Tower e ( BackpressureTransmit s ('Stored IBool)
                     , ChanOutput ('Stored Uint8)
                     , Monitor e ())
uartTower tocc uart pins baud = case uart of
    (WrappedV1 x) -> V1.uartTower tocc x pins baud
    (WrappedV2 x) -> V2.uartTower tocc x pins baud
    (WrappedV3 x) -> V3.uartTower tocc x pins baud
  