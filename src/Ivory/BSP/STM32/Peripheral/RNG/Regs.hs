{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

module Ivory.BSP.STM32.Peripheral.RNG.Regs where

import Ivory.Language

-- RNG Random number generator

-- Base address: 0x50060800

-- control register
--  | offset : 0x0
--  | address: 0x50060800
[ivory|
 bitdata RNG_CR :: Bits 32 = rng_cr
  { rng_cr_configlock  :: Bit    -- RNG Config lock
  , rng_cr_condrst     :: Bit    -- Conditioning soft reset
  , _                  :: Bits 4 -- (Reserved)
  , rng_cr_rng_config1 :: Bits 6 -- RNG configuration 1
  , rng_cr_clkdiv      :: Bits 4 -- Clock divider factor
  , rng_cr_rng_config2 :: Bits 3 -- RNG configuration 2
  , rng_cr_nistc       :: Bit    -- Non NIST compliant
  , rng_cr_rng_config3 :: Bits 4 -- RNG configuration 3
  , _                  :: Bits 2 -- (Reserved)
  , rng_cr_ced         :: Bit    -- Clock error detection
  , _                  :: Bit    -- (Reserved)
  , rng_cr_ie          :: Bit    -- Interrupt enable
  , rng_cr_rngen       :: Bit    -- Random number generator enable
  , _                  :: Bits 2 -- (Reserved)
  }
|]

-- status register
--  | offset : 0x4
--  | address: 0x50060804
[ivory|
 bitdata RNG_SR :: Bits 32 = rng_sr
  { _           :: Bits 25 -- (Reserved)
  , rng_sr_seis :: Bit     -- Seed error interrupt status
  , rng_sr_ceis :: Bit     -- Clock error interrupt status
  , _           :: Bits 2  -- (Reserved)
  , rng_sr_secs :: Bit     -- Seed error current status
  , rng_sr_cecs :: Bit     -- Clock error current status
  , rng_sr_drdy :: Bit     -- Data ready
  }
|]

-- data register
--  | offset : 0x8
--  | address: 0x50060808
[ivory|
 bitdata RNG_DR :: Bits 32 = rng_dr
  { rng_dr_rndata :: Bits 32 -- Random data
  }
|]
