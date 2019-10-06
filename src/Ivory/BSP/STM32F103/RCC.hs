{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}

module Ivory.BSP.STM32F103.RCC where

import Ivory.Language
import Ivory.HW
import Ivory.BSP.STM32F103.MemoryMap (rcc_periph_base)
import Ivory.BSP.STM32.Peripheral.RCC.RegTypes

-- RCC Reset and clock control

-- Base address: 0x40021000

-- Clock control register
--  | offset : 0x0
--  | address: 0x40021000
[ivory|
 bitdata RCC_CR :: Bits 32 = rcc_cr
  { _             :: Bits 6   -- (Reserved)
  , rcc_cr_pllrdy   :: Bit      -- PLL clock ready flag
  , rcc_cr_pllon    :: Bit      -- PLL enable
  , _             :: Bits 4   -- (Reserved)
  , rcc_cr_csson    :: Bit      -- Clock Security System enable
  , rcc_cr_hsebyp   :: Bit      -- External High Speed clock Bypass
  , rcc_cr_hserdy   :: Bit      -- External High Speed clock ready flag
  , rcc_cr_hseon    :: Bit      -- External High Speed clock enable
  , rcc_cr_hsical   :: Bits 8   -- Internal High Speed clock Calibration
  , rcc_cr_hsitrim  :: Bits 5   -- Internal High Speed clock trimming
  , _             :: Bit      -- (Reserved)
  , rcc_cr_hsirdy   :: Bit      -- Internal High Speed clock ready flag
  , rcc_cr_hsion    :: Bit      -- Internal High Speed clock enable
  }
|]
rcc_reg_cr :: BitDataReg RCC_CR
rcc_reg_cr = mkBitDataRegNamed (rcc_periph_base + 0x0) "cr"

-- Clock configuration register (RCC_CFGR)
--  | offset : 0x4
--  | address: 0x40021004
[ivory|
 bitdata RCC_CFGR :: Bits 32 = rcc_cfgr
  { _                :: Bits 5   -- (Reserved)
  , rcc_cfgr_mco       :: Bits 3   -- Microcontroller clock output
  , _                :: Bit      -- (Reserved)
  , rcc_cfgr_otgfspre  :: Bit      -- USB OTG FS prescaler
  , rcc_cfgr_pllmul    :: Bits 4   -- PLL Multiplication Factor
  , rcc_cfgr_pllxtpre  :: Bit      -- HSE divider for PLL entry
  , rcc_cfgr_pllsrc    :: Bit      -- PLL entry clock source
  , rcc_cfgr_adcpre    :: Bits 2   -- ADC prescaler
  , rcc_cfgr_ppre2     :: RCC_PPREx  -- APB High speed prescaler (APB2)
  , rcc_cfgr_ppre1     :: RCC_PPREx  -- APB Low speed prescaler (APB1)
  , rcc_cfgr_hpre      :: RCC_HPRE  -- AHB prescaler
  , rcc_cfgr_sws       :: RCC_SYSCLK  -- System Clock Switch Status
  , rcc_cfgr_sw        :: RCC_SYSCLK  -- System clock Switch
  }
|]
rcc_reg_cfgr :: BitDataReg RCC_CFGR
rcc_reg_cfgr = mkBitDataRegNamed (rcc_periph_base + 0x4) "cfgr"

-- Clock interrupt register (RCC_CIR)
--  | offset : 0x8
--  | address: 0x40021008
[ivory|
 bitdata RCC_CIR :: Bits 32 = rcc_cir
  { _               :: Bits 8   -- (Reserved)
  , rcc_cir_cssc      :: Bit      -- Clock security system interrupt clear
  , _               :: Bits 2   -- (Reserved)
  , rcc_cir_pllrdyc   :: Bit      -- PLL Ready Interrupt Clear
  , rcc_cir_hserdyc   :: Bit      -- HSE Ready Interrupt Clear
  , rcc_cir_hsirdyc   :: Bit      -- HSI Ready Interrupt Clear
  , rcc_cir_lserdyc   :: Bit      -- LSE Ready Interrupt Clear
  , rcc_cir_lsirdyc   :: Bit      -- LSI Ready Interrupt Clear
  , _               :: Bits 3   -- (Reserved)
  , rcc_cir_pllrdyie  :: Bit      -- PLL Ready Interrupt Enable
  , rcc_cir_hserdyie  :: Bit      -- HSE Ready Interrupt Enable
  , rcc_cir_hsirdyie  :: Bit      -- HSI Ready Interrupt Enable
  , rcc_cir_lserdyie  :: Bit      -- LSE Ready Interrupt Enable
  , rcc_cir_lsirdyie  :: Bit      -- LSI Ready Interrupt Enable
  , rcc_cir_cssf      :: Bit      -- Clock Security System Interrupt flag
  , _               :: Bits 2   -- (Reserved)
  , rcc_cir_pllrdyf   :: Bit      -- PLL Ready Interrupt flag
  , rcc_cir_hserdyf   :: Bit      -- HSE Ready Interrupt flag
  , rcc_cir_hsirdyf   :: Bit      -- HSI Ready Interrupt flag
  , rcc_cir_lserdyf   :: Bit      -- LSE Ready Interrupt flag
  , rcc_cir_lsirdyf   :: Bit      -- LSI Ready Interrupt flag
  }
|]
rcc_reg_cir :: BitDataReg RCC_CIR
rcc_reg_cir = mkBitDataRegNamed (rcc_periph_base + 0x8) "cir"

-- APB2 peripheral reset register (RCC_APB2RSTR)
--  | offset : 0xc
--  | address: 0x4002100c
[ivory|
 bitdata RCC_APB2RSTR :: Bits 32 = rcc_apb2rstr
  { _                     :: Bits 10  -- (Reserved)
  , rcc_apb2rstr_tim11rst   :: Bit      -- TIM11 timer reset
  , rcc_apb2rstr_tim10rst   :: Bit      -- TIM10 timer reset
  , rcc_apb2rstr_tim9rst    :: Bit      -- TIM9 timer reset
  , _                     :: Bits 3   -- (Reserved)
  , rcc_apb2rstr_adc3rst    :: Bit      -- ADC 3 interface reset
  , rcc_apb2rstr_usart1rst  :: Bit      -- USART1 reset
  , rcc_apb2rstr_tim8rst    :: Bit      -- TIM8 timer reset
  , rcc_apb2rstr_spi1rst    :: Bit      -- SPI 1 reset
  , rcc_apb2rstr_tim1rst    :: Bit      -- TIM1 timer reset
  , rcc_apb2rstr_adc2rst    :: Bit      -- ADC 2 interface reset
  , rcc_apb2rstr_adc1rst    :: Bit      -- ADC 1 interface reset
  , rcc_apb2rstr_gpiogrst   :: Bit      -- IO port G reset
  , rcc_apb2rstr_gpiofrst   :: Bit      -- IO port F reset
  , rcc_apb2rstr_gpioerst   :: Bit      -- IO port E reset
  , rcc_apb2rstr_gpiodrst   :: Bit      -- IO port D reset
  , rcc_apb2rstr_gpiocrst   :: Bit      -- IO port C reset
  , rcc_apb2rstr_gpiobrst   :: Bit      -- IO port B reset
  , rcc_apb2rstr_gpioarst   :: Bit      -- IO port A reset
  , _                     :: Bit      -- (Reserved)
  , rcc_apb2rstr_afiorst    :: Bit      -- Alternate function I/O reset
  }
|]
rcc_reg_apb2rstr :: BitDataReg RCC_APB2RSTR
rcc_reg_apb2rstr = mkBitDataRegNamed (rcc_periph_base + 0xc) "apb2rstr"

-- APB1 peripheral reset register (RCC_APB1RSTR)
--  | offset : 0x10
--  | address: 0x40021010
[ivory|
 bitdata RCC_APB1RSTR :: Bits 32 = rcc_apb1rstr
  { _                     :: Bits 2   -- (Reserved)
  , rcc_apb1rstr_dacrst     :: Bit      -- DAC interface reset
  , rcc_apb1rstr_pwrrst     :: Bit      -- Power interface reset
  , rcc_apb1rstr_bkprst     :: Bit      -- Backup interface reset
  , _                     :: Bit      -- (Reserved)
  , rcc_apb1rstr_canrst     :: Bit      -- CAN reset
  , _                     :: Bit      -- (Reserved)
  , rcc_apb1rstr_usbrst     :: Bit      -- USB reset
  , rcc_apb1rstr_i2c2rst    :: Bit      -- I2C2 reset
  , rcc_apb1rstr_i2c1rst    :: Bit      -- I2C1 reset
  , rcc_apb1rstr_uart5rst   :: Bit      -- UART 5 reset
  , rcc_apb1rstr_uart4rst   :: Bit      -- UART 4 reset
  , rcc_apb1rstr_usart3rst  :: Bit      -- USART 3 reset
  , rcc_apb1rstr_usart2rst  :: Bit      -- USART 2 reset
  , _                     :: Bit      -- (Reserved)
  , rcc_apb1rstr_spi3rst    :: Bit      -- SPI3 reset
  , rcc_apb1rstr_spi2rst    :: Bit      -- SPI2 reset
  , _                     :: Bits 2   -- (Reserved)
  , rcc_apb1rstr_wwdgrst    :: Bit      -- Window watchdog reset
  , _                     :: Bits 2   -- (Reserved)
  , rcc_apb1rstr_tim14rst   :: Bit      -- Timer 14 reset
  , rcc_apb1rstr_tim13rst   :: Bit      -- Timer 13 reset
  , rcc_apb1rstr_tim12rst   :: Bit      -- Timer 12 reset
  , rcc_apb1rstr_tim7rst    :: Bit      -- Timer 7 reset
  , rcc_apb1rstr_tim6rst    :: Bit      -- Timer 6 reset
  , rcc_apb1rstr_tim5rst    :: Bit      -- Timer 5 reset
  , rcc_apb1rstr_tim4rst    :: Bit      -- Timer 4 reset
  , rcc_apb1rstr_tim3rst    :: Bit      -- Timer 3 reset
  , rcc_apb1rstr_tim2rst    :: Bit      -- Timer 2 reset
  }
|]
rcc_reg_apb1rstr :: BitDataReg RCC_APB1RSTR
rcc_reg_apb1rstr = mkBitDataRegNamed (rcc_periph_base + 0x10) "apb1rstr"

-- AHB Peripheral Clock enable register (RCC_AHBENR)
--  | offset : 0x14
--  | address: 0x40021014
[ivory|
 bitdata RCC_AHBENR :: Bits 32 = rcc_ahbenr
  { _                 :: Bits 21  -- (Reserved)
  , rcc_ahbenr_sdioen   :: Bit      -- SDIO clock enable
  , _                 :: Bit      -- (Reserved)
  , rcc_ahbenr_fsmcen   :: Bit      -- FSMC clock enable
  , _                 :: Bit      -- (Reserved)
  , rcc_ahbenr_crcen    :: Bit      -- CRC clock enable
  , _                 :: Bit      -- (Reserved)
  , rcc_ahbenr_flitfen  :: Bit      -- FLITF clock enable
  , _                 :: Bit      -- (Reserved)
  , rcc_ahbenr_sramen   :: Bit      -- SRAM interface clock enable
  , rcc_ahbenr_dma2en   :: Bit      -- DMA2 clock enable
  , rcc_ahbenr_dma1en   :: Bit      -- DMA1 clock enable
  }
|]
rcc_reg_ahbenr :: BitDataReg RCC_AHBENR
rcc_reg_ahbenr = mkBitDataRegNamed (rcc_periph_base + 0x14) "ahbenr"

-- APB2 peripheral clock enable register (RCC_APB2ENR)
--  | offset : 0x18
--  | address: 0x40021018
[ivory|
 bitdata RCC_APB2ENR :: Bits 32 = rcc_apb2enr
  { _                   :: Bits 10  -- (Reserved)
  , rcc_apb2enr_tim11en   :: Bit      -- TIM11 Timer clock enable
  , rcc_apb2enr_tim10en   :: Bit      -- TIM10 Timer clock enable
  , rcc_apb2enr_tim9en    :: Bit      -- TIM9 Timer clock enable
  , _                   :: Bits 3   -- (Reserved)
  , rcc_apb2enr_adc3en    :: Bit      -- ADC3 interface clock enable
  , rcc_apb2enr_usart1en  :: Bit      -- USART1 clock enable
  , rcc_apb2enr_tim8en    :: Bit      -- TIM8 Timer clock enable
  , rcc_apb2enr_spi1en    :: Bit      -- SPI 1 clock enable
  , rcc_apb2enr_tim1en    :: Bit      -- TIM1 Timer clock enable
  , rcc_apb2enr_adc2en    :: Bit      -- ADC 2 interface clock enable
  , rcc_apb2enr_adc1en    :: Bit      -- ADC 1 interface clock enable
  , rcc_apb2enr_gpiogen   :: Bit      -- I/O port G clock enable
  , rcc_apb2enr_gpiofen   :: Bit      -- I/O port F clock enable
  , rcc_apb2enr_gpioeen   :: Bit      -- I/O port E clock enable
  , rcc_apb2enr_gpioden   :: Bit      -- I/O port D clock enable
  , rcc_apb2enr_gpiocen   :: Bit      -- I/O port C clock enable
  , rcc_apb2enr_gpioben   :: Bit      -- I/O port B clock enable
  , rcc_apb2enr_gpioaen   :: Bit      -- I/O port A clock enable
  , _                   :: Bit      -- (Reserved)
  , rcc_apb2enr_afioen    :: Bit      -- Alternate function I/O clock enable
  }
|]
rcc_reg_apb2enr :: BitDataReg RCC_APB2ENR
rcc_reg_apb2enr = mkBitDataRegNamed (rcc_periph_base + 0x18) "apb2enr"

-- APB1 peripheral clock enable register (RCC_APB1ENR)
--  | offset : 0x1c
--  | address: 0x4002101c
[ivory|
 bitdata RCC_APB1ENR :: Bits 32 = rcc_apb1enr
  { _                   :: Bits 2   -- (Reserved)
  , rcc_apb1enr_dacen     :: Bit      -- DAC interface clock enable
  , rcc_apb1enr_pwren     :: Bit      -- Power interface clock enable
  , rcc_apb1enr_bkpen     :: Bit      -- Backup interface clock enable
  , _                   :: Bit      -- (Reserved)
  , rcc_apb1enr_canen     :: Bit      -- CAN clock enable
  , _                   :: Bit      -- (Reserved)
  , rcc_apb1enr_usben     :: Bit      -- USB clock enable
  , rcc_apb1enr_i2c2en    :: Bit      -- I2C 2 clock enable
  , rcc_apb1enr_i2c1en    :: Bit      -- I2C 1 clock enable
  , rcc_apb1enr_uart5en   :: Bit      -- UART 5 clock enable
  , rcc_apb1enr_uart4en   :: Bit      -- UART 4 clock enable
  , rcc_apb1enr_usart3en  :: Bit      -- USART 3 clock enable
  , rcc_apb1enr_usart2en  :: Bit      -- USART 2 clock enable
  , _                   :: Bit      -- (Reserved)
  , rcc_apb1enr_spi3en    :: Bit      -- SPI 3 clock enable
  , rcc_apb1enr_spi2en    :: Bit      -- SPI 2 clock enable
  , _                   :: Bits 2   -- (Reserved)
  , rcc_apb1enr_wwdgen    :: Bit      -- Window watchdog clock enable
  , _                   :: Bits 2   -- (Reserved)
  , rcc_apb1enr_tim14en   :: Bit      -- Timer 14 clock enable
  , rcc_apb1enr_tim13en   :: Bit      -- Timer 13 clock enable
  , rcc_apb1enr_tim12en   :: Bit      -- Timer 12 clock enable
  , rcc_apb1enr_tim7en    :: Bit      -- Timer 7 clock enable
  , rcc_apb1enr_tim6en    :: Bit      -- Timer 6 clock enable
  , rcc_apb1enr_tim5en    :: Bit      -- Timer 5 clock enable
  , rcc_apb1enr_tim4en    :: Bit      -- Timer 4 clock enable
  , rcc_apb1enr_tim3en    :: Bit      -- Timer 3 clock enable
  , rcc_apb1enr_tim2en    :: Bit      -- Timer 2 clock enable
  }
|]
rcc_reg_apb1enr :: BitDataReg RCC_APB1ENR
rcc_reg_apb1enr = mkBitDataRegNamed (rcc_periph_base + 0x1c) "apb1enr"

-- Backup domain control register (RCC_BDCR)
--  | offset : 0x20
--  | address: 0x40021020
[ivory|
 bitdata RCC_BDCR :: Bits 32 = rcc_bdcr
  { _              :: Bits 15  -- (Reserved)
  , rcc_bdcr_bdrst   :: Bit      -- Backup domain software reset
  , rcc_bdcr_rtcen   :: Bit      -- RTC clock enable
  , _              :: Bits 5   -- (Reserved)
  , rcc_bdcr_rtcsel  :: Bits 2   -- RTC clock source selection
  , _              :: Bits 5   -- (Reserved)
  , rcc_bdcr_lsebyp  :: Bit      -- External Low Speed oscillator bypass
  , rcc_bdcr_lserdy  :: Bit      -- External Low Speed oscillator ready
  , rcc_bdcr_lseon   :: Bit      -- External Low Speed oscillator enable
  }
|]
rcc_reg_bdcr :: BitDataReg RCC_BDCR
rcc_reg_bdcr = mkBitDataRegNamed (rcc_periph_base + 0x20) "bdcr"

-- Control/status register (RCC_CSR)
--  | offset : 0x24
--  | address: 0x40021024
[ivory|
 bitdata RCC_CSR :: Bits 32 = rcc_csr
  { rcc_csr_lpwrrstf  :: Bit      -- Low-power reset flag
  , rcc_csr_wwdgrstf  :: Bit      -- Window watchdog reset flag
  , rcc_csr_iwdgrstf  :: Bit      -- Independent watchdog reset flag
  , rcc_csr_sftrstf   :: Bit      -- Software reset flag
  , rcc_csr_porrstf   :: Bit      -- POR/PDR reset flag
  , rcc_csr_pinrstf   :: Bit      -- PIN reset flag
  , _               :: Bit      -- (Reserved)
  , rcc_csr_rmvf      :: Bit      -- Remove reset flag
  , _               :: Bits 22  -- (Reserved)
  , rcc_csr_lsirdy    :: Bit      -- Internal low speed oscillator ready
  , rcc_csr_lsion     :: Bit      -- Internal low speed oscillator enable
  }
|]
rcc_reg_csr :: BitDataReg RCC_CSR
rcc_reg_csr = mkBitDataRegNamed (rcc_periph_base + 0x24) "csr"

