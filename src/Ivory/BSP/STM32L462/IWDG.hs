module Ivory.BSP.STM32L462.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32L462.Clock (clockLSI)
import Ivory.BSP.STM32L462.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

