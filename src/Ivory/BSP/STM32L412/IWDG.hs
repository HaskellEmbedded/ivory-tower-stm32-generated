module Ivory.BSP.STM32L412.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32L412.Clock (clockLSI)
import Ivory.BSP.STM32L412.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

