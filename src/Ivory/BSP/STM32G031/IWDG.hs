module Ivory.BSP.STM32G031.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32G031.Clock (clockLSI)
import Ivory.BSP.STM32G031.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

