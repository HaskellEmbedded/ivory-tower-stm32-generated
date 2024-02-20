module Ivory.BSP.STM32G0B1.ATIM
  ( ATIM(..)
  , atim1
  ) where


import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.Peripheral.ATIM.Peripheral
import Ivory.BSP.STM32G0B1.RCC
import Ivory.BSP.STM32G0B1.MemoryMap

atim1 :: ATIM
atim1 =
  mkATIM
    tim1_periph_base
    rccenable
    rccdisable
    "atim1"
  where
  rccenable  = modifyReg rcc_reg_apbenr2 $ setBit   rcc_apbenr2_tim1en
  rccdisable = modifyReg rcc_reg_apbenr2 $ clearBit rcc_apbenr2_tim1en

