module Ivory.BSP.STM32L431.I2C (
    i2c1
  , i2c2
  , i2c3
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32L431.RCC
import Ivory.BSP.STM32L431.MemoryMap
import qualified Ivory.BSP.STM32L431.Interrupt as L431

import Ivory.BSP.STM32.Peripheral.I2C

i2c1 :: I2C
i2c1 = mkI2CVersion V2 i2c1_periph_base
                rccenable rccdisable rccreset
                L431.I2C1_EV L431.I2C1_ER
                "i2c1"
                -- XXX: add PClk1 when we add support for it

  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_i2c1en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_i2c1en
  rccreset   = modifyReg rcc_reg_apb1rstr1  $ clearBit rcc_apb1rstr1_i2c1rst

i2c2 :: I2C
i2c2 = mkI2CVersion V2 i2c2_periph_base
                rccenable rccdisable rccreset
                L431.I2C2_EV L431.I2C2_ER
                "i2c2"
                -- XXX: add PClk1 when we add support for it

  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_i2c2en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_i2c2en
  rccreset   = modifyReg rcc_reg_apb1rstr1  $ clearBit rcc_apb1rstr1_i2c2rst

i2c3 :: I2C
i2c3 = mkI2CVersion V2 i2c3_periph_base
                rccenable rccdisable rccreset
                L431.I2C3_EV L431.I2C3_ER
                "i2c3"
                -- XXX: add PClk1 when we add support for it

  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_i2c3en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_i2c3en
  rccreset   = modifyReg rcc_reg_apb1rstr1  $ clearBit rcc_apb1rstr1_i2c3rst

