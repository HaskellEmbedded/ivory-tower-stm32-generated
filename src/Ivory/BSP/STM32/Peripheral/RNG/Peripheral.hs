{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE Rank2Types #-}

module Ivory.BSP.STM32.Peripheral.RNG.Peripheral where

import Ivory.Language

import Ivory.HW

import Ivory.BSP.STM32.Interrupt
import Ivory.BSP.STM32.Peripheral.RNG.Regs

-- Convenience type synonyms
data RNG = RNG
  { rngRegCR      :: BitDataReg RNG_CR
  , rngRegSR      :: BitDataReg RNG_SR
  , rngRegDR      :: BitDataReg RNG_DR
  , rngInterrupt       :: HasSTM32Interrupt
  , rngRCCEnable       :: forall eff . Ivory eff ()
  , rngRCCDisable      :: forall eff . Ivory eff ()
  }

-- | Create an RNG given the base register address.
mkRNG  :: (STM32Interrupt i)
       => Integer
       -> (forall eff . Ivory eff ())
       -> (forall eff . Ivory eff ())
       -> i
       -> RNG
mkRNG base rccen rccdis interrupt = RNG
  { rngRegCR      = reg 0x0 "cr"
  , rngRegSR      = reg 0x4 "sr"
  , rngRegDR      = reg 0x8 "dr"
    , rngInterrupt      = HasSTM32Interrupt interrupt
    , rngRCCEnable      = rccen
    , rngRCCDisable     = rccdis
    }
  where
  reg :: (IvoryIOReg (BitDataRep d)) => Integer -> String -> BitDataReg d
  reg offs name = mkBitDataRegNamed (base + offs) ("rng->" ++ name)

