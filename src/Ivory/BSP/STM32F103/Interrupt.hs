module Ivory.BSP.STM32F103.Interrupt where

import Ivory.BSP.ARMv7M.Exception
import Ivory.BSP.STM32.Interrupt

data Interrupt
  = WWDG -- 0 Window Watchdog interrupt
  | PVD -- 1 PVD through EXTI line detection interrupt
  | TAMPER -- 2 Tamper interrupt
  | RTC -- 3 RTC global interrupt
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
  | ADC1_2 -- 18 ADC1 and ADC2 global interrupt
  | USB_HP_CAN_TX -- 19 USB High Priority or CAN TX interrupts
  | USB_LP_CAN_RX0 -- 20 USB Low Priority or CAN RX0 interrupts
  | CAN_RX1 -- 21 CAN RX1 interrupt
  | CAN_SCE -- 22 CAN SCE interrupt
  | EXTI9_5 -- 23 EXTI Line[9:5] interrupts
  | TIM1_BRK -- 24 TIM1 Break interrupt
  | TIM1_UP -- 25 TIM1 Update interrupt
  | TIM1_TRG_COM -- 26 TIM1 Trigger and Commutation interrupts
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
  | Undefined42 -- 42 Undefined interrupt (padding only)
  | TIM8_BRK -- 43 TIM8 Break interrupt
  | TIM8_UP -- 44 TIM8 Update interrupt
  | TIM8_TRG_COM -- 45 TIM8 Trigger and Commutation interrupts
  | TIM8_CC -- 46 TIM8 Capture Compare interrupt
  | ADC3 -- 47 ADC3 global interrupt
  | FSMC -- 48 FSMC global interrupt
  | SDIO -- 49 SDIO global interrupt
  | TIM5 -- 50 TIM5 global interrupt
  | SPI3 -- 51 SPI3 global interrupt
  | UART4 -- 52 UART4 global interrupt
  | UART5 -- 53 UART5 global interrupt
  | TIM6 -- 54 TIM6 global interrupt
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
