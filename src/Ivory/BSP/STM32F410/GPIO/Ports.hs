{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE RankNTypes #-}

module Ivory.BSP.STM32F410.GPIO.Ports (
    gpioA
  , gpioB
  , gpioC
  , gpioH
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F410.RCC
import Ivory.BSP.STM32F410.MemoryMap

import Ivory.BSP.STM32.Peripheral.GPIOv2.Peripheral

gpioA :: GPIOPort
gpioA = mkGPIOPort gpioa_periph_base rccenable rccdisable 0
  where
  rccenable  = modifyReg rcc_reg_ahb1enr $ setBit   rcc_ahb1enr_gpioaen
  rccdisable = modifyReg rcc_reg_ahb1enr $ clearBit rcc_ahb1enr_gpioaen

gpioB :: GPIOPort
gpioB = mkGPIOPort gpiob_periph_base rccenable rccdisable 1
  where
  rccenable  = modifyReg rcc_reg_ahb1enr $ setBit   rcc_ahb1enr_gpioben
  rccdisable = modifyReg rcc_reg_ahb1enr $ clearBit rcc_ahb1enr_gpioben

gpioC :: GPIOPort
gpioC = mkGPIOPort gpioc_periph_base rccenable rccdisable 2
  where
  rccenable  = modifyReg rcc_reg_ahb1enr $ setBit   rcc_ahb1enr_gpiocen
  rccdisable = modifyReg rcc_reg_ahb1enr $ clearBit rcc_ahb1enr_gpiocen

gpioH :: GPIOPort
gpioH = mkGPIOPort gpioh_periph_base rccenable rccdisable 3
  where
  rccenable  = modifyReg rcc_reg_ahb1enr $ setBit   rcc_ahb1enr_gpiohen
  rccdisable = modifyReg rcc_reg_ahb1enr $ clearBit rcc_ahb1enr_gpiohen

