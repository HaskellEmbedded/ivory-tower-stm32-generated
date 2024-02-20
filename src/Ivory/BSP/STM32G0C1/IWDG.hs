module Ivory.BSP.STM32G0C1.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32G0C1.Clock (clockLSI)
import Ivory.BSP.STM32G0C1.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

