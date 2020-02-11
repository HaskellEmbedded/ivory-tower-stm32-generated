{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE Rank2Types #-}

module Ivory.BSP.STM32F100.AFIO.Peripheral where

import Ivory.Language

import Ivory.HW

import Ivory.BSP.STM32F100.AFIO.Regs

-- Convenience type synonyms
data AFIO = AFIO
  { afioRegEVCR    :: BitDataReg AFIO_EVCR
  , afioRegMAPR    :: BitDataReg AFIO_MAPR
  , afioRegEXTICR1 :: BitDataReg AFIO_EXTICR1
  , afioRegEXTICR2 :: BitDataReg AFIO_EXTICR2
  , afioRegEXTICR3 :: BitDataReg AFIO_EXTICR3
  , afioRegEXTICR4 :: BitDataReg AFIO_EXTICR4
  , afioRegMAPR2   :: BitDataReg AFIO_MAPR2
  , afioRCCEnable       :: forall eff . Ivory eff ()
  , afioRCCDisable      :: forall eff . Ivory eff ()
  }

-- | Create AFIO given the base register address.
mkAFIO  :: Integer
       -> (forall eff . Ivory eff ())
       -> (forall eff . Ivory eff ())
       -> AFIO
mkAFIO base rccen rccdis = AFIO
  { afioRegEVCR    = reg 0x0 "evcr"
  , afioRegMAPR    = reg 0x4 "mapr"
  , afioRegEXTICR1 = reg 0x8 "exticr1"
  , afioRegEXTICR2 = reg 0xc "exticr2"
  , afioRegEXTICR3 = reg 0x10 "exticr3"
  , afioRegEXTICR4 = reg 0x14 "exticr4"
  , afioRegMAPR2   = reg 0x1c "mapr2"
    , afioRCCEnable      = rccen
    , afioRCCDisable     = rccdis
    }
  where
  reg :: (IvoryIOReg (BitDataRep d)) => Integer -> String -> BitDataReg d
  reg offs name = mkBitDataRegNamed (base + offs) ("afio->" ++ name)
