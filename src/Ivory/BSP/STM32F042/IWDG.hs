module Ivory.BSP.STM32F042.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32F042.Clock (clockLSI)
import Ivory.BSP.STM32F042.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

