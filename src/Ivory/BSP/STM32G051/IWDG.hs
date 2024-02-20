module Ivory.BSP.STM32G051.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32G051.Clock (clockLSI)
import Ivory.BSP.STM32G051.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

