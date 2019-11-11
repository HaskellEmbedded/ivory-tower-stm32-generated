module Ivory.BSP.STM32L451.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32L451.Clock (clockLSI)
import Ivory.BSP.STM32L451.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

