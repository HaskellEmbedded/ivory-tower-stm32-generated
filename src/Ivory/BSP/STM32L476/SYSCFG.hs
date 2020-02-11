module Ivory.BSP.STM32L476.SYSCFG
  ( module Ivory.BSP.STM32L476.SYSCFG.Peripheral
  , module Ivory.BSP.STM32L476.SYSCFG.Regs
  , syscfg
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32L476.SYSCFG.Peripheral
import Ivory.BSP.STM32L476.SYSCFG.Regs
import Ivory.BSP.STM32L476.RCC
import Ivory.BSP.STM32L476.MemoryMap (syscfg_periph_base)

syscfg :: SYSCFG
syscfg = mkSYSCFG syscfg_periph_base rccenable rccdisable
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_syscfgen
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_syscfgen

