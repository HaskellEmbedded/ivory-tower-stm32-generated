{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE Rank2Types #-}

module Ivory.BSP.STM32.Peripheral.ETH.DMA.Peripheral where

import Ivory.HW
import Ivory.Language

import Ivory.BSP.STM32.Peripheral.ETH.DMA.Regs

data ETHDMA = ETHDMA
  { ethRegDMABMR    :: BitDataReg ETH_DMABMR
  , ethRegDMATPDR   :: BitDataReg ETH_DMATPDR
  , ethRegDMARPDR   :: BitDataReg ETH_DMARPDR
  , ethRegDMARDLAR  :: BitDataReg ETH_DMARDLAR
  , ethRegDMATDLAR  :: BitDataReg ETH_DMATDLAR
  , ethRegDMASR     :: BitDataReg ETH_DMASR
  , ethRegDMAOMR    :: BitDataReg ETH_DMAOMR
  , ethRegDMAIER    :: BitDataReg ETH_DMAIER
  , ethRegDMAMFBOCR :: BitDataReg ETH_DMAMFBOCR
  , ethRegDMARSWTR  :: BitDataReg ETH_DMARSWTR
  , ethRegDMACHTDR  :: BitDataReg ETH_DMACHTDR
  , ethRegDMACHRDR  :: BitDataReg ETH_DMACHRDR
  , ethRegDMACHTBAR :: BitDataReg ETH_DMACHTBAR
  , ethRegDMACHRBAR :: BitDataReg ETH_DMACHRBAR
  }

-- | Create an ETHDMA given the base register address.
mkETHDMA
  :: Integer
  -> ETHDMA
mkETHDMA base = ETHDMA
  { ethRegDMABMR    = reg 0x0 "dmabmr"
  , ethRegDMATPDR   = reg 0x4 "dmatpdr"
  , ethRegDMARPDR   = reg 0x8 "dmarpdr"
  , ethRegDMARDLAR  = reg 0xc "dmardlar"
  , ethRegDMATDLAR  = reg 0x10 "dmatdlar"
  , ethRegDMASR     = reg 0x14 "dmasr"
  , ethRegDMAOMR    = reg 0x18 "dmaomr"
  , ethRegDMAIER    = reg 0x1c "dmaier"
  , ethRegDMAMFBOCR = reg 0x20 "dmamfbocr"
  , ethRegDMARSWTR  = reg 0x24 "dmarswtr"
  , ethRegDMACHTDR  = reg 0x48 "dmachtdr"
  , ethRegDMACHRDR  = reg 0x4c "dmachrdr"
  , ethRegDMACHTBAR = reg 0x50 "dmachtbar"
  , ethRegDMACHRBAR = reg 0x54 "dmachrbar"
  }
  where
  reg :: (IvoryIOReg (BitDataRep d)) => Integer -> String -> BitDataReg d
  reg offs name = mkBitDataRegNamed (base + offs) ("ethdma->" ++ name)
