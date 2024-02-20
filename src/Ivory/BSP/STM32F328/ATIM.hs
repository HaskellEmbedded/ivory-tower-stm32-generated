module Ivory.BSP.STM32F328.ATIM
  ( ATIM(..)
  , atim1
  ) where


import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.Peripheral.ATIM.Peripheral
import Ivory.BSP.STM32F328.RCC
import Ivory.BSP.STM32F328.MemoryMap

atim1 :: ATIM
atim1 =
  mkATIM
    tim1_periph_base
    rccenable
    rccdisable
    "atim1"
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_tim1en
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_tim1en

