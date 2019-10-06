module Ivory.BSP.STM32F732.Interrupt where

import Ivory.BSP.ARMv7M.Exception
import Ivory.BSP.STM32.Interrupt

data Interrupt
  = WWDG -- 0 Window Watchdog interrupt
  | PVD -- 1 PVD through EXTI line detection interrupt
  | TAMP_STAMP -- 2 Tamper and TimeStamp interrupts through the EXTI line
  | RTC_WKUP -- 3 RTC Tamper or TimeStamp /CSS on LSE through EXTI line 19 interrupts
  | FLASH -- 4 Flash global interrupt
  | RCC -- 5 RCC global interrupt
  | EXTI0 -- 6 EXTI Line0 interrupt
  | EXTI1 -- 7 EXTI Line1 interrupt
  | EXTI2 -- 8 EXTI Line2 interrupt
  | EXTI3 -- 9 EXTI Line3 interrupt
  | EXTI4 -- 10 EXTI Line4 interrupt
  | DMA1_STREAM0 -- 11 DMA1 Stream0 global interrupt
  | DMA1_STREAM1 -- 12 DMA1 Stream1 global interrupt
  | DMA1_STREAM2 -- 13 DMA1 Stream2 global interrupt
  | DMA1_STREAM3 -- 14 DMA1 Stream3 global interrupt
  | DMA1_STREAM4 -- 15 DMA1 Stream4 global interrupt
  | DMA1_STREAM5 -- 16 DMA1 Stream5 global interrupt
  | DMA1_STREAM6 -- 17 DMA1 Stream6 global interrupt
  | ADC -- 18 ADC1 global interrupt
  | CAN1_TX -- 19 CAN1 TX interrupts
  | CAN1_RX0 -- 20 CAN1 RX0 interrupts
  | CAN1_RX1 -- 21 CAN1 RX1 interrupts
  | CAN1_SCE -- 22 CAN1 SCE interrupt
  | EXTI9_5 -- 23 EXTI Line[9:5] interrupts
  | TIM1_BRK_TIM9 -- 24 TIM1 Break interrupt and TIM9 global interrupt
  | TIM1_UP_TIM10 -- 25 TIM1 Update interrupt and TIM10
  | TIM1_TRG_COM_TIM11 -- 26 TIM1 Trigger and Commutation interrupts and TIM11 global interrupt
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
  | RTC_ALARM -- 41 RTC alarms through EXTI line 18 interrupts
  | OTG_FS_WKUP -- 42 USB On-The-Go FS Wakeup through EXTI line interrupt
  | TIM8_BRK_TIM12 -- 43 TIM8 Break interrupt and TIM12 global interrupt
  | TIM8_UP_TIM13 -- 44 TIM8 Update interrupt and TIM13 global interrupt
  | TIM8_TRG_COM_TIM14 -- 45 TIM8 Trigger and Commutation interrupts and TIM14 global interrupt
  | TIM8_CC -- 46 TIM8 Capture Compare interrupt
  | DMA1_STREAM7 -- 47 DMA1 Stream7 global interrupt
  | FSMC -- 48 FMC global interrupt
  | SDMMC1 -- 49 SDMMC1 global interrupt
  | TIM5 -- 50 TIM5 global interrupt
  | SPI3 -- 51 SPI3 global interrupt
  | UART4 -- 52 UART4 global interrupt
  | UART5 -- 53 UART5 global interrupt
  | TIM6_DAC -- 54 TIM6 global interrupt, DAC1 and DAC2 underrun error interrupt
  | TIM7 -- 55 TIM7 global interrupt
  | DMA2_STREAM0 -- 56 DMA2 Stream0 global interrupt
  | DMA2_STREAM1 -- 57 DMA2 Stream1 global interrupt
  | DMA2_STREAM2 -- 58 DMA2 Stream2 global interrupt
  | DMA2_STREAM3 -- 59 DMA2 Stream3 global interrupt
  | DMA2_STREAM4 -- 60 DMA2 Stream4 global interrupt
  | Undefined61 -- 61 Undefined interrupt (padding only)
  | Undefined62 -- 62 Undefined interrupt (padding only)
  | Undefined63 -- 63 Undefined interrupt (padding only)
  | Undefined64 -- 64 Undefined interrupt (padding only)
  | Undefined65 -- 65 Undefined interrupt (padding only)
  | Undefined66 -- 66 Undefined interrupt (padding only)
  | OTG_FS -- 67 USB On The Go FS global interrupt
  | DMA2_STREAM5 -- 68 DMA2 Stream5 global interrupt
  | DMA2_STREAM6 -- 69 DMA2 Stream6 global interrupt
  | DMA2_STREAM7 -- 70 DMA2 Stream7 global interrupt
  | USART6 -- 71 USART6 global interrupt
  | I2C3_EV -- 72 I2C3 event interrupt
  | I2C3_ER -- 73 I2C3 error interrupt
  | OTG_HS_EP1_OUT -- 74 USB On The Go HS End Point 1 Out
  | OTG_HS_EP1_IN -- 75 USB On The Go HS End Point 1 In
  | OTG_HS_WKUP -- 76 USB On The Go HS Wakeup through
  | OTG_HS -- 77 USB On The Go HS global interrupt
  | Undefined78 -- 78 Undefined interrupt (padding only)
  | AES -- 79 AES global interrupt
  | RNG -- 80 Rng global interrupt
  | FPU -- 81 Floating point unit interrupt
  | UART7 -- 82 UART7 global interrupt
  | UART8 -- 83 UART 8 global interrupt
  | SPI4 -- 84 SPI 4 global interrupt
  | SPI5 -- 85 SPI 5 global interrupt
  | Undefined86 -- 86 Undefined interrupt (padding only)
  | SAI1 -- 87 SAI1 global interrupt
  | Undefined88 -- 88 Undefined interrupt (padding only)
  | Undefined89 -- 89 Undefined interrupt (padding only)
  | Undefined90 -- 90 Undefined interrupt (padding only)
  | SAI2 -- 91 SAI2 global interrupt
  | QUADSPI -- 92 QuadSPI global interrupt
  | LP_TIMER1 -- 93 LP Timer1 global interrupt
  | Undefined94 -- 94 Undefined interrupt (padding only)
  | Undefined95 -- 95 Undefined interrupt (padding only)
  | Undefined96 -- 96 Undefined interrupt (padding only)
  | Undefined97 -- 97 Undefined interrupt (padding only)
  | Undefined98 -- 98 Undefined interrupt (padding only)
  | Undefined99 -- 99 Undefined interrupt (padding only)
  | Undefined100 -- 100 Undefined interrupt (padding only)
  | Undefined101 -- 101 Undefined interrupt (padding only)
  | Undefined102 -- 102 Undefined interrupt (padding only)
  | SDMMC2 -- 103 SDMMC2 global interrupt
  deriving (Eq, Show, Enum)

instance STM32Interrupt Interrupt where
  interruptIRQn = IRQn . fromIntegral . fromEnum
  interruptTable _ = map Just (enumFrom WWDG)
  interruptHandlerName i = (show i) ++ "_IRQHandler"
