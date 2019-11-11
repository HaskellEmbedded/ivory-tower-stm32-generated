module Ivory.BSP.STM32G473.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32G473.Clock (clockLSI)
import Ivory.BSP.STM32G473.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

