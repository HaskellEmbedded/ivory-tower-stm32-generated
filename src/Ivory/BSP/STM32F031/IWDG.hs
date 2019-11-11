module Ivory.BSP.STM32F031.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32F031.Clock (clockLSI)
import Ivory.BSP.STM32F031.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

