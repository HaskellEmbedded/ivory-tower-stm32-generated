module Ivory.BSP.STM32F768.UART.DMA (
    dmauart4
  , dmauart5
  ) where

import Ivory.BSP.STM32.Peripheral.DMA.Peripheral
import Ivory.BSP.STM32.Peripheral.UART.DMA

import Ivory.BSP.STM32F768.DMA
import Ivory.BSP.STM32F768.UART

dmauart4 :: DMAUART
dmauart4 = DMAUART
  { dmaUARTPeriph    = uart4
  , dmaUARTDMAPeriph = dma1
  , dmaUARTTxStream  = DMAStream 4
  , dmaUARTTxChannel = DMAChannel 4
  , dmaUARTRxStream  = DMAStream 2
  , dmaUARTRxChannel = DMAChannel 4
  }
dmauart5 :: DMAUART
dmauart5 = DMAUART
  { dmaUARTPeriph    = uart5
  , dmaUARTDMAPeriph = dma1
  , dmaUARTTxStream  = DMAStream 7
  , dmaUARTTxChannel = DMAChannel 4
  , dmaUARTRxStream  = DMAStream 0
  , dmaUARTRxChannel = DMAChannel 4
  }
