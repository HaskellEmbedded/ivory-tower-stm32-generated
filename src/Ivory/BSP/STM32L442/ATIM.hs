module Ivory.BSP.STM32L442.ATIM
  ( ATIM(..)
  , atim1
  ) where


import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.Peripheral.ATIM.Peripheral
import Ivory.BSP.STM32L442.RCC
import Ivory.BSP.STM32L442.MemoryMap

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

