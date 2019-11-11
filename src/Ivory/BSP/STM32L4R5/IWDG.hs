module Ivory.BSP.STM32L4R5.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32L4R5.Clock (clockLSI)
import Ivory.BSP.STM32L4R5.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

