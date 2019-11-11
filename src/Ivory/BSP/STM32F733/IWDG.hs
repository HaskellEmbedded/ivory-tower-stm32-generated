module Ivory.BSP.STM32F733.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32F733.Clock (clockLSI)
import Ivory.BSP.STM32F733.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

