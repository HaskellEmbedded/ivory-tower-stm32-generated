module Ivory.BSP.STM32F102.GTIM
  ( GTIM(..)
  , GTIM32
  , GTIM16
  , tim2
  , tim3
  , tim4
  , tim2_32
  ) where


import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.Peripheral.GTIM.Peripheral
import Ivory.BSP.STM32F102.RCC
import Ivory.BSP.STM32F102.MemoryMap

tim2 :: GTIM16
tim2 =
  mkGTIM
    tim2_periph_base
    rccenable
    rccdisable
    "tim2"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_tim2en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_tim2en

tim3 :: GTIM16
tim3 =
  mkGTIM
    tim3_periph_base
    rccenable
    rccdisable
    "tim3"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_tim3en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_tim3en

tim4 :: GTIM16
tim4 =
  mkGTIM
    tim4_periph_base
    rccenable
    rccdisable
    "tim4"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_tim4en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_tim4en

-- Both TIM2 and TIM5 are really 32 bit timers, but you can safely make
-- them believe they are 16 bit.
tim2_32 :: GTIM32
tim2_32 =
  mkGTIM
    tim2_periph_base
    rccenable
    rccdisable
    "tim2_32bit"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_tim2en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_tim2en

