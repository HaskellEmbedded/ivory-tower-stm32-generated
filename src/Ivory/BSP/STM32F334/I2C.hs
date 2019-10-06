module Ivory.BSP.STM32F334.I2C (
    i2c1
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F334.RCC
import Ivory.BSP.STM32F334.MemoryMap
import qualified Ivory.BSP.STM32F334.Interrupt as F334

import Ivory.BSP.STM32.Peripheral.I2C

i2c1 :: I2C
i2c1 = mkI2CVersion V2 i2c1_periph_base
                rccenable rccdisable rccreset
                F334.I2C1_EV_EXTI23 F334.I2C1_ER
                "i2c1"
                -- XXX: add PClk1 when we add support for it

  where
  rccenable  = modifyReg rcc_reg_apb1enr $ setBit   rcc_apb1enr_i2c1en
  rccdisable = modifyReg rcc_reg_apb1enr $ clearBit rcc_apb1enr_i2c1en
  rccreset   = modifyReg rcc_reg_apb1rstr  $ clearBit rcc_apb1rstr_i2c1rst

