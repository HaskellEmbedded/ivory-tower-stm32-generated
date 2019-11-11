module Ivory.BSP.STM32L485.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32L485.Clock (clockLSI)
import Ivory.BSP.STM32L485.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

