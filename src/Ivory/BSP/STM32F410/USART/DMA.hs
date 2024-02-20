module Ivory.BSP.STM32F410.USART.DMA (
    dmausart1
  , dmausart2
  ) where

import Ivory.BSP.STM32.Peripheral.DMA.Peripheral
import Ivory.BSP.STM32.Peripheral.UART.DMA

import Ivory.BSP.STM32F410.DMA
import Ivory.BSP.STM32F410.USART

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
