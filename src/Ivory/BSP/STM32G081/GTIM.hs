module Ivory.BSP.STM32G081.GTIM
  ( GTIM(..)
  , GTIM32
  , GTIM16
  , tim2
  , tim3
  , tim6
  , tim7
  , tim14
  , tim15
  , tim16
  , tim17
  , tim2_32
  ) where


import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.Peripheral.GTIM.Peripheral
import Ivory.BSP.STM32G081.RCC
import Ivory.BSP.STM32G081.MemoryMap

tim2 :: GTIM16
tim2 =
  mkGTIM
    tim2_periph_base
    rccenable
    rccdisable
    "tim2"
  where
  rccenable  = modifyReg rcc_reg_apbenr1 $ setBit   rcc_apbenr1_tim2en
  rccdisable = modifyReg rcc_reg_apbenr1 $ clearBit rcc_apbenr1_tim2en

tim3 :: GTIM16
tim3 =
  mkGTIM
    tim3_periph_base
    rccenable
    rccdisable
    "tim3"
  where
  rccenable  = modifyReg rcc_reg_apbenr1 $ setBit   rcc_apbenr1_tim3en
  rccdisable = modifyReg rcc_reg_apbenr1 $ clearBit rcc_apbenr1_tim3en

tim6 :: GTIM16
tim6 =
  mkGTIM
    tim6_periph_base
    rccenable
    rccdisable
    "tim6"
  where
  rccenable  = modifyReg rcc_reg_apbenr1 $ setBit   rcc_apbenr1_tim6en
  rccdisable = modifyReg rcc_reg_apbenr1 $ clearBit rcc_apbenr1_tim6en

tim7 :: GTIM16
tim7 =
  mkGTIM
    tim7_periph_base
    rccenable
    rccdisable
    "tim7"
  where
  rccenable  = modifyReg rcc_reg_apbenr1 $ setBit   rcc_apbenr1_tim7en
  rccdisable = modifyReg rcc_reg_apbenr1 $ clearBit rcc_apbenr1_tim7en

tim14 :: GTIM16
tim14 =
  mkGTIM
    tim14_periph_base
    rccenable
    rccdisable
    "tim14"
  where
  rccenable  = modifyReg rcc_reg_apbenr2 $ setBit   rcc_apbenr2_tim14en
  rccdisable = modifyReg rcc_reg_apbenr2 $ clearBit rcc_apbenr2_tim14en

tim15 :: GTIM16
tim15 =
  mkGTIM
    tim15_periph_base
    rccenable
    rccdisable
    "tim15"
  where
  rccenable  = modifyReg rcc_reg_apbenr2 $ setBit   rcc_apbenr2_tim15en
  rccdisable = modifyReg rcc_reg_apbenr2 $ clearBit rcc_apbenr2_tim15en

tim16 :: GTIM16
tim16 =
  mkGTIM
    tim16_periph_base
    rccenable
    rccdisable
    "tim16"
  where
  rccenable  = modifyReg rcc_reg_apbenr2 $ setBit   rcc_apbenr2_tim16en
  rccdisable = modifyReg rcc_reg_apbenr2 $ clearBit rcc_apbenr2_tim16en

tim17 :: GTIM16
tim17 =
  mkGTIM
    tim17_periph_base
    rccenable
    rccdisable
    "tim17"
  where
  rccenable  = modifyReg rcc_reg_apbenr2 $ setBit   rcc_apbenr2_tim17en
  rccdisable = modifyReg rcc_reg_apbenr2 $ clearBit rcc_apbenr2_tim17en

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
  rccenable  = modifyReg rcc_reg_apbenr1 $ setBit   rcc_apbenr1_tim2en
  rccdisable = modifyReg rcc_reg_apbenr1 $ clearBit rcc_apbenr1_tim2en

