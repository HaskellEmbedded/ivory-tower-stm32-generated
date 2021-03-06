{-# LANGUAGE TemplateHaskell #-}

module Ivory.BSP.STM32F107.GPIO.Pins where

import Ivory.BSP.STM32F107.GPIO.Ports
import Ivory.BSP.STM32.Peripheral.GPIOv1.Regs
import Ivory.BSP.STM32.Peripheral.GPIOv1.TH

mkGPIOPins 'gpioA "pinA"
mkGPIOPins 'gpioB "pinB"
mkGPIOPins 'gpioC "pinC"
mkGPIOPins 'gpioD "pinD"
mkGPIOPins 'gpioE "pinE"
