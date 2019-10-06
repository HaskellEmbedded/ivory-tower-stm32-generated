{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}

module Ivory.BSP.STM32L431.RCC where

import Ivory.Language
import Ivory.HW
import Ivory.BSP.STM32L431.MemoryMap (rcc_periph_base)
import Ivory.BSP.STM32.Peripheral.RCC.RegTypes

-- RCC Reset and clock control

-- Base address: 0x40021000

-- Clock control register
--  | offset : 0x0
--  | address: 0x40021000
[ivory|
 bitdata RCC_CR :: Bits 32 = rcc_cr
  { _                :: Bits 4   -- (Reserved)
  , rcc_cr_pllsai1rdy  :: Bit      -- SAI1 PLL clock ready flag
  , rcc_cr_pllsai1on   :: Bit      -- SAI1 PLL enable
  , rcc_cr_pllrdy      :: Bit      -- Main PLL clock ready flag
  , rcc_cr_pllon       :: Bit      -- Main PLL enable
  , _                :: Bits 4   -- (Reserved)
  , rcc_cr_csson       :: Bit      -- Clock security system enable
  , rcc_cr_hsebyp      :: Bit      -- HSE crystal oscillator bypass
  , rcc_cr_hserdy      :: Bit      -- HSE clock ready flag
  , rcc_cr_hseon       :: Bit      -- HSE clock enable
  , _                :: Bits 4   -- (Reserved)
  , rcc_cr_hsiasfs     :: Bit      -- HSI automatic start from Stop
  , rcc_cr_hsirdy      :: Bit      -- HSI clock ready flag
  , rcc_cr_hsikeron    :: Bit      -- HSI always enable for peripheral kernels
  , rcc_cr_hsion       :: Bit      -- HSI clock enable
  , rcc_cr_msirange    :: Bits 4   -- MSI clock ranges
  , rcc_cr_msirgsel    :: Bit      -- MSI clock range selection
  , rcc_cr_msipllen    :: Bit      -- MSI clock PLL enable
  , rcc_cr_msirdy      :: Bit      -- MSI clock ready flag
  , rcc_cr_msion       :: Bit      -- MSI clock enable
  }
|]
rcc_reg_cr :: BitDataReg RCC_CR
rcc_reg_cr = mkBitDataRegNamed (rcc_periph_base + 0x0) "cr"

-- Internal clock sources calibration register
--  | offset : 0x4
--  | address: 0x40021004
[ivory|
 bitdata RCC_ICSCR :: Bits 32 = rcc_icscr
  { _                :: Bits 3   -- (Reserved)
  , rcc_icscr_hsitrim  :: Bits 5   -- HSI clock trimming
  , rcc_icscr_hsical   :: Bits 8   -- HSI clock calibration
  , rcc_icscr_msitrim  :: Bits 8   -- MSI clock trimming
  , rcc_icscr_msical   :: Bits 8   -- MSI clock calibration
  }
|]
rcc_reg_icscr :: BitDataReg RCC_ICSCR
rcc_reg_icscr = mkBitDataRegNamed (rcc_periph_base + 0x4) "icscr"

-- Clock configuration register
--  | offset : 0x8
--  | address: 0x40021008
[ivory|
 bitdata RCC_CFGR :: Bits 32 = rcc_cfgr
  { _                :: Bit      -- (Reserved)
  , rcc_cfgr_mcopre    :: RCC_MCOxPre  -- Microcontroller clock output prescaler
  , _                :: Bit      -- (Reserved)
  , rcc_cfgr_mcosel    :: Bits 3   -- Microcontroller clock output
  , _                :: Bits 8   -- (Reserved)
  , rcc_cfgr_stopwuck  :: Bit      -- Wakeup from Stop and CSS backup clock selection
  , _                :: Bit      -- (Reserved)
  , rcc_cfgr_ppre2     :: RCC_PPREx  -- APB high-speed prescaler (APB2)
  , rcc_cfgr_ppre1     :: RCC_PPREx  -- PB low-speed prescaler (APB1)
  , rcc_cfgr_hpre      :: RCC_HPRE  -- AHB prescaler
  , rcc_cfgr_sws       :: RCC_SYSCLK  -- System clock switch status
  , rcc_cfgr_sw        :: RCC_SYSCLK  -- System clock switch
  }
|]
rcc_reg_cfgr :: BitDataReg RCC_CFGR
rcc_reg_cfgr = mkBitDataRegNamed (rcc_periph_base + 0x8) "cfgr"

-- PLL configuration register
--  | offset : 0xc
--  | address: 0x4002100c
[ivory|
 bitdata RCC_PLLCFGR :: Bits 32 = rcc_pllcfgr
  { rcc_pllcfgr_pllpdiv  :: Bits 5   -- Main PLL division factor for PLLSAI2CLK
  , rcc_pllcfgr_pllr     :: Bits 2   -- Main PLL division factor for PLLCLK (system clock)
  , rcc_pllcfgr_pllren   :: Bit      -- Main PLL PLLCLK output enable
  , _                  :: Bit      -- (Reserved)
  , rcc_pllcfgr_pllq     :: Bits 2   -- Main PLL division factor for PLLUSB1CLK(48 MHz clock)
  , rcc_pllcfgr_pllqen   :: Bit      -- Main PLL PLLUSB1CLK output enable
  , _                  :: Bits 2   -- (Reserved)
  , rcc_pllcfgr_pllp     :: Bit      -- Main PLL division factor for PLLSAI3CLK (SAI1 and SAI2 clock)
  , rcc_pllcfgr_pllpen   :: Bit      -- Main PLL PLLSAI3CLK output enable
  , _                  :: Bit      -- (Reserved)
  , rcc_pllcfgr_plln     :: Bits 7   -- Main PLL multiplication factor for VCO
  , _                  :: Bit      -- (Reserved)
  , rcc_pllcfgr_pllm     :: Bits 3   -- Division factor for the main PLL and audio PLL (PLLSAI1 and PLLSAI2) input clock
  , _                  :: Bits 2   -- (Reserved)
  , rcc_pllcfgr_pllsrc   :: Bits 2   -- Main PLL, PLLSAI1 and PLLSAI2 entry clock source
  }
|]
rcc_reg_pllcfgr :: BitDataReg RCC_PLLCFGR
rcc_reg_pllcfgr = mkBitDataRegNamed (rcc_periph_base + 0xc) "pllcfgr"

-- PLLSAI1 configuration register
--  | offset : 0x10
--  | address: 0x40021010
[ivory|
 bitdata RCC_PLLSAI1CFGR :: Bits 32 = rcc_pllsai1cfgr
  { rcc_pllsai1cfgr_pllsai1pdiv  :: Bits 5   -- PLLSAI1 division factor for PLLSAI1CLK
  , rcc_pllsai1cfgr_pllsai1r     :: Bits 2   -- PLLSAI1 division factor for PLLADC1CLK (ADC clock)
  , rcc_pllsai1cfgr_pllsai1ren   :: Bit      -- PLLSAI1 PLLADC1CLK output enable
  , _                          :: Bit      -- (Reserved)
  , rcc_pllsai1cfgr_pllsai1q     :: Bits 2   -- SAI1PLL division factor for PLLUSB2CLK (48 MHz clock)
  , rcc_pllsai1cfgr_pllsai1qen   :: Bit      -- SAI1PLL PLLUSB2CLK output enable
  , _                          :: Bits 2   -- (Reserved)
  , rcc_pllsai1cfgr_pllsai1p     :: Bit      -- SAI1PLL division factor for PLLSAI1CLK (SAI1 or SAI2 clock)
  , rcc_pllsai1cfgr_pllsai1pen   :: Bit      -- SAI1PLL PLLSAI1CLK output enable
  , _                          :: Bit      -- (Reserved)
  , rcc_pllsai1cfgr_pllsai1n     :: Bits 7   -- SAI1PLL multiplication factor for VCO
  , _                          :: Bits 8   -- (Reserved)
  }
|]
rcc_reg_pllsai1cfgr :: BitDataReg RCC_PLLSAI1CFGR
rcc_reg_pllsai1cfgr = mkBitDataRegNamed (rcc_periph_base + 0x10) "pllsai1cfgr"

-- Clock interrupt enable register
--  | offset : 0x18
--  | address: 0x40021018
[ivory|
 bitdata RCC_CIR :: Bits 32 = rcc_cir
  { _                   :: Bits 21  -- (Reserved)
  , rcc_cir_hsi48rdyie    :: Bit      -- HSI48 ready interrupt enable
  , rcc_cir_lsecssie      :: Bit      -- LSE clock security system interrupt enable
  , _                   :: Bits 2   -- (Reserved)
  , rcc_cir_pllsai1rdyie  :: Bit      -- PLLSAI1 ready interrupt enable
  , rcc_cir_pllrdyie      :: Bit      -- PLL ready interrupt enable
  , rcc_cir_hserdyie      :: Bit      -- HSE ready interrupt enable
  , rcc_cir_hsirdyie      :: Bit      -- HSI ready interrupt enable
  , rcc_cir_msirdyie      :: Bit      -- MSI ready interrupt enable
  , rcc_cir_lserdyie      :: Bit      -- LSE ready interrupt enable
  , rcc_cir_lsirdyie      :: Bit      -- LSI ready interrupt enable
  }
|]
rcc_reg_cir :: BitDataReg RCC_CIR
rcc_reg_cir = mkBitDataRegNamed (rcc_periph_base + 0x18) "cir"

-- Clock interrupt flag register
--  | offset : 0x1c
--  | address: 0x4002101c
[ivory|
 bitdata RCC_CIFR :: Bits 32 = rcc_cifr
  { _                   :: Bits 21  -- (Reserved)
  , rcc_cifr_hsi48rdyf    :: Bit      -- HSI48 ready interrupt flag
  , rcc_cifr_lsecssf      :: Bit      -- LSE Clock security system interrupt flag
  , rcc_cifr_cssf         :: Bit      -- Clock security system interrupt flag
  , _                   :: Bit      -- (Reserved)
  , rcc_cifr_pllsai1rdyf  :: Bit      -- PLLSAI1 ready interrupt flag
  , rcc_cifr_pllrdyf      :: Bit      -- PLL ready interrupt flag
  , rcc_cifr_hserdyf      :: Bit      -- HSE ready interrupt flag
  , rcc_cifr_hsirdyf      :: Bit      -- HSI ready interrupt flag
  , rcc_cifr_msirdyf      :: Bit      -- MSI ready interrupt flag
  , rcc_cifr_lserdyf      :: Bit      -- LSE ready interrupt flag
  , rcc_cifr_lsirdyf      :: Bit      -- LSI ready interrupt flag
  }
|]
rcc_reg_cifr :: BitDataReg RCC_CIFR
rcc_reg_cifr = mkBitDataRegNamed (rcc_periph_base + 0x1c) "cifr"

-- Clock interrupt clear register
--  | offset : 0x20
--  | address: 0x40021020
[ivory|
 bitdata RCC_CICR :: Bits 32 = rcc_cicr
  { _                   :: Bits 21  -- (Reserved)
  , rcc_cicr_hsi48rdyc    :: Bit      -- HSI48 oscillator ready interrupt clear
  , rcc_cicr_lsecssc      :: Bit      -- LSE Clock security system interrupt clear
  , rcc_cicr_cssc         :: Bit      -- Clock security system interrupt clear
  , _                   :: Bit      -- (Reserved)
  , rcc_cicr_pllsai1rdyc  :: Bit      -- PLLSAI1 ready interrupt clear
  , rcc_cicr_pllrdyc      :: Bit      -- PLL ready interrupt clear
  , rcc_cicr_hserdyc      :: Bit      -- HSE ready interrupt clear
  , rcc_cicr_hsirdyc      :: Bit      -- HSI ready interrupt clear
  , rcc_cicr_msirdyc      :: Bit      -- MSI ready interrupt clear
  , rcc_cicr_lserdyc      :: Bit      -- LSE ready interrupt clear
  , rcc_cicr_lsirdyc      :: Bit      -- LSI ready interrupt clear
  }
|]
rcc_reg_cicr :: BitDataReg RCC_CICR
rcc_reg_cicr = mkBitDataRegNamed (rcc_periph_base + 0x20) "cicr"

-- AHB1 peripheral reset register
--  | offset : 0x28
--  | address: 0x40021028
[ivory|
 bitdata RCC_AHB1RSTR :: Bits 32 = rcc_ahb1rstr
  { _                    :: Bits 15  -- (Reserved)
  , rcc_ahb1rstr_tscrst    :: Bit      -- Touch Sensing Controller reset
  , _                    :: Bits 4   -- (Reserved)
  , rcc_ahb1rstr_crcrst    :: Bit      -- CRC reset
  , _                    :: Bits 2   -- (Reserved)
  , rcc_ahb1rstr_flashrst  :: Bit      -- Flash memory interface reset
  , _                    :: Bits 6   -- (Reserved)
  , rcc_ahb1rstr_dma2rst   :: Bit      -- DMA2 reset
  , rcc_ahb1rstr_dma1rst   :: Bit      -- DMA1 reset
  }
|]
rcc_reg_ahb1rstr :: BitDataReg RCC_AHB1RSTR
rcc_reg_ahb1rstr = mkBitDataRegNamed (rcc_periph_base + 0x28) "ahb1rstr"

-- AHB2 peripheral reset register
--  | offset : 0x2c
--  | address: 0x4002102c
[ivory|
 bitdata RCC_AHB2RSTR :: Bits 32 = rcc_ahb2rstr
  { _                    :: Bits 13  -- (Reserved)
  , rcc_ahb2rstr_rngrst    :: Bit      -- Random number generator reset
  , _                    :: Bit      -- (Reserved)
  , rcc_ahb2rstr_aesrst    :: Bit      -- AES hardware accelerator reset
  , _                    :: Bits 2   -- (Reserved)
  , rcc_ahb2rstr_adcrst    :: Bit      -- ADC reset
  , _                    :: Bits 5   -- (Reserved)
  , rcc_ahb2rstr_gpiohrst  :: Bit      -- IO port H reset
  , _                    :: Bits 2   -- (Reserved)
  , rcc_ahb2rstr_gpioerst  :: Bit      -- IO port E reset
  , rcc_ahb2rstr_gpiodrst  :: Bit      -- IO port D reset
  , rcc_ahb2rstr_gpiocrst  :: Bit      -- IO port C reset
  , rcc_ahb2rstr_gpiobrst  :: Bit      -- IO port B reset
  , rcc_ahb2rstr_gpioarst  :: Bit      -- IO port A reset
  }
|]
rcc_reg_ahb2rstr :: BitDataReg RCC_AHB2RSTR
rcc_reg_ahb2rstr = mkBitDataRegNamed (rcc_periph_base + 0x2c) "ahb2rstr"

-- AHB3 peripheral reset register
--  | offset : 0x30
--  | address: 0x40021030
[ivory|
 bitdata RCC_AHB3RSTR :: Bits 32 = rcc_ahb3rstr
  { _                   :: Bits 23  -- (Reserved)
  , rcc_ahb3rstr_qspirst  :: Bit      -- Quad SPI memory interface reset
  , _                   :: Bits 8   -- (Reserved)
  }
|]
rcc_reg_ahb3rstr :: BitDataReg RCC_AHB3RSTR
rcc_reg_ahb3rstr = mkBitDataRegNamed (rcc_periph_base + 0x30) "ahb3rstr"

-- APB1 peripheral reset register 1
--  | offset : 0x38
--  | address: 0x40021038
[ivory|
 bitdata RCC_APB1RSTR1 :: Bits 32 = rcc_apb1rstr1
  { rcc_apb1rstr1_lptim1rst  :: Bit      -- Low Power Timer 1 reset
  , rcc_apb1rstr1_opamprst   :: Bit      -- OPAMP interface reset
  , rcc_apb1rstr1_dac1rst    :: Bit      -- DAC1 interface reset
  , rcc_apb1rstr1_pwrrst     :: Bit      -- Power interface reset
  , _                      :: Bit      -- (Reserved)
  , rcc_apb1rstr1_usbfsrst   :: Bit      -- USB FS reset
  , rcc_apb1rstr1_can1rst    :: Bit      -- CAN1 reset
  , rcc_apb1rstr1_crsrst     :: Bit      -- CRS reset
  , rcc_apb1rstr1_i2c3rst    :: Bit      -- I2C3 reset
  , rcc_apb1rstr1_i2c2rst    :: Bit      -- I2C2 reset
  , rcc_apb1rstr1_i2c1rst    :: Bit      -- I2C1 reset
  , _                      :: Bit      -- (Reserved)
  , rcc_apb1rstr1_usart4rst  :: Bit      -- USART4 reset.
  , rcc_apb1rstr1_usart1rst  :: Bit      -- USART1 reset
  , rcc_apb1rstr1_usart2rst  :: Bit      -- USART2 reset
  , _                      :: Bit      -- (Reserved)
  , rcc_apb1rstr1_spi3rst    :: Bit      -- SPI3 reset
  , rcc_apb1rstr1_spi2rst    :: Bit      -- SPI2 reset
  , _                      :: Bits 4   -- (Reserved)
  , rcc_apb1rstr1_lcdrst     :: Bit      -- LCD interface reset
  , _                      :: Bits 3   -- (Reserved)
  , rcc_apb1rstr1_tim7rst    :: Bit      -- TIM7 timer reset
  , rcc_apb1rstr1_tim6rst    :: Bit      -- TIM6 timer reset
  , _                      :: Bits 3   -- (Reserved)
  , rcc_apb1rstr1_tim2rst    :: Bit      -- TIM2 timer reset
  }
|]
rcc_reg_apb1rstr1 :: BitDataReg RCC_APB1RSTR1
rcc_reg_apb1rstr1 = mkBitDataRegNamed (rcc_periph_base + 0x38) "apb1rstr1"

-- APB1 peripheral reset register 2
--  | offset : 0x3c
--  | address: 0x4002103c
[ivory|
 bitdata RCC_APB1RSTR2 :: Bits 32 = rcc_apb1rstr2
  { _                       :: Bits 26  -- (Reserved)
  , rcc_apb1rstr2_lptim2rst   :: Bit      -- Low-power timer 2 reset
  , _                       :: Bits 2   -- (Reserved)
  , rcc_apb1rstr2_swpmi1rst   :: Bit      -- Single wire protocol reset
  , rcc_apb1rstr2_i2c4rst     :: Bit      -- I2C4 reset
  , rcc_apb1rstr2_lpuart1rst  :: Bit      -- Low-power UART 1 reset
  }
|]
rcc_reg_apb1rstr2 :: BitDataReg RCC_APB1RSTR2
rcc_reg_apb1rstr2 = mkBitDataRegNamed (rcc_periph_base + 0x3c) "apb1rstr2"

-- APB2 peripheral reset register
--  | offset : 0x40
--  | address: 0x40021040
[ivory|
 bitdata RCC_APB2RSTR :: Bits 32 = rcc_apb2rstr
  { _                     :: Bits 7   -- (Reserved)
  , rcc_apb2rstr_dfsdmrst   :: Bit      -- DFSDM filter reset
  , _                     :: Bits 2   -- (Reserved)
  , rcc_apb2rstr_sai1rst    :: Bit      -- Serial audio interface 1 (SAI1) reset
  , _                     :: Bits 3   -- (Reserved)
  , rcc_apb2rstr_tim16rst   :: Bit      -- TIM16 timer reset
  , rcc_apb2rstr_tim15rst   :: Bit      -- TIM15 timer reset
  , _                     :: Bit      -- (Reserved)
  , rcc_apb2rstr_usart1rst  :: Bit      -- USART1 reset
  , _                     :: Bit      -- (Reserved)
  , rcc_apb2rstr_spi1rst    :: Bit      -- SPI1 reset
  , rcc_apb2rstr_tim1rst    :: Bit      -- TIM1 timer reset
  , rcc_apb2rstr_sdmmcrst   :: Bit      -- SDMMC reset
  , _                     :: Bits 9   -- (Reserved)
  , rcc_apb2rstr_syscfgrst  :: Bit      -- System configuration (SYSCFG) reset
  }
|]
rcc_reg_apb2rstr :: BitDataReg RCC_APB2RSTR
rcc_reg_apb2rstr = mkBitDataRegNamed (rcc_periph_base + 0x40) "apb2rstr"

-- AHB1 peripheral clock enable register
--  | offset : 0x48
--  | address: 0x40021048
[ivory|
 bitdata RCC_AHB1ENR :: Bits 32 = rcc_ahb1enr
  { _                  :: Bits 15  -- (Reserved)
  , rcc_ahb1enr_tscen    :: Bit      -- Touch Sensing Controller clock enable
  , _                  :: Bits 3   -- (Reserved)
  , rcc_ahb1enr_crcen    :: Bit      -- CRC clock enable
  , _                  :: Bits 3   -- (Reserved)
  , rcc_ahb1enr_flashen  :: Bit      -- Flash memory interface clock enable
  , _                  :: Bits 6   -- (Reserved)
  , rcc_ahb1enr_dma2en   :: Bit      -- DMA2 clock enable
  , rcc_ahb1enr_dma1en   :: Bit      -- DMA1 clock enable
  }
|]
rcc_reg_ahb1enr :: BitDataReg RCC_AHB1ENR
rcc_reg_ahb1enr = mkBitDataRegNamed (rcc_periph_base + 0x48) "ahb1enr"

-- AHB2 peripheral clock enable register
--  | offset : 0x4c
--  | address: 0x4002104c
[ivory|
 bitdata RCC_AHB2ENR :: Bits 32 = rcc_ahb2enr
  { _                  :: Bits 13  -- (Reserved)
  , rcc_ahb2enr_rngen    :: Bit      -- Random Number Generator clock enable
  , _                  :: Bit      -- (Reserved)
  , rcc_ahb2enr_aesen    :: Bit      -- AES accelerator clock enable
  , _                  :: Bits 2   -- (Reserved)
  , rcc_ahb2enr_adcen    :: Bit      -- ADC clock enable
  , _                  :: Bits 5   -- (Reserved)
  , rcc_ahb2enr_gpiohen  :: Bit      -- IO port H clock enable
  , _                  :: Bits 2   -- (Reserved)
  , rcc_ahb2enr_gpioeen  :: Bit      -- IO port E clock enable
  , rcc_ahb2enr_gpioden  :: Bit      -- IO port D clock enable
  , rcc_ahb2enr_gpiocen  :: Bit      -- IO port C clock enable
  , rcc_ahb2enr_gpioben  :: Bit      -- IO port B clock enable
  , rcc_ahb2enr_gpioaen  :: Bit      -- IO port A clock enable
  }
|]
rcc_reg_ahb2enr :: BitDataReg RCC_AHB2ENR
rcc_reg_ahb2enr = mkBitDataRegNamed (rcc_periph_base + 0x4c) "ahb2enr"

-- AHB3 peripheral clock enable register
--  | offset : 0x50
--  | address: 0x40021050
[ivory|
 bitdata RCC_AHB3ENR :: Bits 32 = rcc_ahb3enr
  { _                 :: Bits 23  -- (Reserved)
  , rcc_ahb3enr_qspien  :: Bit      -- QSPIEN
  , _                 :: Bits 8   -- (Reserved)
  }
|]
rcc_reg_ahb3enr :: BitDataReg RCC_AHB3ENR
rcc_reg_ahb3enr = mkBitDataRegNamed (rcc_periph_base + 0x50) "ahb3enr"

-- APB1ENR1
--  | offset : 0x58
--  | address: 0x40021058
[ivory|
 bitdata RCC_APB1ENR1 :: Bits 32 = rcc_apb1enr1
  { rcc_apb1enr1_lptim1en  :: Bit      -- Low power timer 1 clock enable
  , rcc_apb1enr1_opampen   :: Bit      -- OPAMP interface clock enable
  , rcc_apb1enr1_dac1en    :: Bit      -- DAC1 interface clock enable
  , rcc_apb1enr1_pwren     :: Bit      -- Power interface clock enable
  , _                    :: Bit      -- (Reserved)
  , rcc_apb1enr1_usbf      :: Bit      -- USB FS clock enable
  , rcc_apb1enr1_can1en    :: Bit      -- CAN1 clock enable
  , rcc_apb1enr1_crsen     :: Bit      -- CRS clock enable
  , rcc_apb1enr1_i2c3en    :: Bit      -- I2C3 clock enable
  , rcc_apb1enr1_i2c2en    :: Bit      -- I2C2 clock enable
  , rcc_apb1enr1_i2c1en    :: Bit      -- I2C1 clock enable
  , _                    :: Bit      -- (Reserved)
  , rcc_apb1enr1_uart4en   :: Bit      -- UART4 clock enable
  , rcc_apb1enr1_usart3en  :: Bit      -- USART1 clock enable
  , rcc_apb1enr1_usart2en  :: Bit      -- USART2 clock enable
  , _                    :: Bit      -- (Reserved)
  , rcc_apb1enr1_spi3en    :: Bit      -- SPI3 clock enable
  , rcc_apb1enr1_spi2en    :: Bit      -- SPI1 clock enable
  , _                    :: Bits 2   -- (Reserved)
  , rcc_apb1enr1_wwdgen    :: Bit      -- Window watchdog clock enable
  , rcc_apb1enr1_rtcapben  :: Bit      -- RTC APB clock enable
  , rcc_apb1enr1_lcden     :: Bit      -- LCD clock enable
  , _                    :: Bits 3   -- (Reserved)
  , rcc_apb1enr1_tim7en    :: Bit      -- TIM7 timer clock enable
  , rcc_apb1enr1_tim6en    :: Bit      -- TIM6 timer clock enable
  , _                    :: Bits 2   -- (Reserved)
  , rcc_apb1enr1_tim3en    :: Bit      -- TIM3 timer clock enable
  , rcc_apb1enr1_tim2en    :: Bit      -- TIM2 timer clock enable
  }
|]
rcc_reg_apb1enr1 :: BitDataReg RCC_APB1ENR1
rcc_reg_apb1enr1 = mkBitDataRegNamed (rcc_periph_base + 0x58) "apb1enr1"

-- APB1 peripheral clock enable register 2
--  | offset : 0x5c
--  | address: 0x4002105c
[ivory|
 bitdata RCC_APB1ENR2 :: Bits 32 = rcc_apb1enr2
  { _                     :: Bits 7   -- (Reserved)
  , rcc_apb1enr2_dfsdmen    :: Bit      -- DFSDMEN enable
  , _                     :: Bits 18  -- (Reserved)
  , rcc_apb1enr2_lptim2en   :: Bit      -- LPTIM2EN
  , _                     :: Bits 2   -- (Reserved)
  , rcc_apb1enr2_swpmi1en   :: Bit      -- Single wire protocol clock enable
  , rcc_apb1enr2_i2c4en     :: Bit      -- I2C4 clock enable
  , rcc_apb1enr2_lpuart1en  :: Bit      -- Low power UART 1 clock enable
  }
|]
rcc_reg_apb1enr2 :: BitDataReg RCC_APB1ENR2
rcc_reg_apb1enr2 = mkBitDataRegNamed (rcc_periph_base + 0x5c) "apb1enr2"

-- APB2ENR
--  | offset : 0x60
--  | address: 0x40021060
[ivory|
 bitdata RCC_APB2ENR :: Bits 32 = rcc_apb2enr
  { _                     :: Bits 10  -- (Reserved)
  , rcc_apb2enr_sai1en      :: Bit      -- SAI1 clock enable
  , _                     :: Bits 3   -- (Reserved)
  , rcc_apb2enr_tim16en     :: Bit      -- TIM16 timer clock enable
  , rcc_apb2enr_tim15en     :: Bit      -- TIM15 timer clock enable
  , _                     :: Bit      -- (Reserved)
  , rcc_apb2enr_usart1en    :: Bit      -- USART1clock enable
  , _                     :: Bit      -- (Reserved)
  , rcc_apb2enr_spi1en      :: Bit      -- SPI1 clock enable
  , rcc_apb2enr_tim1en      :: Bit      -- TIM1 timer clock enable
  , rcc_apb2enr_sdmmcen     :: Bit      -- SDMMC clock enable
  , _                     :: Bits 2   -- (Reserved)
  , rcc_apb2enr_firewallen  :: Bit      -- Firewall clock enable
  , _                     :: Bits 6   -- (Reserved)
  , rcc_apb2enr_syscfgen    :: Bit      -- SYSCFG clock enable
  }
|]
rcc_reg_apb2enr :: BitDataReg RCC_APB2ENR
rcc_reg_apb2enr = mkBitDataRegNamed (rcc_periph_base + 0x60) "apb2enr"

-- AHB1 peripheral clocks enable in Sleep and Stop modes register
--  | offset : 0x68
--  | address: 0x40021068
[ivory|
 bitdata RCC_AHB1SMENR :: Bits 32 = rcc_ahb1smenr
  { _                      :: Bits 15  -- (Reserved)
  , rcc_ahb1smenr_tscsmen    :: Bit      -- Touch Sensing Controller clocks enable during Sleep and Stop modes
  , _                      :: Bits 3   -- (Reserved)
  , rcc_ahb1smenr_crcsmen    :: Bit      -- CRCSMEN
  , _                      :: Bits 2   -- (Reserved)
  , rcc_ahb1smenr_sram1smen  :: Bit      -- SRAM1 interface clocks enable during Sleep and Stop modes
  , rcc_ahb1smenr_flashsmen  :: Bit      -- Flash memory interface clocks enable during Sleep and Stop modes
  , _                      :: Bits 6   -- (Reserved)
  , rcc_ahb1smenr_dma2smen   :: Bit      -- DMA2 clocks enable during Sleep and Stop modes
  , rcc_ahb1smenr_dma1smen   :: Bit      -- DMA1 clocks enable during Sleep and Stop modes
  }
|]
rcc_reg_ahb1smenr :: BitDataReg RCC_AHB1SMENR
rcc_reg_ahb1smenr = mkBitDataRegNamed (rcc_periph_base + 0x68) "ahb1smenr"

-- AHB2 peripheral clocks enable in Sleep and Stop modes register
--  | offset : 0x6c
--  | address: 0x4002106c
[ivory|
 bitdata RCC_AHB2SMENR :: Bits 32 = rcc_ahb2smenr
  { _                      :: Bits 13  -- (Reserved)
  , rcc_ahb2smenr_rngsmen    :: Bit      -- Random Number Generator clocks enable during Sleep and Stop modes
  , _                      :: Bit      -- (Reserved)
  , rcc_ahb2smenr_aessmen    :: Bit      -- AES accelerator clocks enable during Sleep and Stop modes
  , _                      :: Bits 2   -- (Reserved)
  , rcc_ahb2smenr_adcfssmen  :: Bit      -- ADC clocks enable during Sleep and Stop modes
  , _                      :: Bits 3   -- (Reserved)
  , rcc_ahb2smenr_sram2smen  :: Bit      -- SRAM2 interface clocks enable during Sleep and Stop modes
  , _                      :: Bit      -- (Reserved)
  , rcc_ahb2smenr_gpiohsmen  :: Bit      -- IO port H clocks enable during Sleep and Stop modes
  , _                      :: Bits 2   -- (Reserved)
  , rcc_ahb2smenr_gpioesmen  :: Bit      -- IO port E clocks enable during Sleep and Stop modes
  , rcc_ahb2smenr_gpiodsmen  :: Bit      -- IO port D clocks enable during Sleep and Stop modes
  , rcc_ahb2smenr_gpiocsmen  :: Bit      -- IO port C clocks enable during Sleep and Stop modes
  , rcc_ahb2smenr_gpiobsmen  :: Bit      -- IO port B clocks enable during Sleep and Stop modes
  , rcc_ahb2smenr_gpioasmen  :: Bit      -- IO port A clocks enable during Sleep and Stop modes
  }
|]
rcc_reg_ahb2smenr :: BitDataReg RCC_AHB2SMENR
rcc_reg_ahb2smenr = mkBitDataRegNamed (rcc_periph_base + 0x6c) "ahb2smenr"

-- AHB3 peripheral clocks enable in Sleep and Stop modes register
--  | offset : 0x70
--  | address: 0x40021070
[ivory|
 bitdata RCC_AHB3SMENR :: Bits 32 = rcc_ahb3smenr
  { _                     :: Bits 23  -- (Reserved)
  , rcc_ahb3smenr_qspismen  :: Bit      -- QSPISMEN
  , _                     :: Bits 8   -- (Reserved)
  }
|]
rcc_reg_ahb3smenr :: BitDataReg RCC_AHB3SMENR
rcc_reg_ahb3smenr = mkBitDataRegNamed (rcc_periph_base + 0x70) "ahb3smenr"

-- APB1SMENR1
--  | offset : 0x78
--  | address: 0x40021078
[ivory|
 bitdata RCC_APB1SMENR1 :: Bits 32 = rcc_apb1smenr1
  { rcc_apb1smenr1_lptim1smen  :: Bit      -- Low power timer 1 clocks enable during Sleep and Stop modes
  , rcc_apb1smenr1_opampsmen   :: Bit      -- OPAMP interface clocks enable during Sleep and Stop modes
  , rcc_apb1smenr1_dac1smen    :: Bit      -- DAC1 interface clocks enable during Sleep and Stop modes
  , rcc_apb1smenr1_pwrsmen     :: Bit      -- Power interface clocks enable during Sleep and Stop modes
  , _                        :: Bit      -- (Reserved)
  , rcc_apb1smenr1_usbfssmen   :: Bit      -- USB FS clock enable during Sleep and Stop modes
  , rcc_apb1smenr1_can1smen    :: Bit      -- CAN1 clocks enable during Sleep and Stop modes
  , rcc_apb1smenr1_crssmen     :: Bit      -- CRS clock enable during Sleep and Stop modes
  , rcc_apb1smenr1_i2c3smen    :: Bit      -- I2C3 clocks enable during Sleep and Stop modes
  , rcc_apb1smenr1_i2c2smen    :: Bit      -- I2C2 clocks enable during Sleep and Stop modes
  , rcc_apb1smenr1_i2c1smen    :: Bit      -- I2C1 clocks enable during Sleep and Stop modes
  , _                        :: Bits 2   -- (Reserved)
  , rcc_apb1smenr1_usart2smen  :: Bit      -- USART2 clocks enable during Sleep and Stop modes
  , rcc_apb1smenr1_usart1smen  :: Bit      -- USART1 clocks enable during Sleep and Stop modes
  , _                        :: Bit      -- (Reserved)
  , rcc_apb1smenr1_sp3smen     :: Bit      -- SPI3 clocks enable during Sleep and Stop modes
  , rcc_apb1smenr1_spi2smen    :: Bit      -- SPI2 clocks enable during Sleep and Stop modes
  , _                        :: Bits 2   -- (Reserved)
  , rcc_apb1smenr1_wwdgsmen    :: Bit      -- Window watchdog clocks enable during Sleep and Stop modes
  , rcc_apb1smenr1_rtcapbsmen  :: Bit      -- RTC APB clock enable during Sleep and Stop modes
  , rcc_apb1smenr1_lcdsmen     :: Bit      -- LCD clocks enable during Sleep and Stop modes
  , _                        :: Bits 3   -- (Reserved)
  , rcc_apb1smenr1_tim7smen    :: Bit      -- TIM7 timer clocks enable during Sleep and Stop modes
  , rcc_apb1smenr1_tim6smen    :: Bit      -- TIM6 timer clocks enable during Sleep and Stop modes
  , _                        :: Bits 3   -- (Reserved)
  , rcc_apb1smenr1_tim2smen    :: Bit      -- TIM2 timer clocks enable during Sleep and Stop modes
  }
|]
rcc_reg_apb1smenr1 :: BitDataReg RCC_APB1SMENR1
rcc_reg_apb1smenr1 = mkBitDataRegNamed (rcc_periph_base + 0x78) "apb1smenr1"

-- APB1 peripheral clocks enable in Sleep and Stop modes register 2
--  | offset : 0x7c
--  | address: 0x4002107c
[ivory|
 bitdata RCC_APB1SMENR2 :: Bits 32 = rcc_apb1smenr2
  { _                         :: Bits 26  -- (Reserved)
  , rcc_apb1smenr2_lptim2smen   :: Bit      -- LPTIM2SMEN
  , _                         :: Bits 2   -- (Reserved)
  , rcc_apb1smenr2_swpmi1smen   :: Bit      -- Single wire protocol clocks enable during Sleep and Stop modes
  , _                         :: Bit      -- (Reserved)
  , rcc_apb1smenr2_lpuart1smen  :: Bit      -- Low power UART 1 clocks enable during Sleep and Stop modes
  }
|]
rcc_reg_apb1smenr2 :: BitDataReg RCC_APB1SMENR2
rcc_reg_apb1smenr2 = mkBitDataRegNamed (rcc_periph_base + 0x7c) "apb1smenr2"

-- APB2SMENR
--  | offset : 0x80
--  | address: 0x40021080
[ivory|
 bitdata RCC_APB2SMENR :: Bits 32 = rcc_apb2smenr
  { _                       :: Bits 10  -- (Reserved)
  , rcc_apb2smenr_sai1smen    :: Bit      -- SAI1 clocks enable during Sleep and Stop modes
  , _                       :: Bits 3   -- (Reserved)
  , rcc_apb2smenr_tim16smen   :: Bit      -- TIM16 timer clocks enable during Sleep and Stop modes
  , rcc_apb2smenr_tim15smen   :: Bit      -- TIM15 timer clocks enable during Sleep and Stop modes
  , _                       :: Bit      -- (Reserved)
  , rcc_apb2smenr_usart1smen  :: Bit      -- USART1clocks enable during Sleep and Stop modes
  , _                       :: Bit      -- (Reserved)
  , rcc_apb2smenr_spi1smen    :: Bit      -- SPI1 clocks enable during Sleep and Stop modes
  , rcc_apb2smenr_tim1smen    :: Bit      -- TIM1 timer clocks enable during Sleep and Stop modes
  , rcc_apb2smenr_sdmmcsmen   :: Bit      -- SDMMC clocks enable during Sleep and Stop modes
  , _                       :: Bits 9   -- (Reserved)
  , rcc_apb2smenr_syscfgsmen  :: Bit      -- SYSCFG clocks enable during Sleep and Stop modes
  }
|]
rcc_reg_apb2smenr :: BitDataReg RCC_APB2SMENR
rcc_reg_apb2smenr = mkBitDataRegNamed (rcc_periph_base + 0x80) "apb2smenr"

-- CCIPR
--  | offset : 0x88
--  | address: 0x40021088
[ivory|
 bitdata RCC_CCIPR :: Bits 32 = rcc_ccipr
  { _                   :: Bit      -- (Reserved)
  , rcc_ccipr_swpmi1sel   :: Bit      -- SWPMI1 clock source selection
  , rcc_ccipr_adcsel      :: Bits 2   -- ADCs clock source selection
  , rcc_ccipr_clk48sel    :: Bits 2   -- 48 MHz clock source selection
  , _                   :: Bits 2   -- (Reserved)
  , rcc_ccipr_sai1sel     :: Bits 2   -- SAI1 clock source selection
  , rcc_ccipr_lptim2sel   :: Bits 2   -- Low power timer 2 clock source selection
  , rcc_ccipr_lptim1sel   :: Bits 2   -- Low power timer 1 clock source selection
  , rcc_ccipr_i2c3sel     :: Bits 2   -- I2C3 clock source selection
  , rcc_ccipr_i2c2sel     :: Bits 2   -- I2C2 clock source selection
  , rcc_ccipr_i2c1sel     :: Bits 2   -- I2C1 clock source selection
  , rcc_ccipr_lpuart1sel  :: Bits 2   -- LPUART1 clock source selection
  , _                   :: Bits 2   -- (Reserved)
  , rcc_ccipr_usart4sel   :: Bits 2   -- USART4 clock source selection
  , rcc_ccipr_usart3sel   :: Bits 2   -- USART3 clock source selection
  , rcc_ccipr_usart2sel   :: Bits 2   -- USART2 clock source selection
  , rcc_ccipr_usart1sel   :: Bits 2   -- USART1 clock source selection
  }
|]
rcc_reg_ccipr :: BitDataReg RCC_CCIPR
rcc_reg_ccipr = mkBitDataRegNamed (rcc_periph_base + 0x88) "ccipr"

-- BDCR
--  | offset : 0x90
--  | address: 0x40021090
[ivory|
 bitdata RCC_BDCR :: Bits 32 = rcc_bdcr
  { _                :: Bits 6   -- (Reserved)
  , rcc_bdcr_lscosel   :: Bit      -- Low speed clock output selection
  , rcc_bdcr_lscoen    :: Bit      -- Low speed clock output enable
  , _                :: Bits 7   -- (Reserved)
  , rcc_bdcr_bdrst     :: Bit      -- Backup domain software reset
  , rcc_bdcr_rtcen     :: Bit      -- RTC clock enable
  , _                :: Bits 5   -- (Reserved)
  , rcc_bdcr_rtcsel    :: Bits 2   -- RTC clock source selection
  , _                :: Bit      -- (Reserved)
  , rcc_bdcr_lsecssd   :: Bit      -- LSECSSD
  , rcc_bdcr_lsecsson  :: Bit      -- LSECSSON
  , rcc_bdcr_lsedrv    :: Bits 2   -- SE oscillator drive capability
  , rcc_bdcr_lsebyp    :: Bit      -- LSE oscillator bypass
  , rcc_bdcr_lserdy    :: Bit      -- LSE oscillator ready
  , rcc_bdcr_lseon     :: Bit      -- LSE oscillator enable
  }
|]
rcc_reg_bdcr :: BitDataReg RCC_BDCR
rcc_reg_bdcr = mkBitDataRegNamed (rcc_periph_base + 0x90) "bdcr"

-- CSR
--  | offset : 0x94
--  | address: 0x40021094
[ivory|
 bitdata RCC_CSR :: Bits 32 = rcc_csr
  { rcc_csr_lpwrstf       :: Bit      -- Low-power reset flag
  , rcc_csr_wwdgrstf      :: Bit      -- Window watchdog reset flag
  , rcc_csr_iwdgrstf      :: Bit      -- Independent window watchdog reset flag
  , rcc_csr_sftrstf       :: Bit      -- Software reset flag
  , rcc_csr_borrstf       :: Bit      -- BOR flag
  , rcc_csr_pinrstf       :: Bit      -- Pin reset flag
  , rcc_csr_oblrstf       :: Bit      -- Option byte loader reset flag
  , rcc_csr_firewallrstf  :: Bit      -- Firewall reset flag
  , rcc_csr_rmvf          :: Bit      -- Remove reset flag
  , _                   :: Bits 11  -- (Reserved)
  , rcc_csr_msisrange     :: Bits 4   -- SI range after Standby mode
  , _                   :: Bits 6   -- (Reserved)
  , rcc_csr_lsirdy        :: Bit      -- LSI oscillator ready
  , rcc_csr_lsion         :: Bit      -- LSI oscillator enable
  }
|]
rcc_reg_csr :: BitDataReg RCC_CSR
rcc_reg_csr = mkBitDataRegNamed (rcc_periph_base + 0x94) "csr"

-- Clock recovery RC register
--  | offset : 0x98
--  | address: 0x40021098
[ivory|
 bitdata RCC_CRRCR :: Bits 32 = rcc_crrcr
  { _                 :: Bits 16  -- (Reserved)
  , rcc_crrcr_hsi48cal  :: Bits 9   -- HSI48 clock calibration
  , _                 :: Bits 5   -- (Reserved)
  , rcc_crrcr_hsi48rdy  :: Bit      -- HSI48 clock ready flag
  , rcc_crrcr_hsi48on   :: Bit      -- HSI48 clock enable
  }
|]
rcc_reg_crrcr :: BitDataReg RCC_CRRCR
rcc_reg_crrcr = mkBitDataRegNamed (rcc_periph_base + 0x98) "crrcr"

