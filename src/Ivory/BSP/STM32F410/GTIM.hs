module Ivory.BSP.STM32F410.GTIM
  ( GTIM(..)
  , GTIM32
  , GTIM16
  , tim5
  , tim6
  , tim9
  , tim11
  , tim5_32
  ) where


import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.Peripheral.GTIM.Peripheral
import Ivory.BSP.STM32F410.RCC
import Ivory.BSP.STM32F410.MemoryMap

tim5 :: GTIM16
tim5 =
  mkGTIM
    tim5_periph_base
    rccenable
    rccdisable
    "tim5"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_tim5en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_tim5en

tim6 :: GTIM16
tim6 =
  mkGTIM
    tim6_periph_base
    rccenable
    rccdisable
    "tim6"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_tim6en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_tim6en

tim9 :: GTIM16
tim9 =
  mkGTIM
    tim9_periph_base
    rccenable
    rccdisable
    "tim9"
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_tim9en
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_tim9en

tim11 :: GTIM16
tim11 =
  mkGTIM
    tim11_periph_base
    rccenable
    rccdisable
    "tim11"
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_tim11en
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_tim11en

-- Both TIM2 and TIM5 are really 32 bit timers, but you can safely make
-- them believe they are 16 bit.
tim5_32 :: GTIM32
tim5_32 =
  mkGTIM
    tim5_periph_base
    rccenable
    rccdisable
    "tim5_32bit"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_tim5en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_tim5en

