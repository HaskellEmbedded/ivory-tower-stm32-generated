module Ivory.BSP.STM32L4S9.SPI (
    spi1
  , spi2
  ) where


import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32L4S9.AF
import Ivory.BSP.STM32L4S9.RCC
import Ivory.BSP.STM32L4S9.MemoryMap
import qualified Ivory.BSP.STM32L4S9.Interrupt as L4S9

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.SPI

spi1 :: SPI
spi1 = mkSPI spi1_periph_base
          rccenable rccdisable
          L4S9.SPI1
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
          L4S9.SPI2
          PClk1
          (\pin -> findAFByPin pin "spi2" afDB)
          3
          "spi2"
  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_spi2en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_spi2en

