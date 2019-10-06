{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE RecordWildCards #-}

module Ivory.BSP.STM32.Driver.SPI
  ( V2.spiTower
  , module Ivory.Tower.HAL.Bus.SPI
  , module Ivory.Tower.HAL.Bus.SPI.DeviceHandle
  ) where

import Ivory.Language
import Ivory.Stdlib
import Ivory.Tower
import Ivory.Tower.HAL.Bus.Interface
import Ivory.Tower.HAL.Bus.SPI
import Ivory.Tower.HAL.Bus.SPI.DeviceHandle
import Ivory.HW

import Ivory.BSP.STM32.Interrupt
import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32.Peripheral.SPI

import qualified Ivory.BSP.STM32.Driver.SPIv1 as V1
import qualified Ivory.BSP.STM32.Driver.SPIv2 as V2
import qualified Ivory.BSP.STM32.Driver.SPIv3 as V3

import qualified Ivory.BSP.STM32.Peripheral.SPIv1.Peripheral as P1
import qualified Ivory.BSP.STM32.Peripheral.SPIv2.Peripheral as P2
import qualified Ivory.BSP.STM32.Peripheral.SPIv3.Peripheral as P3

{--
spiTower :: forall e . (e -> ClockConfig)
          -> SPI
          -> [SPIDevice]
          -> Tower e ( BackpressureTransmit ('Struct "spi_transaction_request")
                                            ('Struct "spi_transaction_result")
                     , ChanOutput ('Stored ITime))
spiTower tocc spi pins baud = case spi of
    (WrappedV1 x) -> V1.spiTower tocc x pins baud
    (WrappedV2 x) -> V2.spiTower tocc x pins baud
    (WrappedV3 x) -> V3.spiTower tocc x pins baud
  --}
