{-# LANGUAGE Rank2Types #-}
--
-- SPI.hs --- SPI peripheral
--
-- Copyright (C) 2014, Galois, Inc.
-- All Rights Reserved.
--

module Ivory.BSP.STM32.Peripheral.SPI
  ( P2.SPI(..)
  , P2.SPIDevice(..)
  , P2.mkSPI
  , P2.SPICSActive(..)
  , P2.SPIClockPolarity(..)
  , P2.SPIClockPhase(..)
  , P2.SPIBitOrder(..)
  , SPIPins(..)
  ) where

import Ivory.Language
import Ivory.BSP.STM32.Interrupt
import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32.Peripheral.SPI.Pins
import Ivory.BSP.STM32.Peripheral.SPI.RegTypes

import qualified Ivory.BSP.STM32.Peripheral.SPIv1.Peripheral as P1
import qualified Ivory.BSP.STM32.Peripheral.SPIv2.Peripheral as P2
import qualified Ivory.BSP.STM32.Peripheral.SPIv3.Peripheral as P3

{--
data SPIVersion =
    V1
  | V2
  | V3

data SPI =
    WrappedV1 P1.SPI
  | WrappedV2 P2.SPI
  | WrappedV3 P3.SPI

mkSPIVersion
       :: (STM32Interrupt i)
       => SPIVersion
       -> Integer
       -> (forall eff . Ivory eff ())
       -> (forall eff . Ivory eff ())
       -> i
       -> PClk
       -> String
       -> SPI
mkSPIVersion V1 i e1 e2 j c s = WrappedV1 $ P1.mkSPI i e1 e2 j c s
mkSPIVersion V2 i e1 e2 j c s = WrappedV2 $ P2.mkSPI i e1 e2 j c s
mkSPIVersion V3 i e1 e2 j c s = WrappedV3 $ P3.mkSPI i e1 e2 j c s
--}
