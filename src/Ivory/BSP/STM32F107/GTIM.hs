module Ivory.BSP.STM32F107.GTIM
  ( GTIM(..)
  , GTIM32
  , GTIM16
  , tim2
  , tim3
  , tim4
  , tim5
  , tim6
  , tim7
  , tim2_32
  , tim5_32
  ) where


import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.Peripheral.GTIM.Peripheral
import Ivory.BSP.STM32F107.RCC
import Ivory.BSP.STM32F107.MemoryMap

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

tim7 :: GTIM16
tim7 =
  mkGTIM
    tim7_periph_base
    rccenable
    rccdisable
    "tim7"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_tim7en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_tim7en

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

