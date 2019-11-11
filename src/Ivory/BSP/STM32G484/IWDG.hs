module Ivory.BSP.STM32G484.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32G484.Clock (clockLSI)
import Ivory.BSP.STM32G484.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

