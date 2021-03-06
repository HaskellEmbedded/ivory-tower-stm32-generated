module Ivory.BSP.STM32G471.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32G471.Clock (clockLSI)
import Ivory.BSP.STM32G471.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

