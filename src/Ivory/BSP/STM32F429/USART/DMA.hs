module Ivory.BSP.STM32F429.USART.DMA (
    dmausart1
  , dmausart2
  , dmausart3
  , dmausart6
  ) where

import Ivory.BSP.STM32.Peripheral.DMA.Peripheral
import Ivory.BSP.STM32.Peripheral.UART.DMA

import Ivory.BSP.STM32F429.DMA
import Ivory.BSP.STM32F429.USART

dmausart1 :: DMAUART
dmausart1 = DMAUART
  { dmaUARTPeriph    = usart1
  , dmaUARTDMAPeriph = dma2
  , dmaUARTTxStream  = DMAStream 7
  , dmaUARTTxChannel = DMAChannel 4
  , dmaUARTRxStream  = DMAStream 2
  , dmaUARTRxChannel = DMAChannel 4
  }
dmausart2 :: DMAUART
dmausart2 = DMAUART
  { dmaUARTPeriph    = usart2
  , dmaUARTDMAPeriph = dma1
  , dmaUARTTxStream  = DMAStream 6
  , dmaUARTTxChannel = DMAChannel 4
  , dmaUARTRxStream  = DMAStream 5
  , dmaUARTRxChannel = DMAChannel 4
  }
dmausart3 :: DMAUART
dmausart3 = DMAUART
  { dmaUARTPeriph    = usart3
  , dmaUARTDMAPeriph = dma1
  , dmaUARTTxStream  = DMAStream 3
  , dmaUARTTxChannel = DMAChannel 4
  , dmaUARTRxStream  = DMAStream 1
  , dmaUARTRxChannel = DMAChannel 4
  }
dmausart6 :: DMAUART
dmausart6 = DMAUART
  { dmaUARTPeriph    = usart6
  , dmaUARTDMAPeriph = dma2
  , dmaUARTTxStream  = DMAStream 6
  , dmaUARTTxChannel = DMAChannel 5
  , dmaUARTRxStream  = DMAStream 1
  , dmaUARTRxChannel = DMAChannel 5
  }
