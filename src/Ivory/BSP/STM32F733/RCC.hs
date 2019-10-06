{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}

module Ivory.BSP.STM32F733.RCC where

import Ivory.Language
import Ivory.HW
import Ivory.BSP.STM32F733.MemoryMap (rcc_periph_base)
import Ivory.BSP.STM32.Peripheral.RCC.RegTypes

-- RCC Reset and clock control

-- Base address: 0x40023800

-- clock control register
--  | offset : 0x0
--  | address: 0x40023800
[ivory|
 bitdata RCC_CR :: Bits 32 = rcc_cr
  { _               :: Bits 2   -- (Reserved)
  , rcc_cr_pllsairdy  :: Bit      -- PLLSAI clock ready flag
  , rcc_cr_pllsaion   :: Bit      -- PLLSAI enable
  , rcc_cr_plli2srdy  :: Bit      -- PLLI2S clock ready flag
  , rcc_cr_plli2son   :: Bit      -- PLLI2S enable
  , rcc_cr_pllrdy     :: Bit      -- Main PLL (PLL) clock ready flag
  , rcc_cr_pllon      :: Bit      -- Main PLL (PLL) enable
  , _               :: Bits 4   -- (Reserved)
  , rcc_cr_csson      :: Bit      -- Clock security system enable
  , rcc_cr_hsebyp     :: Bit      -- HSE clock bypass
  , rcc_cr_hserdy     :: Bit      -- HSE clock ready flag
  , rcc_cr_hseon      :: Bit      -- HSE clock enable
  , rcc_cr_hsical     :: Bits 8   -- Internal high-speed clock calibration
  , rcc_cr_hsitrim    :: Bits 5   -- Internal high-speed clock trimming
  , _               :: Bit      -- (Reserved)
  , rcc_cr_hsirdy     :: Bit      -- Internal high-speed clock ready flag
  , rcc_cr_hsion      :: Bit      -- Internal high-speed clock enable
  }
|]
rcc_reg_cr :: BitDataReg RCC_CR
rcc_reg_cr = mkBitDataRegNamed (rcc_periph_base + 0x0) "cr"

-- PLL configuration register
--  | offset : 0x4
--  | address: 0x40023804
[ivory|
 bitdata RCC_PLLCFGR :: Bits 32 = rcc_pllcfgr
  { _                 :: Bits 4   -- (Reserved)
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
  , rcc_cfgr_i2ssrc   :: Bit      -- I2S clock selection
  , rcc_cfgr_mco1     :: RCC_MCOx  -- Microcontroller clock output 1
  , rcc_cfgr_rtcpre   :: Bits 5   -- HSE division factor for RTC clock
  , rcc_cfgr_ppre2    :: RCC_PPREx  -- APB high-speed prescaler (APB2)
  , rcc_cfgr_ppre1    :: RCC_PPREx  -- APB Low speed prescaler (APB1)
  , _               :: Bits 2   -- (Reserved)
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
  { _                  :: Bits 8   -- (Reserved)
  , rcc_cir_cssc         :: Bit      -- Clock security system interrupt clear
  , rcc_cir_pllsairdyc   :: Bit      -- PLLSAI Ready Interrupt Clear
  , rcc_cir_plli2srdyc   :: Bit      -- PLLI2S ready interrupt clear
  , rcc_cir_pllrdyc      :: Bit      -- Main PLL(PLL) ready interrupt clear
  , rcc_cir_hserdyc      :: Bit      -- HSE ready interrupt clear
  , rcc_cir_hsirdyc      :: Bit      -- HSI ready interrupt clear
  , rcc_cir_lserdyc      :: Bit      -- LSE ready interrupt clear
  , rcc_cir_lsirdyc      :: Bit      -- LSI ready interrupt clear
  , _                  :: Bit      -- (Reserved)
  , rcc_cir_pllsairdyie  :: Bit      -- PLLSAI Ready Interrupt Enable
  , rcc_cir_plli2srdyie  :: Bit      -- PLLI2S ready interrupt enable
  , rcc_cir_pllrdyie     :: Bit      -- Main PLL (PLL) ready interrupt enable
  , rcc_cir_hserdyie     :: Bit      -- HSE ready interrupt enable
  , rcc_cir_hsirdyie     :: Bit      -- HSI ready interrupt enable
  , rcc_cir_lserdyie     :: Bit      -- LSE ready interrupt enable
  , rcc_cir_lsirdyie     :: Bit      -- LSI ready interrupt enable
  , rcc_cir_cssf         :: Bit      -- Clock security system interrupt flag
  , rcc_cir_pllsairdyf   :: Bit      -- PLLSAI ready interrupt flag
  , rcc_cir_plli2srdyf   :: Bit      -- PLLI2S ready interrupt flag
  , rcc_cir_pllrdyf      :: Bit      -- Main PLL (PLL) ready interrupt flag
  , rcc_cir_hserdyf      :: Bit      -- HSE ready interrupt flag
  , rcc_cir_hsirdyf      :: Bit      -- HSI ready interrupt flag
  , rcc_cir_lserdyf      :: Bit      -- LSE ready interrupt flag
  , rcc_cir_lsirdyf      :: Bit      -- LSI ready interrupt flag
  }
|]
rcc_reg_cir :: BitDataReg RCC_CIR
rcc_reg_cir = mkBitDataRegNamed (rcc_periph_base + 0xc) "cir"

-- AHB1 peripheral reset register
--  | offset : 0x10
--  | address: 0x40023810
[ivory|
 bitdata RCC_AHB1RSTR :: Bits 32 = rcc_ahb1rstr
  { _                    :: Bits 2   -- (Reserved)
  , rcc_ahb1rstr_otghsrst  :: Bit      -- USB OTG HS module reset
  , _                    :: Bits 6   -- (Reserved)
  , rcc_ahb1rstr_dma2rst   :: Bit      -- DMA2 reset
  , rcc_ahb1rstr_dma1rst   :: Bit      -- DMA2 reset
  , _                    :: Bits 8   -- (Reserved)
  , rcc_ahb1rstr_crcrst    :: Bit      -- CRC reset
  , _                    :: Bits 3   -- (Reserved)
  , rcc_ahb1rstr_gpioirst  :: Bit      -- IO port I reset
  , rcc_ahb1rstr_gpiohrst  :: Bit      -- IO port H reset
  , rcc_ahb1rstr_gpiogrst  :: Bit      -- IO port G reset
  , rcc_ahb1rstr_gpiofrst  :: Bit      -- IO port F reset
  , rcc_ahb1rstr_gpioerst  :: Bit      -- IO port E reset
  , rcc_ahb1rstr_gpiodrst  :: Bit      -- IO port D reset
  , rcc_ahb1rstr_gpiocrst  :: Bit      -- IO port C reset
  , rcc_ahb1rstr_gpiobrst  :: Bit      -- IO port B reset
  , rcc_ahb1rstr_gpioarst  :: Bit      -- IO port A reset
  }
|]
rcc_reg_ahb1rstr :: BitDataReg RCC_AHB1RSTR
rcc_reg_ahb1rstr = mkBitDataRegNamed (rcc_periph_base + 0x10) "ahb1rstr"

-- AHB2 peripheral reset register
--  | offset : 0x14
--  | address: 0x40023814
[ivory|
 bitdata RCC_AHB2RSTR :: Bits 32 = rcc_ahb2rstr
  { _                    :: Bits 24  -- (Reserved)
  , rcc_ahb2rstr_otgfsrst  :: Bit      -- USB OTG FS module reset
  , rcc_ahb2rstr_rngrst    :: Bit      -- Random number generator module reset
  , _                    :: Bit      -- (Reserved)
  , rcc_ahb2rstr_aesrst    :: Bit      -- AES module reset
  , _                    :: Bits 4   -- (Reserved)
  }
|]
rcc_reg_ahb2rstr :: BitDataReg RCC_AHB2RSTR
rcc_reg_ahb2rstr = mkBitDataRegNamed (rcc_periph_base + 0x14) "ahb2rstr"

-- AHB3 peripheral reset register
--  | offset : 0x18
--  | address: 0x40023818
[ivory|
 bitdata RCC_AHB3RSTR :: Bits 32 = rcc_ahb3rstr
  { _                   :: Bits 30  -- (Reserved)
  , rcc_ahb3rstr_qspirst  :: Bit      -- Quad SPI memory controller reset
  , rcc_ahb3rstr_fmcrst   :: Bit      -- Flexible memory controller module reset
  }
|]
rcc_reg_ahb3rstr :: BitDataReg RCC_AHB3RSTR
rcc_reg_ahb3rstr = mkBitDataRegNamed (rcc_periph_base + 0x18) "ahb3rstr"

-- APB1 peripheral reset register
--  | offset : 0x20
--  | address: 0x40023820
[ivory|
 bitdata RCC_APB1RSTR :: Bits 32 = rcc_apb1rstr
  { rcc_apb1rstr_uart8rst   :: Bit      -- UART8 reset
  , rcc_apb1rstr_uart7rst   :: Bit      -- UART7 reset
  , rcc_apb1rstr_dacrst     :: Bit      -- DAC reset
  , rcc_apb1rstr_pwrrst     :: Bit      -- Power interface reset
  , rcc_apb1rstr_cecrst     :: Bit      -- HDMI-CEC reset
  , _                     :: Bit      -- (Reserved)
  , rcc_apb1rstr_can1rst    :: Bit      -- CAN1 reset
  , _                     :: Bit      -- (Reserved)
  , rcc_apb1rstr_i2c3rst    :: Bit      -- I2C3 reset
  , rcc_apb1rstr_i2c2rst    :: Bit      -- I2C 2 reset
  , rcc_apb1rstr_i2c1rst    :: Bit      -- I2C 1 reset
  , rcc_apb1rstr_uart5rst   :: Bit      -- USART 5 reset
  , rcc_apb1rstr_uart4rst   :: Bit      -- USART 4 reset
  , rcc_apb1rstr_uart3rst   :: Bit      -- USART 3 reset
  , rcc_apb1rstr_uart2rst   :: Bit      -- USART 2 reset
  , _                     :: Bit      -- (Reserved)
  , rcc_apb1rstr_spi3rst    :: Bit      -- SPI 3 reset
  , rcc_apb1rstr_spi2rst    :: Bit      -- SPI 2 reset
  , _                     :: Bits 2   -- (Reserved)
  , rcc_apb1rstr_wwdgrst    :: Bit      -- Window watchdog reset
  , _                     :: Bit      -- (Reserved)
  , rcc_apb1rstr_lptim1rst  :: Bit      -- Low power timer 1 reset
  , rcc_apb1rstr_tim14rst   :: Bit      -- TIM14 reset
  , rcc_apb1rstr_tim13rst   :: Bit      -- TIM13 reset
  , rcc_apb1rstr_tim12rst   :: Bit      -- TIM12 reset
  , rcc_apb1rstr_tim7rst    :: Bit      -- TIM7 reset
  , rcc_apb1rstr_tim6rst    :: Bit      -- TIM6 reset
  , rcc_apb1rstr_tim5rst    :: Bit      -- TIM5 reset
  , rcc_apb1rstr_tim4rst    :: Bit      -- TIM4 reset
  , rcc_apb1rstr_tim3rst    :: Bit      -- TIM3 reset
  , rcc_apb1rstr_tim2rst    :: Bit      -- TIM2 reset
  }
|]
rcc_reg_apb1rstr :: BitDataReg RCC_APB1RSTR
rcc_reg_apb1rstr = mkBitDataRegNamed (rcc_periph_base + 0x20) "apb1rstr"

-- APB2 peripheral reset register
--  | offset : 0x24
--  | address: 0x40023824
[ivory|
 bitdata RCC_APB2RSTR :: Bits 32 = rcc_apb2rstr
  { rcc_apb2rstr_usbphycrst  :: Bit      -- USB OTG HS PHY controller reset
  , _                      :: Bits 7   -- (Reserved)
  , rcc_apb2rstr_sai2rst     :: Bit      -- SAI2 reset
  , rcc_apb2rstr_sai1rst     :: Bit      -- SAI1 reset
  , _                      :: Bit      -- (Reserved)
  , rcc_apb2rstr_spi5rst     :: Bit      -- SPI5 reset
  , _                      :: Bit      -- (Reserved)
  , rcc_apb2rstr_tim11rst    :: Bit      -- TIM11 reset
  , rcc_apb2rstr_tim10rst    :: Bit      -- TIM10 reset
  , rcc_apb2rstr_tim9rst     :: Bit      -- TIM9 reset
  , _                      :: Bit      -- (Reserved)
  , rcc_apb2rstr_syscfgrst   :: Bit      -- System configuration controller reset
  , rcc_apb2rstr_spi4rst     :: Bit      -- SPI4 reset
  , rcc_apb2rstr_spi1rst     :: Bit      -- SPI 1 reset
  , rcc_apb2rstr_sdmmc1rst   :: Bit      -- SDMMC1 reset
  , _                      :: Bits 2   -- (Reserved)
  , rcc_apb2rstr_adcrst      :: Bit      -- ADC interface reset (common to all ADCs)
  , rcc_apb2rstr_sdmmc2rst   :: Bit      -- SDMMC2 reset
  , _                      :: Bit      -- (Reserved)
  , rcc_apb2rstr_usart6rst   :: Bit      -- USART6 reset
  , rcc_apb2rstr_usart1rst   :: Bit      -- USART1 reset
  , _                      :: Bits 2   -- (Reserved)
  , rcc_apb2rstr_tim8rst     :: Bit      -- TIM8 reset
  , rcc_apb2rstr_tim1rst     :: Bit      -- TIM1 reset
  }
|]
rcc_reg_apb2rstr :: BitDataReg RCC_APB2RSTR
rcc_reg_apb2rstr = mkBitDataRegNamed (rcc_periph_base + 0x24) "apb2rstr"

-- AHB1 peripheral clock register
--  | offset : 0x30
--  | address: 0x40023830
[ivory|
 bitdata RCC_AHB1ENR :: Bits 32 = rcc_ahb1enr
  { _                      :: Bit      -- (Reserved)
  , rcc_ahb1enr_otghsulpien  :: Bit      -- USB OTG HSULPI clock enable
  , rcc_ahb1enr_otghsen      :: Bit      -- USB OTG HS clock enable
  , _                      :: Bits 6   -- (Reserved)
  , rcc_ahb1enr_dma2en       :: Bit      -- DMA2 clock enable
  , rcc_ahb1enr_dma1en       :: Bit      -- DMA1 clock enable
  , rcc_ahb1enr_dtcmramen    :: Bit      -- CCM data RAM clock enable
  , _                      :: Bit      -- (Reserved)
  , rcc_ahb1enr_bkpsramen    :: Bit      -- Backup SRAM interface clock enable
  , _                      :: Bits 5   -- (Reserved)
  , rcc_ahb1enr_crcen        :: Bit      -- CRC clock enable
  , _                      :: Bits 3   -- (Reserved)
  , rcc_ahb1enr_gpioien      :: Bit      -- IO port I clock enable
  , rcc_ahb1enr_gpiohen      :: Bit      -- IO port H clock enable
  , rcc_ahb1enr_gpiogen      :: Bit      -- IO port G clock enable
  , rcc_ahb1enr_gpiofen      :: Bit      -- IO port F clock enable
  , rcc_ahb1enr_gpioeen      :: Bit      -- IO port E clock enable
  , rcc_ahb1enr_gpioden      :: Bit      -- IO port D clock enable
  , rcc_ahb1enr_gpiocen      :: Bit      -- IO port C clock enable
  , rcc_ahb1enr_gpioben      :: Bit      -- IO port B clock enable
  , rcc_ahb1enr_gpioaen      :: Bit      -- IO port A clock enable
  }
|]
rcc_reg_ahb1enr :: BitDataReg RCC_AHB1ENR
rcc_reg_ahb1enr = mkBitDataRegNamed (rcc_periph_base + 0x30) "ahb1enr"

-- AHB2 peripheral clock enable register
--  | offset : 0x34
--  | address: 0x40023834
[ivory|
 bitdata RCC_AHB2ENR :: Bits 32 = rcc_ahb2enr
  { _                  :: Bits 24  -- (Reserved)
  , rcc_ahb2enr_otgfsen  :: Bit      -- USB OTG FS clock enable
  , rcc_ahb2enr_rngen    :: Bit      -- Random number generator clock enable
  , _                  :: Bit      -- (Reserved)
  , rcc_ahb2enr_aesen    :: Bit      -- AES module clock enable
  , _                  :: Bits 4   -- (Reserved)
  }
|]
rcc_reg_ahb2enr :: BitDataReg RCC_AHB2ENR
rcc_reg_ahb2enr = mkBitDataRegNamed (rcc_periph_base + 0x34) "ahb2enr"

-- AHB3 peripheral clock enable register
--  | offset : 0x38
--  | address: 0x40023838
[ivory|
 bitdata RCC_AHB3ENR :: Bits 32 = rcc_ahb3enr
  { _                 :: Bits 30  -- (Reserved)
  , rcc_ahb3enr_qspien  :: Bit      -- Quad SPI memory controller clock enable
  , rcc_ahb3enr_fmcen   :: Bit      -- Flexible memory controller module clock enable
  }
|]
rcc_reg_ahb3enr :: BitDataReg RCC_AHB3ENR
rcc_reg_ahb3enr = mkBitDataRegNamed (rcc_periph_base + 0x38) "ahb3enr"

-- APB1 peripheral clock enable register
--  | offset : 0x40
--  | address: 0x40023840
[ivory|
 bitdata RCC_APB1ENR :: Bits 32 = rcc_apb1enr
  { rcc_apb1enr_uart8en   :: Bit      -- UART8 clock enable
  , rcc_apb1enr_uart7en   :: Bit      -- UART7 clock enable
  , rcc_apb1enr_dacen     :: Bit      -- DAC interface clock enable
  , rcc_apb1enr_pwren     :: Bit      -- Power interface clock enable
  , _                   :: Bits 2   -- (Reserved)
  , rcc_apb1enr_can1en    :: Bit      -- CAN 1 clock enable
  , _                   :: Bit      -- (Reserved)
  , rcc_apb1enr_i2c3en    :: Bit      -- I2C3 clock enable
  , rcc_apb1enr_i2c2en    :: Bit      -- I2C2 clock enable
  , rcc_apb1enr_i2c1en    :: Bit      -- I2C1 clock enable
  , rcc_apb1enr_uart5en   :: Bit      -- UART5 clock enable
  , rcc_apb1enr_uart4en   :: Bit      -- UART4 clock enable
  , rcc_apb1enr_usart3en  :: Bit      -- USART3 clock enable
  , rcc_apb1enr_usart2en  :: Bit      -- USART 2 clock enable
  , _                   :: Bit      -- (Reserved)
  , rcc_apb1enr_spi3en    :: Bit      -- SPI3 clock enable
  , rcc_apb1enr_spi2en    :: Bit      -- SPI2 clock enable
  , _                   :: Bits 2   -- (Reserved)
  , rcc_apb1enr_wwdgen    :: Bit      -- Window watchdog clock enable
  , rcc_apb1enr_rtcapben  :: Bit      -- RTCAPB clock enable
  , rcc_apb1enr_lptim1en  :: Bit      -- Low power timer 1 clock enable
  , rcc_apb1enr_tim14en   :: Bit      -- TIM14 clock enable
  , rcc_apb1enr_tim13en   :: Bit      -- TIM13 clock enable
  , rcc_apb1enr_tim12en   :: Bit      -- TIM12 clock enable
  , rcc_apb1enr_tim7en    :: Bit      -- TIM7 clock enable
  , rcc_apb1enr_tim6en    :: Bit      -- TIM6 clock enable
  , rcc_apb1enr_tim5en    :: Bit      -- TIM5 clock enable
  , rcc_apb1enr_tim4en    :: Bit      -- TIM4 clock enable
  , rcc_apb1enr_tim3en    :: Bit      -- TIM3 clock enable
  , rcc_apb1enr_tim2en    :: Bit      -- TIM2 clock enable
  }
|]
rcc_reg_apb1enr :: BitDataReg RCC_APB1ENR
rcc_reg_apb1enr = mkBitDataRegNamed (rcc_periph_base + 0x40) "apb1enr"

-- APB2 peripheral clock enable register
--  | offset : 0x44
--  | address: 0x40023844
[ivory|
 bitdata RCC_APB2ENR :: Bits 32 = rcc_apb2enr
  { rcc_apb2enr_usbphycen  :: Bit      -- USB OTG HS PHY controller clock enable
  , _                    :: Bits 7   -- (Reserved)
  , rcc_apb2enr_sai2en     :: Bit      -- SAI2 clock enable
  , rcc_apb2enr_sai1en     :: Bit      -- SAI1 clock enable
  , _                    :: Bit      -- (Reserved)
  , rcc_apb2enr_spi5en     :: Bit      -- SPI5 clock enable
  , _                    :: Bit      -- (Reserved)
  , rcc_apb2enr_tim11en    :: Bit      -- TIM11 clock enable
  , rcc_apb2enr_tim10en    :: Bit      -- TIM10 clock enable
  , rcc_apb2enr_tim9en     :: Bit      -- TIM9 clock enable
  , _                    :: Bit      -- (Reserved)
  , rcc_apb2enr_syscfgen   :: Bit      -- System configuration controller clock enable
  , rcc_apb2enr_spi4en     :: Bit      -- SPI4 clock enable
  , rcc_apb2enr_spi1en     :: Bit      -- SPI1 clock enable
  , rcc_apb2enr_sdmmc1en   :: Bit      -- SDMMC1 clock enable
  , rcc_apb2enr_adc3en     :: Bit      -- ADC3 clock enable
  , rcc_apb2enr_adc2en     :: Bit      -- ADC2 clock enable
  , rcc_apb2enr_adc1en     :: Bit      -- ADC1 clock enable
  , rcc_apb2enr_sdmmc2en   :: Bit      -- SDMMC2 clock enable
  , _                    :: Bit      -- (Reserved)
  , rcc_apb2enr_usart6en   :: Bit      -- USART6 clock enable
  , rcc_apb2enr_usart1en   :: Bit      -- USART1 clock enable
  , _                    :: Bits 2   -- (Reserved)
  , rcc_apb2enr_tim8en     :: Bit      -- TIM8 clock enable
  , rcc_apb2enr_tim1en     :: Bit      -- TIM1 clock enable
  }
|]
rcc_reg_apb2enr :: BitDataReg RCC_APB2ENR
rcc_reg_apb2enr = mkBitDataRegNamed (rcc_periph_base + 0x44) "apb2enr"

-- AHB1 peripheral clock enable in low power mode register
--  | offset : 0x50
--  | address: 0x40023850
[ivory|
 bitdata RCC_AHB1LPENR :: Bits 32 = rcc_ahb1lpenr
  { _                          :: Bit      -- (Reserved)
  , rcc_ahb1lpenr_otghsulpilpen  :: Bit      -- USB OTG HS ULPI clock enable during Sleep mode
  , rcc_ahb1lpenr_otghslpen      :: Bit      -- USB OTG HS clock enable during Sleep mode
  , rcc_ahb1lpenr_ethmacptplpen  :: Bit      -- Ethernet PTP clock enable during Sleep mode
  , rcc_ahb1lpenr_ethmacrxlpen   :: Bit      -- Ethernet reception clock enable during Sleep mode
  , rcc_ahb1lpenr_ethmactxlpen   :: Bit      -- Ethernet transmission clock enable during Sleep mode
  , rcc_ahb1lpenr_ethmaclpen     :: Bit      -- Ethernet MAC clock enable during Sleep mode
  , _                          :: Bit      -- (Reserved)
  , rcc_ahb1lpenr_dma2dlpen      :: Bit      -- DMA2D clock enable during Sleep mode
  , rcc_ahb1lpenr_dma2lpen       :: Bit      -- DMA2 clock enable during Sleep mode
  , rcc_ahb1lpenr_dma1lpen       :: Bit      -- DMA1 clock enable during Sleep mode
  , rcc_ahb1lpenr_dtcmlpen       :: Bit      -- DTCM RAM interface clock enable during Sleep mode
  , rcc_ahb1lpenr_sram3lpen      :: Bit      -- SRAM 3 interface clock enable during Sleep mode
  , rcc_ahb1lpenr_bkpsramlpen    :: Bit      -- Backup SRAM interface clock enable during Sleep mode
  , rcc_ahb1lpenr_sram2lpen      :: Bit      -- SRAM 2 interface clock enable during Sleep mode
  , rcc_ahb1lpenr_sram1lpen      :: Bit      -- SRAM 1interface clock enable during Sleep mode
  , rcc_ahb1lpenr_flitflpen      :: Bit      -- Flash interface clock enable during Sleep mode
  , _                          :: Bit      -- (Reserved)
  , rcc_ahb1lpenr_axilpen        :: Bit      -- AXI to AHB bridge clock enable during Sleep mode
  , rcc_ahb1lpenr_crclpen        :: Bit      -- CRC clock enable during Sleep mode
  , _                          :: Bit      -- (Reserved)
  , rcc_ahb1lpenr_gpioklpen      :: Bit      -- IO port K clock enable during Sleep mode
  , rcc_ahb1lpenr_gpiojlpen      :: Bit      -- IO port J clock enable during Sleep mode
  , rcc_ahb1lpenr_gpioilpen      :: Bit      -- IO port I clock enable during Sleep mode
  , rcc_ahb1lpenr_gpiohlpen      :: Bit      -- IO port H clock enable during Sleep mode
  , rcc_ahb1lpenr_gpioglpen      :: Bit      -- IO port G clock enable during Sleep mode
  , rcc_ahb1lpenr_gpioflpen      :: Bit      -- IO port F clock enable during Sleep mode
  , rcc_ahb1lpenr_gpioelpen      :: Bit      -- IO port E clock enable during Sleep mode
  , rcc_ahb1lpenr_gpiodlpen      :: Bit      -- IO port D clock enable during Sleep mode
  , rcc_ahb1lpenr_gpioclpen      :: Bit      -- IO port C clock enable during Sleep mode
  , rcc_ahb1lpenr_gpioblpen      :: Bit      -- IO port B clock enable during Sleep mode
  , rcc_ahb1lpenr_gpioalpen      :: Bit      -- IO port A clock enable during sleep mode
  }
|]
rcc_reg_ahb1lpenr :: BitDataReg RCC_AHB1LPENR
rcc_reg_ahb1lpenr = mkBitDataRegNamed (rcc_periph_base + 0x50) "ahb1lpenr"

-- AHB2 peripheral clock enable in low power mode register
--  | offset : 0x54
--  | address: 0x40023854
[ivory|
 bitdata RCC_AHB2LPENR :: Bits 32 = rcc_ahb2lpenr
  { _                      :: Bits 24  -- (Reserved)
  , rcc_ahb2lpenr_otgfslpen  :: Bit      -- USB OTG FS clock enable during Sleep mode
  , rcc_ahb2lpenr_rnglpen    :: Bit      -- Random number generator clock enable during Sleep mode
  , _                      :: Bit      -- (Reserved)
  , rcc_ahb2lpenr_aeslpen    :: Bit      -- AES module clock enable during Sleep mode
  , _                      :: Bits 4   -- (Reserved)
  }
|]
rcc_reg_ahb2lpenr :: BitDataReg RCC_AHB2LPENR
rcc_reg_ahb2lpenr = mkBitDataRegNamed (rcc_periph_base + 0x54) "ahb2lpenr"

-- AHB3 peripheral clock enable in low power mode register
--  | offset : 0x58
--  | address: 0x40023858
[ivory|
 bitdata RCC_AHB3LPENR :: Bits 32 = rcc_ahb3lpenr
  { _                     :: Bits 30  -- (Reserved)
  , rcc_ahb3lpenr_qspilpen  :: Bit      -- Quand SPI memory controller clock enable during Sleep mode
  , rcc_ahb3lpenr_fmclpen   :: Bit      -- Flexible memory controller module clock enable during Sleep mode
  }
|]
rcc_reg_ahb3lpenr :: BitDataReg RCC_AHB3LPENR
rcc_reg_ahb3lpenr = mkBitDataRegNamed (rcc_periph_base + 0x58) "ahb3lpenr"

-- APB1 peripheral clock enable in low power mode register
--  | offset : 0x60
--  | address: 0x40023860
[ivory|
 bitdata RCC_APB1LPENR :: Bits 32 = rcc_apb1lpenr
  { rcc_apb1lpenr_uart8lpen   :: Bit      -- UART8 clock enable during Sleep mode
  , rcc_apb1lpenr_uart7lpen   :: Bit      -- UART7 clock enable during Sleep mode
  , rcc_apb1lpenr_daclpen     :: Bit      -- DAC interface clock enable during Sleep mode
  , rcc_apb1lpenr_pwrlpen     :: Bit      -- Power interface clock enable during Sleep mode
  , _                       :: Bit      -- (Reserved)
  , rcc_apb1lpenr_can2lpen    :: Bit      -- CAN 2 clock enable during Sleep mode
  , rcc_apb1lpenr_can1lpen    :: Bit      -- CAN 1 clock enable during Sleep mode
  , _                       :: Bit      -- (Reserved)
  , rcc_apb1lpenr_i2c3lpen    :: Bit      -- I2C3 clock enable during Sleep mode
  , rcc_apb1lpenr_i2c2lpen    :: Bit      -- I2C2 clock enable during Sleep mode
  , rcc_apb1lpenr_i2c1lpen    :: Bit      -- I2C1 clock enable during Sleep mode
  , rcc_apb1lpenr_uart5lpen   :: Bit      -- UART5 clock enable during Sleep mode
  , rcc_apb1lpenr_uart4lpen   :: Bit      -- UART4 clock enable during Sleep mode
  , rcc_apb1lpenr_usart3lpen  :: Bit      -- USART3 clock enable during Sleep mode
  , rcc_apb1lpenr_usart2lpen  :: Bit      -- USART2 clock enable during Sleep mode
  , _                       :: Bit      -- (Reserved)
  , rcc_apb1lpenr_spi3lpen    :: Bit      -- SPI3 clock enable during Sleep mode
  , rcc_apb1lpenr_spi2lpen    :: Bit      -- SPI2 clock enable during Sleep mode
  , _                       :: Bits 2   -- (Reserved)
  , rcc_apb1lpenr_wwdglpen    :: Bit      -- Window watchdog clock enable during Sleep mode
  , _                       :: Bit      -- (Reserved)
  , rcc_apb1lpenr_lptim1lpen  :: Bit      -- low power timer 1 clock enable during Sleep mode
  , rcc_apb1lpenr_tim14lpen   :: Bit      -- TIM14 clock enable during Sleep mode
  , rcc_apb1lpenr_tim13lpen   :: Bit      -- TIM13 clock enable during Sleep mode
  , rcc_apb1lpenr_tim12lpen   :: Bit      -- TIM12 clock enable during Sleep mode
  , rcc_apb1lpenr_tim7lpen    :: Bit      -- TIM7 clock enable during Sleep mode
  , rcc_apb1lpenr_tim6lpen    :: Bit      -- TIM6 clock enable during Sleep mode
  , rcc_apb1lpenr_tim5lpen    :: Bit      -- TIM5 clock enable during Sleep mode
  , rcc_apb1lpenr_tim4lpen    :: Bit      -- TIM4 clock enable during Sleep mode
  , rcc_apb1lpenr_tim3lpen    :: Bit      -- TIM3 clock enable during Sleep mode
  , rcc_apb1lpenr_tim2lpen    :: Bit      -- TIM2 clock enable during Sleep mode
  }
|]
rcc_reg_apb1lpenr :: BitDataReg RCC_APB1LPENR
rcc_reg_apb1lpenr = mkBitDataRegNamed (rcc_periph_base + 0x60) "apb1lpenr"

-- APB2 peripheral clock enabled in low power mode register
--  | offset : 0x64
--  | address: 0x40023864
[ivory|
 bitdata RCC_APB2LPENR :: Bits 32 = rcc_apb2lpenr
  { _                       :: Bits 8   -- (Reserved)
  , rcc_apb2lpenr_sai2lpen    :: Bit      -- SAI2 clock enable during sleep mode
  , rcc_apb2lpenr_sai1lpen    :: Bit      -- SAI1 clock enable during sleep mode
  , _                       :: Bit      -- (Reserved)
  , rcc_apb2lpenr_spi5lpen    :: Bit      -- SPI 5 clock enable during Sleep mode
  , _                       :: Bit      -- (Reserved)
  , rcc_apb2lpenr_tim11lpen   :: Bit      -- TIM11 clock enable during Sleep mode
  , rcc_apb2lpenr_tim10lpen   :: Bit      -- TIM10 clock enable during Sleep mode
  , rcc_apb2lpenr_tim9lpen    :: Bit      -- TIM9 clock enable during sleep mode
  , _                       :: Bit      -- (Reserved)
  , rcc_apb2lpenr_syscfglpen  :: Bit      -- System configuration controller clock enable during Sleep mode
  , rcc_apb2lpenr_spi4lpen    :: Bit      -- SPI 4 clock enable during Sleep mode
  , rcc_apb2lpenr_spi1lpen    :: Bit      -- SPI 1 clock enable during Sleep mode
  , rcc_apb2lpenr_sdmmc1lpen  :: Bit      -- SDMMC1 clock enable during Sleep mode
  , rcc_apb2lpenr_adc3lpen    :: Bit      -- ADC 3 clock enable during Sleep mode
  , rcc_apb2lpenr_adc2lpen    :: Bit      -- ADC2 clock enable during Sleep mode
  , rcc_apb2lpenr_adc1lpen    :: Bit      -- ADC1 clock enable during Sleep mode
  , rcc_apb2lpenr_sdmmc2lpen  :: Bit      -- SDMMC2 clock enable during Sleep mode
  , _                       :: Bit      -- (Reserved)
  , rcc_apb2lpenr_usart6lpen  :: Bit      -- USART6 clock enable during Sleep mode
  , rcc_apb2lpenr_usart1lpen  :: Bit      -- USART1 clock enable during Sleep mode
  , _                       :: Bits 2   -- (Reserved)
  , rcc_apb2lpenr_tim8lpen    :: Bit      -- TIM8 clock enable during Sleep mode
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

-- PLLI2S configuration register
--  | offset : 0x84
--  | address: 0x40023884
[ivory|
 bitdata RCC_PLLI2SCFGR :: Bits 32 = rcc_plli2scfgr
  { _                     :: Bit      -- (Reserved)
  , rcc_plli2scfgr_plli2sr  :: Bits 3   -- PLLI2S division factor for I2S clocks
  , rcc_plli2scfgr_plli2sq  :: Bits 4   -- PLLI2S division factor for SAI1 clock
  , _                     :: Bits 9   -- (Reserved)
  , rcc_plli2scfgr_plli2sn  :: Bits 9   -- PLLI2S multiplication factor for VCO
  , _                     :: Bits 6   -- (Reserved)
  }
|]
rcc_reg_plli2scfgr :: BitDataReg RCC_PLLI2SCFGR
rcc_reg_plli2scfgr = mkBitDataRegNamed (rcc_periph_base + 0x84) "plli2scfgr"

-- PLL configuration register
--  | offset : 0x88
--  | address: 0x40023888
[ivory|
 bitdata RCC_PLLSAICFGR :: Bits 32 = rcc_pllsaicfgr
  { _                     :: Bits 4   -- (Reserved)
  , rcc_pllsaicfgr_pllsaiq  :: Bits 4   -- PLLSAI division factor for SAI clock
  , _                     :: Bits 6   -- (Reserved)
  , rcc_pllsaicfgr_pllsaip  :: Bits 2   -- PLLSAI division factor for 48MHz clock
  , _                     :: Bit      -- (Reserved)
  , rcc_pllsaicfgr_pllsain  :: Bits 9   -- PLLSAI division factor for VCO
  , _                     :: Bits 6   -- (Reserved)
  }
|]
rcc_reg_pllsaicfgr :: BitDataReg RCC_PLLSAICFGR
rcc_reg_pllsaicfgr = mkBitDataRegNamed (rcc_periph_base + 0x88) "pllsaicfgr"

-- dedicated clocks configuration register
--  | offset : 0x8c
--  | address: 0x4002388c
[ivory|
 bitdata RCC_DCKCFGR1 :: Bits 32 = rcc_dckcfgr1
  { _                      :: Bits 7   -- (Reserved)
  , rcc_dckcfgr1_timpre      :: Bit      -- Timers clocks prescalers selection
  , rcc_dckcfgr1_sai2sel     :: Bits 2   -- SAI2 clock source selection
  , rcc_dckcfgr1_sai1sel     :: Bits 2   -- SAI1 clock source selection
  , _                      :: Bits 7   -- (Reserved)
  , rcc_dckcfgr1_pllsaidivq  :: Bits 5   -- PLLSAI division factor for SAI1 clock
  , _                      :: Bits 3   -- (Reserved)
  , rcc_dckcfgr1_plli2sdiv   :: Bits 5   -- PLLI2S division factor for SAI1 clock
  }
|]
rcc_reg_dckcfgr1 :: BitDataReg RCC_DCKCFGR1
rcc_reg_dckcfgr1 = mkBitDataRegNamed (rcc_periph_base + 0x8c) "dckcfgr1"

-- dedicated clocks configuration register
--  | offset : 0x90
--  | address: 0x40023890
[ivory|
 bitdata RCC_DCKCFGR2 :: Bits 32 = rcc_dckcfgr2
  { _                     :: Bits 2   -- (Reserved)
  , rcc_dckcfgr2_sdmmc2sel  :: Bit      -- SDMMC2 clock source selection
  , rcc_dckcfgr2_sdmmc1sel  :: Bit      -- SDMMC1 clock source selection
  , rcc_dckcfgr2_ck48msel   :: Bit      -- 48MHz clock source selection
  , _                     :: Bit      -- (Reserved)
  , rcc_dckcfgr2_lptim1sel  :: Bits 2   -- Low power timer 1 clock source selection
  , _                     :: Bits 2   -- (Reserved)
  , rcc_dckcfgr2_i2c3sel    :: Bits 2   -- I2C3 clock source selection
  , rcc_dckcfgr2_i2c2sel    :: Bits 2   -- I2C2 clock source selection
  , rcc_dckcfgr2_i2c1sel    :: Bits 2   -- I2C1 clock source selection
  , rcc_dckcfgr2_uart8sel   :: Bits 2   -- UART 8 clock source selection
  , rcc_dckcfgr2_uart7sel   :: Bits 2   -- UART 7 clock source selection
  , rcc_dckcfgr2_uart6sel   :: Bits 2   -- USART 6 clock source selection
  , rcc_dckcfgr2_uart5sel   :: Bits 2   -- UART 5 clock source selection
  , rcc_dckcfgr2_uart4sel   :: Bits 2   -- UART 4 clock source selection
  , rcc_dckcfgr2_uart3sel   :: Bits 2   -- USART 3 clock source selection
  , rcc_dckcfgr2_uart2sel   :: Bits 2   -- USART 2 clock source selection
  , rcc_dckcfgr2_uart1sel   :: Bits 2   -- USART 1 clock source selection
  }
|]
rcc_reg_dckcfgr2 :: BitDataReg RCC_DCKCFGR2
rcc_reg_dckcfgr2 = mkBitDataRegNamed (rcc_periph_base + 0x90) "dckcfgr2"

