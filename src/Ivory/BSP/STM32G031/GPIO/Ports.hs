{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE RankNTypes #-}

module Ivory.BSP.STM32G031.GPIO.Ports (
    gpioA
  , gpioB
  , gpioC
  , gpioD
  , gpioF
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32G031.RCC
import Ivory.BSP.STM32G031.MemoryMap

import Ivory.BSP.STM32.Peripheral.GPIOv2.Peripheral

gpioA :: GPIOPort
gpioA = mkGPIOPort gpioa_periph_base rccenable rccdisable 0
  where
  rccenable  = modifyReg rcc_reg_iopenr $ setBit   rcc_iopenr_gpioaen
  rccdisable = modifyReg rcc_reg_iopenr $ clearBit rcc_iopenr_gpioaen

gpioB :: GPIOPort
gpioB = mkGPIOPort gpiob_periph_base rccenable rccdisable 1
  where
  rccenable  = modifyReg rcc_reg_iopenr $ setBit   rcc_iopenr_gpioben
  rccdisable = modifyReg rcc_reg_iopenr $ clearBit rcc_iopenr_gpioben

gpioC :: GPIOPort
gpioC = mkGPIOPort gpioc_periph_base rccenable rccdisable 2
  where
  rccenable  = modifyReg rcc_reg_iopenr $ setBit   rcc_iopenr_gpiocen
  rccdisable = modifyReg rcc_reg_iopenr $ clearBit rcc_iopenr_gpiocen

gpioD :: GPIOPort
gpioD = mkGPIOPort gpiod_periph_base rccenable rccdisable 3
  where
  rccenable  = modifyReg rcc_reg_iopenr $ setBit   rcc_iopenr_gpioden
  rccdisable = modifyReg rcc_reg_iopenr $ clearBit rcc_iopenr_gpioden

gpioF :: GPIOPort
gpioF = mkGPIOPort gpiof_periph_base rccenable rccdisable 4
  where
  rccenable  = modifyReg rcc_reg_iopenr $ setBit   rcc_iopenr_gpiofen
  rccdisable = modifyReg rcc_reg_iopenr $ clearBit rcc_iopenr_gpiofen

