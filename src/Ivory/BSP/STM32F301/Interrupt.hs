module Ivory.BSP.STM32F301.Interrupt where

import Ivory.BSP.ARMv7M.Exception
import Ivory.BSP.STM32.Interrupt

data Interrupt
  = WWDG -- 0 Window Watchdog interrupt
  | PVD -- 1 PVD through EXTI line detection interrupt
  | TAMP_STAMP -- 2 Tamper and TimeStamp interrupts
  | RTC_WKUP -- 3 RTC
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
  | Undefined29 -- 29 Undefined interrupt (padding only)
  | Undefined30 -- 30 Undefined interrupt (padding only)
  | I2C1_EV -- 31 I2C1_EV global interrupt/EXTI Line[3:2] interrupts
  | I2C1_ER -- 32 I2C1_ER
  | I2C2_EV -- 33 I2C2_EV global interrupt/EXTI Line[4:2] interrupts
  | I2C2_ER -- 34 I2C2_ER
  | SPI1 -- 35 SPI1 global interrupt
  | SPI2 -- 36 SPI2 global interrupt
  | USART1_EXTI25 -- 37 USART1 global interrupt and EXTI Line 25 interrupt
  | USART2 -- 38 USART2 global interrupt/EXTI26 (USART1 wakeup event)
  | USART3 -- 39 USART3 global interrupt/EXTI28 (USART1 wakeup event)
  | EXTI15_10 -- 40 EXTI Line15 to Line10 interrupts
  | RTC_ALARM_IT -- 41 RTC alarm interrupt
  | CEC -- 42 CEC interrupt
  | TIM12 -- 43 Timer 12 global interrupt
  | Undefined44 -- 44 Undefined interrupt (padding only)
  | Undefined45 -- 45 Undefined interrupt (padding only)
  | Undefined46 -- 46 Undefined interrupt (padding only)
  | Undefined47 -- 47 Undefined interrupt (padding only)
  | Undefined48 -- 48 Undefined interrupt (padding only)
  | Undefined49 -- 49 Undefined interrupt (padding only)
  | Undefined50 -- 50 Undefined interrupt (padding only)
  | SPI3 -- 51 SPI3 global interrupt
  | Undefined52 -- 52 Undefined interrupt (padding only)
  | Undefined53 -- 53 Undefined interrupt (padding only)
  | TIM6_DAC1 -- 54 TIM6 global, DAC1 Cahnnel1 and Cahnnel2 underrun error Interrupts
  | TIM7 -- 55 Timer 7 global interrupt
  | Undefined56 -- 56 Undefined interrupt (padding only)
  | Undefined57 -- 57 Undefined interrupt (padding only)
  | Undefined58 -- 58 Undefined interrupt (padding only)
  | Undefined59 -- 59 Undefined interrupt (padding only)
  | Undefined60 -- 60 Undefined interrupt (padding only)
  | ADC_SD1 -- 61 ADC sigma delta 1 (SDADC1) global interrupt
  | ADC_SD2 -- 62 ADC sigma delta 2 (SDADC2) global interrupt
  | ADC_SD3 -- 63 ADC sigma delta 3 (SDADC3) global interrupt
  | COMP1_2_3 -- 64 COMP1_2_3 interrupt combined with EXTI lines 21, 22, 29
  | COMP4_5_6 -- 65 COMP4_5_6 interrupt combined with EXTI lines 30, 31, 32
  | Undefined66 -- 66 Undefined interrupt (padding only)
  | Undefined67 -- 67 Undefined interrupt (padding only)
  | Undefined68 -- 68 Undefined interrupt (padding only)
  | Undefined69 -- 69 Undefined interrupt (padding only)
  | Undefined70 -- 70 Undefined interrupt (padding only)
  | Undefined71 -- 71 Undefined interrupt (padding only)
  | I2C3_EV -- 72 I2C3 event interrupt / EXTI Line27 interrupt
  | I2C3_ER -- 73 I2C3 error interrupt
  | USB_HP -- 74 USB high priority interrupt
  | USB_LP -- 75 USB low priority interrupt
  | USB_WAKEUP -- 76 USB wakeup interrupt
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
