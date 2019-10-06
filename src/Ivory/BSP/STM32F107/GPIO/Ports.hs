{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE RankNTypes #-}

module Ivory.BSP.STM32F107.GPIO.Ports (
    gpioA
  , gpioB
  , gpioC
  , gpioD
  , gpioE
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F107.RCC
import Ivory.BSP.STM32F107.MemoryMap

import Ivory.BSP.STM32.Peripheral.GPIOv1.Peripheral

gpioA :: GPIOPort
gpioA = mkGPIOPort gpioa_periph_base rccenable rccdisable 0
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_gpioaen
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_gpioaen

gpioB :: GPIOPort
gpioB = mkGPIOPort gpiob_periph_base rccenable rccdisable 1
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_gpioben
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_gpioben

gpioC :: GPIOPort
gpioC = mkGPIOPort gpioc_periph_base rccenable rccdisable 2
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_gpiocen
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_gpiocen

gpioD :: GPIOPort
gpioD = mkGPIOPort gpiod_periph_base rccenable rccdisable 3
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_gpioden
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_gpioden

gpioE :: GPIOPort
gpioE = mkGPIOPort gpioe_periph_base rccenable rccdisable 4
  where
  rccenable  = modifyReg rcc_reg_apb2enr $ setBit   rcc_apb2enr_gpioeen
  rccdisable = modifyReg rcc_reg_apb2enr $ clearBit rcc_apb2enr_gpioeen

