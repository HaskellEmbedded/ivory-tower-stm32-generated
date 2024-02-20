module Ivory.BSP.STM32G0.Interrupt where

import Ivory.BSP.ARMv7M.Exception
import Ivory.BSP.STM32.Interrupt

data Interrupt
  = WWDG -- 0 Window watchdog interrupt
  | PVD -- 1 Power voltage detector interrupt
  | RTC_TAMP -- 2 RTC and TAMP interrupts
  | FLASH -- 3 Flash global interrupt
  | RCC_CRS -- 4 RCC global interrupt
  | EXTI0_1 -- 5 EXTI line 0 and 1 interrupt
  | EXTI2_3 -- 6 EXTI line 2 and 3 interrupt
  | EXTI4_15 -- 7 EXTI line 4 to 15 interrupt
  | UCPD1_UCPD2_USB -- 8 UCPD and USB global interrupt
  | DMA1_CHANNEL1 -- 9 DMA1 channel 1 interrupt
  | DMA1_CHANNEL2_3 -- 10 DMA1 channel 2 and 3 interrupts
  | DMA1_CHANNEL4_5_6_7_DMAMUX_DMA2_CHANNEL1_2_3_4_5 -- 11 DMA1 channel 4, 5, 6, 7, DMAMUX, DMA2 channel 1, 2, 3, 4, 5 interrupts
  | ADC_COMP -- 12 ADC and COMP interrupts (ADC combined with EXTI 17 and 18)
  | TIM1_BRK_UP_TRG_COM -- 13 TIM1 break, update, trigger and commutation interrupts
  | TIM1_CC -- 14 TIM1 Capture Compare interrupt
  | TIM2 -- 15 TIM2 global interrupt
  | TIM3_TIM4 -- 16 TIM3 global interrupt
  | TIM6_DAC -- 17 TIM6 + LPTIM1 and DAC global interrupt
  | TIM7 -- 18 TIM7 + LPTIM2 global interrupt
  | TIM14 -- 19 TIM14 global interrupt
  | TIM15 -- 20 Timer 15 global interrupt
  | TIM16 -- 21 TIM16 global interrupt
  | TIM17 -- 22 TIM17 global interrupt
  | I2C1 -- 23 I2C1 global interrupt
  | I2C2_I2C3 -- 24 I2C2 and I2C3 global interrupt
  | SPI1 -- 25 SPI1 gloabl interrupt
  | SPI2_SPI3 -- 26 SPI2 gloabl interrupt
  | USART1 -- 27 USART1 global interrupt
  | USART2_LPUART2 -- 28 USART2 and LPUART2 global interrupt (combined with EXTI 26)
  | USART3_USART4_USART5_USART6_LPUART1 -- 29 USART3,4,5,6 and LPUART1 global interrupt (combined with EXTI 28)
  | CEC -- 30 CEC global interrupt
  | AES_RNG -- 31 AES and RNG global interrupts
  deriving (Eq, Show, Enum)

instance STM32Interrupt Interrupt where
  interruptIRQn = IRQn . fromIntegral . fromEnum
  interruptTable _ = map Just (enumFrom WWDG)
  interruptHandlerName i = (show i) ++ "_IRQHandler"
