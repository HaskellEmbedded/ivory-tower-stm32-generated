module Ivory.BSP.STM32L442.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32L442.Clock (clockLSI)
import Ivory.BSP.STM32L442.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

