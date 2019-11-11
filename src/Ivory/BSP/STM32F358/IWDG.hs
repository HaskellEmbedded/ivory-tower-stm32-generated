module Ivory.BSP.STM32F358.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32F358.Clock (clockLSI)
import Ivory.BSP.STM32F358.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

