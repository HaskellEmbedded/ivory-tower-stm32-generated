module Ivory.BSP.STM32L422.I2C (
    i2c1
  , i2c3
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32.ClockConfig

import Ivory.BSP.STM32L422.AF
import Ivory.BSP.STM32L422.RCC
import Ivory.BSP.STM32L422.MemoryMap
import qualified Ivory.BSP.STM32L422.Interrupt as L422

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.I2C

i2c1 :: I2C
i2c1 = mkI2CVersion V2 i2c1_periph_base
                rccenable rccdisable rccreset
                L422.I2C1_EV L422.I2C1_ER
                PClk1
                (\pin -> findAFByPin pin "i2c1" afDB)
                "i2c1"

  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_i2c1en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_i2c1en
  rccreset   = modifyReg rcc_reg_apb1rstr1  $ clearBit rcc_apb1rstr1_i2c1rst

i2c3 :: I2C
i2c3 = mkI2CVersion V2 i2c3_periph_base
                rccenable rccdisable rccreset
                L422.I2C3_EV L422.I2C3_ER
                PClk1
                (\pin -> findAFByPin pin "i2c3" afDB)
                "i2c3"

  where
  rccenable  = modifyReg rcc_reg_apb1enr1 $ setBit   rcc_apb1enr1_i2c3en
  rccdisable = modifyReg rcc_reg_apb1enr1 $ clearBit rcc_apb1enr1_i2c3en
  rccreset   = modifyReg rcc_reg_apb1rstr1  $ clearBit rcc_apb1rstr1_i2c3rst

