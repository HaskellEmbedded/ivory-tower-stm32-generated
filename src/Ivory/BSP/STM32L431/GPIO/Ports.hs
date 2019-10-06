{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE RankNTypes #-}

module Ivory.BSP.STM32L431.GPIO.Ports (
    gpioA
  , gpioB
  , gpioC
  , gpioD
  , gpioE
  , gpioH
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32L431.RCC
import Ivory.BSP.STM32L431.MemoryMap

import Ivory.BSP.STM32.Peripheral.GPIOv2.Peripheral

gpioA :: GPIOPort
gpioA = mkGPIOPort gpioa_periph_base rccenable rccdisable 0
  where
  rccenable  = modifyReg rcc_reg_ahb2enr $ setBit   rcc_ahb2enr_gpioaen
  rccdisable = modifyReg rcc_reg_ahb2enr $ clearBit rcc_ahb2enr_gpioaen

gpioB :: GPIOPort
gpioB = mkGPIOPort gpiob_periph_base rccenable rccdisable 1
  where
  rccenable  = modifyReg rcc_reg_ahb2enr $ setBit   rcc_ahb2enr_gpioben
  rccdisable = modifyReg rcc_reg_ahb2enr $ clearBit rcc_ahb2enr_gpioben

gpioC :: GPIOPort
gpioC = mkGPIOPort gpioc_periph_base rccenable rccdisable 2
  where
  rccenable  = modifyReg rcc_reg_ahb2enr $ setBit   rcc_ahb2enr_gpiocen
  rccdisable = modifyReg rcc_reg_ahb2enr $ clearBit rcc_ahb2enr_gpiocen

gpioD :: GPIOPort
gpioD = mkGPIOPort gpiod_periph_base rccenable rccdisable 3
  where
  rccenable  = modifyReg rcc_reg_ahb2enr $ setBit   rcc_ahb2enr_gpioden
  rccdisable = modifyReg rcc_reg_ahb2enr $ clearBit rcc_ahb2enr_gpioden

gpioE :: GPIOPort
gpioE = mkGPIOPort gpioe_periph_base rccenable rccdisable 4
  where
  rccenable  = modifyReg rcc_reg_ahb2enr $ setBit   rcc_ahb2enr_gpioeen
  rccdisable = modifyReg rcc_reg_ahb2enr $ clearBit rcc_ahb2enr_gpioeen

gpioH :: GPIOPort
gpioH = mkGPIOPort gpioh_periph_base rccenable rccdisable 5
  where
  rccenable  = modifyReg rcc_reg_ahb2enr $ setBit   rcc_ahb2enr_gpiohen
  rccdisable = modifyReg rcc_reg_ahb2enr $ clearBit rcc_ahb2enr_gpiohen

