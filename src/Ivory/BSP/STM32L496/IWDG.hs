module Ivory.BSP.STM32L496.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32L496.Clock (clockLSI)
import Ivory.BSP.STM32L496.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

