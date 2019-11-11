module Ivory.BSP.STM32F072.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32F072.Clock (clockLSI)
import Ivory.BSP.STM32F072.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

