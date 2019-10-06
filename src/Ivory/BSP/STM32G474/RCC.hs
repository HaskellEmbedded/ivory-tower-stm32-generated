{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}

module Ivory.BSP.STM32G474.RCC where

import Ivory.Language
import Ivory.HW
import Ivory.BSP.STM32G474.MemoryMap (rcc_periph_base)
import Ivory.BSP.STM32.Peripheral.RCC.RegTypes

-- RCC Reset and clock control

-- Base address: 0x40021000

-- Clock control register
--  | offset : 0x0
--  | address: 0x40021000
[ivory|
 bitdata RCC_CR :: Bits 32 = rcc_cr
  { _               :: Bits 6   -- (Reserved)
  , rcc_cr_pllsysrdy  :: Bit      -- Main PLL clock ready flag
  , rcc_cr_pllsyson   :: Bit      -- Main PLL enable
  , _               :: Bits 4   -- (Reserved)
  , rcc_cr_hsecsson   :: Bit      -- Clock security system enable
  , rcc_cr_hsebyp     :: Bit      -- HSE crystal oscillator bypass
  , rcc_cr_hserdy     :: Bit      -- HSE clock ready flag
  , rcc_cr_hseon      :: Bit      -- HSE clock enable
  , _               :: Bits 5   -- (Reserved)
  , rcc_cr_hsirdy     :: Bit      -- HSI clock ready flag
  , rcc_cr_hsikeron   :: Bit      -- HSI always enable for peripheral kernels
  , rcc_cr_hsion      :: Bit      -- HSI clock enable
  , _               :: Bits 8   -- (Reserved)
  }
|]
rcc_reg_cr :: BitDataReg RCC_CR
rcc_reg_cr = mkBitDataRegNamed (rcc_periph_base + 0x0) "cr"

-- Internal clock sources calibration register
--  | offset : 0x4
--  | address: 0x40021004
[ivory|
 bitdata RCC_ICSCR :: Bits 32 = rcc_icscr
  { _                :: Bit      -- (Reserved)
  , rcc_icscr_hsitrim  :: Bits 7   -- Internal High Speed clock trimming
  , rcc_icscr_hsical0  :: Bits 8   -- Internal High Speed clock Calibration
  , _                :: Bits 16  -- (Reserved)
  }
|]
rcc_reg_icscr :: BitDataReg RCC_ICSCR
rcc_reg_icscr = mkBitDataRegNamed (rcc_periph_base + 0x4) "icscr"

-- Clock configuration register
--  | offset : 0x8
--  | address: 0x40021008
[ivory|
 bitdata RCC_CFGR :: Bits 32 = rcc_cfgr
  { _              :: Bit      -- (Reserved)
  , rcc_cfgr_mcopre  :: RCC_MCOxPre  -- Microcontroller clock output prescaler
  , rcc_cfgr_mcosel  :: Bits 4   -- Microcontroller clock output
  , _              :: Bits 10  -- (Reserved)
  , rcc_cfgr_ppre2   :: RCC_PPREx  -- APB high-speed prescaler (APB2)
  , rcc_cfgr_ppre1   :: RCC_PPREx  -- PB low-speed prescaler (APB1)
  , rcc_cfgr_hpre    :: RCC_HPRE  -- AHB prescaler
  , rcc_cfgr_sws     :: RCC_SYSCLK  -- System clock switch status
  , rcc_cfgr_sw      :: RCC_SYSCLK  -- System clock switch
  }
|]
rcc_reg_cfgr :: BitDataReg RCC_CFGR
rcc_reg_cfgr = mkBitDataRegNamed (rcc_periph_base + 0x8) "cfgr"

-- PLL configuration register
--  | offset : 0xc
--  | address: 0x4002100c
[ivory|
 bitdata RCC_PLLSYSCFGR :: Bits 32 = rcc_pllsyscfgr
  { rcc_pllsyscfgr_pllsyspdiv  :: Bits 5   -- Main PLL division factor for PLLSAI2CLK
  , rcc_pllsyscfgr_pllsysr     :: Bits 2   -- Main PLL division factor for PLLCLK (system clock)
  , rcc_pllsyscfgr_pllsysren   :: Bit      -- Main PLL PLLCLK output enable
  , _                        :: Bit      -- (Reserved)
  , rcc_pllsyscfgr_pllsysq     :: Bits 2   -- Main PLL division factor for PLLUSB1CLK(48 MHz clock)
  , rcc_pllsyscfgr_pllsysqen   :: Bit      -- Main PLL PLLUSB1CLK output enable
  , _                        :: Bits 2   -- (Reserved)
  , rcc_pllsyscfgr_pllsysp     :: Bit      -- Main PLL division factor for PLLSAI3CLK (SAI1 and SAI2 clock)
  , rcc_pllsyscfgr_pllpen      :: Bit      -- Main PLL PLLSAI3CLK output enable
  , _                        :: Bit      -- (Reserved)
  , rcc_pllsyscfgr_pllsysn     :: Bits 7   -- Main PLL multiplication factor for VCO
  , rcc_pllsyscfgr_pllsysm     :: Bits 4   -- Division factor for the main PLL and audio PLL (PLLSAI1 and PLLSAI2) input clock
  , _                        :: Bits 2   -- (Reserved)
  , rcc_pllsyscfgr_pllsrc      :: Bits 2   -- Main PLL, PLLSAI1 and PLLSAI2 entry clock source
  }
|]
rcc_reg_pllsyscfgr :: BitDataReg RCC_PLLSYSCFGR
rcc_reg_pllsyscfgr = mkBitDataRegNamed (rcc_periph_base + 0xc) "pllsyscfgr"

-- Clock interrupt enable register
--  | offset : 0x18
--  | address: 0x40021018
[ivory|
 bitdata RCC_CIR :: Bits 32 = rcc_cir
  { _                  :: Bits 21  -- (Reserved)
  , rcc_cir_rc48rdyie    :: Bit      -- HSI48 ready interrupt enable
  , rcc_cir_lsecssie     :: Bit      -- LSE clock security system interrupt enable
  , _                  :: Bits 3   -- (Reserved)
  , rcc_cir_pllsysrdyie  :: Bit      -- PLL ready interrupt enable
  , rcc_cir_hserdyie     :: Bit      -- HSE ready interrupt enable
  , rcc_cir_hsirdyie     :: Bit      -- HSI ready interrupt enable
  , _                  :: Bit      -- (Reserved)
  , rcc_cir_lserdyie     :: Bit      -- LSE ready interrupt enable
  , rcc_cir_lsirdyie     :: Bit      -- LSI ready interrupt enable
  }
|]
rcc_reg_cir :: BitDataReg RCC_CIR
rcc_reg_cir = mkBitDataRegNamed (rcc_periph_base + 0x18) "cir"

-- Clock interrupt flag register
--  | offset : 0x1c
--  | address: 0x4002101c
[ivory|
 bitdata RCC_CIFR :: Bits 32 = rcc_cifr
  { _                  :: Bits 21  -- (Reserved)
  , rcc_cifr_rc48rdyf    :: Bit      -- HSI48 ready interrupt flag
  , rcc_cifr_lsecssf     :: Bit      -- LSE Clock security system interrupt flag
  , rcc_cifr_hsecssf     :: Bit      -- Clock security system interrupt flag
  , _                  :: Bits 2   -- (Reserved)
  , rcc_cifr_pllsysrdyf  :: Bit      -- PLL ready interrupt flag
  , rcc_cifr_hserdyf     :: Bit      -- HSE ready interrupt flag
  , rcc_cifr_hsirdyf     :: Bit      -- HSI ready interrupt flag
  , _                  :: Bit      -- (Reserved)
  , rcc_cifr_lserdyf     :: Bit      -- LSE ready interrupt flag
  , rcc_cifr_lsirdyf     :: Bit      -- LSI ready interrupt flag
  }
|]
rcc_reg_cifr :: BitDataReg RCC_CIFR
rcc_reg_cifr = mkBitDataRegNamed (rcc_periph_base + 0x1c) "cifr"

-- Clock interrupt clear register
--  | offset : 0x20
--  | address: 0x40021020
[ivory|
 bitdata RCC_CICR :: Bits 32 = rcc_cicr
  { _                  :: Bits 21  -- (Reserved)
  , rcc_cicr_rc48rdyc    :: Bit      -- HSI48 oscillator ready interrupt clear
  , rcc_cicr_lsecssc     :: Bit      -- LSE Clock security system interrupt clear
  , rcc_cicr_hsecssc     :: Bit      -- Clock security system interrupt clear
  , _                  :: Bits 2   -- (Reserved)
  , rcc_cicr_pllsysrdyc  :: Bit      -- PLL ready interrupt clear
  , rcc_cicr_hserdyc     :: Bit      -- HSE ready interrupt clear
  , rcc_cicr_hsirdyc     :: Bit      -- HSI ready interrupt clear
  , _                  :: Bit      -- (Reserved)
  , rcc_cicr_lserdyc     :: Bit      -- LSE ready interrupt clear
  , rcc_cicr_lsirdyc     :: Bit      -- LSI ready interrupt clear
  }
|]
rcc_reg_cicr :: BitDataReg RCC_CICR
rcc_reg_cicr = mkBitDataRegNamed (rcc_periph_base + 0x20) "cicr"

-- AHB1 peripheral reset register
--  | offset : 0x28
--  | address: 0x40021028
[ivory|
 bitdata RCC_AHB1RSTR :: Bits 32 = rcc_ahb1rstr
  { _                      :: Bits 19  -- (Reserved)
  , rcc_ahb1rstr_crcrst      :: Bit      -- CRC reset
  , _                      :: Bits 3   -- (Reserved)
  , rcc_ahb1rstr_flitfrst_   :: Bit      -- FLITF reset
  , _                      :: Bits 3   -- (Reserved)
  , rcc_ahb1rstr_matrixrst   :: Bit      -- MATRIX reset
  , rcc_ahb1rstr_cordicrst   :: Bit      -- CORDIC reset
  , rcc_ahb1rstr_dmamux1rst  :: Bit      -- DMAMUXRST
  , rcc_ahb1rstr_dma2rst     :: Bit      -- DMA2 reset
  , rcc_ahb1rstr_dma1rst     :: Bit      -- DMA1 reset
  }
|]
rcc_reg_ahb1rstr :: BitDataReg RCC_AHB1RSTR
rcc_reg_ahb1rstr = mkBitDataRegNamed (rcc_periph_base + 0x28) "ahb1rstr"

-- AHB2 peripheral reset register
--  | offset : 0x2c
--  | address: 0x4002102c
[ivory|
 bitdata RCC_AHB2RSTR :: Bits 32 = rcc_ahb2rstr
  { _                      :: Bits 5   -- (Reserved)
  , rcc_ahb2rstr_rngrst      :: Bit      -- Random Number Generator module reset
  , _                      :: Bit      -- (Reserved)
  , rcc_ahb2rstr_cryptrst    :: Bit      -- Cryptography module reset
  , _                      :: Bits 4   -- (Reserved)
  , rcc_ahb2rstr_dac4rst     :: Bit      -- DAC4 interface reset
  , rcc_ahb2rstr_dac3rst     :: Bit      -- DAC3 interface reset
  , rcc_ahb2rstr_dac2rst     :: Bit      -- DAC2 interface reset
  , rcc_ahb2rstr_dac1rst_    :: Bit      -- DAC1 interface reset
  , _                      :: Bit      -- (Reserved)
  , rcc_ahb2rstr_adc345rst_  :: Bit      -- SAR ADC345 interface reset
  , rcc_ahb2rstr_adc12rst    :: Bit      -- ADC reset
  , _                      :: Bits 6   -- (Reserved)
  , rcc_ahb2rstr_gpiogrst    :: Bit      -- IO port G reset
  , rcc_ahb2rstr_gpiofrst    :: Bit      -- IO port F reset
  , rcc_ahb2rstr_gpioerst    :: Bit      -- IO port E reset
  , rcc_ahb2rstr_gpiodrst    :: Bit      -- IO port D reset
  , rcc_ahb2rstr_gpiocrst    :: Bit      -- IO port C reset
  , rcc_ahb2rstr_gpiobrst    :: Bit      -- IO port B reset
  , rcc_ahb2rstr_gpioarst    :: Bit      -- IO port A reset
  }
|]
rcc_reg_ahb2rstr :: BitDataReg RCC_AHB2RSTR
rcc_reg_ahb2rstr = mkBitDataRegNamed (rcc_periph_base + 0x2c) "ahb2rstr"

-- AHB3 peripheral reset register
--  | offset : 0x30
--  | address: 0x40021030
[ivory|
 bitdata RCC_AHB3RSTR :: Bits 32 = rcc_ahb3rstr
  { _                       :: Bits 23  -- (Reserved)
  , rcc_ahb3rstr_quadspi1rst  :: Bit      -- Quad SPI 1 module reset
  , _                       :: Bits 7   -- (Reserved)
  , rcc_ahb3rstr_fmcrst       :: Bit      -- Flexible memory controller reset
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
  , rcc_apb1rstr1_i2c3rst    :: Bit      -- I2C3 clock enable
  , _                      :: Bit      -- (Reserved)
  , rcc_apb1rstr1_pwrrst     :: Bit      -- Power interface reset
  , _                      :: Bits 2   -- (Reserved)
  , rcc_apb1rstr1_fdcanrst   :: Bit      -- FDCAN reset
  , _                      :: Bit      -- (Reserved)
  , rcc_apb1rstr1_usbdrst    :: Bit      -- USBD reset
  , rcc_apb1rstr1_i2c2rst    :: Bit      -- I2C2 reset
  , rcc_apb1rstr1_i2c1rst    :: Bit      -- I2C1 reset
  , rcc_apb1rstr1_uart5rst   :: Bit      -- UART5 reset
  , rcc_apb1rstr1_uart4rst   :: Bit      -- UART4 reset
  , rcc_apb1rstr1_usart3rst  :: Bit      -- USART3 reset
  , rcc_apb1rstr1_usart2rst  :: Bit      -- USART2 reset
  , _                      :: Bit      -- (Reserved)
  , rcc_apb1rstr1_spi3rst    :: Bit      -- SPI3 reset
  , rcc_apb1rstr1_spi2rst    :: Bit      -- SPI2 reset
  , _                      :: Bits 5   -- (Reserved)
  , rcc_apb1rstr1_crsrst     :: Bit      -- Clock recovery system reset
  , _                      :: Bits 2   -- (Reserved)
  , rcc_apb1rstr1_tim7rst    :: Bit      -- TIM7 timer reset
  , rcc_apb1rstr1_tim6rst    :: Bit      -- TIM6 timer reset
  , rcc_apb1rstr1_tim5rst    :: Bit      -- TIM5 timer reset
  , rcc_apb1rstr1_tim4rst    :: Bit      -- TIM3 timer reset
  , rcc_apb1rstr1_tim3rst    :: Bit      -- TIM3 timer reset
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
  { _                       :: Bits 23  -- (Reserved)
  , rcc_apb1rstr2_usbpdrst    :: Bit      -- USBPD reset
  , _                       :: Bits 6   -- (Reserved)
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
  { _                     :: Bits 5   -- (Reserved)
  , rcc_apb2rstr_hrtim1rst  :: Bit      -- HRTIMER reset
  , _                     :: Bits 4   -- (Reserved)
  , rcc_apb2rstr_sai1rst    :: Bit      -- Serial audio interface 1 (SAI1) reset
  , rcc_apb2rstr_tim20rst   :: Bit      -- Timer 20 reset
  , _                     :: Bit      -- (Reserved)
  , rcc_apb2rstr_tim17rst   :: Bit      -- TIM17 timer reset
  , rcc_apb2rstr_tim16rst   :: Bit      -- TIM16 timer reset
  , rcc_apb2rstr_tim15rst   :: Bit      -- TIM15 timer reset
  , rcc_apb2rstr_spi4rst    :: Bit      -- SPI 4 reset
  , rcc_apb2rstr_usart1rst  :: Bit      -- USART1 reset
  , rcc_apb2rstr_tim8rst    :: Bit      -- TIM8 timer reset
  , rcc_apb2rstr_spi1rst    :: Bit      -- SPI1 reset
  , rcc_apb2rstr_tim1rst    :: Bit      -- TIM1 timer reset
  , _                     :: Bits 10  -- (Reserved)
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
  { _                   :: Bits 19  -- (Reserved)
  , rcc_ahb1enr_crcen     :: Bit      -- CRC clock enable
  , _                   :: Bits 3   -- (Reserved)
  , rcc_ahb1enr_flitfen   :: Bit      -- FLITF clock enable
  , _                   :: Bits 3   -- (Reserved)
  , rcc_ahb1enr_fmacen    :: Bit      -- FMAC clock enable
  , rcc_ahb1enr_cordicen  :: Bit      -- CORDIC clock enable
  , rcc_ahb1enr_dmamuxen  :: Bit      -- DMAMUX clock enable
  , rcc_ahb1enr_dma2en    :: Bit      -- DMA2 clock enable
  , rcc_ahb1enr_dma1en    :: Bit      -- DMA1 clock enable
  }
|]
rcc_reg_ahb1enr :: BitDataReg RCC_AHB1ENR
rcc_reg_ahb1enr = mkBitDataRegNamed (rcc_periph_base + 0x48) "ahb1enr"

-- AHB2 peripheral clock enable register
--  | offset : 0x4c
--  | address: 0x4002104c
[ivory|
 bitdata RCC_AHB2ENR :: Bits 32 = rcc_ahb2enr
  { _                   :: Bits 5   -- (Reserved)
  , rcc_ahb2enr_rngen     :: Bit      -- Random Number Generator clock enable
  , _                   :: Bit      -- (Reserved)
  , rcc_ahb2enr_crypten   :: Bit      -- Cryptography clock enable
  , _                   :: Bits 4   -- (Reserved)
  , rcc_ahb2enr_dac4      :: Bit      -- DAC4 clock enable
  , rcc_ahb2enr_dac3      :: Bit      -- Random Number Generator clock enable
  , rcc_ahb2enr_dac2      :: Bit      -- HASH clock enable
  , rcc_ahb2enr_dac1      :: Bit      -- AES accelerator clock enable
  , _                   :: Bit      -- (Reserved)
  , rcc_ahb2enr_adc345en  :: Bit      -- DCMI clock enable
  , rcc_ahb2enr_adc12en   :: Bit      -- ADC clock enable
  , _                   :: Bits 6   -- (Reserved)
  , rcc_ahb2enr_gpiogen   :: Bit      -- IO port G clock enable
  , rcc_ahb2enr_gpiofen   :: Bit      -- IO port F clock enable
  , rcc_ahb2enr_gpioeen   :: Bit      -- IO port E clock enable
  , rcc_ahb2enr_gpioden   :: Bit      -- IO port D clock enable
  , rcc_ahb2enr_gpiocen   :: Bit      -- IO port C clock enable
  , rcc_ahb2enr_gpioben   :: Bit      -- IO port B clock enable
  , rcc_ahb2enr_gpioaen   :: Bit      -- IO port A clock enable
  }
|]
rcc_reg_ahb2enr :: BitDataReg RCC_AHB2ENR
rcc_reg_ahb2enr = mkBitDataRegNamed (rcc_periph_base + 0x4c) "ahb2enr"

-- AHB3 peripheral clock enable register
--  | offset : 0x50
--  | address: 0x40021050
[ivory|
 bitdata RCC_AHB3ENR :: Bits 32 = rcc_ahb3enr
  { _                     :: Bits 23  -- (Reserved)
  , rcc_ahb3enr_quadspi1en  :: Bit      -- Quad SPI 1 module clock enable
  , _                     :: Bits 7   -- (Reserved)
  , rcc_ahb3enr_fmcen       :: Bit      -- Flexible memory controller clock enable
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
  , rcc_apb1enr1_i2c3en    :: Bit      -- I2C3 clock enable
  , _                    :: Bit      -- (Reserved)
  , rcc_apb1enr1_pwren     :: Bit      -- Power interface clock enable
  , _                    :: Bits 2   -- (Reserved)
  , rcc_apb1enr1_fdcanen   :: Bit      -- FDCAN clock enable
  , _                    :: Bit      -- (Reserved)
  , rcc_apb1enr1_usbden    :: Bit      -- USBDclock enable
  , rcc_apb1enr1_i2c2en    :: Bit      -- I2C2 clock enable
  , rcc_apb1enr1_i2c1en    :: Bit      -- I2C1 clock enable
  , rcc_apb1enr1_uart5en   :: Bit      -- UART5 clock enable
  , rcc_apb1enr1_uart4en   :: Bit      -- UART4 clock enable
  , rcc_apb1enr1_usart3en  :: Bit      -- USART3 clock enable
  , rcc_apb1enr1_usart2en  :: Bit      -- USART2 clock enable
  , _                    :: Bit      -- (Reserved)
  , rcc_apb1enr1_sp3en     :: Bit      -- SPI3 clock enable
  , rcc_apb1enr1_spi2en    :: Bit      -- SPI2 clock enable
  , _                    :: Bits 2   -- (Reserved)
  , rcc_apb1enr1_wwdgen    :: Bit      -- Window watchdog clock enable
  , rcc_apb1enr1_rtcapben  :: Bit      -- RTC APB clock enable
  , _                    :: Bit      -- (Reserved)
  , rcc_apb1enr1_crsen     :: Bit      -- CRSclock enable
  , _                    :: Bits 2   -- (Reserved)
  , rcc_apb1enr1_tim7en    :: Bit      -- TIM7 timer clock enable
  , rcc_apb1enr1_tim6en    :: Bit      -- TIM6 timer clock enable
  , rcc_apb1enr1_tim5en    :: Bit      -- TIM5 timer clock enable
  , rcc_apb1enr1_tim4en    :: Bit      -- TIM4 timer clock enable
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
  { _                     :: Bits 23  -- (Reserved)
  , rcc_apb1enr2_usbpden    :: Bit      -- USBPD clock enable
  , _                     :: Bits 6   -- (Reserved)
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
  { _                    :: Bits 5   -- (Reserved)
  , rcc_apb2enr_hrtimeren  :: Bit      -- HRTIMER clock enable
  , _                    :: Bits 4   -- (Reserved)
  , rcc_apb2enr_sai1en     :: Bit      -- SAI1 clock enable
  , rcc_apb2enr_tim20en    :: Bit      -- Timer 20 clock enable
  , _                    :: Bit      -- (Reserved)
  , rcc_apb2enr_tim17en    :: Bit      -- TIM17 timer clock enable
  , rcc_apb2enr_tim16en    :: Bit      -- TIM16 timer clock enable
  , rcc_apb2enr_tim15en    :: Bit      -- TIM15 timer clock enable
  , rcc_apb2enr_spi4en     :: Bit      -- SPI 4 clock enable
  , rcc_apb2enr_usart1en   :: Bit      -- USART1clock enable
  , rcc_apb2enr_tim8en     :: Bit      -- TIM8 timer clock enable
  , rcc_apb2enr_spi1en     :: Bit      -- SPI1 clock enable
  , rcc_apb2enr_tim1en     :: Bit      -- TIM1 timer clock enable
  , _                    :: Bits 10  -- (Reserved)
  , rcc_apb2enr_syscfgen   :: Bit      -- SYSCFG clock enable
  }
|]
rcc_reg_apb2enr :: BitDataReg RCC_APB2ENR
rcc_reg_apb2enr = mkBitDataRegNamed (rcc_periph_base + 0x60) "apb2enr"

-- AHB1 peripheral clocks enable in Sleep and Stop modes register
--  | offset : 0x68
--  | address: 0x40021068
[ivory|
 bitdata RCC_AHB1SMENR :: Bits 32 = rcc_ahb1smenr
  { _                        :: Bits 19  -- (Reserved)
  , rcc_ahb1smenr_crcsmen      :: Bit      -- CRCSMEN
  , _                        :: Bits 2   -- (Reserved)
  , rcc_ahb1smenr_sram1smen    :: Bit      -- SRAM1 interface clocks enable during Sleep and Stop modes
  , rcc_ahb1smenr_flashsmen    :: Bit      -- Flash memory interface clocks enable during Sleep and Stop modes
  , _                        :: Bits 3   -- (Reserved)
  , rcc_ahb1smenr_fmacsmen     :: Bit      -- FMACSM clock enable
  , rcc_ahb1smenr_cordicsmen   :: Bit      -- CORDIC clock enable during sleep mode
  , rcc_ahb1smenr_dmamux1smen  :: Bit      -- DMAMUX clock enable during Sleep and Stop modes
  , rcc_ahb1smenr_dma2smen     :: Bit      -- DMA2 clocks enable during Sleep and Stop modes
  , rcc_ahb1smenr_dma1smen     :: Bit      -- DMA1 clocks enable during Sleep and Stop modes
  }
|]
rcc_reg_ahb1smenr :: BitDataReg RCC_AHB1SMENR
rcc_reg_ahb1smenr = mkBitDataRegNamed (rcc_periph_base + 0x68) "ahb1smenr"

-- AHB2 peripheral clocks enable in Sleep and Stop modes register
--  | offset : 0x6c
--  | address: 0x4002106c
[ivory|
 bitdata RCC_AHB2SMENR :: Bits 32 = rcc_ahb2smenr
  { _                       :: Bits 5   -- (Reserved)
  , rcc_ahb2smenr_rngsmen     :: Bit      -- Random Number Generator clock enable during sleep mode
  , _                       :: Bit      -- (Reserved)
  , rcc_ahb2smenr_cryptsmen   :: Bit      -- Cryptography clock enable during sleep mode
  , _                       :: Bits 4   -- (Reserved)
  , rcc_ahb2smenr_dac4smen    :: Bit      -- DAC4 clock enable during sleep mode
  , rcc_ahb2smenr_dac3smen    :: Bit      -- DAC3 clock enable during sleep mode
  , rcc_ahb2smenr_dac2smen    :: Bit      -- HASH clock enable during Sleep and Stop modes
  , rcc_ahb2smenr_dac1smen    :: Bit      -- AES accelerator clocks enable during Sleep and Stop modes
  , _                       :: Bit      -- (Reserved)
  , rcc_ahb2smenr_adc345smen  :: Bit      -- DCMI clock enable during Sleep and Stop modes
  , rcc_ahb2smenr_ad12csmen   :: Bit      -- ADC clocks enable during Sleep and Stop modes
  , _                       :: Bits 2   -- (Reserved)
  , rcc_ahb2smenr_sram3smen   :: Bit      -- SRAM2 interface clocks enable during Sleep and Stop modes
  , rcc_ahb2smenr_sram2smen   :: Bit      -- SRAM2 interface clocks enable during Sleep and Stop modes
  , _                       :: Bits 2   -- (Reserved)
  , rcc_ahb2smenr_gpiogsmen   :: Bit      -- IO port G clocks enable during Sleep and Stop modes
  , rcc_ahb2smenr_gpiofsmen   :: Bit      -- IO port F clocks enable during Sleep and Stop modes
  , rcc_ahb2smenr_gpioesmen   :: Bit      -- IO port E clocks enable during Sleep and Stop modes
  , rcc_ahb2smenr_gpiodsmen   :: Bit      -- IO port D clocks enable during Sleep and Stop modes
  , rcc_ahb2smenr_gpiocsmen   :: Bit      -- IO port C clocks enable during Sleep and Stop modes
  , rcc_ahb2smenr_gpiobsmen   :: Bit      -- IO port B clocks enable during Sleep and Stop modes
  , rcc_ahb2smenr_gpioasmen   :: Bit      -- IO port A clocks enable during Sleep and Stop modes
  }
|]
rcc_reg_ahb2smenr :: BitDataReg RCC_AHB2SMENR
rcc_reg_ahb2smenr = mkBitDataRegNamed (rcc_periph_base + 0x6c) "ahb2smenr"

-- AHB3 peripheral clocks enable in Sleep and Stop modes register
--  | offset : 0x70
--  | address: 0x40021070
[ivory|
 bitdata RCC_AHB3SMENR :: Bits 32 = rcc_ahb3smenr
  { _                         :: Bits 23  -- (Reserved)
  , rcc_ahb3smenr_quadspi1smen  :: Bit      -- QUAD SPI 1 module clock enable during sleep mode
  , _                         :: Bits 7   -- (Reserved)
  , rcc_ahb3smenr_fmcsmen       :: Bit      -- Flexible memory controller clocks enable during Sleep and Stop modes
  }
|]
rcc_reg_ahb3smenr :: BitDataReg RCC_AHB3SMENR
rcc_reg_ahb3smenr = mkBitDataRegNamed (rcc_periph_base + 0x70) "ahb3smenr"

-- APB1SMENR1
--  | offset : 0x78
--  | address: 0x40021078
[ivory|
 bitdata RCC_APB1SMENR1 :: Bits 32 = rcc_apb1smenr1
  { rcc_apb1smenr1_lptim1smen  :: Bit      -- Low Power Timer1 clock enable during sleep mode
  , rcc_apb1smenr1_i2c3smen_3  :: Bit      -- I2C 3 interface clock enable during sleep mode
  , _                        :: Bit      -- (Reserved)
  , rcc_apb1smenr1_pwrsmen     :: Bit      -- Power interface clocks enable during Sleep and Stop modes
  , _                        :: Bits 2   -- (Reserved)
  , rcc_apb1smenr1_fdcansmen   :: Bit      -- FDCAN clock enable during sleep mode
  , _                        :: Bit      -- (Reserved)
  , rcc_apb1smenr1_i2c3smen    :: Bit      -- I2C3 clocks enable during Sleep and Stop modes
  , rcc_apb1smenr1_i2c2smen    :: Bit      -- I2C2 clocks enable during Sleep and Stop modes
  , rcc_apb1smenr1_i2c1smen    :: Bit      -- I2C1 clocks enable during Sleep and Stop modes
  , rcc_apb1smenr1_uart5smen   :: Bit      -- UART5 clocks enable during Sleep and Stop modes
  , rcc_apb1smenr1_uart4smen   :: Bit      -- UART4 clocks enable during Sleep and Stop modes
  , rcc_apb1smenr1_usart3smen  :: Bit      -- USART3 clocks enable during Sleep and Stop modes
  , rcc_apb1smenr1_usart2smen  :: Bit      -- USART2 clocks enable during Sleep and Stop modes
  , _                        :: Bit      -- (Reserved)
  , rcc_apb1smenr1_sp3smen     :: Bit      -- SPI3 clocks enable during Sleep and Stop modes
  , rcc_apb1smenr1_spi2smen    :: Bit      -- SPI2 clocks enable during Sleep and Stop modes
  , _                        :: Bits 2   -- (Reserved)
  , rcc_apb1smenr1_wwdgsmen    :: Bit      -- Window watchdog clocks enable during Sleep and Stop modes
  , rcc_apb1smenr1_rtcapbsmen  :: Bit      -- RTC APB clock enable during Sleep and Stop modes
  , _                        :: Bit      -- (Reserved)
  , rcc_apb1smenr1_crssmen     :: Bit      -- CRS clock enable during sleep mode
  , _                        :: Bits 2   -- (Reserved)
  , rcc_apb1smenr1_tim7smen    :: Bit      -- TIM7 timer clocks enable during Sleep and Stop modes
  , rcc_apb1smenr1_tim6smen    :: Bit      -- TIM6 timer clocks enable during Sleep and Stop modes
  , rcc_apb1smenr1_tim5smen    :: Bit      -- TIM5 timer clocks enable during Sleep and Stop modes
  , rcc_apb1smenr1_tim4smen    :: Bit      -- TIM4 timer clocks enable during Sleep and Stop modes
  , rcc_apb1smenr1_tim3smen    :: Bit      -- TIM3 timer clocks enable during Sleep and Stop modes
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
  { _                         :: Bits 23  -- (Reserved)
  , rcc_apb1smenr2_usbpdsmen    :: Bit      -- USB PD clock enable during sleep mode
  , _                         :: Bits 6   -- (Reserved)
  , rcc_apb1smenr2_i2c4smen     :: Bit      -- I2C4 clocks enable during Sleep and Stop modes
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
  { _                        :: Bits 5   -- (Reserved)
  , rcc_apb2smenr_hrtimersmen  :: Bit      -- HRTIMER clock enable during sleep mode
  , _                        :: Bits 4   -- (Reserved)
  , rcc_apb2smenr_sai1smen     :: Bit      -- SAI1 clock enable during sleep mode
  , rcc_apb2smenr_tim20smen    :: Bit      -- Timer 20clock enable during sleep mode
  , _                        :: Bit      -- (Reserved)
  , rcc_apb2smenr_tim17smen    :: Bit      -- TIM17 timer clocks enable during Sleep and Stop modes
  , rcc_apb2smenr_tim16smen    :: Bit      -- TIM16 timer clocks enable during Sleep and Stop modes
  , rcc_apb2smenr_tim15smen    :: Bit      -- TIM15 timer clocks enable during Sleep and Stop modes
  , rcc_apb2smenr_spi4smen     :: Bit      -- SPI4 timer clocks enable during Sleep and Stop modes
  , rcc_apb2smenr_usart1smen   :: Bit      -- USART1clocks enable during Sleep and Stop modes
  , rcc_apb2smenr_tim8smen     :: Bit      -- TIM8 timer clocks enable during Sleep and Stop modes
  , rcc_apb2smenr_spi1smen     :: Bit      -- SPI1 clocks enable during Sleep and Stop modes
  , rcc_apb2smenr_tim1smen     :: Bit      -- TIM1 timer clocks enable during Sleep and Stop modes
  , _                        :: Bits 10  -- (Reserved)
  , rcc_apb2smenr_syscfgsmen   :: Bit      -- SYSCFG clocks enable during Sleep and Stop modes
  }
|]
rcc_reg_apb2smenr :: BitDataReg RCC_APB2SMENR
rcc_reg_apb2smenr = mkBitDataRegNamed (rcc_periph_base + 0x80) "apb2smenr"

-- CCIPR
--  | offset : 0x88
--  | address: 0x40021088
[ivory|
 bitdata RCC_CCIPR1 :: Bits 32 = rcc_ccipr1
  { rcc_ccipr1_adc345sel   :: Bits 2   -- ADC3/4/5 clock source selection
  , rcc_ccipr1_adcsel      :: Bits 2   -- ADCs clock source selection
  , rcc_ccipr1_clk48sel    :: Bits 2   -- 48 MHz clock source selection
  , rcc_ccipr1_fdcansel    :: Bits 2   -- SAI2 clock source selection
  , rcc_ccipr1_spisel_     :: Bits 2   -- SAI1 clock source selection
  , rcc_ccipr1_saisel      :: Bits 2   -- Low power timer 2 clock source selection
  , rcc_ccipr1_lptim1sel   :: Bits 2   -- Low power timer 1 clock source selection
  , rcc_ccipr1_i2c3sel     :: Bits 2   -- I2C3 clock source selection
  , rcc_ccipr1_i2c2sel     :: Bits 2   -- I2C2 clock source selection
  , rcc_ccipr1_i2c1sel     :: Bits 2   -- I2C1 clock source selection
  , rcc_ccipr1_lpuart1sel  :: Bits 2   -- LPUART1 clock source selection
  , rcc_ccipr1_uart5sel    :: Bits 2   -- UART5 clock source selection
  , rcc_ccipr1_uart4sel    :: Bits 2   -- UART4 clock source selection
  , rcc_ccipr1_usart3sel   :: Bits 2   -- USART3 clock source selection
  , rcc_ccipr1_usart2sel   :: Bits 2   -- USART2 clock source selection
  , rcc_ccipr1_usart1sel   :: Bits 2   -- USART1 clock source selection
  }
|]
rcc_reg_ccipr1 :: BitDataReg RCC_CCIPR1
rcc_reg_ccipr1 = mkBitDataRegNamed (rcc_periph_base + 0x88) "ccipr1"

-- BDCR
--  | offset : 0x90
--  | address: 0x40021090
[ivory|
 bitdata RCC_BDCR :: Bits 32 = rcc_bdcr
  { _                :: Bits 6   -- (Reserved)
  , rcc_bdcr_lscosel   :: Bit      -- Low speed clock output selection
  , rcc_bdcr_lsccoen   :: Bit      -- Low speed clock output enable
  , _                :: Bits 7   -- (Reserved)
  , rcc_bdcr_vswrst    :: Bit      -- Vswitch domain software reset
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
  { rcc_csr_lpwrstf   :: Bit      -- Low-power reset flag
  , rcc_csr_wwdgrstf  :: Bit      -- Window watchdog reset flag
  , rcc_csr_wdgrstf   :: Bit      -- Independent window watchdog reset flag
  , rcc_csr_sftrstf   :: Bit      -- Software reset flag
  , rcc_csr_borrstf   :: Bit      -- BOR flag
  , rcc_csr_padrstf   :: Bit      -- Pad reset flag
  , rcc_csr_oblrstf   :: Bit      -- Option byte loader reset flag
  , _               :: Bit      -- (Reserved)
  , rcc_csr_rmvf      :: Bit      -- Remove reset flag
  , _               :: Bits 21  -- (Reserved)
  , rcc_csr_lsirdy    :: Bit      -- LSI oscillator ready
  , rcc_csr_lsion     :: Bit      -- LSI oscillator enable
  }
|]
rcc_reg_csr :: BitDataReg RCC_CSR
rcc_reg_csr = mkBitDataRegNamed (rcc_periph_base + 0x94) "csr"

-- Clock recovery RC register
--  | offset : 0x98
--  | address: 0x40021098
[ivory|
 bitdata RCC_CRRCR :: Bits 32 = rcc_crrcr
  { _                :: Bits 16  -- (Reserved)
  , rcc_crrcr_rc48cal  :: Bits 9   -- HSI48 clock calibration
  , _                :: Bits 5   -- (Reserved)
  , rcc_crrcr_rc48rdy  :: Bit      -- HSI48 clock ready flag
  , rcc_crrcr_rc48on   :: Bit      -- HSI48 clock enable
  }
|]
rcc_reg_crrcr :: BitDataReg RCC_CRRCR
rcc_reg_crrcr = mkBitDataRegNamed (rcc_periph_base + 0x98) "crrcr"

-- Peripherals independent clock configuration register
--  | offset : 0x9c
--  | address: 0x4002109c
[ivory|
 bitdata RCC_CCIPR2 :: Bits 32 = rcc_ccipr2
  { _                    :: Bits 10  -- (Reserved)
  , rcc_ccipr2_quadspisel  :: Bits 2   -- Octospi clock source selection
  , _                    :: Bits 18  -- (Reserved)
  , rcc_ccipr2_i2c4sel     :: Bits 2   -- I2C4 clock source selection
  }
|]
rcc_reg_ccipr2 :: BitDataReg RCC_CCIPR2
rcc_reg_ccipr2 = mkBitDataRegNamed (rcc_periph_base + 0x9c) "ccipr2"

