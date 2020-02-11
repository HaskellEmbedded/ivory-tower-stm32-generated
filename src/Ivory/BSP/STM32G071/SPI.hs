module Ivory.BSP.STM32G071.SPI (
    spi1
  , spi2
  ) where


import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32G071.AF
import Ivory.BSP.STM32G071.RCC
import Ivory.BSP.STM32G071.MemoryMap
import qualified Ivory.BSP.STM32G071.Interrupt as G071

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.SPI

spi1 :: SPI
spi1 = mkSPI spi1_periph_base
          rccenable rccdisable
          G071.SPI1
          PClk1
          (\pin -> findAFByPin pin "spi1" afDB)
          3
          "spi1"
  where
  rccenable  = modifyReg rcc_reg_apbenr2 $ setBit   rcc_apbenr2_spi1en
  rccdisable = modifyReg rcc_reg_apbenr2 $ clearBit rcc_apbenr2_spi1en

spi2 :: SPI
spi2 = mkSPI spi2_periph_base
          rccenable rccdisable
          G071.SPI2
          PClk1
          (\pin -> findAFByPin pin "spi2" afDB)
          3
          "spi2"
  where
  rccenable  = modifyReg rcc_reg_apbenr1 $ setBit   rcc_apbenr1_spi2en
  rccdisable = modifyReg rcc_reg_apbenr1 $ clearBit rcc_apbenr1_spi2en

