module Ivory.BSP.STM32G041.Interrupt where

import Ivory.BSP.ARMv7M.Exception
import Ivory.BSP.STM32.Interrupt

data Interrupt
  = WWDG -- 0 Window watchdog interrupt
  | PVD -- 1 Power voltage detector interrupt
  | RTC_TAMP -- 2 RTC and TAMP interrupts
  | FLASH -- 3 Flash global interrupt
  | RCC -- 4 RCC global interrupt
  | EXTI0_1 -- 5 EXTI line 0 & 1 interrupt
  | EXTI2_3 -- 6 EXTI line 2 & 3 interrupt
  | EXTI4_15 -- 7 EXTI line 4 to 15 interrupt
  | Undefined8 -- 8 Undefined interrupt (padding only)
  | DMA_CHANNEL1 -- 9 DMA channel 1 interrupt
  | DMA_CHANNEL2_3 -- 10 DMA channel 2 & 3 interrupts
  | DMA_CHANNEL4_5_6_7 -- 11 DMA channel 4, 5, 6 & 7 and DMAMUX
  | ADC_COMP -- 12 ADC and COMP interrupts
  | TIM1_BRK_UP_TRG_COM -- 13 TIM1 break, update, trigger
  | TIM1_CC -- 14 TIM1 Capture Compare interrupt
  | TIM2 -- 15 TIM2 global interrupt
  | TIM3 -- 16 TIM3 global interrupt
  | Undefined17 -- 17 Undefined interrupt (padding only)
  | Undefined18 -- 18 Undefined interrupt (padding only)
  | TIM14 -- 19 TIM14 global interrupt
  | Undefined20 -- 20 Undefined interrupt (padding only)
  | TIM16 -- 21 TIM16 global interrupt
  | TIM17 -- 22 TIM17 global interrupt
  | I2C1 -- 23 I2C1 global interrupt
  | I2C2 -- 24 I2C2 global interrupt
  | SPI1 -- 25 SPI1 global interrupt
  | SPI2 -- 26 SPI2 global interrupt
  | USART1 -- 27 USART1 global interrupt
  | USART2 -- 28 USART2 global interrupt
  | USART3_USART4_LPUART1 -- 29 USART3 + USART4 + LPUART1
  | CEC -- 30 CEC global interrupt
  | AES_RNG -- 31 AES and RNG global interrupts
  deriving (Eq, Show, Enum)

instance STM32Interrupt Interrupt where
  interruptIRQn = IRQn . fromIntegral . fromEnum
  interruptTable _ = map Just (enumFrom WWDG)
  interruptHandlerName i = (show i) ++ "_IRQHandler"
