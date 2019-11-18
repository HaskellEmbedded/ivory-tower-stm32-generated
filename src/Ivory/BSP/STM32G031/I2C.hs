module Ivory.BSP.STM32G031.I2C (
    i2c1
  , i2c2
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32G031.AF
import Ivory.BSP.STM32G031.RCC
import Ivory.BSP.STM32G031.MemoryMap
import qualified Ivory.BSP.STM32G031.Interrupt as G031

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.I2C

i2c1 :: I2C
i2c1 = mkI2CVersion V2 i2c1_periph_base
                rccenable rccdisable rccreset
                G031.I2C1 G031.I2C1
                PClk1
                (\pin -> findAFByPin pin "i2c1" afDB)
                "i2c1"

  where
  rccenable  = modifyReg rcc_reg_apbenr1 $ setBit   rcc_apbenr1_i2c1en
  rccdisable = modifyReg rcc_reg_apbenr1 $ clearBit rcc_apbenr1_i2c1en
  rccreset   = modifyReg rcc_reg_apbrstr1  $ clearBit rcc_apbrstr1_i2c1rst

i2c2 :: I2C
i2c2 = mkI2CVersion V2 i2c2_periph_base
                rccenable rccdisable rccreset
                G031.I2C2 G031.I2C2
                PClk1
                (\pin -> findAFByPin pin "i2c2" afDB)
                "i2c2"

  where
  rccenable  = modifyReg rcc_reg_apbenr1 $ setBit   rcc_apbenr1_i2c2en
  rccdisable = modifyReg rcc_reg_apbenr1 $ clearBit rcc_apbenr1_i2c2en
  rccreset   = modifyReg rcc_reg_apbrstr1  $ clearBit rcc_apbrstr1_i2c2rst

