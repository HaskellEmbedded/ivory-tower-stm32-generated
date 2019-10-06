{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
module Ivory.BSP.STM32.ClockInit
  ( init_clocks
  ) where

import Ivory.Language

import Ivory.BSP.STM32.ClockConfig
import Data.STM32

import qualified Ivory.BSP.STM32F0.ClockInit as F0
import qualified Ivory.BSP.STM32F1.ClockInit as F1
import qualified Ivory.BSP.STM32F3.ClockInit as F3
import qualified Ivory.BSP.STM32F4.ClockInit as F4
import qualified Ivory.BSP.STM32F7.ClockInit as F7
import qualified Ivory.BSP.STM32L4.ClockInit as L4
import qualified Ivory.BSP.STM32L4Plus.ClockInit as L4Plus
import qualified Ivory.BSP.STM32G0.ClockInit as G0
import qualified Ivory.BSP.STM32G4.ClockInit as G4

init_clocks :: Family -> ClockConfig -> Def('[]':->())
init_clocks F0 = F0.init_clocks
init_clocks F1 = F1.init_clocks
init_clocks F3 = F3.init_clocks
init_clocks F4 = F4.init_clocks
init_clocks F7 = F7.init_clocks
init_clocks L4 = L4.init_clocks
init_clocks L4Plus = L4Plus.init_clocks
init_clocks G0 = G0.init_clocks
init_clocks G4 = G4.init_clocks
init_clocks f = error $ "Family not supported" ++ show f
