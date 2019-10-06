{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE RecordWildCards #-}

module Ivory.BSP.STM32.Driver.I2C
  ( i2cTower
  , module Ivory.Tower.HAL.Bus.I2C
  , module Ivory.Tower.HAL.Bus.I2C.DeviceAddr
  ) where

import Ivory.Language
import Ivory.Stdlib
import Ivory.Tower
import Ivory.Tower.HAL.Bus.I2C
import Ivory.Tower.HAL.Bus.I2C.DeviceAddr
import Ivory.Tower.HAL.Bus.Interface
import Ivory.HW

import Ivory.BSP.STM32.Interrupt
import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32.Peripheral.I2C

import qualified Ivory.BSP.STM32.Driver.I2Cv1 as V1
import qualified Ivory.BSP.STM32.Driver.I2Cv2 as V2

import qualified Ivory.BSP.STM32.Peripheral.I2Cv1.Peripheral as P1
import qualified Ivory.BSP.STM32.Peripheral.I2Cv2.Peripheral as P2

i2cTower :: (e -> ClockConfig)
          -> I2C
          -> I2CPins
          -- -> Integer -- XXX: this should eat target I2C frequency but we're not there yet
          -> Tower e ( BackpressureTransmit ('Struct "i2c_transaction_request")
                                            ('Struct "i2c_transaction_result")
                     , ChanOutput ('Stored ITime))
i2cTower tocc i2c pins = case i2c of
    (WrappedV1 x) -> V1.i2cTower tocc x pins
    (WrappedV2 x) -> V2.i2cTower tocc x pins
  