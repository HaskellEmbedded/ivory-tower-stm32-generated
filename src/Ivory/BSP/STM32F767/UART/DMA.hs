module Ivory.BSP.STM32F767.UART.DMA (
    dmauart4
  , dmauart5
  , dmauart7
  , dmauart8
  ) where

import Ivory.BSP.STM32.Peripheral.DMA.Peripheral
import Ivory.BSP.STM32.Peripheral.UART.DMA

import Ivory.BSP.STM32F767.DMA
import Ivory.BSP.STM32F767.UART

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
dmauart7 :: DMAUART
dmauart7 = DMAUART
  { dmaUARTPeriph    = uart7
  , dmaUARTDMAPeriph = dma1
  , dmaUARTTxStream  = DMAStream 1
  , dmaUARTTxChannel = DMAChannel 5
  , dmaUARTRxStream  = DMAStream 3
  , dmaUARTRxChannel = DMAChannel 5
  }
dmauart8 :: DMAUART
dmauart8 = DMAUART
  { dmaUARTPeriph    = uart8
  , dmaUARTDMAPeriph = dma1
  , dmaUARTTxStream  = DMAStream 0
  , dmaUARTTxChannel = DMAChannel 5
  , dmaUARTRxStream  = DMAStream 6
  , dmaUARTRxChannel = DMAChannel 5
  }
