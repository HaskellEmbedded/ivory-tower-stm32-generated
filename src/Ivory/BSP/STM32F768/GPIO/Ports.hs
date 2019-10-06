{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE RankNTypes #-}

module Ivory.BSP.STM32F768.GPIO.Ports (
    gpioA
  , gpioB
  , gpioC
  , gpioD
  , gpioE
  , gpioF
  , gpioG
  , gpioH
  , gpioI
  , gpioJ
  , gpioK
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F768.RCC
import Ivory.BSP.STM32F768.MemoryMap

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

gpioD :: GPIOPort
gpioD = mkGPIOPort gpiod_periph_base rccenable rccdisable 3
  where
  rccenable  = modifyReg rcc_reg_ahb1enr $ setBit   rcc_ahb1enr_gpioden
  rccdisable = modifyReg rcc_reg_ahb1enr $ clearBit rcc_ahb1enr_gpioden

gpioE :: GPIOPort
gpioE = mkGPIOPort gpioe_periph_base rccenable rccdisable 4
  where
  rccenable  = modifyReg rcc_reg_ahb1enr $ setBit   rcc_ahb1enr_gpioeen
  rccdisable = modifyReg rcc_reg_ahb1enr $ clearBit rcc_ahb1enr_gpioeen

gpioF :: GPIOPort
gpioF = mkGPIOPort gpiof_periph_base rccenable rccdisable 5
  where
  rccenable  = modifyReg rcc_reg_ahb1enr $ setBit   rcc_ahb1enr_gpiofen
  rccdisable = modifyReg rcc_reg_ahb1enr $ clearBit rcc_ahb1enr_gpiofen

gpioG :: GPIOPort
gpioG = mkGPIOPort gpiog_periph_base rccenable rccdisable 6
  where
  rccenable  = modifyReg rcc_reg_ahb1enr $ setBit   rcc_ahb1enr_gpiogen
  rccdisable = modifyReg rcc_reg_ahb1enr $ clearBit rcc_ahb1enr_gpiogen

gpioH :: GPIOPort
gpioH = mkGPIOPort gpioh_periph_base rccenable rccdisable 7
  where
  rccenable  = modifyReg rcc_reg_ahb1enr $ setBit   rcc_ahb1enr_gpiohen
  rccdisable = modifyReg rcc_reg_ahb1enr $ clearBit rcc_ahb1enr_gpiohen

gpioI :: GPIOPort
gpioI = mkGPIOPort gpioi_periph_base rccenable rccdisable 8
  where
  rccenable  = modifyReg rcc_reg_ahb1enr $ setBit   rcc_ahb1enr_gpioien
  rccdisable = modifyReg rcc_reg_ahb1enr $ clearBit rcc_ahb1enr_gpioien

gpioJ :: GPIOPort
gpioJ = mkGPIOPort gpioj_periph_base rccenable rccdisable 9
  where
  rccenable  = modifyReg rcc_reg_ahb1enr $ setBit   rcc_ahb1enr_gpiojen
  rccdisable = modifyReg rcc_reg_ahb1enr $ clearBit rcc_ahb1enr_gpiojen

gpioK :: GPIOPort
gpioK = mkGPIOPort gpiok_periph_base rccenable rccdisable 10
  where
  rccenable  = modifyReg rcc_reg_ahb1enr $ setBit   rcc_ahb1enr_gpioken
  rccdisable = modifyReg rcc_reg_ahb1enr $ clearBit rcc_ahb1enr_gpioken

