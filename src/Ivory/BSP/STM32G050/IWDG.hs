module Ivory.BSP.STM32G050.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32G050.Clock (clockLSI)
import Ivory.BSP.STM32G050.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

