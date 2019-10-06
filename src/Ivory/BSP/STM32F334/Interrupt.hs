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
  | Undefined64 -- 64 Undefined interrupt (padding only)
  | Undefined65 -- 65 Undefined interrupt (padding only)
  | Undefined66 -- 66 Undefined interrupt (padding only)
  | Undefined67 -- 67 Undefined interrupt (padding only)
  | Undefined68 -- 68 Undefined interrupt (padding only)
  | Undefined69 -- 69 Undefined interrupt (padding only)
  | Undefined70 -- 70 Undefined interrupt (padding only)
  | Undefined71 -- 71 Undefined interrupt (padding only)
  | Undefined72 -- 72 Undefined interrupt (padding only)
  | Undefined73 -- 73 Undefined interrupt (padding only)
  | Undefined74 -- 74 Undefined interrupt (padding only)
  | Undefined75 -- 75 Undefined interrupt (padding only)
  | Undefined76 -- 76 Undefined interrupt (padding only)
  | Undefined77 -- 77 Undefined interrupt (padding only)
  | Undefined78 -- 78 Undefined interrupt (padding only)
  | Undefined79 -- 79 Undefined interrupt (padding only)
  | Undefined80 -- 80 Undefined interrupt (padding only)
  | FPU -- 81 Floating point unit interrupt
  | Undefined82 -- 82 Undefined interrupt (padding only)
  | Undefined83 -- 83 Undefined interrupt (padding only)
  | Undefined84 -- 84 Undefined interrupt (padding only)
  | Undefined85 -- 85 Undefined interrupt (padding only)
  | Undefined86 -- 86 Undefined interrupt (padding only)
  | Undefined87 -- 87 Undefined interrupt (padding only)
  | Undefined88 -- 88 Undefined interrupt (padding only)
  | Undefined89 -- 89 Undefined interrupt (padding only)
  | Undefined90 -- 90 Undefined interrupt (padding only)
  | Undefined91 -- 91 Undefined interrupt (padding only)
  | Undefined92 -- 92 Undefined interrupt (padding only)
  | Undefined93 -- 93 Undefined interrupt (padding only)
  | Undefined94 -- 94 Undefined interrupt (padding only)
  | Undefined95 -- 95 Undefined interrupt (padding only)
  | Undefined96 -- 96 Undefined interrupt (padding only)
  | Undefined97 -- 97 Undefined interrupt (padding only)
  | Undefined98 -- 98 Undefined interrupt (padding only)
  | Undefined99 -- 99 Undefined interrupt (padding only)
  | Undefined100 -- 100 Undefined interrupt (padding only)
  | Undefined101 -- 101 Undefined interrupt (padding only)
  | Undefined102 -- 102 Undefined interrupt (padding only)
  | HRTIM1_MST -- 103 HRTIM1 master timer interrupt
  | HRTIM1_TIMA -- 104 HRTIM1 timer A interrupt
  | HRTIM_TIMB -- 105 HRTIM1 timer B interrupt
  | HRTIM1_TIMC -- 106 HRTIM1 timer C interrupt
  | HRTIM1_TIMD -- 107 HRTIM1 timer D interrupt
  | HRTIM_TIME -- 108 HRTIM1 timer E interrupt
  | HRTIM1_FLT -- 109 HRTIM1 fault interrupt
  deriving (Eq, Show, Enum)

instance STM32Interrupt Interrupt where
  interruptIRQn = IRQn . fromIntegral . fromEnum
  interruptTable _ = map Just (enumFrom WWDG)
  interruptHandlerName i = (show i) ++ "_IRQHandler"
