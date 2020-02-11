{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module Ivory.BSP.STM32.Driver.EXTI (
    extiTower
  ) where

import Ivory.Language
import Ivory.Tower

import Ivory.BSP.STM32.Peripheral.EXTI

import qualified Ivory.BSP.STM32.Driver.EXTIv1 as V1
import qualified Ivory.BSP.STM32.Driver.EXTIv2 as V2

extiTower :: EXTI
          -> [EXTIPin]
          -> Tower e [ChanOutput ('Stored IBool)]
extiTower exti ePins = case exti of
    (WrappedV1 x) -> V1.extiTower x ePins
    (WrappedV2 x) -> V2.extiTower x ePins
  