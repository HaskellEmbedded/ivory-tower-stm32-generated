module Ivory.BSP.STM32F078.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32F078.Clock (clockLSI)
import Ivory.BSP.STM32F078.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

