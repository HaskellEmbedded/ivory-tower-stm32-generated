module Ivory.BSP.STM32G491.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32G491.Clock (clockLSI)
import Ivory.BSP.STM32G491.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

