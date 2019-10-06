module Ivory.BSP.STM32F070.Interrupt where

import Ivory.BSP.ARMv7M.Exception
import Ivory.BSP.STM32.Interrupt

data Interrupt
  = WWDG -- 0 Window Watchdog interrupt
  | PVD -- 1 PVD and VDDIO2 supply comparator interrupt
  | RTC -- 2 RTC interrupts
  | FLASH -- 3 Flash global interrupt
  | RCC -- 4 RCC global interruptr
  | EXTI0_1 -- 5 EXTI Line[1:0] interrupts
  | EXTI2_3 -- 6 EXTI Line[3:2] interrupts
  | EXTI4_15 -- 7 EXTI Line15 and EXTI4 interrupts
  | Undefined8 -- 8 Undefined interrupt (padding only)
  | DMA1_CH1 -- 9 DMA1 channel 1 interrupt
  | DMA1_CH2_3 -- 10 DMA1 channel 2 and 3 interrupt
  | DMA1_CH4_5 -- 11 DMA1 channel 4 and 5 interrupt
  | ADC -- 12 ADC interrupt
  | TIM1_BRK_UP_TRG_COM -- 13 TIM1 break, update, trigger and commutation interrupt
  | TIM1_CC -- 14 TIM1 Capture Compare interrupt
  | Undefined15 -- 15 Undefined interrupt (padding only)
  | TIM3 -- 16 TIM3 global interrupt
  | TIM6 -- 17 TIM6 global interrupt
  | Undefined18 -- 18 Undefined interrupt (padding only)
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
  | USART3_4_5_6 -- 29 USART3, USART4, USART5, USART6 global interrupt
  | Undefined30 -- 30 Undefined interrupt (padding only)
  | USB -- 31 USB global interrupt
  deriving (Eq, Show, Enum)

instance STM32Interrupt Interrupt where
  interruptIRQn = IRQn . fromIntegral . fromEnum
  interruptTable _ = map Just (enumFrom WWDG)
  interruptHandlerName i = (show i) ++ "_IRQHandler"
