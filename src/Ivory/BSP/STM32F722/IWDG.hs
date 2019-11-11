module Ivory.BSP.STM32F722.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32F722.Clock (clockLSI)
import Ivory.BSP.STM32F722.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

