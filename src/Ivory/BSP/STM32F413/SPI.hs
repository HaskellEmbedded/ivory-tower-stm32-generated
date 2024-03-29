module Ivory.BSP.STM32F413.SPI (
    spi1
  , spi2
  , spi4
  , spi5
  ) where


import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32F413.AF
import Ivory.BSP.STM32F413.RCC
import Ivory.BSP.STM32F413.MemoryMap
import qualified Ivory.BSP.STM32F413.Interrupt as F413

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.SPI

spi1 :: SPI
spi1 = mkSPI spi1_periph_base
          rccenable rccdisable
          F413.SPI1
          PClk2
          (\pin -> findAFByPin pin "spi1" afDB)
          2
          "spi1"
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_spi1en
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_spi1en

spi2 :: SPI
spi2 = mkSPI spi2_periph_base
          rccenable rccdisable
          F413.SPI2
          PClk1
          (\pin -> findAFByPin pin "spi2" afDB)
          2
          "spi2"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_spi2en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_spi2en

spi4 :: SPI
spi4 = mkSPI spi4_periph_base
          rccenable rccdisable
          F413.SPI4
          PClk2
          (\pin -> findAFByPin pin "spi4" afDB)
          2
          "spi4"
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_spi4en
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_spi4en

spi5 :: SPI
spi5 = mkSPI spi5_periph_base
          rccenable rccdisable
          F413.SPI5
          PClk2
          (\pin -> findAFByPin pin "spi5" afDB)
          2
          "spi5"
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_spi5en
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_spi5en

