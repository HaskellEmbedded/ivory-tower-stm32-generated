module Ivory.BSP.STM32G0B0.Interrupt where

import Ivory.BSP.ARMv7M.Exception
import Ivory.BSP.STM32.Interrupt

data Interrupt
  = WWDG -- 0 Window watchdog interrupt
  | Undefined1 -- 1 Undefined interrupt (padding only)
  | RTC_STAMP -- 2 RTC and TAMP interrupts
  | FLASH -- 3 Flash global interrupt
  | RCC -- 4 RCC global interrupt
  | EXTI0_1 -- 5 EXTI line 0 and 1 interrupt
  | EXTI2_3 -- 6 EXTI line 2 and 3 interrupt
  | EXTI4_15 -- 7 EXTI line 4 to 15 interrupt
  | Undefined8 -- 8 Undefined interrupt (padding only)
  | DMA1_CHANNEL1 -- 9 DMA channel 1 interrupt
  | DMA1_CHANNEL2_3 -- 10 DMA channel 2 and 3 interrupts
  | DMA1_CHANNEL4_5_6_7_DMAMUX_DMA2_CHANNEL1_2_3_4_5 -- 11 DMA channel 2 and 3 interrupts
  | ADC -- 12 ADC interrupt (ADC combined with EXTI 17 and 18)
  | TIM1_BRK_UP_TRG_COM -- 13 TIM1 break, update, trigger and commutation interrupts
  | TIM1_CC -- 14 TIM1 Capture Compare interrupt
  | Undefined15 -- 15 Undefined interrupt (padding only)
  | TIM3_TIM4 -- 16 TIM3 global interrupt
  | TIM6_DAC -- 17 TIM6 + LPTIM1 and DAC global interrupt
  | TIM7 -- 18 TIM7 + LPTIM2 global interrupt
  | TIM14 -- 19 TIM14 global interrupt
  | TIM15 -- 20 Timer 15 global interrupt
  | TIM16 -- 21 TIM16 global interrupt
  | TIM17 -- 22 TIM17 global interrupt
  | I2C1 -- 23 I2C1 global interrupt
  | I2C2 -- 24 I2C2/I2C3 global interrupt
  | SPI1 -- 25 SPI1 global interrupt
  | SPI2_SPI3 -- 26 SPI2/SPI3 global interrupt
  | USART1 -- 27 USART1 global interrupt
  | USART2 -- 28 USART2 global interrupt
  | USART3_USART4_USART5_USART6_LPUART1 -- 29 USART3,4,5,6 global interrupt
  deriving (Eq, Show, Enum)

instance STM32Interrupt Interrupt where
  interruptIRQn = IRQn . fromIntegral . fromEnum
  interruptTable _ = map Just (enumFrom WWDG)
  interruptHandlerName i = (show i) ++ "_IRQHandler"
