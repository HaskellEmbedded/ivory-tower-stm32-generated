module Ivory.BSP.STM32G484.SPI (
    spi1
  , spi2
  , spi3
  , spi4
  ) where


import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32G484.AF
import Ivory.BSP.STM32G484.RCC
import Ivory.BSP.STM32G484.MemoryMap
import qualified Ivory.BSP.STM32G484.Interrupt as G484

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.SPI

spi1 :: SPI
spi1 = mkSPI spi1_periph_base
          rccenable rccdisable
          G484.SPI1
          PClk2
          (\pin -> findAFByPin pin "spi1" afDB)
          3
          "spi1"
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_spi1en
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_spi1en

spi2 :: SPI
spi2 = mkSPI spi2_periph_base
          rccenable rccdisable
          G484.SPI2
          PClk1
          (\pin -> findAFByPin pin "spi2" afDB)
          3
          "spi2"
  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_spi2en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_spi2en

spi3 :: SPI
spi3 = mkSPI spi3_periph_base
          rccenable rccdisable
          G484.SPI3
          PClk1
          (\pin -> findAFByPin pin "spi3" afDB)
          3
          "spi3"
  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_spi3en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_spi3en

spi4 :: SPI
spi4 = mkSPI spi4_periph_base
          rccenable rccdisable
          G484.SPI4
          PClk2
          (\pin -> findAFByPin pin "spi4" afDB)
          3
          "spi4"
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_spi4en
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_spi4en

