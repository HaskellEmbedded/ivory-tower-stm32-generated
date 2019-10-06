module Ivory.BSP.STM32F411.I2C (
    i2c1
  , i2c2
  , i2c3
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F411.RCC
import Ivory.BSP.STM32F411.MemoryMap
import qualified Ivory.BSP.STM32F411.Interrupt as F411

import Ivory.BSP.STM32.Peripheral.I2C

i2c1 :: I2C
i2c1 = mkI2CVersion V1 i2c1_periph_base
                rccenable rccdisable rccreset
                F411.I2C1_EVT F411.I2C1_ERR
                "i2c1"
                -- XXX: add PClk1 when we add support for it

  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_i2c1en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_i2c1en
  rccreset   = modifyReg rcc_reg_apb1rstr  $ clearBit rcc_apb1rstr_i2c1rst

i2c2 :: I2C
i2c2 = mkI2CVersion V1 i2c2_periph_base
                rccenable rccdisable rccreset
                F411.I2C2_EVT F411.I2C2_ERR
                "i2c2"
                -- XXX: add PClk1 when we add support for it

  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_i2c2en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_i2c2en
  rccreset   = modifyReg rcc_reg_apb1rstr  $ clearBit rcc_apb1rstr_i2c2rst

i2c3 :: I2C
i2c3 = mkI2CVersion V1 i2c3_periph_base
                rccenable rccdisable rccreset
                F411.I2C3_EV F411.I2C3_ER
                "i2c3"
                -- XXX: add PClk1 when we add support for it

  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_i2c3en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_i2c3en
  rccreset   = modifyReg rcc_reg_apb1rstr  $ clearBit rcc_apb1rstr_i2c3rst

