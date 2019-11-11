module Ivory.BSP.STM32F103.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32F103.Clock (clockLSI)
import Ivory.BSP.STM32F103.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

