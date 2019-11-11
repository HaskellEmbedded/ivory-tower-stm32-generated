{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-} -- due to unused versions

module Ivory.BSP.STM32.Driver.SPI
  ( V2.spiTower
  , module Ivory.Tower.HAL.Bus.SPI
  , module Ivory.Tower.HAL.Bus.SPI.DeviceHandle
  ) where

import Ivory.Tower.HAL.Bus.SPI
import Ivory.Tower.HAL.Bus.SPI.DeviceHandle

import qualified Ivory.BSP.STM32.Driver.SPIv1 as V1
import qualified Ivory.BSP.STM32.Driver.SPIv2 as V2
import qualified Ivory.BSP.STM32.Driver.SPIv3 as V3

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
