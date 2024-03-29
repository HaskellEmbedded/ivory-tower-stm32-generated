module Ivory.BSP.STM32L4S7.Interrupt where

import Ivory.BSP.ARMv7M.Exception
import Ivory.BSP.STM32.Interrupt

data Interrupt
  = WWDG -- 0 Window Watchdog interrupt
  | PVD_PVM -- 1 PVD through EXTI line detection
  | TAMP_STAMP -- 2 Tamper and TimeStamp interrupts
  | RTC_WKUP -- 3 RTC Tamper or TimeStamp /CSS on LSE through EXTI line 19 interrupts
  | FLASH -- 4 Flash global interrupt
  | RCC -- 5 RCC global interrupt
  | EXTI0 -- 6 EXTI Line 0 interrupt
  | EXTI1 -- 7 EXTI Line 1 interrupt
  | EXTI2 -- 8 EXTI Line 2 interrupt
  | EXTI3 -- 9 EXTI Line 3 interrupt
  | EXTI4 -- 10 EXTI Line 4 interrupt
  | DMA1_CH1 -- 11 DMA1 Channel1 global interrupt
  | DMA1_CH2 -- 12 DMA1 Channel2 global interrupt
  | DMA1_CH3 -- 13 DMA1 Channel3 interrupt
  | DMA1_CH4 -- 14 DMA1 Channel4 interrupt
  | DMA1_CH5 -- 15 DMA1 Channel5 interrupt
  | DMA1_CH6 -- 16 DMA1 Channel6 interrupt
  | DMA1_CH7 -- 17 DMA1 Channel 7 interrupt
  | ADC1 -- 18 ADC1 and ADC2 global interrupt
  | CAN1_TX -- 19 CAN1 TX interrupts
  | CAN1_RX0 -- 20 CAN1 RX0 interrupts
  | CAN1_RX1 -- 21 CAN1 RX1 interrupts
  | CAN1_SCE -- 22 CAN1 SCE interrupt
  | EXTI9_5 -- 23 EXTI Line5 to Line9 interrupts
  | TIM1_BRK_TIM15 -- 24 TIM1 Break/TIM15 global interrupts
  | TIM1_UP_TIM16 -- 25 TIM1 Update/TIM16 global interrupts
  | TIM1_TRG_COM_TIM17 -- 26 TIM1 Trigger and Commutation interrupts and TIM17 global interrupt
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
  | EXTI15_10 -- 40 EXTI Lines 10 to 15 interrupts
  | RTC_ALARM -- 41 RTC alarms through EXTI line 18 interrupts
  | DFSDM1_FLT3 -- 42 DFSDM1_FLT3 global interrupt
  | TIM8_BRK -- 43 TIM8 Break Interrupt
  | TIM8_UP -- 44 TIM8 Update Interrupt
  | TIM8_TRG_COM -- 45 TIM8 Trigger and Commutation Interrupt
  | TIM8_CC -- 46 TIM8 Capture Compare Interrupt
  | ADC3 -- 47 ADC3 global interrupt
  | FMC -- 48 FMC global Interrupt
  | SDMMC1 -- 49 SDMMC global Interrupt
  | TIM5 -- 50 TIM5 global Interrupt
  | SPI3 -- 51 SPI3 global Interrupt
  | UART4 -- 52 UART4 global Interrupt
  | UART5 -- 53 UART5 global Interrupt
  | TIM6_DACUNDER -- 54 TIM6 global and DAC1 and 2 underrun error interrupts
  | TIM7 -- 55 TIM7 global interrupt
  | DMA2_CH1 -- 56 DMA2 Channel 1 global Interrupt
  | DMA2_CH2 -- 57 DMA2 Channel 2 global Interrupt
  | DMA2_CH3 -- 58 DMA2 Channel 3 global Interrupt
  | DMA2_CH4 -- 59 DMA2 Channel 4 global Interrupt
  | DMA2_CH5 -- 60 DMA2 Channel 5 global Interrupt
  | DFSDM1_FLT0 -- 61 DFSDM1_FLT0 global interrupt
  | DFSDM1_FLT1 -- 62 DFSDM1_FLT1 global interrupt
  | DFSDM1_FLT2 -- 63 DFSDM1_FLT2 global interrupt
  | COMP -- 64 COMP1 and COMP2 interrupts
  | LPTIM1 -- 65 LP TIM1 interrupt
  | LPTIM2 -- 66 LP TIM2 interrupt
  | OTG_FS -- 67 USB OTG FS global Interrupt
  | DMA2_CH6 -- 68 DMA2 Channel 6 global Interrupt
  | DMA2_CH7 -- 69 DMA2 Channel 7 global Interrupt
  | LPUART1 -- 70 LPUART1 global interrupt
  | OCTOSPI1 -- 71 OCTOSPI1 global interrupt
  | I2C3_EV -- 72 I2C3 event interrupt
  | I2C3_ER -- 73 I2C3 error interrupt
  | SAI1 -- 74 SAI1 global interrupt
  | SAI2 -- 75 SAI2 global interrupt
  | OCTOSPI2 -- 76 OCTOSPI2 global interrupt
  | TSC -- 77 TSC global interrupt
  | Undefined78 -- 78 Undefined interrupt (padding only)
  | AES -- 79 AES global interrupt
  | RNG_HASH -- 80 RNG and HASH global interrupt
  | FPU -- 81 Floating point interrupt
  | CRS -- 82 CRS global interrupt
  | I2C4_ER -- 83 I2C4 error interrupt
  | I2C4_EV -- 84 I2C4 event interrupt
  | DCMI -- 85 DCMI global interrupt
  | Undefined86 -- 86 Undefined interrupt (padding only)
  | Undefined87 -- 87 Undefined interrupt (padding only)
  | Undefined88 -- 88 Undefined interrupt (padding only)
  | Undefined89 -- 89 Undefined interrupt (padding only)
  | DMA2D -- 90 DMA2D global interrupt
  | LCD_TFT -- 91 LTDC global interrupt
  | LCD_TFT_ER -- 92 LTDC global error interrupt
  | GFXMMU -- 93 GFXMMU global error interrupt
  | DMAMUX_OVR -- 94 DMAMUX Overrun interrupt
  deriving (Eq, Show, Enum)

instance STM32Interrupt Interrupt where
  interruptIRQn = IRQn . fromIntegral . fromEnum
  interruptTable _ = map Just (enumFrom WWDG)
  interruptHandlerName i = (show i) ++ "_IRQHandler"
