module Ivory.BSP.STM32F302.Interrupt where

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
  | TIM3 -- 29 TIM3 global interrupt
  | TIM4 -- 30 TIM4 global interrupt
  | I2C1_EV_EXTI23 -- 31 I2C1 event interrupt and EXTI Line23 interrupt
  | I2C1_ER -- 32 I2C1 error interrupt
  | I2C2_EV_EXTI24 -- 33 I2C2 event interrupt & EXTI Line24 interrupt
  | I2C2_ER -- 34 I2C2 error interrupt
  | SPI1 -- 35 SPI1 global interrupt
  | SPI2 -- 36 SPI2 global interrupt
  | USART1_EXTI25 -- 37 USART1 global interrupt and EXTI Line 25 interrupt
  | USART2_EXTI26 -- 38 USART2 global interrupt and EXTI Line 26 interrupt
  | USART3_EXTI28 -- 39 USART3 global interrupt and EXTI Line 28 interrupt
  | EXTI15_10 -- 40 EXTI Line15 to Line10 interrupts
  | RTCALARM -- 41 RTC alarm interrupt
  | USB_WKUP -- 42 USB wakeup from Suspend
  | TIM8_BRK -- 43 TIM8 break interrupt
  | TIM8_UP -- 44 TIM8 update interrupt
  | TIM8_TRG_COM -- 45 TIM8 Trigger and commutation interrupts
  | TIM8_CC -- 46 TIM8 capture compare interrupt
  | ADC3 -- 47 ADC3 global interrupt
  | FMC -- 48 FSMC global interrupt
  | Undefined49 -- 49 Undefined interrupt (padding only)
  | Undefined50 -- 50 Undefined interrupt (padding only)
  | SPI3 -- 51 SPI3 global interrupt
  | UART4_EXTI34 -- 52 UART4 global and EXTI Line 34 interrupts
  | UART5_EXTI35 -- 53 UART5 global and EXTI Line 35 interrupts
  | TIM6_DACUNDER -- 54 TIM6 global and DAC12 underrun interrupts
  | TIM7 -- 55 TIM7 global interrupt
  | DMA2_CH1 -- 56 DMA2 channel1 global interrupt
  | DMA2_CH2 -- 57 DMA2 channel2 global interrupt
  | DMA2_CH3 -- 58 DMA2 channel3 global interrupt
  | DMA2_CH4 -- 59 DMA2 channel4 global interrupt
  | DMA2_CH5 -- 60 DMA2 channel5 global interrupt
  | ADC4 -- 61 ADC4 global interrupt
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
  | USB_HP -- 74 USB High priority interrupt
  | USB_LP -- 75 USB Low priority interrupt
  | USB_WKUP_EXTI -- 76 USB wakeup from Suspend and EXTI Line 18
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
