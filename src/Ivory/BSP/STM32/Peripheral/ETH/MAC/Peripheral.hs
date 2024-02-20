{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE Rank2Types #-}

module Ivory.BSP.STM32.Peripheral.ETH.MAC.Peripheral where

import Ivory.HW
import Ivory.Language

import Ivory.BSP.STM32.Interrupt
import Ivory.BSP.STM32.Peripheral.ETH.MAC.Regs

-- Convenience type synonyms
data MAC = MAC
  { ethRegMACCR      :: BitDataReg ETH_MACCR
  , ethRegMACFFR     :: BitDataReg ETH_MACFFR
  , ethRegMACHTHR    :: BitDataReg ETH_MACHTHR
  , ethRegMACHTLR    :: BitDataReg ETH_MACHTLR
  , ethRegMACMIIAR   :: BitDataReg ETH_MACMIIAR
  , ethRegMACMIIDR   :: BitDataReg ETH_MACMIIDR
  , ethRegMACFCR     :: BitDataReg ETH_MACFCR
  , ethRegMACVLANTR  :: BitDataReg ETH_MACVLANTR
  , ethRegMACPMTCSR  :: BitDataReg ETH_MACPMTCSR
  , ethRegMACDBGR    :: BitDataReg ETH_MACDBGR
  , ethRegMACSR      :: BitDataReg ETH_MACSR
  , ethRegMACIMR     :: BitDataReg ETH_MACIMR
  , ethRegMACA0HR    :: BitDataReg ETH_MACA0HR
  , ethRegMACA0LR    :: BitDataReg ETH_MACA0LR
  , ethRegMACA1HR    :: BitDataReg ETH_MACA1HR
  , ethRegMACA1LR    :: BitDataReg ETH_MACA1LR
  , ethRegMACA2HR    :: BitDataReg ETH_MACA2HR
  , ethRegMACA2LR    :: BitDataReg ETH_MACA2LR
  , ethRegMACA3HR    :: BitDataReg ETH_MACA3HR
  , ethRegMACA3LR    :: BitDataReg ETH_MACA3LR
  , ethRegMACRWUFFER :: BitDataReg ETH_MACRWUFFER
  , ethInterrupt       :: HasSTM32Interrupt
  , ethRCCEnable       :: forall eff . Ivory eff ()
  , ethRCCDisable      :: forall eff . Ivory eff ()
  -- RX and TX clocks
  , ethRCCRXEnable     :: forall eff . Ivory eff ()
  , ethRCCRXDisable    :: forall eff . Ivory eff ()
  , ethRCCTXEnable     :: forall eff . Ivory eff ()
  , ethRCCTXDisable    :: forall eff . Ivory eff ()
  }

-- | Create an ETHMAC given the base register address.
mkMAC
  :: (STM32Interrupt i)
  => Integer
  -> (forall eff . Ivory eff ())
  -> (forall eff . Ivory eff ())
  -> (forall eff . Ivory eff ())
  -> (forall eff . Ivory eff ())
  -> (forall eff . Ivory eff ())
  -> (forall eff . Ivory eff ())
  -> i
  -> MAC
mkMAC base rccen rccdis rcctxen rcctxdis rccrxen rccrxdis interrupt = MAC
  { ethRegMACCR      = reg 0x0 "maccr"
  , ethRegMACFFR     = reg 0x4 "macffr"
  , ethRegMACHTHR    = reg 0x8 "machthr"
  , ethRegMACHTLR    = reg 0xc "machtlr"
  , ethRegMACMIIAR   = reg 0x10 "macmiiar"
  , ethRegMACMIIDR   = reg 0x14 "macmiidr"
  , ethRegMACFCR     = reg 0x18 "macfcr"
  , ethRegMACVLANTR  = reg 0x1c "macvlantr"
  , ethRegMACPMTCSR  = reg 0x2c "macpmtcsr"
  , ethRegMACDBGR    = reg 0x34 "macdbgr"
  , ethRegMACSR      = reg 0x38 "macsr"
  , ethRegMACIMR     = reg 0x3c "macimr"
  , ethRegMACA0HR    = reg 0x40 "maca0hr"
  , ethRegMACA0LR    = reg 0x44 "maca0lr"
  , ethRegMACA1HR    = reg 0x48 "maca1hr"
  , ethRegMACA1LR    = reg 0x4c "maca1lr"
  , ethRegMACA2HR    = reg 0x50 "maca2hr"
  , ethRegMACA2LR    = reg 0x54 "maca2lr"
  , ethRegMACA3HR    = reg 0x58 "maca3hr"
  , ethRegMACA3LR    = reg 0x5c "maca3lr"
  , ethRegMACRWUFFER = reg 0x60 "macrwuffer"
  , ethInterrupt      = HasSTM32Interrupt interrupt
  , ethRCCEnable      = rccen
  , ethRCCDisable     = rccdis
  , ethRCCTXEnable    = rcctxen
  , ethRCCTXDisable   = rcctxdis
  , ethRCCRXEnable    = rccrxen
  , ethRCCRXDisable   = rccrxdis
  }
  where
  reg :: (IvoryIOReg (BitDataRep d)) => Integer -> String -> BitDataReg d
  reg offs name = mkBitDataRegNamed (base + offs) ("ethmac->" ++ name)
