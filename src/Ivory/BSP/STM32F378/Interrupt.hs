module Ivory.BSP.STM32F378.Interrupt where

import Ivory.BSP.ARMv7M.Exception
import Ivory.BSP.STM32.Interrupt

data Interrupt
  = WWDG -- 0 Window Watchdog interrupt
  | PVD -- 1 Power voltage detector through EXTI line detection interrupt
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
  | DMA1_CH7 -- 17 DMA1 channel 7 interrupt
  | ADC1 -- 18 ADC1 interrupt
  | CAN_TX -- 19 USB high priority/CAN_TX interrupt
  | CAN_RXD -- 20 USB low priority/CAN_RXD interrupt
  | CAN_RXI -- 21 CAN_RXI interrupt
  | CAN_SCE -- 22 CAN_SCE interrupt
  | EXTI9_5 -- 23 EXTI Line5 to Line9 interrupts
  | TIM15 -- 24 Timer 15 global interrupt
  | TIM16 -- 25 Timer 16 global interrupt
  | TIM17 -- 26 Timer 17 global interrupt
  | TIM18_DAC3 -- 27 Timer 18 global interrupt/DAC3 underrun interrupt
  | TIM2 -- 28 Timer 2 global interrupt
  | TIM3 -- 29 Timer 3 global interrupt
  | TIM4 -- 30 Timer 4 global interrupt
  | I2C1_EV -- 31 I2C1_EV global interrupt/EXTI Line[3:2] interrupts
  | I2C1_ER -- 32 I2C1_ER
  | I2C2_EV -- 33 I2C2_EV global interrupt/EXTI Line[4:2] interrupts
  | I2C2_ER -- 34 I2C2_ER
  | SPI1 -- 35 SPI1 global interrupt
  | SPI2 -- 36 SPI2 global interrupt
  | USART1 -- 37 USART1 global interrupt/EXTI25 (USART1 wakeup event)
  | USART2 -- 38 USART2 global interrupt/EXTI26 (USART1 wakeup event)
  | USART3 -- 39 USART3 global interrupt/EXTI28 (USART1 wakeup event)
  | EXTI15_10 -- 40 EXTI Line[15:10] interrupts
  | RTC_ALARM_IT -- 41 RTC alarm interrupt
  | Undefined42 -- 42 Undefined interrupt (padding only)
  | TIM12 -- 43 Timer 12 global interrupt
  | TIM13 -- 44 Timer 13 global interrupt
  | TIM14 -- 45 Timer 14 global interrupt
  | TIM8_CC -- 46 TIM8 capture compare interrupt
  | ADC3 -- 47 ADC3 global interrupt
  | FMC -- 48 FSMC global interrupt
  | Undefined49 -- 49 Undefined interrupt (padding only)
  | TIM5 -- 50 Timer 5 global interrupt
  | SPI3 -- 51 SPI3 global interrupt
  | UART4_EXTI34 -- 52 UART4 global and EXTI Line 34 interrupts
  | UART5_EXTI35 -- 53 UART5 global and EXTI Line 35 interrupts
  | TIM6_DAC1 -- 54 TIM6 global, DAC1 Cahnnel1 and Cahnnel2 underrun error Interrupts
  | TIM7 -- 55 Timer 7 global interrupt
  | DMA2_CHANNEL1 -- 56 DMA2 channel1 global interrupt
  | DMA2_CHANNEL2 -- 57 DMA2 channel2 global interrupt
  | DMA2_CHANNEL3 -- 58 DMA2 channel3 global interrupt
  | DMA2_CHANNEL4 -- 59 DMA2 channel4 global interrupt
  | DMA2_CHANNEL5 -- 60 DMA2 channel5 global interrupt
  | ADC_SD1 -- 61 ADC sigma delta 1 (SDADC1) global interrupt
  | ADC_SD2 -- 62 ADC sigma delta 2 (SDADC2) global interrupt
  | ADC_SD3 -- 63 ADC sigma delta 3 (SDADC3) global interrupt
  | Undefined64 -- 64 Undefined interrupt (padding only)
  | Undefined65 -- 65 Undefined interrupt (padding only)
  | COMP7 -- 66 COMP7 interrupt combined with EXTI Line 33
  | Undefined67 -- 67 Undefined interrupt (padding only)
  | Undefined68 -- 68 Undefined interrupt (padding only)
  | Undefined69 -- 69 Undefined interrupt (padding only)
  | Undefined70 -- 70 Undefined interrupt (padding only)
  | Undefined71 -- 71 Undefined interrupt (padding only)
  | I2C3_EV -- 72 I2C3 Event interrupt
  | I2C3_ER -- 73 I2C3 Error interrupt
  | USB_HP -- 74 USB high priority interrupt
  | USB_LP -- 75 USB low priority interrupt
  | USB_WAKEUP -- 76 USB wakeup interrupt
  | TIM20_BRK -- 77 TIM20 Break interrupt
  | TIM19 -- 78 Timer 19 global interrupt
  | TIM20_TRG_COM -- 79 TIM20 Trigger and Commutation interrupt
  | TIM20_CC -- 80 TIM20 Capture Compare interrupt
  | FPU -- 81 Floating point unit interrupt
  deriving (Eq, Show, Enum)

instance STM32Interrupt Interrupt where
  interruptIRQn = IRQn . fromIntegral . fromEnum
  interruptTable _ = map Just (enumFrom WWDG)
  interruptHandlerName i = (show i) ++ "_IRQHandler"
