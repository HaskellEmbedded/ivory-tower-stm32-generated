module Ivory.BSP.STM32L433.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32L433.Clock (clockLSI)
import Ivory.BSP.STM32L433.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

