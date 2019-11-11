module Ivory.BSP.STM32F745.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32F745.Clock (clockLSI)
import Ivory.BSP.STM32F745.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

