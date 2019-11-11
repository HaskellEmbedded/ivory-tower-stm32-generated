module Ivory.BSP.STM32F768.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32F768.Clock (clockLSI)
import Ivory.BSP.STM32F768.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

