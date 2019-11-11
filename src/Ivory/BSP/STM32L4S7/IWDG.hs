module Ivory.BSP.STM32L4S7.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32L4S7.Clock (clockLSI)
import Ivory.BSP.STM32L4S7.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

