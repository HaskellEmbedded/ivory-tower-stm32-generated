module Ivory.BSP.STM32L431.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32L431.Clock (clockLSI)
import Ivory.BSP.STM32L431.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

