module Ivory.BSP.STM32F100.Interrupt where

import Ivory.BSP.ARMv7M.Exception
import Ivory.BSP.STM32.Interrupt

data Interrupt
  = WWDG -- 0 Window Watchdog interrupt
  | PVD -- 1 PVD through EXTI line detection interrupt
  | TAMPER_STAMP -- 2 Tamper and TimeStamp through EXTI line interrupts
  | RTC_WKUP -- 3 RTC Wakeup through EXTI line interrupt
  | FLASH -- 4 Flash global interrupt
  | RCC -- 5 RCC global interrupt
  | EXTI0 -- 6 EXTI Line0 interrupt
  | EXTI1 -- 7 EXTI Line1 interrupt
  | EXTI2 -- 8 EXTI Line2 interrupt
  | EXTI3 -- 9 EXTI Line3 interrupt
  | EXTI4 -- 10 EXTI Line4 interrupt
  | DMA1_CHANNEL1 -- 11 DMA1 Channel1 global interrupt
  | DMA1_CHANNEL2 -- 12 DMA1 Channel2 global interrupt
  | DMA1_CHANNEL3 -- 13 DMA1 Channel3 global interrupt
  | DMA1_CHANNEL4 -- 14 DMA1 Channel4 global interrupt
  | DMA1_CHANNEL5 -- 15 DMA1 Channel5 global interrupt
  | DMA1_CHANNEL6 -- 16 DMA1 Channel6 global interrupt
  | DMA1_CHANNEL7 -- 17 DMA1 Channel7 global interrupt
  | ADC -- 18 ADC1 global interrupt
  | Undefined19 -- 19 Undefined interrupt (padding only)
  | Undefined20 -- 20 Undefined interrupt (padding only)
  | Undefined21 -- 21 Undefined interrupt (padding only)
  | Undefined22 -- 22 Undefined interrupt (padding only)
  | EXTI9_5 -- 23 EXTI Line[9:5] interrupts
  | TIM1_BRK_TIM15 -- 24 TIM1 Break interrupt and TIM15 global interrupt
  | TIM1_UP_TIM16 -- 25 TIM1 Update interrupt and TIM16 global interrupt
  | TIM1_TRG_COM_TIM17 -- 26 TIM1 Trigger and Commutation interrupts and TIM17 global interrupt
  | TIM1_CC -- 27 TIM1 Capture Compare interrupt
  | TIM2 -- 28 TIM2 global interrupt
  | TIM3 -- 29 TIM3 global interrupt
  | TIM4 -- 30 TIM4 global interrupt
  | I2C1_EV -- 31 I2C1 event interrupt
  | I2C1_ER -- 32 I2C1 error interrupt
  | I2C2_EV -- 33 I2C2 event interrupt
  | I2C2_ER -- 34 I2C2 error interrupt
  | SPI1 -- 35 SPI1 global interrupt
  | SPI2 -- 36 SPI2 global interrupt
  | USART1 -- 37 USART1 global interrupt
  | USART2 -- 38 USART2 global interrupt
  | USART3 -- 39 USART3 global interrupt
  | EXTI15_10 -- 40 EXTI Line[15:10] interrupts
  | RTCALARM -- 41 RTC Alarms through EXTI line interrupt
  | CEC -- 42 CEC global interrupt
  | TIM12 -- 43 TIM12 global interrupt
  | TIM13 -- 44 TIM13 global interrupt
  | TIM14 -- 45 TIM14 global interrupt
  | Undefined46 -- 46 Undefined interrupt (padding only)
  | Undefined47 -- 47 Undefined interrupt (padding only)
  | FSMC -- 48 FSMC global interrupt
  | Undefined49 -- 49 Undefined interrupt (padding only)
  | TIM5 -- 50 TIM5 global interrupt
  | SPI3 -- 51 SPI3 global interrupt
  | UART4 -- 52 UART4 global interrupt
  | UART5 -- 53 UART5 global interrupt
  | TIM6_DAC -- 54 TIM6 global and DAC underrun interrupts
  | TIM7 -- 55 TIM7 global interrupt
  | DMA2_CHANNEL1 -- 56 DMA2 Channel1 global interrupt
  | DMA2_CHANNEL2 -- 57 DMA2 Channel2 global interrupt
  | DMA2_CHANNEL3 -- 58 DMA2 Channel3 global interrupt
  | DMA2_CHANNEL4_5 -- 59 DMA2 Channel4 and DMA2 Channel5 global interrupt
  deriving (Eq, Show, Enum)

instance STM32Interrupt Interrupt where
  interruptIRQn = IRQn . fromIntegral . fromEnum
  interruptTable _ = map Just (enumFrom WWDG)
  interruptHandlerName i = (show i) ++ "_IRQHandler"
