module Ivory.BSP.STM32G071.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32G071.Clock (clockLSI)
import Ivory.BSP.STM32G071.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

