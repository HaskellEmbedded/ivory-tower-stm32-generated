{-# LANGUAGE Rank2Types #-}

module Ivory.BSP.STM32.Peripheral.I2C
  ( I2C(..)
  , I2CPins(..)
  , I2CVersion(..)
  , mkI2CVersion
  ) where

import Ivory.Language
import Ivory.BSP.STM32.Interrupt
import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32.Peripheral.GPIO (GPIOPin, GPIO_AF)
import Ivory.BSP.STM32.Peripheral.I2C.Pins (I2CPins(..))

import qualified Ivory.BSP.STM32.Peripheral.I2Cv1.Peripheral as P1
import qualified Ivory.BSP.STM32.Peripheral.I2Cv2.Peripheral as P2

data I2CVersion =
    V1
  | V2

data I2C =
    WrappedV1 P1.I2C
  | WrappedV2 P2.I2C

mkI2CVersion
       :: (STM32Interrupt i)
       => I2CVersion
       -> Integer -- Base
       -> (forall eff . Ivory eff ()) -- RCC Enable
       -> (forall eff . Ivory eff ()) -- RCC Disable
       -> (forall eff . Ivory eff ()) -- RCC Reset
       -> i -- event interrupt
       -> i -- error interrupt
       -> PClk   -- Clock source
       -> (GPIOPin -> GPIO_AF)
       -> String -- Name
       -> I2C
mkI2CVersion V1 i e1 e2 e3 j k pclk afLookup name = WrappedV1 $ P1.mkI2C i e1 e2 e3 j k pclk afLookup name
mkI2CVersion V2 i e1 e2 e3 j k pclk afLookup name = WrappedV2 $ P2.mkI2C i e1 e2 e3 j k pclk afLookup name
