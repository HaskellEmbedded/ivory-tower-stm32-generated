module Ivory.BSP.STM32F427.SPI (
    spi1
  , spi2
  , spi3
  , spi4
  , spi5
  , spi6
  ) where


import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32F427.AF
import Ivory.BSP.STM32F427.RCC
import Ivory.BSP.STM32F427.MemoryMap
import qualified Ivory.BSP.STM32F427.Interrupt as F427

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.SPI

spi1 :: SPI
spi1 = mkSPI spi1_periph_base
          rccenable rccdisable
          F427.SPI1
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
          F427.SPI2
          PClk1
          (\pin -> findAFByPin pin "spi2" afDB)
          2
          "spi2"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_spi2en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_spi2en

spi3 :: SPI
spi3 = mkSPI spi3_periph_base
          rccenable rccdisable
          F427.SPI3
          PClk1
          (\pin -> findAFByPin pin "spi3" afDB)
          2
          "spi3"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_spi3en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_spi3en

spi4 :: SPI
spi4 = mkSPI spi4_periph_base
          rccenable rccdisable
          F427.SPI4
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
          F427.SPI5
          PClk2
          (\pin -> findAFByPin pin "spi5" afDB)
          2
          "spi5"
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_spi5en
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_spi5en

spi6 :: SPI
spi6 = mkSPI spi6_periph_base
          rccenable rccdisable
          F427.SPI6
          PClk2
          (\pin -> findAFByPin pin "spi6" afDB)
          2
          "spi6"
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_spi6en
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_spi6en

