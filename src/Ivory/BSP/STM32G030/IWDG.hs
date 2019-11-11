module Ivory.BSP.STM32G030.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32G030.Clock (clockLSI)
import Ivory.BSP.STM32G030.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

