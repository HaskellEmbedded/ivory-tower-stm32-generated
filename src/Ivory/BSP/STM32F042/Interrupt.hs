module Ivory.BSP.STM32F042.Interrupt where

import Ivory.BSP.ARMv7M.Exception
import Ivory.BSP.STM32.Interrupt

data Interrupt
  = WWDG -- 0 Window Watchdog interrupt
  | PVD -- 1 PVD and VDDIO2 supply comparator interrupt
  | RTC -- 2 RTC interrupts
  | FLASH -- 3 Flash global interrupt
  | RCC_CRS -- 4 RCC and CRS global interrupts
  | EXTI0_1 -- 5 EXTI Line[1:0] interrupts
  | EXTI2_3 -- 6 EXTI Line[3:2] interrupts
  | EXTI4_15 -- 7 EXTI Line15 and EXTI4 interrupts
  | TSC -- 8 Touch sensing interrupt
  | DMA1_CH1 -- 9 DMA1 channel 1 interrupt
  | Undefined10 -- 10 Undefined interrupt (padding only)
  | Undefined11 -- 11 Undefined interrupt (padding only)
  | ADC_COMP -- 12 ADC and comparator interrupts
  | TIM1_BRK_UP_TRG_COM -- 13 TIM1 break, update, trigger and commutation interrupt
  | TIM1_CC -- 14 TIM1 Capture Compare interrupt
  | TIM2 -- 15 TIM2 global interrupt
  | TIM3 -- 16 TIM3 global interrupt
  | TIM6_DAC -- 17 TIM6 global interrupt and DAC underrun interrupt
  | TIM7 -- 18 TIM7 global interrupt
  | TIM14 -- 19 TIM14 global interrupt
  | TIM15 -- 20 TIM15 global interrupt
  | TIM16 -- 21 TIM16 global interrupt
  | TIM17 -- 22 TIM17 global interrupt
  | I2C1 -- 23 I2C1 global interrupt
  | I2C2 -- 24 I2C2 global interrupt
  | SPI1 -- 25 SPI1_global_interrupt
  | SPI2 -- 26 SPI2 global interrupt
  | USART1 -- 27 USART1 global interrupt
  | USART2 -- 28 USART2 global interrupt
  | USART3_4 -- 29 USART3 and USART4 global interrupt
  | CEC_CAN -- 30 CEC and CAN global interrupt
  | USB -- 31 USB global interrupt
  deriving (Eq, Show, Enum)

instance STM32Interrupt Interrupt where
  interruptIRQn = IRQn . fromIntegral . fromEnum
  interruptTable _ = map Just (enumFrom WWDG)
  interruptHandlerName i = (show i) ++ "_IRQHandler"
