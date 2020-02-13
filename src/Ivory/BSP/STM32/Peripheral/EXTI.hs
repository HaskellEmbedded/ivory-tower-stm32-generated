{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE Rank2Types #-}

module Ivory.BSP.STM32.Peripheral.EXTI
  ( mkEXTIVersion
  , EXTI(..)
  , EXTIVersion(..)
  , module Ivory.BSP.STM32.Peripheral.EXTI.RegTypes
  , module Ivory.BSP.STM32.Peripheral.EXTI.Types
  ) where

import Ivory.Language
import Ivory.HW
import Ivory.BSP.STM32.Interrupt
import Ivory.BSP.STM32.Peripheral.EXTI.RegTypes
import Ivory.BSP.STM32.Peripheral.EXTI.Types

import qualified Ivory.BSP.STM32.Peripheral.EXTIv1.Peripheral as P1
import qualified Ivory.BSP.STM32.Peripheral.EXTIv2.Peripheral as P2

data EXTIVersion =
    V1
  | V2

data EXTI =
    WrappedV1 P1.EXTI
  | WrappedV2 P2.EXTI

mkEXTIVersion :: (STM32Interrupt i)
       => EXTIVersion
       -> Integer
       -> (forall eff . Ivory eff ())
       -> (forall eff . Ivory eff ())
       -> BitDataReg (EXTI_EXTICR)
       -> BitDataReg (EXTI_EXTICR)
       -> BitDataReg (EXTI_EXTICR)
       -> BitDataReg (EXTI_EXTICR)
       -> [(Int, Int, i)]
       -> EXTI
mkEXTIVersion V1 base syscfgrccen syscfgrccdis r1 r2 r3 r4 isrs = WrappedV1 $ P1.mkEXTI base syscfgrccen syscfgrccdis r1 r2 r3 r4 isrs
mkEXTIVersion V2 base syscfgrccen syscfgrccdis r1 r2 r3 r4 isrs = WrappedV2 $ P2.mkEXTI base syscfgrccen syscfgrccdis r1 r2 r3 r4 isrs

