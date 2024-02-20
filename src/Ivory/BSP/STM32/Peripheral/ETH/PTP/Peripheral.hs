{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE Rank2Types #-}

module Ivory.BSP.STM32.Peripheral.ETH.PTP.Peripheral where

import Ivory.HW
import Ivory.Language

import Ivory.BSP.STM32.Peripheral.ETH.PTP.Regs

data PTP = PTP
  { ethRegPTPTSCR  :: BitDataReg ETH_PTPTSCR
  , ethRegPTPSSIR  :: BitDataReg ETH_PTPSSIR
  , ethRegPTPTSHR  :: BitDataReg ETH_PTPTSHR
  , ethRegPTPTSLR  :: BitDataReg ETH_PTPTSLR
  , ethRegPTPTSHUR :: BitDataReg ETH_PTPTSHUR
  , ethRegPTPTSLUR :: BitDataReg ETH_PTPTSLUR
  , ethRegPTPTSAR  :: BitDataReg ETH_PTPTSAR
  , ethRegPTPTTHR  :: BitDataReg ETH_PTPTTHR
  , ethRegPTPTTLR  :: BitDataReg ETH_PTPTTLR
  , ethRegPTPTSSR  :: BitDataReg ETH_PTPTSSR
  , ethRegPTPPPSCR :: BitDataReg ETH_PTPPPSCR
  , ethPTPRCCEnable       :: forall eff . Ivory eff ()
  , ethPTPRCCDisable      :: forall eff . Ivory eff ()
  }

-- | Create an ETHPTP given the base register address.
mkPTP
  :: Integer
  -> (forall eff . Ivory eff ())
  -> (forall eff . Ivory eff ())
  -> PTP
mkPTP base rccen rccdis = PTP
  { ethRegPTPTSCR  = reg 0x0 "ptptscr"
  , ethRegPTPSSIR  = reg 0x4 "ptpssir"
  , ethRegPTPTSHR  = reg 0x8 "ptptshr"
  , ethRegPTPTSLR  = reg 0xc "ptptslr"
  , ethRegPTPTSHUR = reg 0x10 "ptptshur"
  , ethRegPTPTSLUR = reg 0x14 "ptptslur"
  , ethRegPTPTSAR  = reg 0x18 "ptptsar"
  , ethRegPTPTTHR  = reg 0x1c "ptptthr"
  , ethRegPTPTTLR  = reg 0x20 "ptpttlr"
  , ethRegPTPTSSR  = reg 0x28 "ptptssr"
  , ethRegPTPPPSCR = reg 0x2c "ptpppscr"
  , ethPTPRCCEnable      = rccen
  , ethPTPRCCDisable     = rccdis
  }
  where
  reg :: (IvoryIOReg (BitDataRep d)) => Integer -> String -> BitDataReg d
  reg offs name = mkBitDataRegNamed (base + offs) ("ethptp->" ++ name)
