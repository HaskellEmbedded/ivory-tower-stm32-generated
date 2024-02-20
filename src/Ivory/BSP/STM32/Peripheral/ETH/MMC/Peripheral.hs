{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE Rank2Types #-}

module Ivory.BSP.STM32.Peripheral.ETH.MMC.Peripheral where

import Ivory.HW
import Ivory.Language

import Ivory.BSP.STM32.Peripheral.ETH.MMC.Regs

data MMC = MMC
  { ethRegMMCCR       :: BitDataReg ETH_MMCCR
  , ethRegMMCRIR      :: BitDataReg ETH_MMCRIR
  , ethRegMMCTIR      :: BitDataReg ETH_MMCTIR
  , ethRegMMCRIMR     :: BitDataReg ETH_MMCRIMR
  , ethRegMMCTIMR     :: BitDataReg ETH_MMCTIMR
  , ethRegMMCTGFSCCR  :: BitDataReg ETH_MMCTGFSCCR
  , ethRegMMCTGFMSCCR :: BitDataReg ETH_MMCTGFMSCCR
  , ethRegMMCTGFCR    :: BitDataReg ETH_MMCTGFCR
  , ethRegMMCRFCECR   :: BitDataReg ETH_MMCRFCECR
  , ethRegMMCRFAECR   :: BitDataReg ETH_MMCRFAECR
  , ethRegMMCRGUFCR   :: BitDataReg ETH_MMCRGUFCR
  }

-- | Create an ETHMMC given the base register address.
mkMMC
  :: Integer
  -> MMC
mkMMC base = MMC
  { ethRegMMCCR       = reg 0x0 "mmccr"
  , ethRegMMCRIR      = reg 0x4 "mmcrir"
  , ethRegMMCTIR      = reg 0x8 "mmctir"
  , ethRegMMCRIMR     = reg 0xc "mmcrimr"
  , ethRegMMCTIMR     = reg 0x10 "mmctimr"
  , ethRegMMCTGFSCCR  = reg 0x4c "mmctgfsccr"
  , ethRegMMCTGFMSCCR = reg 0x50 "mmctgfmsccr"
  , ethRegMMCTGFCR    = reg 0x68 "mmctgfcr"
  , ethRegMMCRFCECR   = reg 0x94 "mmcrfcecr"
  , ethRegMMCRFAECR   = reg 0x98 "mmcrfaecr"
  , ethRegMMCRGUFCR   = reg 0xc4 "mmcrgufcr"
  }
  where
  reg :: (IvoryIOReg (BitDataRep d)) => Integer -> String -> BitDataReg d
  reg offs name = mkBitDataRegNamed (base + offs) ("ethmmc->" ++ name)
