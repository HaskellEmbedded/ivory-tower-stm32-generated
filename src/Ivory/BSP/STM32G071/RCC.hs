{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}

module Ivory.BSP.STM32G071.RCC where

import Ivory.Language
import Ivory.HW
import Ivory.BSP.STM32G071.MemoryMap (rcc_periph_base)
import Ivory.BSP.STM32.Peripheral.RCC.RegTypes

-- RCC Reset and clock control

-- Base address: 0x40021000

-- Clock control register
--  | offset : 0x0
--  | address: 0x40021000
[ivory|
 bitdata RCC_CR :: Bits 32 = rcc_cr
  { _              :: Bits 6   -- (Reserved)
  , rcc_cr_pllrdy    :: Bit      -- PLL clock ready flag
  , rcc_cr_pllon     :: Bit      -- PLL enable
  , _              :: Bits 4   -- (Reserved)
  , rcc_cr_csson     :: Bit      -- Clock security system enable
  , rcc_cr_hsebyp    :: Bit      -- HSE crystal oscillator bypass
  , rcc_cr_hserdy    :: Bit      -- HSE clock ready flag
  , rcc_cr_hseon     :: Bit      -- HSE clock enable
  , _              :: Bits 2   -- (Reserved)
  , rcc_cr_hsidiv    :: Bits 3   -- HSI16 clock division factor
  , rcc_cr_hsirdy    :: Bit      -- HSI16 clock ready flag
  , rcc_cr_hsikeron  :: Bit      -- HSI16 always enable for peripheral kernels
  , rcc_cr_hsion     :: Bit      -- HSI16 clock enable
  , _              :: Bits 8   -- (Reserved)
  }
|]
rcc_reg_cr :: BitDataReg RCC_CR
rcc_reg_cr = mkBitDataRegNamed (rcc_periph_base + 0x0) "cr"

-- Internal clock sources calibration register
--  | offset : 0x4
--  | address: 0x40021004
[ivory|
 bitdata RCC_ICSCR :: Bits 32 = rcc_icscr
  { _                :: Bits 17  -- (Reserved)
  , rcc_icscr_hsitrim  :: Bits 7   -- HSI16 clock trimming
  , rcc_icscr_hsical   :: Bits 8   -- HSI16 clock calibration
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
  , _              :: Bit      -- (Reserved)
  , rcc_cfgr_mcosel  :: Bits 3   -- Microcontroller clock output
  , _              :: Bits 9   -- (Reserved)
  , rcc_cfgr_ppre    :: RCC_PPREx  -- APB prescaler
  , rcc_cfgr_hpre    :: RCC_HPRE  -- AHB prescaler
  , _              :: Bits 2   -- (Reserved)
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
  { rcc_pllsyscfgr_pllr    :: Bits 3   -- PLL VCO division factor R for PLLRCLK clock output
  , rcc_pllsyscfgr_pllren  :: Bit      -- PLLRCLK clock output enable
  , rcc_pllsyscfgr_pllq    :: Bits 3   -- PLL VCO division factor Q for PLLQCLK clock output
  , rcc_pllsyscfgr_pllqen  :: Bit      -- PLLQCLK clock output enable
  , _                    :: Bits 2   -- (Reserved)
  , rcc_pllsyscfgr_pllp    :: Bits 5   -- PLL VCO division factor P for PLLPCLK clock output
  , rcc_pllsyscfgr_pllpen  :: Bit      -- PLLPCLK clock output enable
  , _                    :: Bit      -- (Reserved)
  , rcc_pllsyscfgr_plln    :: Bits 7   -- PLL frequency multiplication factor N
  , _                    :: Bit      -- (Reserved)
  , rcc_pllsyscfgr_pllm    :: Bits 3   -- Division factor M of the PLL input clock divider
  , _                    :: Bits 2   -- (Reserved)
  , rcc_pllsyscfgr_pllsrc  :: Bits 2   -- PLL input clock source
  }
|]
rcc_reg_pllsyscfgr :: BitDataReg RCC_PLLSYSCFGR
rcc_reg_pllsyscfgr = mkBitDataRegNamed (rcc_periph_base + 0xc) "pllsyscfgr"

-- Clock interrupt enable register
--  | offset : 0x18
--  | address: 0x40021018
[ivory|
 bitdata RCC_CIR :: Bits 32 = rcc_cir
  { _                  :: Bits 26  -- (Reserved)
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
  { _                  :: Bits 22  -- (Reserved)
  , rcc_cifr_lsecssf     :: Bit      -- LSE Clock security system interrupt flag
  , rcc_cifr_cssf        :: Bit      -- Clock security system interrupt flag
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
  { _                  :: Bits 22  -- (Reserved)
  , rcc_cicr_lsecssc     :: Bit      -- LSE Clock security system interrupt clear
  , rcc_cicr_cssc        :: Bit      -- Clock security system interrupt clear
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

-- AHB peripheral reset register
--  | offset : 0x28
--  | address: 0x40021028
[ivory|
 bitdata RCC_AHBRSTR :: Bits 32 = rcc_ahbrstr
  { _                   :: Bits 13  -- (Reserved)
  , rcc_ahbrstr_rngrst    :: Bit      -- Random number generator reset
  , _                   :: Bit      -- (Reserved)
  , rcc_ahbrstr_aesrst    :: Bit      -- AES hardware accelerator reset
  , _                   :: Bits 3   -- (Reserved)
  , rcc_ahbrstr_crcrst    :: Bit      -- CRC reset
  , _                   :: Bits 3   -- (Reserved)
  , rcc_ahbrstr_flashrst  :: Bit      -- FLITF reset
  , _                   :: Bits 7   -- (Reserved)
  , rcc_ahbrstr_dmarst    :: Bit      -- DMA1 reset
  }
|]
rcc_reg_ahbrstr :: BitDataReg RCC_AHBRSTR
rcc_reg_ahbrstr = mkBitDataRegNamed (rcc_periph_base + 0x28) "ahbrstr"

-- GPIO reset register
--  | offset : 0x24
--  | address: 0x40021024
[ivory|
 bitdata RCC_IOPRSTR :: Bits 32 = rcc_ioprstr
  { _                   :: Bits 26  -- (Reserved)
  , rcc_ioprstr_gpiofrst  :: Bit      -- I/O port F reset
  , _                   :: Bit      -- (Reserved)
  , rcc_ioprstr_gpiodrst  :: Bit      -- I/O port D reset
  , rcc_ioprstr_gpiocrst  :: Bit      -- I/O port C reset
  , rcc_ioprstr_gpiobrst  :: Bit      -- I/O port B reset
  , rcc_ioprstr_gpioarst  :: Bit      -- I/O port A reset
  }
|]
rcc_reg_ioprstr :: BitDataReg RCC_IOPRSTR
rcc_reg_ioprstr = mkBitDataRegNamed (rcc_periph_base + 0x24) "ioprstr"

-- APB peripheral reset register 1
--  | offset : 0x2c
--  | address: 0x4002102c
[ivory|
 bitdata RCC_APBRSTR1 :: Bits 32 = rcc_apbrstr1
  { rcc_apbrstr1_lptim1rst   :: Bit      -- Low Power Timer 1 reset
  , rcc_apbrstr1_lptim2rst   :: Bit      -- Low Power Timer 2 reset
  , rcc_apbrstr1_dac1rst     :: Bit      -- DAC1 interface reset
  , rcc_apbrstr1_pwrrst      :: Bit      -- Power interface reset
  , rcc_apbrstr1_dbgrst      :: Bit      -- Debug support reset
  , rcc_apbrstr1_ucpd2rst    :: Bit      -- UCPD2 reset
  , rcc_apbrstr1_ucpd1rst    :: Bit      -- UCPD1 reset
  , rcc_apbrstr1_cecrst      :: Bit      -- HDMI CEC reset
  , _                      :: Bit      -- (Reserved)
  , rcc_apbrstr1_i2c2rst     :: Bit      -- I2C2 reset
  , rcc_apbrstr1_i2c1rst     :: Bit      -- I2C1 reset
  , rcc_apbrstr1_lpuart1rst  :: Bit      -- LPUART1 reset
  , rcc_apbrstr1_usart4rst   :: Bit      -- USART4 reset
  , rcc_apbrstr1_usart3rst   :: Bit      -- USART3 reset
  , rcc_apbrstr1_usart2rst   :: Bit      -- USART2 reset
  , _                      :: Bits 2   -- (Reserved)
  , rcc_apbrstr1_spi2rst     :: Bit      -- SPI2 reset
  , _                      :: Bits 8   -- (Reserved)
  , rcc_apbrstr1_tim7rst     :: Bit      -- TIM7 timer reset
  , rcc_apbrstr1_tim6rst     :: Bit      -- TIM6 timer reset
  , _                      :: Bits 2   -- (Reserved)
  , rcc_apbrstr1_tim3rst     :: Bit      -- TIM3 timer reset
  , rcc_apbrstr1_tim2rst     :: Bit      -- TIM2 timer reset
  }
|]
rcc_reg_apbrstr1 :: BitDataReg RCC_APBRSTR1
rcc_reg_apbrstr1 = mkBitDataRegNamed (rcc_periph_base + 0x2c) "apbrstr1"

-- APB peripheral reset register 2
--  | offset : 0x30
--  | address: 0x40021030
[ivory|
 bitdata RCC_APBRSTR2 :: Bits 32 = rcc_apbrstr2
  { _                     :: Bits 11  -- (Reserved)
  , rcc_apbrstr2_adcrst     :: Bit      -- ADC reset
  , _                     :: Bit      -- (Reserved)
  , rcc_apbrstr2_tim17rst   :: Bit      -- TIM17 timer reset
  , rcc_apbrstr2_tim16rst   :: Bit      -- TIM16 timer reset
  , rcc_apbrstr2_tim15rst   :: Bit      -- TIM15 timer reset
  , rcc_apbrstr2_tim14rst   :: Bit      -- TIM14 timer reset
  , rcc_apbrstr2_usart1rst  :: Bit      -- USART1 reset
  , _                     :: Bit      -- (Reserved)
  , rcc_apbrstr2_spi1rst    :: Bit      -- SPI1 reset
  , rcc_apbrstr2_tim1rst    :: Bit      -- TIM1 timer reset
  , _                     :: Bits 10  -- (Reserved)
  , rcc_apbrstr2_syscfgrst  :: Bit      -- SYSCFG, COMP and VREFBUF reset
  }
|]
rcc_reg_apbrstr2 :: BitDataReg RCC_APBRSTR2
rcc_reg_apbrstr2 = mkBitDataRegNamed (rcc_periph_base + 0x30) "apbrstr2"

-- GPIO clock enable register
--  | offset : 0x34
--  | address: 0x40021034
[ivory|
 bitdata RCC_IOPENR :: Bits 32 = rcc_iopenr
  { _                 :: Bits 26  -- (Reserved)
  , rcc_iopenr_gpiofen  :: Bit      -- I/O port F clock enable
  , _                 :: Bit      -- (Reserved)
  , rcc_iopenr_gpioden  :: Bit      -- I/O port D clock enable
  , rcc_iopenr_gpiocen  :: Bit      -- I/O port C clock enable
  , rcc_iopenr_gpioben  :: Bit      -- I/O port B clock enable
  , rcc_iopenr_gpioaen  :: Bit      -- I/O port A clock enable
  }
|]
rcc_reg_iopenr :: BitDataReg RCC_IOPENR
rcc_reg_iopenr = mkBitDataRegNamed (rcc_periph_base + 0x34) "iopenr"

-- AHB peripheral clock enable register
--  | offset : 0x38
--  | address: 0x40021038
[ivory|
 bitdata RCC_AHBENR :: Bits 32 = rcc_ahbenr
  { _                 :: Bits 13  -- (Reserved)
  , rcc_ahbenr_rngen    :: Bit      -- Random number generator clock enable
  , _                 :: Bit      -- (Reserved)
  , rcc_ahbenr_aesen    :: Bit      -- AES hardware accelerator
  , _                 :: Bits 3   -- (Reserved)
  , rcc_ahbenr_crcen    :: Bit      -- CRC clock enable
  , _                 :: Bits 3   -- (Reserved)
  , rcc_ahbenr_flashen  :: Bit      -- Flash memory interface clock enable
  , _                 :: Bits 7   -- (Reserved)
  , rcc_ahbenr_dmaen    :: Bit      -- DMA clock enable
  }
|]
rcc_reg_ahbenr :: BitDataReg RCC_AHBENR
rcc_reg_ahbenr = mkBitDataRegNamed (rcc_periph_base + 0x38) "ahbenr"

-- APB peripheral clock enable register 1
--  | offset : 0x3c
--  | address: 0x4002103c
[ivory|
 bitdata RCC_APBENR1 :: Bits 32 = rcc_apbenr1
  { rcc_apbenr1_lptim1en   :: Bit      -- LPTIM1 clock enable
  , rcc_apbenr1_lptim2en   :: Bit      -- LPTIM2 clock enable
  , rcc_apbenr1_dac1en     :: Bit      -- DAC1 interface clock enable
  , rcc_apbenr1_pwren      :: Bit      -- Power interface clock enable
  , rcc_apbenr1_dbgen      :: Bit      -- Debug support clock enable
  , rcc_apbenr1_ucpd2en    :: Bit      -- UCPD2 clock enable
  , rcc_apbenr1_ucpd1en    :: Bit      -- UCPD1 clock enable
  , rcc_apbenr1_cecen      :: Bit      -- HDMI CEC clock enable
  , _                    :: Bit      -- (Reserved)
  , rcc_apbenr1_i2c2en     :: Bit      -- I2C2 clock enable
  , rcc_apbenr1_i2c1en     :: Bit      -- I2C1 clock enable
  , rcc_apbenr1_lpuart1en  :: Bit      -- LPUART1 clock enable
  , rcc_apbenr1_usart4en   :: Bit      -- USART4 clock enable
  , rcc_apbenr1_usart3en   :: Bit      -- USART3 clock enable
  , rcc_apbenr1_usart2en   :: Bit      -- USART2 clock enable
  , _                    :: Bits 2   -- (Reserved)
  , rcc_apbenr1_spi2en     :: Bit      -- SPI2 clock enable
  , _                    :: Bits 2   -- (Reserved)
  , rcc_apbenr1_wwdgen     :: Bit      -- WWDG clock enable
  , rcc_apbenr1_rtcapben   :: Bit      -- RTC APB clock enable
  , _                    :: Bits 4   -- (Reserved)
  , rcc_apbenr1_tim7en     :: Bit      -- TIM7 timer clock enable
  , rcc_apbenr1_tim6en     :: Bit      -- TIM6 timer clock enable
  , _                    :: Bits 2   -- (Reserved)
  , rcc_apbenr1_tim3en     :: Bit      -- TIM3 timer clock enable
  , rcc_apbenr1_tim2en     :: Bit      -- TIM2 timer clock enable
  }
|]
rcc_reg_apbenr1 :: BitDataReg RCC_APBENR1
rcc_reg_apbenr1 = mkBitDataRegNamed (rcc_periph_base + 0x3c) "apbenr1"

-- APB peripheral clock enable register 2
--  | offset : 0x40
--  | address: 0x40021040
[ivory|
 bitdata RCC_APBENR2 :: Bits 32 = rcc_apbenr2
  { _                   :: Bits 11  -- (Reserved)
  , rcc_apbenr2_adcen     :: Bit      -- ADC clock enable
  , _                   :: Bit      -- (Reserved)
  , rcc_apbenr2_tim17en   :: Bit      -- TIM16 timer clock enable
  , rcc_apbenr2_tim16en   :: Bit      -- TIM16 timer clock enable
  , rcc_apbenr2_tim15en   :: Bit      -- TIM15 timer clock enable
  , rcc_apbenr2_tim14en   :: Bit      -- TIM14 timer clock enable
  , rcc_apbenr2_usart1en  :: Bit      -- USART1 clock enable
  , _                   :: Bit      -- (Reserved)
  , rcc_apbenr2_spi1en    :: Bit      -- SPI1 clock enable
  , rcc_apbenr2_tim1en    :: Bit      -- TIM1 timer clock enable
  , _                   :: Bits 10  -- (Reserved)
  , rcc_apbenr2_syscfgen  :: Bit      -- SYSCFG, COMP and VREFBUF clock enable
  }
|]
rcc_reg_apbenr2 :: BitDataReg RCC_APBENR2
rcc_reg_apbenr2 = mkBitDataRegNamed (rcc_periph_base + 0x40) "apbenr2"

-- GPIO in Sleep mode clock enable register
--  | offset : 0x44
--  | address: 0x40021044
[ivory|
 bitdata RCC_IOPSMENR :: Bits 32 = rcc_iopsmenr
  { _                     :: Bits 26  -- (Reserved)
  , rcc_iopsmenr_gpiofsmen  :: Bit      -- I/O port F clock enable during Sleep mode
  , _                     :: Bit      -- (Reserved)
  , rcc_iopsmenr_gpiodsmen  :: Bit      -- I/O port D clock enable during Sleep mode
  , rcc_iopsmenr_gpiocsmen  :: Bit      -- I/O port C clock enable during Sleep mode
  , rcc_iopsmenr_gpiobsmen  :: Bit      -- I/O port B clock enable during Sleep mode
  , rcc_iopsmenr_gpioasmen  :: Bit      -- I/O port A clock enable during Sleep mode
  }
|]
rcc_reg_iopsmenr :: BitDataReg RCC_IOPSMENR
rcc_reg_iopsmenr = mkBitDataRegNamed (rcc_periph_base + 0x44) "iopsmenr"

-- AHB peripheral clock enable in Sleep mode register
--  | offset : 0x48
--  | address: 0x40021048
[ivory|
 bitdata RCC_AHBSMENR :: Bits 32 = rcc_ahbsmenr
  { _                     :: Bits 13  -- (Reserved)
  , rcc_ahbsmenr_rngsmen    :: Bit      -- Random number generator clock enable during Sleep mode
  , _                     :: Bit      -- (Reserved)
  , rcc_ahbsmenr_aessmen    :: Bit      -- AES hardware accelerator clock enable during Sleep mode
  , _                     :: Bits 3   -- (Reserved)
  , rcc_ahbsmenr_crcsmen    :: Bit      -- CRC clock enable during Sleep mode
  , _                     :: Bits 2   -- (Reserved)
  , rcc_ahbsmenr_sramsmen   :: Bit      -- SRAM clock enable during Sleep mode
  , rcc_ahbsmenr_flashsmen  :: Bit      -- Flash memory interface clock enable during Sleep mode
  , _                     :: Bits 7   -- (Reserved)
  , rcc_ahbsmenr_dmasmen    :: Bit      -- DMA clock enable during Sleep mode
  }
|]
rcc_reg_ahbsmenr :: BitDataReg RCC_AHBSMENR
rcc_reg_ahbsmenr = mkBitDataRegNamed (rcc_periph_base + 0x48) "ahbsmenr"

-- APB peripheral clock enable in Sleep mode register 1
--  | offset : 0x4c
--  | address: 0x4002104c
[ivory|
 bitdata RCC_APBSMENR1 :: Bits 32 = rcc_apbsmenr1
  { rcc_apbsmenr1_lptim1smen   :: Bit      -- Low Power Timer 1 clock enable during Sleep mode
  , rcc_apbsmenr1_lptim2smen   :: Bit      -- Low Power Timer 2 clock enable during Sleep mode
  , rcc_apbsmenr1_dac1smen     :: Bit      -- DAC1 interface clock enable during Sleep mode
  , rcc_apbsmenr1_pwrsmen      :: Bit      -- Power interface clock enable during Sleep mode
  , rcc_apbsmenr1_dbgsmen      :: Bit      -- Debug support clock enable during Sleep mode
  , rcc_apbsmenr1_ucpd2smen    :: Bit      -- UCPD2 clock enable during Sleep mode
  , rcc_apbsmenr1_ucpd1smen    :: Bit      -- UCPD1 clock enable during Sleep mode
  , rcc_apbsmenr1_cecsmen      :: Bit      -- HDMI CEC clock enable during Sleep mode
  , _                        :: Bit      -- (Reserved)
  , rcc_apbsmenr1_i2c2smen     :: Bit      -- I2C2 clock enable during Sleep mode
  , rcc_apbsmenr1_i2c1smen     :: Bit      -- I2C1 clock enable during Sleep mode
  , rcc_apbsmenr1_lpuart1smen  :: Bit      -- LPUART1 clock enable during Sleep mode
  , rcc_apbsmenr1_usart4smen   :: Bit      -- USART4 clock enable during Sleep mode
  , rcc_apbsmenr1_usart3smen   :: Bit      -- USART3 clock enable during Sleep mode
  , rcc_apbsmenr1_usart2smen   :: Bit      -- USART2 clock enable during Sleep mode
  , _                        :: Bits 2   -- (Reserved)
  , rcc_apbsmenr1_spi2smen     :: Bit      -- SPI2 clock enable during Sleep mode
  , _                        :: Bits 2   -- (Reserved)
  , rcc_apbsmenr1_wwdgsmen     :: Bit      -- WWDG clock enable during Sleep mode
  , rcc_apbsmenr1_rtcapbsmen   :: Bit      -- RTC APB clock enable during Sleep mode
  , _                        :: Bits 4   -- (Reserved)
  , rcc_apbsmenr1_tim7smen     :: Bit      -- TIM7 timer clock enable during Sleep mode
  , rcc_apbsmenr1_tim6smen     :: Bit      -- TIM6 timer clock enable during Sleep mode
  , _                        :: Bits 2   -- (Reserved)
  , rcc_apbsmenr1_tim3smen     :: Bit      -- TIM3 timer clock enable during Sleep mode
  , rcc_apbsmenr1_tim2smen     :: Bit      -- TIM2 timer clock enable during Sleep mode
  }
|]
rcc_reg_apbsmenr1 :: BitDataReg RCC_APBSMENR1
rcc_reg_apbsmenr1 = mkBitDataRegNamed (rcc_periph_base + 0x4c) "apbsmenr1"

-- APB peripheral clock enable in Sleep mode register 2
--  | offset : 0x50
--  | address: 0x40021050
[ivory|
 bitdata RCC_APBSMENR2 :: Bits 32 = rcc_apbsmenr2
  { _                       :: Bits 11  -- (Reserved)
  , rcc_apbsmenr2_adcsmen     :: Bit      -- ADC clock enable during Sleep mode
  , _                       :: Bit      -- (Reserved)
  , rcc_apbsmenr2_tim17smen   :: Bit      -- TIM16 timer clock enable during Sleep mode
  , rcc_apbsmenr2_tim16smen   :: Bit      -- TIM16 timer clock enable during Sleep mode
  , rcc_apbsmenr2_tim15smen   :: Bit      -- TIM15 timer clock enable during Sleep mode
  , rcc_apbsmenr2_tim14smen   :: Bit      -- TIM14 timer clock enable during Sleep mode
  , rcc_apbsmenr2_usart1smen  :: Bit      -- USART1 clock enable during Sleep mode
  , _                       :: Bit      -- (Reserved)
  , rcc_apbsmenr2_spi1smen    :: Bit      -- SPI1 clock enable during Sleep mode
  , rcc_apbsmenr2_tim1smen    :: Bit      -- TIM1 timer clock enable during Sleep mode
  , _                       :: Bits 10  -- (Reserved)
  , rcc_apbsmenr2_syscfgsmen  :: Bit      -- SYSCFG, COMP and VREFBUF clock enable during Sleep mode
  }
|]
rcc_reg_apbsmenr2 :: BitDataReg RCC_APBSMENR2
rcc_reg_apbsmenr2 = mkBitDataRegNamed (rcc_periph_base + 0x50) "apbsmenr2"

-- Peripherals independent clock configuration register
--  | offset : 0x54
--  | address: 0x40021054
[ivory|
 bitdata RCC_CCIPR :: Bits 32 = rcc_ccipr
  { rcc_ccipr_adcsel      :: Bits 2   -- ADCs clock source selection
  , rcc_ccipr_rngdiv      :: Bits 2   -- Division factor of RNG clock divider
  , rcc_ccipr_rngsel      :: Bits 2   -- RNG clock source selection
  , _                   :: Bit      -- (Reserved)
  , rcc_ccipr_tim15sel    :: Bit      -- TIM15 clock source selection
  , _                   :: Bit      -- (Reserved)
  , rcc_ccipr_tim1sel     :: Bit      -- TIM1 clock source selection
  , rcc_ccipr_lptim2sel   :: Bits 2   -- LPTIM2 clock source selection
  , rcc_ccipr_lptim1sel   :: Bits 2   -- LPTIM1 clock source selection
  , _                   :: Bits 2   -- (Reserved)
  , rcc_ccipr_i2s2sel     :: Bits 2   -- I2S1 clock source selection
  , rcc_ccipr_i2c1sel     :: Bits 2   -- I2C1 clock source selection
  , rcc_ccipr_lpuart1sel  :: Bits 2   -- LPUART1 clock source selection
  , _                   :: Bits 3   -- (Reserved)
  , rcc_ccipr_cecsel      :: Bit      -- HDMI CEC clock source selection
  , _                   :: Bits 2   -- (Reserved)
  , rcc_ccipr_usart2sel   :: Bits 2   -- USART2 clock source selection
  , rcc_ccipr_usart1sel   :: Bits 2   -- USART1 clock source selection
  }
|]
rcc_reg_ccipr :: BitDataReg RCC_CCIPR
rcc_reg_ccipr = mkBitDataRegNamed (rcc_periph_base + 0x54) "ccipr"

-- RTC domain control register
--  | offset : 0x5c
--  | address: 0x4002105c
[ivory|
 bitdata RCC_BDCR :: Bits 32 = rcc_bdcr
  { _                :: Bits 6   -- (Reserved)
  , rcc_bdcr_lscosel   :: Bit      -- Low-speed clock output selection
  , rcc_bdcr_lscoen    :: Bit      -- Low-speed clock output (LSCO) enable
  , _                :: Bits 7   -- (Reserved)
  , rcc_bdcr_bdrst     :: Bit      -- RTC domain software reset
  , rcc_bdcr_rtcen     :: Bit      -- RTC clock enable
  , _                :: Bits 5   -- (Reserved)
  , rcc_bdcr_rtcsel    :: Bits 2   -- RTC clock source selection
  , _                :: Bit      -- (Reserved)
  , rcc_bdcr_lsecssd   :: Bit      -- CSS on LSE failure Detection
  , rcc_bdcr_lsecsson  :: Bit      -- CSS on LSE enable
  , rcc_bdcr_lsedrv    :: Bits 2   -- LSE oscillator drive capability
  , rcc_bdcr_lsebyp    :: Bit      -- LSE oscillator bypass
  , rcc_bdcr_lserdy    :: Bit      -- LSE oscillator ready
  , rcc_bdcr_lseon     :: Bit      -- LSE oscillator enable
  }
|]
rcc_reg_bdcr :: BitDataReg RCC_BDCR
rcc_reg_bdcr = mkBitDataRegNamed (rcc_periph_base + 0x5c) "bdcr"

-- Control/status register
--  | offset : 0x60
--  | address: 0x40021060
[ivory|
 bitdata RCC_CSR :: Bits 32 = rcc_csr
  { rcc_csr_lpwrrstf  :: Bit      -- Low-power reset flag
  , rcc_csr_wwdgrstf  :: Bit      -- Window watchdog reset flag
  , rcc_csr_iwdgrstf  :: Bit      -- Independent window watchdog reset flag
  , rcc_csr_sftrstf   :: Bit      -- Software reset flag
  , rcc_csr_pwrrstf   :: Bit      -- BOR or POR/PDR flag
  , rcc_csr_pinrstf   :: Bit      -- Pin reset flag
  , rcc_csr_oblrstf   :: Bit      -- Option byte loader reset flag
  , _               :: Bit      -- (Reserved)
  , rcc_csr_rmvf      :: Bit      -- Remove reset flags
  , _               :: Bits 21  -- (Reserved)
  , rcc_csr_lsirdy    :: Bit      -- LSI oscillator ready
  , rcc_csr_lsion     :: Bit      -- LSI oscillator enable
  }
|]
rcc_reg_csr :: BitDataReg RCC_CSR
rcc_reg_csr = mkBitDataRegNamed (rcc_periph_base + 0x60) "csr"

