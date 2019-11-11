module Ivory.BSP.STM32G483.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32G483.Clock (clockLSI)
import Ivory.BSP.STM32G483.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

