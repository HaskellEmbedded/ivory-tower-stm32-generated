module Ivory.BSP.STM32F410.SPI (
    spi1
  ) where


import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32F410.AF
import Ivory.BSP.STM32F410.RCC
import Ivory.BSP.STM32F410.MemoryMap
import qualified Ivory.BSP.STM32F410.Interrupt as F410

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.SPI

spi1 :: SPI
spi1 = mkSPI spi1_periph_base
          rccenable rccdisable
          F410.SPI1
          PClk1
          (\pin -> findAFByPin pin "spi1" afDB)
          2
          "spi1"
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_spi1en
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_spi1en

