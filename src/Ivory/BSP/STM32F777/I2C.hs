module Ivory.BSP.STM32F777.I2C (
    i2c1
  , i2c2
  , i2c3
  , i2c4
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32F777.AF
import Ivory.BSP.STM32F777.RCC
import Ivory.BSP.STM32F777.MemoryMap
import qualified Ivory.BSP.STM32F777.Interrupt as F777

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.I2C

i2c1 :: I2C
i2c1 = mkI2CVersion V2 i2c1_periph_base
                rccenable rccdisable rccreset
                F777.I2C1_EV F777.I2C1_ER
                PClk1
                (\pin -> findAFByPin pin "i2c1" afDB)
                "i2c1"

  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_i2c1en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_i2c1en
  rccreset   = modifyReg rcc_reg_apb1rstr  $ clearBit rcc_apb1rstr_i2c1rst

i2c2 :: I2C
i2c2 = mkI2CVersion V2 i2c2_periph_base
                rccenable rccdisable rccreset
                F777.I2C2_EV F777.I2C2_ER
                PClk1
                (\pin -> findAFByPin pin "i2c2" afDB)
                "i2c2"

  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_i2c2en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_i2c2en
  rccreset   = modifyReg rcc_reg_apb1rstr  $ clearBit rcc_apb1rstr_i2c2rst

i2c3 :: I2C
i2c3 = mkI2CVersion V2 i2c3_periph_base
                rccenable rccdisable rccreset
                F777.I2C3_EV F777.I2C3_ER
                PClk1
                (\pin -> findAFByPin pin "i2c3" afDB)
                "i2c3"

  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_i2c3en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_i2c3en
  rccreset   = modifyReg rcc_reg_apb1rstr  $ clearBit rcc_apb1rstr_i2c3rst

i2c4 :: I2C
i2c4 = mkI2CVersion V2 i2c4_periph_base
                rccenable rccdisable rccreset
                F777.I2C4_EV F777.I2C4_ER
                PClk1
                (\pin -> findAFByPin pin "i2c4" afDB)
                "i2c4"

  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_i2c4en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_i2c4en
  rccreset   = modifyReg rcc_reg_apb1rstr  $ clearBit rcc_apb1rstr_i2c4rst

