module Ivory.BSP.STM32F102.AFIO
  ( module Ivory.BSP.STM32F102.AFIO.Peripheral
  , module Ivory.BSP.STM32F102.AFIO.Regs
  , afio
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F102.AFIO.Peripheral
import Ivory.BSP.STM32F102.AFIO.Regs
import Ivory.BSP.STM32F102.RCC
import Ivory.BSP.STM32F102.MemoryMap (afio_periph_base)

afio :: AFIO
afio = mkAFIO afio_periph_base rccenable rccdisable
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_afioen
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_afioen

