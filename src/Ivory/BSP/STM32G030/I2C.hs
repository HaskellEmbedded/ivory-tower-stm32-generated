module Ivory.BSP.STM32G030.I2C (
    i2c1
  , i2c2
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32G030.RCC
import Ivory.BSP.STM32G030.MemoryMap
import qualified Ivory.BSP.STM32G030.Interrupt as G030

import Ivory.BSP.STM32.Peripheral.I2C

i2c1 :: I2C
i2c1 = mkI2CVersion V2 i2c1_periph_base
                rccenable rccdisable rccreset
                G030.I2C1 G030.I2C1
                "i2c1"
                -- XXX: add PClk1 when we add support for it

  where
  rccenable  = modifyReg rcc_reg_apbenr1 $ setBit   rcc_apbenr1_i2c1en
  rccdisable = modifyReg rcc_reg_apbenr1 $ clearBit rcc_apbenr1_i2c1en
  rccreset   = modifyReg rcc_reg_apbrstr1  $ clearBit rcc_apbrstr1_i2c1rst

i2c2 :: I2C
i2c2 = mkI2CVersion V2 i2c2_periph_base
                rccenable rccdisable rccreset
                G030.I2C2 G030.I2C2
                "i2c2"
                -- XXX: add PClk1 when we add support for it

  where
  rccenable  = modifyReg rcc_reg_apbenr1 $ setBit   rcc_apbenr1_i2c2en
  rccdisable = modifyReg rcc_reg_apbenr1 $ clearBit rcc_apbenr1_i2c2en
  rccreset   = modifyReg rcc_reg_apbrstr1  $ clearBit rcc_apbrstr1_i2c2rst

