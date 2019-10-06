{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE RankNTypes #-}

module Ivory.BSP.STM32F058.GPIO.Ports (
    gpioA
  , gpioB
  , gpioC
  , gpioD
  , gpioF
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F058.RCC
import Ivory.BSP.STM32F058.MemoryMap

import Ivory.BSP.STM32.Peripheral.GPIOv2.Peripheral

gpioA :: GPIOPort
gpioA = mkGPIOPort gpioa_periph_base rccenable rccdisable 0
  where
  rccenable  = modifyReg rcc_reg_ahbenr $ setBit   rcc_ahbenr_gpioaen
  rccdisable = modifyReg rcc_reg_ahbenr $ clearBit rcc_ahbenr_gpioaen

gpioB :: GPIOPort
gpioB = mkGPIOPort gpiob_periph_base rccenable rccdisable 1
  where
  rccenable  = modifyReg rcc_reg_ahbenr $ setBit   rcc_ahbenr_gpioben
  rccdisable = modifyReg rcc_reg_ahbenr $ clearBit rcc_ahbenr_gpioben

gpioC :: GPIOPort
gpioC = mkGPIOPort gpioc_periph_base rccenable rccdisable 2
  where
  rccenable  = modifyReg rcc_reg_ahbenr $ setBit   rcc_ahbenr_gpiocen
  rccdisable = modifyReg rcc_reg_ahbenr $ clearBit rcc_ahbenr_gpiocen

gpioD :: GPIOPort
gpioD = mkGPIOPort gpiod_periph_base rccenable rccdisable 3
  where
  rccenable  = modifyReg rcc_reg_ahbenr $ setBit   rcc_ahbenr_gpioden
  rccdisable = modifyReg rcc_reg_ahbenr $ clearBit rcc_ahbenr_gpioden

gpioF :: GPIOPort
gpioF = mkGPIOPort gpiof_periph_base rccenable rccdisable 4
  where
  rccenable  = modifyReg rcc_reg_ahbenr $ setBit   rcc_ahbenr_gpiofen
  rccdisable = modifyReg rcc_reg_ahbenr $ clearBit rcc_ahbenr_gpiofen

