{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}

module Ivory.BSP.STM32F412.RCC where

import Ivory.Language
import Ivory.HW
import Ivory.BSP.STM32F412.MemoryMap (rcc_periph_base)
import Ivory.BSP.STM32.Peripheral.RCC.RegTypes

-- RCC Reset and clock control

-- Base address: 0x40023800

-- clock control register
--  | offset : 0x0
--  | address: 0x40023800
[ivory|
 bitdata RCC_CR :: Bits 32 = rcc_cr
  { _               :: Bits 4   -- (Reserved)
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
  , _                  :: Bit      -- (Reserved)
  , rcc_cir_plli2srdyc   :: Bit      -- PLLI2S ready interrupt clear
  , rcc_cir_pllrdyc      :: Bit      -- Main PLL(PLL) ready interrupt clear
  , rcc_cir_hserdyc      :: Bit      -- HSE ready interrupt clear
  , rcc_cir_hsirdyc      :: Bit      -- HSI ready interrupt clear
  , rcc_cir_lserdyc      :: Bit      -- LSE ready interrupt clear
  , rcc_cir_lsirdyc      :: Bit      -- LSI ready interrupt clear
  , _                  :: Bits 2   -- (Reserved)
  , rcc_cir_plli2srdyie  :: Bit      -- PLLI2S ready interrupt enable
  , rcc_cir_pllrdyie     :: Bit      -- Main PLL (PLL) ready interrupt enable
  , rcc_cir_hserdyie     :: Bit      -- HSE ready interrupt enable
  , rcc_cir_hsirdyie     :: Bit      -- HSI ready interrupt enable
  , rcc_cir_lserdyie     :: Bit      -- LSE ready interrupt enable
  , rcc_cir_lsirdyie     :: Bit      -- LSI ready interrupt enable
  , rcc_cir_cssf         :: Bit      -- Clock security system interrupt flag
  , _                  :: Bit      -- (Reserved)
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
  { _                    :: Bits 9   -- (Reserved)
  , rcc_ahb1rstr_dma2rst   :: Bit      -- DMA2 reset
  , rcc_ahb1rstr_dma1rst   :: Bit      -- DMA2 reset
  , _                    :: Bits 8   -- (Reserved)
  , rcc_ahb1rstr_crcrst    :: Bit      -- CRC reset
  , _                    :: Bits 4   -- (Reserved)
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
  , rcc_ahb2rstr_rngrst    :: Bit      -- RNGRST
  , _                    :: Bits 6   -- (Reserved)
  }
|]
rcc_reg_ahb2rstr :: BitDataReg RCC_AHB2RSTR
rcc_reg_ahb2rstr = mkBitDataRegNamed (rcc_periph_base + 0x14) "ahb2rstr"

-- APB1 peripheral reset register
--  | offset : 0x20
--  | address: 0x40023820
[ivory|
 bitdata RCC_APB1RSTR :: Bits 32 = rcc_apb1rstr
  { _                     :: Bits 3   -- (Reserved)
  , rcc_apb1rstr_pwrrst     :: Bit      -- Power interface reset
  , _                     :: Bit      -- (Reserved)
  , rcc_apb1rstr_can2rst    :: Bit      -- CAN2RST
  , rcc_apb1rstr_can1rst    :: Bit      -- CAN1RST
  , rcc_apb1rstr_i2c4rst    :: Bit      -- I2C4RST
  , rcc_apb1rstr_i2c3rst    :: Bit      -- I2C3 reset
  , rcc_apb1rstr_i2c2rst    :: Bit      -- I2C 2 reset
  , rcc_apb1rstr_i2c1rst    :: Bit      -- I2C 1 reset
  , _                     :: Bits 2   -- (Reserved)
  , rcc_apb1rstr_usart3rst  :: Bit      -- USART3RST
  , rcc_apb1rstr_uart2rst   :: Bit      -- USART 2 reset
  , _                     :: Bit      -- (Reserved)
  , rcc_apb1rstr_spi3rst    :: Bit      -- SPI 3 reset
  , rcc_apb1rstr_spi2rst    :: Bit      -- SPI 2 reset
  , _                     :: Bits 2   -- (Reserved)
  , rcc_apb1rstr_wwdgrst    :: Bit      -- Window watchdog reset
  , _                     :: Bits 2   -- (Reserved)
  , rcc_apb1rstr_tim14rst   :: Bit      -- TIM14RST
  , rcc_apb1rstr_tim13rst   :: Bit      -- TIM13RST
  , rcc_apb1rstr_tim12rst   :: Bit      -- TIM12RST
  , rcc_apb1rstr_tim7rst    :: Bit      -- TIM7RST
  , rcc_apb1rstr_tim6rst    :: Bit      -- TIM6RST
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
  { _                     :: Bits 7   -- (Reserved)
  , rcc_apb2rstr_dfsdmrst   :: Bit      -- DFSDMRST
  , _                     :: Bits 5   -- (Reserved)
  , rcc_apb2rstr_tim11rst   :: Bit      -- TIM11 reset
  , rcc_apb2rstr_tim10rst   :: Bit      -- TIM10 reset
  , rcc_apb2rstr_tim9rst    :: Bit      -- TIM9 reset
  , _                     :: Bit      -- (Reserved)
  , rcc_apb2rstr_syscfgrst  :: Bit      -- System configuration controller reset
  , _                     :: Bit      -- (Reserved)
  , rcc_apb2rstr_spi1rst    :: Bit      -- SPI 1 reset
  , rcc_apb2rstr_sdiorst    :: Bit      -- SDIO reset
  , _                     :: Bits 2   -- (Reserved)
  , rcc_apb2rstr_adcrst     :: Bit      -- ADC interface reset (common to all ADCs)
  , _                     :: Bits 2   -- (Reserved)
  , rcc_apb2rstr_usart6rst  :: Bit      -- USART6 reset
  , rcc_apb2rstr_usart1rst  :: Bit      -- USART1 reset
  , _                     :: Bits 2   -- (Reserved)
  , rcc_apb2rstr_tim8rst    :: Bit      -- TIM8RST
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
  { _                  :: Bits 9   -- (Reserved)
  , rcc_ahb1enr_dma2en   :: Bit      -- DMA2 clock enable
  , rcc_ahb1enr_dma1en   :: Bit      -- DMA1 clock enable
  , _                  :: Bits 8   -- (Reserved)
  , rcc_ahb1enr_crcen    :: Bit      -- CRC clock enable
  , _                  :: Bits 4   -- (Reserved)
  , rcc_ahb1enr_gpiohen  :: Bit      -- IO port H clock enable
  , rcc_ahb1enr_gpiogen  :: Bit      -- IO port G clock enable
  , rcc_ahb1enr_gpiofen  :: Bit      -- IO port F clock enable
  , rcc_ahb1enr_gpioeen  :: Bit      -- IO port E clock enable
  , rcc_ahb1enr_gpioden  :: Bit      -- IO port D clock enable
  , rcc_ahb1enr_gpiocen  :: Bit      -- IO port C clock enable
  , rcc_ahb1enr_gpioben  :: Bit      -- IO port B clock enable
  , rcc_ahb1enr_gpioaen  :: Bit      -- IO port A clock enable
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
  , rcc_ahb2enr_rngen    :: Bit      -- RNGEN
  , _                  :: Bits 6   -- (Reserved)
  }
|]
rcc_reg_ahb2enr :: BitDataReg RCC_AHB2ENR
rcc_reg_ahb2enr = mkBitDataRegNamed (rcc_periph_base + 0x34) "ahb2enr"

-- APB1 peripheral clock enable register
--  | offset : 0x40
--  | address: 0x40023840
[ivory|
 bitdata RCC_APB1ENR :: Bits 32 = rcc_apb1enr
  { _                   :: Bits 3   -- (Reserved)
  , rcc_apb1enr_pwren     :: Bit      -- Power interface clock enable
  , _                   :: Bit      -- (Reserved)
  , rcc_apb1enr_can2en    :: Bit      -- CAN2EN
  , rcc_apb1enr_can1en    :: Bit      -- CAN1EN
  , rcc_apb1enr_i2c4en    :: Bit      -- I2C4EN
  , rcc_apb1enr_i2c3en    :: Bit      -- I2C3 clock enable
  , rcc_apb1enr_i2c2en    :: Bit      -- I2C2 clock enable
  , rcc_apb1enr_i2c1en    :: Bit      -- I2C1 clock enable
  , _                   :: Bits 2   -- (Reserved)
  , rcc_apb1enr_usart3en  :: Bit      -- USART3EN
  , rcc_apb1enr_usart2en  :: Bit      -- USART 2 clock enable
  , _                   :: Bit      -- (Reserved)
  , rcc_apb1enr_spi3en    :: Bit      -- SPI3 clock enable
  , rcc_apb1enr_spi2en    :: Bit      -- SPI2 clock enable
  , _                   :: Bits 2   -- (Reserved)
  , rcc_apb1enr_wwdgen    :: Bit      -- Window watchdog clock enable
  , _                   :: Bits 2   -- (Reserved)
  , rcc_apb1enr_tim14en   :: Bit      -- TIM14EN
  , rcc_apb1enr_tim13en   :: Bit      -- TIM13EN
  , rcc_apb1enr_tim12en   :: Bit      -- TIM12EN
  , rcc_apb1enr_tim7en    :: Bit      -- TIM7EN
  , rcc_apb1enr_tim6en    :: Bit      -- TIM6EN
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
  { _                   :: Bits 7   -- (Reserved)
  , rcc_apb2enr_dfsdmen   :: Bit      -- DFSDMEN
  , _                   :: Bits 5   -- (Reserved)
  , rcc_apb2enr_tim11en   :: Bit      -- TIM11 clock enable
  , rcc_apb2enr_tim10en   :: Bit      -- TIM10 clock enable
  , rcc_apb2enr_tim9en    :: Bit      -- TIM9 clock enable
  , _                   :: Bit      -- (Reserved)
  , rcc_apb2enr_syscfgen  :: Bit      -- System configuration controller clock enable
  , rcc_apb2enr_spi4en    :: Bit      -- SPI4 clock enable
  , rcc_apb2enr_spi1en    :: Bit      -- SPI1 clock enable
  , rcc_apb2enr_sdioen    :: Bit      -- SDIO clock enable
  , _                   :: Bits 2   -- (Reserved)
  , rcc_apb2enr_adc1en    :: Bit      -- ADC1 clock enable
  , _                   :: Bits 2   -- (Reserved)
  , rcc_apb2enr_usart6en  :: Bit      -- USART6 clock enable
  , rcc_apb2enr_usart1en  :: Bit      -- USART1 clock enable
  , _                   :: Bits 2   -- (Reserved)
  , rcc_apb2enr_tim8en    :: Bit      -- TIM8EN
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
  { _                      :: Bits 9   -- (Reserved)
  , rcc_ahb1lpenr_dma2lpen   :: Bit      -- DMA2 clock enable during Sleep mode
  , rcc_ahb1lpenr_dma1lpen   :: Bit      -- DMA1 clock enable during Sleep mode
  , _                      :: Bits 4   -- (Reserved)
  , rcc_ahb1lpenr_sram1lpen  :: Bit      -- SRAM 1interface clock enable during Sleep mode
  , rcc_ahb1lpenr_flitflpen  :: Bit      -- Flash interface clock enable during Sleep mode
  , _                      :: Bits 2   -- (Reserved)
  , rcc_ahb1lpenr_crclpen    :: Bit      -- CRC clock enable during Sleep mode
  , _                      :: Bits 4   -- (Reserved)
  , rcc_ahb1lpenr_gpiohlpen  :: Bit      -- IO port H clock enable during Sleep mode
  , rcc_ahb1lpenr_gpioglpen  :: Bit      -- IO port G clock enable during sleep mode
  , rcc_ahb1lpenr_gpioflpen  :: Bit      -- IO port F clock enable during sleep mode
  , rcc_ahb1lpenr_gpioelpen  :: Bit      -- IO port E clock enable during Sleep mode
  , rcc_ahb1lpenr_gpiodlpen  :: Bit      -- IO port D clock enable during Sleep mode
  , rcc_ahb1lpenr_gpioclpen  :: Bit      -- IO port C clock enable during Sleep mode
  , rcc_ahb1lpenr_gpioblpen  :: Bit      -- IO port B clock enable during Sleep mode
  , rcc_ahb1lpenr_gpioalpen  :: Bit      -- IO port A clock enable during sleep mode
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
  , rcc_ahb2lpenr_rnglpen    :: Bit      -- RNGLPEN
  , _                      :: Bits 6   -- (Reserved)
  }
|]
rcc_reg_ahb2lpenr :: BitDataReg RCC_AHB2LPENR
rcc_reg_ahb2lpenr = mkBitDataRegNamed (rcc_periph_base + 0x54) "ahb2lpenr"

-- APB1 peripheral clock enable in low power mode register
--  | offset : 0x60
--  | address: 0x40023860
[ivory|
 bitdata RCC_APB1LPENR :: Bits 32 = rcc_apb1lpenr
  { _                       :: Bits 3   -- (Reserved)
  , rcc_apb1lpenr_pwrlpen     :: Bit      -- Power interface clock enable during Sleep mode
  , _                       :: Bit      -- (Reserved)
  , rcc_apb1lpenr_can2lpen    :: Bit      -- CAN2LPEN
  , rcc_apb1lpenr_can1lpen    :: Bit      -- CAN1LPEN
  , rcc_apb1lpenr_i2c4lpen    :: Bit      -- I2C4LPEN
  , rcc_apb1lpenr_i2c3lpen    :: Bit      -- I2C3 clock enable during Sleep mode
  , rcc_apb1lpenr_i2c2lpen    :: Bit      -- I2C2 clock enable during Sleep mode
  , rcc_apb1lpenr_i2c1lpen    :: Bit      -- I2C1 clock enable during Sleep mode
  , _                       :: Bits 2   -- (Reserved)
  , rcc_apb1lpenr_usart3lpen  :: Bit      -- USART3LPEN
  , rcc_apb1lpenr_usart2lpen  :: Bit      -- USART2 clock enable during Sleep mode
  , _                       :: Bit      -- (Reserved)
  , rcc_apb1lpenr_spi3lpen    :: Bit      -- SPI3 clock enable during Sleep mode
  , rcc_apb1lpenr_spi2lpen    :: Bit      -- SPI2 clock enable during Sleep mode
  , _                       :: Bits 2   -- (Reserved)
  , rcc_apb1lpenr_wwdglpen    :: Bit      -- Window watchdog clock enable during Sleep mode
  , _                       :: Bits 2   -- (Reserved)
  , rcc_apb1lpenr_tim14lpen   :: Bit      -- TIM14LPEN
  , rcc_apb1lpenr_tim13lpen   :: Bit      -- TIM13LPEN
  , rcc_apb1lpenr_tim12lpen   :: Bit      -- TIM12LPEN
  , rcc_apb1lpenr_tim7lpen    :: Bit      -- TIM7LPEN
  , rcc_apb1lpenr_tim6lpen    :: Bit      -- TIM6LPEN
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
  { _                       :: Bits 7   -- (Reserved)
  , rcc_apb2lpenr_dfsdmlpen   :: Bit      -- DFSDMLPEN
  , _                       :: Bits 5   -- (Reserved)
  , rcc_apb2lpenr_tim11lpen   :: Bit      -- TIM11 clock enable during Sleep mode
  , rcc_apb2lpenr_tim10lpen   :: Bit      -- TIM10 clock enable during Sleep mode
  , rcc_apb2lpenr_tim9lpen    :: Bit      -- TIM9 clock enable during sleep mode
  , _                       :: Bit      -- (Reserved)
  , rcc_apb2lpenr_syscfglpen  :: Bit      -- System configuration controller clock enable during Sleep mode
  , rcc_apb2lpenr_spi4lpen    :: Bit      -- SPI4 clock enable during Sleep mode
  , rcc_apb2lpenr_spi1lpen    :: Bit      -- SPI 1 clock enable during Sleep mode
  , rcc_apb2lpenr_sdiolpen    :: Bit      -- SDIO clock enable during Sleep mode
  , _                       :: Bits 2   -- (Reserved)
  , rcc_apb2lpenr_adc1lpen    :: Bit      -- ADC1 clock enable during Sleep mode
  , _                       :: Bits 2   -- (Reserved)
  , rcc_apb2lpenr_usart6lpen  :: Bit      -- USART6 clock enable during Sleep mode
  , rcc_apb2lpenr_usart1lpen  :: Bit      -- USART1 clock enable during Sleep mode
  , _                       :: Bits 2   -- (Reserved)
  , rcc_apb2lpenr_tim8lpen    :: Bit      -- TIM8LPEN
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
  { _                      :: Bit      -- (Reserved)
  , rcc_plli2scfgr_plli2srx  :: Bits 3   -- PLLI2S division factor for I2S clocks
  , _                      :: Bits 13  -- (Reserved)
  , rcc_plli2scfgr_plli2snx  :: Bits 9   -- PLLI2S multiplication factor for VCO
  , _                      :: Bits 6   -- (Reserved)
  }
|]
rcc_reg_plli2scfgr :: BitDataReg RCC_PLLI2SCFGR
rcc_reg_plli2scfgr = mkBitDataRegNamed (rcc_periph_base + 0x84) "plli2scfgr"

