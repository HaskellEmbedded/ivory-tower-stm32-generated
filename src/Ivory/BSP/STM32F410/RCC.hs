{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}

module Ivory.BSP.STM32F410.RCC where

import Ivory.Language
import Ivory.HW
import Ivory.BSP.STM32F410.MemoryMap (rcc_periph_base)
import Ivory.BSP.STM32.Peripheral.RCC.RegTypes

-- RCC Reset and clock control

-- Base address: 0x40023800

-- clock control register
--  | offset : 0x0
--  | address: 0x40023800
[ivory|
 bitdata RCC_CR :: Bits 32 = rcc_cr
  { _             :: Bits 6   -- (Reserved)
  , rcc_cr_pllrdy   :: Bit      -- Main PLL (PLL) clock ready flag
  , rcc_cr_pllon    :: Bit      -- Main PLL (PLL) enable
  , _             :: Bits 4   -- (Reserved)
  , rcc_cr_csson    :: Bit      -- Clock security system enable
  , rcc_cr_hsebyp   :: Bit      -- HSE clock bypass
  , rcc_cr_hserdy   :: Bit      -- HSE clock ready flag
  , rcc_cr_hseon    :: Bit      -- HSE clock enable
  , rcc_cr_hsical   :: Bits 8   -- Internal high-speed clock calibration
  , rcc_cr_hsitrim  :: Bits 5   -- Internal high-speed clock trimming
  , _             :: Bit      -- (Reserved)
  , rcc_cr_hsirdy   :: Bit      -- Internal high-speed clock ready flag
  , rcc_cr_hsion    :: Bit      -- Internal high-speed clock enable
  }
|]
rcc_reg_cr :: BitDataReg RCC_CR
rcc_reg_cr = mkBitDataRegNamed (rcc_periph_base + 0x0) "cr"

-- PLL configuration register
--  | offset : 0x4
--  | address: 0x40023804
[ivory|
 bitdata RCC_PLLCFGR :: Bits 32 = rcc_pllcfgr
  { _                 :: Bit      -- (Reserved)
  , rcc_pllcfgr_pllr3   :: Bit      -- PLLR3
  , rcc_pllcfgr_pllr2   :: Bit      -- PLLR2
  , rcc_pllcfgr_pllr1   :: Bit      -- PLLR1
  , rcc_pllcfgr_pllq    :: Bits 4   -- Main PLL (PLL) division factor for USB OTG FS, SDIO and random number generator clocks
  , _                 :: Bit      -- (Reserved)
  , rcc_pllcfgr_pllsrc  :: Bit      -- Main PLL(PLL) and audio PLL (PLLI2S) entry clock source
  , _                 :: Bits 4   -- (Reserved)
  , rcc_pllcfgr_pllp    :: RCC_PLLP  -- Main PLL (PLL) division factor for main system clock
  , _                 :: Bit      -- (Reserved)
  , rcc_pllcfgr_plln    :: Bits 9   -- Main PLL (PLL) multiplication factor for VCO
  , rcc_pllcfgr_pllm    :: Bits 6   -- Division factor for the main PLL (PLL) and audio PLL (PLLI2S) input clock
  }
|]
rcc_reg_pllcfgr :: BitDataReg RCC_PLLCFGR
rcc_reg_pllcfgr = mkBitDataRegNamed (rcc_periph_base + 0x4) "pllcfgr"

-- clock configuration register
--  | offset : 0x8
--  | address: 0x40023808
[ivory|
 bitdata RCC_CFGR :: Bits 32 = rcc_cfgr
  { rcc_cfgr_mco2     :: RCC_MCOx  -- Microcontroller clock output 2
  , rcc_cfgr_mco2pre  :: RCC_MCOxPre  -- MCO2 prescaler
  , rcc_cfgr_mco1pre  :: RCC_MCOxPre  -- MCO1 prescaler
  , _               :: Bit      -- (Reserved)
  , rcc_cfgr_mco1     :: RCC_MCOx  -- Microcontroller clock output 1
  , rcc_cfgr_rtcpre   :: Bits 5   -- HSE division factor for RTC clock
  , rcc_cfgr_ppre2    :: RCC_PPREx  -- APB high-speed prescaler (APB2)
  , rcc_cfgr_ppre1    :: RCC_PPREx  -- APB Low speed prescaler (APB1)
  , rcc_cfgr_mco2en   :: Bit      -- MCO output enable
  , rcc_cfgr_mco1en   :: Bit      -- MCO output enable
  , rcc_cfgr_hpre     :: RCC_HPRE  -- AHB prescaler
  , rcc_cfgr_sws      :: RCC_SYSCLK  -- System clock switch status
  , rcc_cfgr_sw       :: RCC_SYSCLK  -- System clock switch
  }
|]
rcc_reg_cfgr :: BitDataReg RCC_CFGR
rcc_reg_cfgr = mkBitDataRegNamed (rcc_periph_base + 0x8) "cfgr"

-- clock interrupt register
--  | offset : 0xc
--  | address: 0x4002380c
[ivory|
 bitdata RCC_CIR :: Bits 32 = rcc_cir
  { _                 :: Bits 8   -- (Reserved)
  , rcc_cir_cssc        :: Bit      -- Clock security system interrupt clear
  , _                 :: Bit      -- (Reserved)
  , rcc_cir_plli2srdyc  :: Bit      -- PLLI2S ready interrupt clear
  , rcc_cir_pllrdyc     :: Bit      -- Main PLL(PLL) ready interrupt clear
  , rcc_cir_hserdyc     :: Bit      -- HSE ready interrupt clear
  , rcc_cir_hsirdyc     :: Bit      -- HSI ready interrupt clear
  , rcc_cir_lserdyc     :: Bit      -- LSE ready interrupt clear
  , rcc_cir_lsirdyc     :: Bit      -- LSI ready interrupt clear
  , _                 :: Bits 3   -- (Reserved)
  , rcc_cir_pllrdyie    :: Bit      -- Main PLL (PLL) ready interrupt enable
  , rcc_cir_hserdyie    :: Bit      -- HSE ready interrupt enable
  , rcc_cir_hsirdyie    :: Bit      -- HSI ready interrupt enable
  , rcc_cir_lserdyie    :: Bit      -- LSE ready interrupt enable
  , rcc_cir_lsirdyie    :: Bit      -- LSI ready interrupt enable
  , rcc_cir_cssf        :: Bit      -- Clock security system interrupt flag
  , _                 :: Bits 2   -- (Reserved)
  , rcc_cir_pllrdyf     :: Bit      -- Main PLL (PLL) ready interrupt flag
  , rcc_cir_hserdyf     :: Bit      -- HSE ready interrupt flag
  , rcc_cir_hsirdyf     :: Bit      -- HSI ready interrupt flag
  , rcc_cir_lserdyf     :: Bit      -- LSE ready interrupt flag
  , rcc_cir_lsirdyf     :: Bit      -- LSI ready interrupt flag
  }
|]
rcc_reg_cir :: BitDataReg RCC_CIR
rcc_reg_cir = mkBitDataRegNamed (rcc_periph_base + 0xc) "cir"

-- AHB1 peripheral reset register
--  | offset : 0x10
--  | address: 0x40023810
[ivory|
 bitdata RCC_AHB1RSTR :: Bits 32 = rcc_ahb1rstr
  { rcc_ahb1rstr_rngrst    :: Bit      -- RNGRST
  , _                    :: Bits 8   -- (Reserved)
  , rcc_ahb1rstr_dma2rst   :: Bit      -- DMA2 reset
  , rcc_ahb1rstr_dma1rst   :: Bit      -- DMA2 reset
  , _                    :: Bits 8   -- (Reserved)
  , rcc_ahb1rstr_crcrst    :: Bit      -- CRC reset
  , _                    :: Bits 4   -- (Reserved)
  , rcc_ahb1rstr_gpiohrst  :: Bit      -- IO port H reset
  , _                    :: Bits 4   -- (Reserved)
  , rcc_ahb1rstr_gpiocrst  :: Bit      -- IO port C reset
  , rcc_ahb1rstr_gpiobrst  :: Bit      -- IO port B reset
  , rcc_ahb1rstr_gpioarst  :: Bit      -- IO port A reset
  }
|]
rcc_reg_ahb1rstr :: BitDataReg RCC_AHB1RSTR
rcc_reg_ahb1rstr = mkBitDataRegNamed (rcc_periph_base + 0x10) "ahb1rstr"

-- APB1 peripheral reset register
--  | offset : 0x20
--  | address: 0x40023820
[ivory|
 bitdata RCC_APB1RSTR :: Bits 32 = rcc_apb1rstr
  { _                     :: Bits 2   -- (Reserved)
  , rcc_apb1rstr_dacrst     :: Bit      -- DAC reset
  , rcc_apb1rstr_pwrrst     :: Bit      -- Power interface reset
  , _                     :: Bits 3   -- (Reserved)
  , rcc_apb1rstr_i2c4rst    :: Bit      -- I2C4 reset
  , _                     :: Bit      -- (Reserved)
  , rcc_apb1rstr_i2c2rst    :: Bit      -- I2C 2 reset
  , rcc_apb1rstr_i2c1rst    :: Bit      -- I2C 1 reset
  , _                     :: Bits 3   -- (Reserved)
  , rcc_apb1rstr_uart2rst   :: Bit      -- USART 2 reset
  , _                     :: Bits 2   -- (Reserved)
  , rcc_apb1rstr_spi2rst    :: Bit      -- SPI 2 reset
  , _                     :: Bits 2   -- (Reserved)
  , rcc_apb1rstr_wwdgrst    :: Bit      -- Window watchdog reset
  , _                     :: Bit      -- (Reserved)
  , rcc_apb1rstr_lptim1rst  :: Bit      -- LPTIM1 reset
  , _                     :: Bits 4   -- (Reserved)
  , rcc_apb1rstr_tim6rst    :: Bit      -- TIM6 reset
  , rcc_apb1rstr_tim5rst    :: Bit      -- TIM5 reset
  , _                     :: Bits 3   -- (Reserved)
  }
|]
rcc_reg_apb1rstr :: BitDataReg RCC_APB1RSTR
rcc_reg_apb1rstr = mkBitDataRegNamed (rcc_periph_base + 0x20) "apb1rstr"

-- APB2 peripheral reset register
--  | offset : 0x24
--  | address: 0x40023824
[ivory|
 bitdata RCC_APB2RSTR :: Bits 32 = rcc_apb2rstr
  { _                     :: Bits 13  -- (Reserved)
  , rcc_apb2rstr_tim11rst   :: Bit      -- TIM11 reset
  , _                     :: Bit      -- (Reserved)
  , rcc_apb2rstr_tim9rst    :: Bit      -- TIM9 reset
  , _                     :: Bit      -- (Reserved)
  , rcc_apb2rstr_syscfgrst  :: Bit      -- System configuration controller reset
  , _                     :: Bit      -- (Reserved)
  , rcc_apb2rstr_spi1rst    :: Bit      -- SPI 1 reset
  , _                     :: Bits 3   -- (Reserved)
  , rcc_apb2rstr_adcrst     :: Bit      -- ADC interface reset (common to all ADCs)
  , _                     :: Bits 2   -- (Reserved)
  , rcc_apb2rstr_usart6rst  :: Bit      -- USART6 reset
  , rcc_apb2rstr_usart1rst  :: Bit      -- USART1 reset
  , _                     :: Bits 3   -- (Reserved)
  , rcc_apb2rstr_tim1rst    :: Bit      -- TIM1 reset
  }
|]
rcc_reg_apb2rstr :: BitDataReg RCC_APB2RSTR
rcc_reg_apb2rstr = mkBitDataRegNamed (rcc_periph_base + 0x24) "apb2rstr"

-- AHB1 peripheral clock register
--  | offset : 0x30
--  | address: 0x40023830
[ivory|
 bitdata RCC_AHB1ENR :: Bits 32 = rcc_ahb1enr
  { rcc_ahb1enr_rngen    :: Bit      -- RNG clock enable
  , _                  :: Bits 8   -- (Reserved)
  , rcc_ahb1enr_dma2en   :: Bit      -- DMA2 clock enable
  , rcc_ahb1enr_dma1en   :: Bit      -- DMA1 clock enable
  , _                  :: Bits 8   -- (Reserved)
  , rcc_ahb1enr_crcen    :: Bit      -- CRC clock enable
  , _                  :: Bits 4   -- (Reserved)
  , rcc_ahb1enr_gpiohen  :: Bit      -- IO port H clock enable
  , _                  :: Bits 4   -- (Reserved)
  , rcc_ahb1enr_gpiocen  :: Bit      -- IO port C clock enable
  , rcc_ahb1enr_gpioben  :: Bit      -- IO port B clock enable
  , rcc_ahb1enr_gpioaen  :: Bit      -- IO port A clock enable
  }
|]
rcc_reg_ahb1enr :: BitDataReg RCC_AHB1ENR
rcc_reg_ahb1enr = mkBitDataRegNamed (rcc_periph_base + 0x30) "ahb1enr"

-- APB1 peripheral clock enable register
--  | offset : 0x40
--  | address: 0x40023840
[ivory|
 bitdata RCC_APB1ENR :: Bits 32 = rcc_apb1enr
  { _                   :: Bits 2   -- (Reserved)
  , rcc_apb1enr_dacen     :: Bit      -- DAC interface clock enable
  , rcc_apb1enr_pwren     :: Bit      -- Power interface clock enable
  , _                   :: Bits 3   -- (Reserved)
  , rcc_apb1enr_i2c4en    :: Bit      -- I2C4 clock enable
  , _                   :: Bit      -- (Reserved)
  , rcc_apb1enr_i2c2en    :: Bit      -- I2C2 clock enable
  , rcc_apb1enr_i2c1en    :: Bit      -- I2C1 clock enable
  , _                   :: Bits 3   -- (Reserved)
  , rcc_apb1enr_usart2en  :: Bit      -- USART 2 clock enable
  , _                   :: Bits 2   -- (Reserved)
  , rcc_apb1enr_spi2en    :: Bit      -- SPI2 clock enable
  , _                   :: Bits 2   -- (Reserved)
  , rcc_apb1enr_wwdgen    :: Bit      -- Window watchdog clock enable
  , rcc_apb1enr_rtcapben  :: Bit      -- RTC APB clock enable
  , rcc_apb1enr_lptim1en  :: Bit      -- LPTIM1 clock enable
  , _                   :: Bits 4   -- (Reserved)
  , rcc_apb1enr_tim6en    :: Bit      -- TIM6 clock enable
  , rcc_apb1enr_tim5en    :: Bit      -- TIM5 clock enable
  , _                   :: Bits 3   -- (Reserved)
  }
|]
rcc_reg_apb1enr :: BitDataReg RCC_APB1ENR
rcc_reg_apb1enr = mkBitDataRegNamed (rcc_periph_base + 0x40) "apb1enr"

-- APB2 peripheral clock enable register
--  | offset : 0x44
--  | address: 0x40023844
[ivory|
 bitdata RCC_APB2ENR :: Bits 32 = rcc_apb2enr
  { _                   :: Bits 11  -- (Reserved)
  , rcc_apb2enr_spi5en    :: Bit      -- SPI5 clock enable
  , _                   :: Bit      -- (Reserved)
  , rcc_apb2enr_tim11en   :: Bit      -- TIM11 clock enable
  , _                   :: Bit      -- (Reserved)
  , rcc_apb2enr_tim9en    :: Bit      -- TIM9 clock enable
  , rcc_apb2enr_extiten   :: Bit      -- EXTI ans external IT clock enable
  , rcc_apb2enr_syscfgen  :: Bit      -- System configuration controller clock enable
  , _                   :: Bit      -- (Reserved)
  , rcc_apb2enr_spi1en    :: Bit      -- SPI1 clock enable
  , _                   :: Bits 3   -- (Reserved)
  , rcc_apb2enr_adc1en    :: Bit      -- ADC1 clock enable
  , _                   :: Bits 2   -- (Reserved)
  , rcc_apb2enr_usart6en  :: Bit      -- USART6 clock enable
  , rcc_apb2enr_usart1en  :: Bit      -- USART1 clock enable
  , _                   :: Bits 3   -- (Reserved)
  , rcc_apb2enr_tim1en    :: Bit      -- TIM1 clock enable
  }
|]
rcc_reg_apb2enr :: BitDataReg RCC_APB2ENR
rcc_reg_apb2enr = mkBitDataRegNamed (rcc_periph_base + 0x44) "apb2enr"

-- AHB1 peripheral clock enable in low power mode register
--  | offset : 0x50
--  | address: 0x40023850
[ivory|
 bitdata RCC_AHB1LPENR :: Bits 32 = rcc_ahb1lpenr
  { rcc_ahb1lpenr_rnglpen    :: Bit      -- RNG clock enable during sleep mode
  , _                      :: Bits 8   -- (Reserved)
  , rcc_ahb1lpenr_dma2lpen   :: Bit      -- DMA2 clock enable during Sleep mode
  , rcc_ahb1lpenr_dma1lpen   :: Bit      -- DMA1 clock enable during Sleep mode
  , _                      :: Bits 4   -- (Reserved)
  , rcc_ahb1lpenr_sram1lpen  :: Bit      -- SRAM 1interface clock enable during Sleep mode
  , rcc_ahb1lpenr_flitflpen  :: Bit      -- Flash interface clock enable during Sleep mode
  , _                      :: Bits 2   -- (Reserved)
  , rcc_ahb1lpenr_crclpen    :: Bit      -- CRC clock enable during Sleep mode
  , _                      :: Bits 4   -- (Reserved)
  , rcc_ahb1lpenr_gpiohlpen  :: Bit      -- IO port H clock enable during Sleep mode
  , _                      :: Bits 4   -- (Reserved)
  , rcc_ahb1lpenr_gpioclpen  :: Bit      -- IO port C clock enable during Sleep mode
  , rcc_ahb1lpenr_gpioblpen  :: Bit      -- IO port B clock enable during Sleep mode
  , rcc_ahb1lpenr_gpioalpen  :: Bit      -- IO port A clock enable during sleep mode
  }
|]
rcc_reg_ahb1lpenr :: BitDataReg RCC_AHB1LPENR
rcc_reg_ahb1lpenr = mkBitDataRegNamed (rcc_periph_base + 0x50) "ahb1lpenr"

-- APB1 peripheral clock enable in low power mode register
--  | offset : 0x60
--  | address: 0x40023860
[ivory|
 bitdata RCC_APB1LPENR :: Bits 32 = rcc_apb1lpenr
  { _                       :: Bits 2   -- (Reserved)
  , rcc_apb1lpenr_daclpen     :: Bit      -- DAC interface clock enable during sleep mode
  , rcc_apb1lpenr_pwrlpen     :: Bit      -- Power interface clock enable during Sleep mode
  , _                       :: Bits 3   -- (Reserved)
  , rcc_apb1lpenr_i2c4lpen    :: Bit      -- I2C4 clock enable during Sleep mode
  , _                       :: Bit      -- (Reserved)
  , rcc_apb1lpenr_i2c2lpen    :: Bit      -- I2C2 clock enable during Sleep mode
  , rcc_apb1lpenr_i2c1lpen    :: Bit      -- I2C1 clock enable during Sleep mode
  , _                       :: Bits 3   -- (Reserved)
  , rcc_apb1lpenr_usart2lpen  :: Bit      -- USART2 clock enable during Sleep mode
  , _                       :: Bits 2   -- (Reserved)
  , rcc_apb1lpenr_spi2lpen    :: Bit      -- SPI2 clock enable during Sleep mode
  , _                       :: Bits 2   -- (Reserved)
  , rcc_apb1lpenr_wwdglpen    :: Bit      -- Window watchdog clock enable during Sleep mode
  , rcc_apb1lpenr_rtcapblpen  :: Bit      -- RTC APB clock enable during sleep mode
  , rcc_apb1lpenr_lptim1lpen  :: Bit      -- LPTIM1 clock enable during sleep mode
  , _                       :: Bits 4   -- (Reserved)
  , rcc_apb1lpenr_tim6lpen    :: Bit      -- TIM6 clock enable during Sleep mode
  , rcc_apb1lpenr_tim5lpen    :: Bit      -- TIM5 clock enable during Sleep mode
  , _                       :: Bits 3   -- (Reserved)
  }
|]
rcc_reg_apb1lpenr :: BitDataReg RCC_APB1LPENR
rcc_reg_apb1lpenr = mkBitDataRegNamed (rcc_periph_base + 0x60) "apb1lpenr"

-- APB2 peripheral clock enabled in low power mode register
--  | offset : 0x64
--  | address: 0x40023864
[ivory|
 bitdata RCC_APB2LPENR :: Bits 32 = rcc_apb2lpenr
  { _                       :: Bits 13  -- (Reserved)
  , rcc_apb2lpenr_tim11lpen   :: Bit      -- TIM11 clock enable during Sleep mode
  , _                       :: Bit      -- (Reserved)
  , rcc_apb2lpenr_tim9lpen    :: Bit      -- TIM9 clock enable during sleep mode
  , rcc_apb2lpenr_extitlpen   :: Bit      -- EXTI and External IT clock enable during sleep mode
  , rcc_apb2lpenr_syscfglpen  :: Bit      -- System configuration controller clock enable during Sleep mode
  , _                       :: Bit      -- (Reserved)
  , rcc_apb2lpenr_spi1lpen    :: Bit      -- SPI 1 clock enable during Sleep mode
  , rcc_apb2lpenr_sdiolpen    :: Bit      -- SDIO clock enable during Sleep mode
  , _                       :: Bits 2   -- (Reserved)
  , rcc_apb2lpenr_adc1lpen    :: Bit      -- ADC1 clock enable during Sleep mode
  , _                       :: Bits 2   -- (Reserved)
  , rcc_apb2lpenr_usart6lpen  :: Bit      -- USART6 clock enable during Sleep mode
  , rcc_apb2lpenr_usart1lpen  :: Bit      -- USART1 clock enable during Sleep mode
  , _                       :: Bits 3   -- (Reserved)
  , rcc_apb2lpenr_tim1lpen    :: Bit      -- TIM1 clock enable during Sleep mode
  }
|]
rcc_reg_apb2lpenr :: BitDataReg RCC_APB2LPENR
rcc_reg_apb2lpenr = mkBitDataRegNamed (rcc_periph_base + 0x64) "apb2lpenr"

-- Backup domain control register
--  | offset : 0x70
--  | address: 0x40023870
[ivory|
 bitdata RCC_BDCR :: Bits 32 = rcc_bdcr
  { _               :: Bits 15  -- (Reserved)
  , rcc_bdcr_bdrst    :: Bit      -- Backup domain software reset
  , rcc_bdcr_rtcen    :: Bit      -- RTC clock enable
  , _               :: Bits 5   -- (Reserved)
  , rcc_bdcr_rtcsel1  :: Bit      -- RTC clock source selection
  , rcc_bdcr_rtcsel0  :: Bit      -- RTC clock source selection
  , _               :: Bits 5   -- (Reserved)
  , rcc_bdcr_lsebyp   :: Bit      -- External low-speed oscillator bypass
  , rcc_bdcr_lserdy   :: Bit      -- External low-speed oscillator ready
  , rcc_bdcr_lseon    :: Bit      -- External low-speed oscillator enable
  }
|]
rcc_reg_bdcr :: BitDataReg RCC_BDCR
rcc_reg_bdcr = mkBitDataRegNamed (rcc_periph_base + 0x70) "bdcr"

-- clock control & status register
--  | offset : 0x74
--  | address: 0x40023874
[ivory|
 bitdata RCC_CSR :: Bits 32 = rcc_csr
  { rcc_csr_lpwrrstf  :: Bit      -- Low-power reset flag
  , rcc_csr_wwdgrstf  :: Bit      -- Window watchdog reset flag
  , rcc_csr_wdgrstf   :: Bit      -- Independent watchdog reset flag
  , rcc_csr_sftrstf   :: Bit      -- Software reset flag
  , rcc_csr_porrstf   :: Bit      -- POR/PDR reset flag
  , rcc_csr_padrstf   :: Bit      -- PIN reset flag
  , rcc_csr_borrstf   :: Bit      -- BOR reset flag
  , rcc_csr_rmvf      :: Bit      -- Remove reset flag
  , _               :: Bits 22  -- (Reserved)
  , rcc_csr_lsirdy    :: Bit      -- Internal low-speed oscillator ready
  , rcc_csr_lsion     :: Bit      -- Internal low-speed oscillator enable
  }
|]
rcc_reg_csr :: BitDataReg RCC_CSR
rcc_reg_csr = mkBitDataRegNamed (rcc_periph_base + 0x74) "csr"

-- spread spectrum clock generation register
--  | offset : 0x80
--  | address: 0x40023880
[ivory|
 bitdata RCC_SSCGR :: Bits 32 = rcc_sscgr
  { rcc_sscgr_sscgen     :: Bit      -- Spread spectrum modulation enable
  , rcc_sscgr_spreadsel  :: Bit      -- Spread Select
  , _                  :: Bits 2   -- (Reserved)
  , rcc_sscgr_incstep    :: Bits 15  -- Incrementation step
  , rcc_sscgr_modper     :: Bits 13  -- Modulation period
  }
|]
rcc_reg_sscgr :: BitDataReg RCC_SSCGR
rcc_reg_sscgr = mkBitDataRegNamed (rcc_periph_base + 0x80) "sscgr"

-- DCKCFGR register
--  | offset : 0x8c
--  | address: 0x4002388c
[ivory|
 bitdata RCC_DCKCFGR :: Bits 32 = rcc_dckcfgr
  { _                 :: Bits 5   -- (Reserved)
  , rcc_dckcfgr_i2ssrc  :: Bits 2   -- I2SSRC
  , rcc_dckcfgr_timpre  :: Bit      -- TIMPRE
  , _                 :: Bits 24  -- (Reserved)
  }
|]
rcc_reg_dckcfgr :: BitDataReg RCC_DCKCFGR
rcc_reg_dckcfgr = mkBitDataRegNamed (rcc_periph_base + 0x8c) "dckcfgr"

-- DCKCFGR2 register
--  | offset : 0x94
--  | address: 0x40023894
[ivory|
 bitdata RCC_DCKCFGR2 :: Bits 32 = rcc_dckcfgr2
  { rcc_dckcfgr2_lptim1sel  :: Bits 2   -- LPTIM1SEL
  , _                     :: Bits 6   -- (Reserved)
  , rcc_dckcfgr2_i2c4sel    :: Bits 2   -- I2C4SEL
  , _                     :: Bits 22  -- (Reserved)
  }
|]
rcc_reg_dckcfgr2 :: BitDataReg RCC_DCKCFGR2
rcc_reg_dckcfgr2 = mkBitDataRegNamed (rcc_periph_base + 0x94) "dckcfgr2"

