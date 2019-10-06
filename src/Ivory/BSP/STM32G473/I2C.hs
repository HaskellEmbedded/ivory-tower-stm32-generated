module Ivory.BSP.STM32G473.I2C (
    i2c1
  , i2c2
  , i2c3
  , i2c4
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32G473.RCC
import Ivory.BSP.STM32G473.MemoryMap
import qualified Ivory.BSP.STM32G473.Interrupt as G473

import Ivory.BSP.STM32.Peripheral.I2C

i2c1 :: I2C
i2c1 = mkI2CVersion V2 i2c1_periph_base
                rccenable rccdisable rccreset
                G473.I2C1_EV G473.I2C1_ER
                "i2c1"
                -- XXX: add PClk1 when we add support for it

  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_i2c1en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_i2c1en
  rccreset   = modifyReg rcc_reg_apb1rstr1  $ clearBit rcc_apb1rstr1_i2c1rst

i2c2 :: I2C
i2c2 = mkI2CVersion V2 i2c2_periph_base
                rccenable rccdisable rccreset
                G473.I2C2_EV G473.I2C2_ER
                "i2c2"
                -- XXX: add PClk1 when we add support for it

  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_i2c2en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_i2c2en
  rccreset   = modifyReg rcc_reg_apb1rstr1  $ clearBit rcc_apb1rstr1_i2c2rst

i2c3 :: I2C
i2c3 = mkI2CVersion V2 i2c3_periph_base
                rccenable rccdisable rccreset
                G473.I2C3_EV G473.I2C3_ER
                "i2c3"
                -- XXX: add PClk1 when we add support for it

  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_i2c3en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_i2c3en
  rccreset   = modifyReg rcc_reg_apb1rstr1  $ clearBit rcc_apb1rstr1_i2c3rst

i2c4 :: I2C
i2c4 = mkI2CVersion V2 i2c4_periph_base
                rccenable rccdisable rccreset
                G473.I2C4_EV G473.I2C4_ER
                "i2c4"
                -- XXX: add PClk1 when we add support for it

  where
  rccenable  = modifyReg rcc_reg_apb1enr2 $ setBit   rcc_apb1enr2_i2c4en
  rccdisable = modifyReg rcc_reg_apb1enr2 $ clearBit rcc_apb1enr2_i2c4en
  rccreset   = modifyReg rcc_reg_apb1rstr2  $ clearBit rcc_apb1rstr2_i2c4rst

