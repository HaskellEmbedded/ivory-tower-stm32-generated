module Ivory.BSP.STM32F334.Interrupt where

import Ivory.BSP.ARMv7M.Exception
import Ivory.BSP.STM32.Interrupt

data Interrupt
  = WWDG -- 0 Window Watchdog interrupt
  | PVD -- 1 PVD through EXTI line detection interrupt
  | TAMP_STAMP -- 2 Tamper and TimeStamp interrupts
  | RTC_WKUP -- 3 RTC Wakeup interrupt through the EXTI line
  | FLASH -- 4 Flash global interrupt
  | RCC -- 5 RCC global interrupt
  | EXTI0 -- 6 EXTI Line0 interrupt
  | EXTI1 -- 7 EXTI Line3 interrupt
  | EXTI2_TSC -- 8 EXTI Line2 and Touch sensing interrupts
  | EXTI3 -- 9 EXTI Line3 interrupt
  | EXTI4 -- 10 EXTI Line4 interrupt
  | DMA1_CH1 -- 11 DMA1 channel 1 interrupt
  | DMA1_CH2 -- 12 DMA1 channel 2 interrupt
  | DMA1_CH3 -- 13 DMA1 channel 3 interrupt
  | DMA1_CH4 -- 14 DMA1 channel 4 interrupt
  | DMA1_CH5 -- 15 DMA1 channel 5 interrupt
  | DMA1_CH6 -- 16 DMA1 channel 6 interrupt
  | DMA1_CH7 -- 17 DMA1 channel 7interrupt
  | ADC1_2 -- 18 ADC1 and ADC2 global interrupt
  | USB_HP_CAN_TX -- 19 USB High Priority/CAN_TX interrupts
  | USB_LP_CAN_RX0 -- 20 USB Low Priority/CAN_RX0 interrupts
  | CAN_RX1 -- 21 CAN_RX1 interrupt
  | CAN_SCE -- 22 CAN_SCE interrupt
  | EXTI9_5 -- 23 EXTI Line5 to Line9 interrupts
  | TIM1_BRK_TIM15 -- 24 TIM1 Break/TIM15 global interruts
  | TIM1_UP_TIM16 -- 25 TIM1 Update/TIM16 global interrupts
  | TIM1_TRG_COM_TIM17 -- 26 TIM1 trigger and commutation/TIM17 interrupts
  | TIM1_CC -- 27 TIM1 capture compare interrupt
  | TIM2 -- 28 TIM2 global interrupt
  | TIM3 -- 29 Timer 3 global interrupt
  | Undefined30 -- 30 Undefined interrupt (padding only)
  | I2C1_EV_EXTI23 -- 31 I2C1 event interrupt and EXTI Line23 interrupt
  | I2C1_ER -- 32 I2C1 error interrupt
  | Undefined33 -- 33 Undefined interrupt (padding only)
  | Undefined34 -- 34 Undefined interrupt (padding only)
  | SPI1 -- 35 SPI1 global interrupt
  | Undefined36 -- 36 Undefined interrupt (padding only)
  | USART1_EXTI25 -- 37 USART1 global interrupt and EXTI Line 25 interrupt
  | USART2_EXTI26 -- 38 USART2 global interrupt and EXTI Line 26 interrupt
  | USART3_EXTI28 -- 39 USART3 global interrupt and EXTI Line 28 interrupt
  | EXTI15_10 -- 40 EXTI Line15 to Line10 interrupts
  | RTCALARM -- 41 RTC alarm interrupt
  | Undefined42 -- 42 Undefined interrupt (padding only)
  | Undefined43 -- 43 Undefined interrupt (padding only)
  | Undefined44 -- 44 Undefined interrupt (padding only)
  | Undefined45 -- 45 Undefined interrupt (padding only)
  | Undefined46 -- 46 Undefined interrupt (padding only)
  | Undefined47 -- 47 Undefined interrupt (padding only)
  | Undefined48 -- 48 Undefined interrupt (padding only)
  | Undefined49 -- 49 Undefined interrupt (padding only)
  | Undefined50 -- 50 Undefined interrupt (padding only)
  | Undefined51 -- 51 Undefined interrupt (padding only)
  | Undefined52 -- 52 Undefined interrupt (padding only)
  | Undefined53 -- 53 Undefined interrupt (padding only)
  | TIM6_DAC1 -- 54 TIM6 global and DAC12 underrun interrupts
  | TIM7_DAC2 -- 55 TIM7 global interrupt
  | Undefined56 -- 56 Undefined interrupt (padding only)
  | Undefined57 -- 57 Undefined interrupt (padding only)
  | Undefined58 -- 58 Undefined interrupt (padding only)
  | Undefined59 -- 59 Undefined interrupt (padding only)
  | Undefined60 -- 60 Undefined interrupt (padding only)
  | Undefined61 -- 61 Undefined interrupt (padding only)
  | Undefined62 -- 62 Undefined interrupt (padding only)
  | Undefined63 -- 63 Undefined interrupt (padding only)
  | COMP1_2_3 -- 64 COMP1_2_3 interrupt combined with EXTI lines 21, 22, 29
  | COMP4_5_6 -- 65 COMP4_5_6 interrupt combined with EXTI lines 30, 31, 32
  | Undefined66 -- 66 Undefined interrupt (padding only)
  | HRTIM_MST -- 67 HRTIM1 master timer interrupt
  | HRTIM_TIMA -- 68 HRTIM1 timer A interrupt
  | HRTIM_TIMB -- 69 HRTIM1 timer B interrupt
  | HRTIM_TIMC -- 70 HRTIM1 timer C interrupt
  | HRTIM_TIMD -- 71 HRTIM1 timer D interrupt
  | HRTIM_TIME -- 72 HRTIM1 timer E interrupt
  | HRTIM_FLT -- 73 HRTIM1 fault interrupt
  | Undefined74 -- 74 Undefined interrupt (padding only)
  | Undefined75 -- 75 Undefined interrupt (padding only)
  | Undefined76 -- 76 Undefined interrupt (padding only)
  | Undefined77 -- 77 Undefined interrupt (padding only)
  | Undefined78 -- 78 Undefined interrupt (padding only)
  | Undefined79 -- 79 Undefined interrupt (padding only)
  | Undefined80 -- 80 Undefined interrupt (padding only)
  | FPU -- 81 Floating point unit interrupt
  deriving (Eq, Show, Enum)

instance STM32Interrupt Interrupt where
  interruptIRQn = IRQn . fromIntegral . fromEnum
  interruptTable _ = map Just (enumFrom WWDG)
  interruptHandlerName i = (show i) ++ "_IRQHandler"
