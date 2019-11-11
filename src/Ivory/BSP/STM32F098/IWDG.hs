module Ivory.BSP.STM32F098.IWDG (
    iwdg
  ) where

import Ivory.BSP.STM32F098.Clock (clockLSI)
import Ivory.BSP.STM32F098.MemoryMap

import Ivory.BSP.STM32.Peripheral.IWDG

iwdg :: IWDG
iwdg = mkIWDG iwdg_periph_base clockLSI

