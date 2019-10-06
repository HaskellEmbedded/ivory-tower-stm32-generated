{-# LANGUAGE TemplateHaskell #-}

module Ivory.BSP.STM32L4A6.GPIO.Pins where

import Ivory.BSP.STM32L4A6.GPIO.Ports
import Ivory.BSP.STM32.Peripheral.GPIOv2.Regs
import Ivory.BSP.STM32.Peripheral.GPIOv2.TH

mkGPIOPins 'gpioA "pinA"
mkGPIOPins 'gpioB "pinB"
mkGPIOPins 'gpioC "pinC"
mkGPIOPins 'gpioD "pinD"
mkGPIOPins 'gpioE "pinE"
mkGPIOPins 'gpioF "pinF"
mkGPIOPins 'gpioG "pinG"
mkGPIOPins 'gpioH "pinH"
mkGPIOPins 'gpioI "pinI"
