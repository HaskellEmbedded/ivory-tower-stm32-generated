module Ivory.BSP.STM32F413.Interrupt where

import Ivory.BSP.ARMv7M.Exception
import Ivory.BSP.STM32.Interrupt

data Interrupt
  = WWDG -- 0 Window Watchdog interrupt
  | PVD -- 1 PVD through EXTI line detection interrupt
  | TAMP_STAMP -- 2 Tamper and TimeStamp interrupts through the EXTI line
  | RTC_WKUP -- 3 RTC Wakeup interrupt through the EXTI line
  | FLASH -- 4 FLASH global interrupt
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
  | TIM1_UP_TIM10 -- 25 TIM1 Update interrupt and TIM10 global interrupt
  | TIM1_TRG_COM_TIM11 -- 26 TIM1 Trigger and Commutation interrupts and TIM11 global interrupt
  | TIM1_CC -- 27 TIM1 Capture Compare interrupt
  | TIM2 -- 28 TIM2 global interrupt
  | TIM3 -- 29 TIM3 global interrupt
  | TIM4 -- 30 TIM4 global interrupt
  | I2C1_EVT -- 31 I2C1 event interrupt
  | I2C1_ERR -- 32 I2C1 error interrupt
  | I2C2_EVT -- 33 I2C2 event interrupt
  | I2C2_ERR -- 34 I2C2 error interrupt
  | SPI1 -- 35 SPI1 global interrupt
  | SPI2 -- 36 SPI2 global interrupt
  | USART1 -- 37 USART1 global interrupt
  | USART2 -- 38 USART2 global interrupt
  | USART3 -- 39 USART3 global interrupt
  | EXTI15_10 -- 40 EXTI Line[15:10] interrupts
  | EXTI17_RTC_ALARM -- 41 RTC Alarms (A and B) through EXTI line interrupt
  | Undefined42 -- 42 Undefined interrupt (padding only)
  | TIM8_BRK_TIM12 -- 43 Timer 12 global interrupt
  | TIM8_UP_TIM13 -- 44 Timer 13 global interrupt
  | TIM8_TRG_COM_TIM14 -- 45 Timer 14 global interrupt
  | TIM8_CC -- 46 TIM8 Cap/Com interrupt
  | DMA1_STREAM7 -- 47 DMA1 global interrupt Channel 7
  | FSMC -- 48 FSMC global interrupt
  | SDIO -- 49 SDIO global interrupt
  | TIM5 -- 50 TIM5 global interrupt
  | SPI3 -- 51 SPI3 global interrupt
  | USART4 -- 52 UART 4 global interrupt
  | UART5 -- 53 UART 5global interrupt
  | TIM6_GLB_IT_DAC1_DAC2 -- 54 TIM6 global and DAC12 underrun interrupts
  | TIM7 -- 55 TIM7 global interrupt
  | DMA2_STREAM0 -- 56 DMA2 Stream0 global interrupt
  | DMA2_STREAM1 -- 57 DMA2 Stream1 global interrupt
  | DMA2_STREAM2 -- 58 DMA2 Stream2 global interrupt
  | DMA2_STREAM3 -- 59 DMA2 Stream3 global interrupt
  | DMA2_STREAM4 -- 60 DMA2 Stream4 global interrupt
  | DFSDM1_FLT0 -- 61 SD filter0 global interrupt
  | DFSDM1_FLT1 -- 62 SD filter1 global interrupt
  | CAN2_TX -- 63 CAN2 TX interrupt
  | CAN2_RX0 -- 64 BXCAN2 RX0 interrupt
  | CAN2_RX1 -- 65 BXCAN2 RX1 interrupt
  | CAN2_SCE -- 66 CAN2 SCE interrupt
  | Undefined67 -- 67 Undefined interrupt (padding only)
  | DMA2_STREAM5 -- 68 DMA2 Stream5 global interrupt
  | DMA2_STREAM6 -- 69 DMA2 Stream6 global interrupt
  | DMA2_STREAM7 -- 70 DMA2 Stream7 global interrupt
  | USART6 -- 71 USART6 global interrupt
  | I2C3_EV -- 72 I2C3 event interrupt
  | I2C3_ER -- 73 I2C3 error interrupt
  | CAN3_TX -- 74 CAN 3 TX interrupt
  | CAN3_RX0 -- 75 BxCAN 3 RX0 interrupt
  | CAN3_RX1 -- 76 BxCAN 3 RX1 interrupt
  | CAN3_SCE -- 77 CAN 3 SCE interrupt
  | Undefined78 -- 78 Undefined interrupt (padding only)
  | CRYPTO -- 79 AES global interrupt
  | RNG -- 80 Rng global interrupt
  | FPU -- 81 FPU global interrupt
  | USART7 -- 82 USART7 global interrupt
  | USART8 -- 83 USART8 global interrupt
  | SPI4 -- 84 SPI4 global interrupt
  | SPI5 -- 85 SPI5 global interrupt
  | Undefined86 -- 86 Undefined interrupt (padding only)
  | SAI1 -- 87 SAI1 global interrupt
  | UART9 -- 88 UART9 global interrupt
  | UART10 -- 89 UART10 global interrupt
  | Undefined90 -- 90 Undefined interrupt (padding only)
  | Undefined91 -- 91 Undefined interrupt (padding only)
  | QUADSPI -- 92 Quad-SPI global interrupt
  | Undefined93 -- 93 Undefined interrupt (padding only)
  | Undefined94 -- 94 Undefined interrupt (padding only)
  | I2CFMP1EVENT -- 95 I2CFMP1 event interrupt
  | I2CFMP1ERROR -- 96 I2CFMP1 error interrupt
  | LPTIM1_OR_IT_EIT_23 -- 97 LP Timer global interrupt or EXT1 interrupt line 23
  | DFSDM2_FILTER1 -- 98 DFSDM2 SD filter 1 global interrupt
  | DFSDM2_FILTER2 -- 99 DFSDM2 SD filter 2 global interrupt
  | DFSDM2_FILTER3 -- 100 DFSDM2 SD filter 3 global interrupt
  | DFSDM2_FILTER4 -- 101 DFSDM2 SD filter 4 global interrupt
  deriving (Eq, Show, Enum)

instance STM32Interrupt Interrupt where
  interruptIRQn = IRQn . fromIntegral . fromEnum
  interruptTable _ = map Just (enumFrom WWDG)
  interruptHandlerName i = (show i) ++ "_IRQHandler"
