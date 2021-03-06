module Ivory.BSP.STM32L471.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32L471.Clock (clockLSI)
import Ivory.BSP.STM32L471.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

