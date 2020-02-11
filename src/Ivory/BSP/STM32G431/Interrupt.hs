module Ivory.BSP.STM32G431.Interrupt where

import Ivory.BSP.ARMv7M.Exception
import Ivory.BSP.STM32.Interrupt

data Interrupt
  = WWDG -- 0 Window Watchdog interrupt
  | PVD_PVM -- 1 PVD through EXTI line detection
  | RTC_TAMP_CSS_LSE -- 2 RTC_TAMP_CSS_LSE
  | RTC_WKUP -- 3 RTC Wakeup timer
  | FLASH -- 4 FLASH
  | RCC -- 5 RCC
  | EXTI0 -- 6 EXTI Line0 interrupt
  | EXTI1 -- 7 EXTI Line1 interrupt
  | EXTI2 -- 8 EXTI Line2 interrupt
  | EXTI3 -- 9 EXTI Line3 interrupt
  | EXTI4 -- 10 EXTI Line4 interrupt
  | DMA1_CH1 -- 11 DMA1 channel 1 interrupt
  | DMA1_CH2 -- 12 DMA1 channel 2 interrupt
  | DMA1_CH3 -- 13 DMA1 channel 3 interrupt
  | DMA1_CH4 -- 14 DMA1 channel 4 interrupt
  | DMA1_CH5 -- 15 DMA1 channel 5 interrupt
  | DMA1_CH6 -- 16 DMA1 channel 6 interrupt
  | Undefined17 -- 17 Undefined interrupt (padding only)
  | ADC1_2 -- 18 ADC1 and ADC2 global interrupt
  | USB_HP -- 19 USB_HP
  | USB_LP -- 20 USB_LP
  | FDCAN1_INTR1_IT -- 21 fdcan1_intr1_it
  | FDCAN1_INTR0_IT -- 22 fdcan1_intr0_it
  | EXTI9_5 -- 23 EXTI9_5
  | TIM1_BRK_TIM15 -- 24 TIM1_BRK_TIM15
  | TIM1_UP_TIM16 -- 25 TIM1_UP_TIM16
  | TIM1_TRG_COM -- 26 TIM1_TRG_COM/
  | TIM1_CC -- 27 TIM1 capture compare interrupt
  | TIM2 -- 28 TIM2
  | TIM3 -- 29 TIM3
  | TIM4 -- 30 TIM4
  | I2C1_EV -- 31 I2C1_EV
  | I2C1_ER -- 32 I2C1_ER
  | I2C2_EV -- 33 I2C2_EV
  | I2C2_ER -- 34 I2C2_ER
  | SPI1 -- 35 SPI1
  | SPI2 -- 36 SPI2
  | USART1 -- 37 USART1
  | USART2 -- 38 USART2
  | USART3 -- 39 USART3
  | EXTI15_10 -- 40 EXTI15_10
  | RTC_ALARM -- 41 RTC_ALARM
  | USBWAKEUP -- 42 USBWakeUP
  | TIM8_BRK -- 43 TIM8_BRK
  | TIM8_UP -- 44 TIM8_UP
  | TIM8_TRG_COM -- 45 TIM8_TRG_COM
  | TIM8_CC -- 46 TIM8_CC
  | Undefined47 -- 47 Undefined interrupt (padding only)
  | Undefined48 -- 48 Undefined interrupt (padding only)
  | LPTIM1 -- 49 LPTIM1
  | Undefined50 -- 50 Undefined interrupt (padding only)
  | SPI3 -- 51 SPI3
  | UART4 -- 52 UART4
  | Undefined53 -- 53 Undefined interrupt (padding only)
  | TIM6_DACUNDER -- 54 TIM6_DACUNDER
  | TIM7 -- 55 TIM7
  | DMA2_CH1 -- 56 DMA2_CH1
  | DMA2_CH2 -- 57 DMA2_CH2
  | DMA2_CH3 -- 58 DMA2_CH3
  | DMA2_CH4 -- 59 DMA2_CH4
  | DMA2_CH5 -- 60 DMA2_CH5
  | Undefined61 -- 61 Undefined interrupt (padding only)
  | Undefined62 -- 62 Undefined interrupt (padding only)
  | UCPD1 -- 63 UCPD1
  | COMP1_2_3 -- 64 COMP1_2_3
  | COMP4 -- 65 COMP4_5_6
  | Undefined66 -- 66 Undefined interrupt (padding only)
  | Undefined67 -- 67 Undefined interrupt (padding only)
  | Undefined68 -- 68 Undefined interrupt (padding only)
  | Undefined69 -- 69 Undefined interrupt (padding only)
  | Undefined70 -- 70 Undefined interrupt (padding only)
  | Undefined71 -- 71 Undefined interrupt (padding only)
  | Undefined72 -- 72 Undefined interrupt (padding only)
  | Undefined73 -- 73 Undefined interrupt (padding only)
  | Undefined74 -- 74 Undefined interrupt (padding only)
  | CRS -- 75 CRS
  | SAI -- 76 SAI
  | Undefined77 -- 77 Undefined interrupt (padding only)
  | Undefined78 -- 78 Undefined interrupt (padding only)
  | Undefined79 -- 79 Undefined interrupt (padding only)
  | Undefined80 -- 80 Undefined interrupt (padding only)
  | FPU -- 81 Floating point unit interrupt
  | Undefined82 -- 82 Undefined interrupt (padding only)
  | Undefined83 -- 83 Undefined interrupt (padding only)
  | Undefined84 -- 84 Undefined interrupt (padding only)
  | AES -- 85 AES
  | Undefined86 -- 86 Undefined interrupt (padding only)
  | Undefined87 -- 87 Undefined interrupt (padding only)
  | Undefined88 -- 88 Undefined interrupt (padding only)
  | Undefined89 -- 89 Undefined interrupt (padding only)
  | RNG -- 90 RNG
  | LPUART1 -- 91 LPUART
  | I2C3_EV -- 92 I2C3_EV
  | I2C3_ER -- 93 I2C3_ER
  | DMAMUX_OVR -- 94 DMAMUX_OVR
  | Undefined95 -- 95 Undefined interrupt (padding only)
  | Undefined96 -- 96 Undefined interrupt (padding only)
  | DMA2_CH6 -- 97 DMA2_CH6
  | Undefined98 -- 98 Undefined interrupt (padding only)
  | Undefined99 -- 99 Undefined interrupt (padding only)
  | CORDIC -- 100 Cordic
  | FMAC -- 101 FMAC
  deriving (Eq, Show, Enum)

instance STM32Interrupt Interrupt where
  interruptIRQn = IRQn . fromIntegral . fromEnum
  interruptTable _ = map Just (enumFrom WWDG)
  interruptHandlerName i = (show i) ++ "_IRQHandler"
