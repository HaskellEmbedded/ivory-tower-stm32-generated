module Ivory.BSP.STM32G0B1.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32G0B1.Clock (clockLSI)
import Ivory.BSP.STM32G0B1.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

