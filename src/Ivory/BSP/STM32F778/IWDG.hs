module Ivory.BSP.STM32F778.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32F778.Clock (clockLSI)
import Ivory.BSP.STM32F778.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

