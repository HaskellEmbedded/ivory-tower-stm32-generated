module Ivory.BSP.STM32G441.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32G441.Clock (clockLSI)
import Ivory.BSP.STM32G441.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

