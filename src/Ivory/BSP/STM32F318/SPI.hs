module Ivory.BSP.STM32F318.SPI (
    spi2
  , spi3
  ) where


import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32F318.AF
import Ivory.BSP.STM32F318.RCC
import Ivory.BSP.STM32F318.MemoryMap
import qualified Ivory.BSP.STM32F318.Interrupt as F318

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.SPI

spi2 :: SPI
spi2 = mkSPI spi2_periph_base
          rccenable rccdisable
          F318.SPI2
          PClk1
          (\pin -> findAFByPin pin "spi2" afDB)
          3
          "spi2"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_spi2en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_spi2en

spi3 :: SPI
spi3 = mkSPI spi3_periph_base
          rccenable rccdisable
          F318.SPI3
          PClk1
          (\pin -> findAFByPin pin "spi3" afDB)
          3
          "spi3"
  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_spi3en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_spi3en

