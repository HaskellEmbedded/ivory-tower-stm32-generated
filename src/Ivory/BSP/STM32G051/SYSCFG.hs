module Ivory.BSP.STM32G051.SYSCFG
  ( module Ivory.BSP.STM32G051.SYSCFG.Peripheral
  , module Ivory.BSP.STM32G051.SYSCFG.Regs
  , syscfg
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32G051.SYSCFG.Peripheral
import Ivory.BSP.STM32G051.SYSCFG.Regs
import Ivory.BSP.STM32G051.RCC
import Ivory.BSP.STM32G051.MemoryMap (syscfg_periph_base)

syscfg :: SYSCFG
syscfg = mkSYSCFG syscfg_periph_base rccenable rccdisable
  where
  rccenable  = modifyReg rcc_reg_apbenr2 $ setBit   rcc_apbenr2_syscfgen
  rccdisable = modifyReg rcc_reg_apbenr2 $ clearBit rcc_apbenr2_syscfgen

