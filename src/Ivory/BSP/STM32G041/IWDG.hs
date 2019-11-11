module Ivory.BSP.STM32G041.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32G041.Clock (clockLSI)
import Ivory.BSP.STM32G041.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

