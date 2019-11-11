module Ivory.BSP.STM32F334.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32F334.Clock (clockLSI)
import Ivory.BSP.STM32F334.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

