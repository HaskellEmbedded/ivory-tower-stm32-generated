{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE Rank2Types #-}

module Ivory.BSP.STM32G081.SYSCFG.Peripheral where

import Ivory.Language

import Ivory.HW

import Ivory.BSP.STM32G081.SYSCFG.Regs

-- Convenience type synonyms
data SYSCFG = SYSCFG
  { syscfgRegVREFBUF_CSR :: BitDataReg SYSCFG_VREFBUF_CSR
  , syscfgRegVREFBUF_CCR :: BitDataReg SYSCFG_VREFBUF_CCR
  , syscfgRegCFGR1       :: BitDataReg SYSCFG_CFGR1
  , syscfgRegCFGR2       :: BitDataReg SYSCFG_CFGR2
  , syscfgRegITLINE0     :: BitDataReg SYSCFG_ITLINE0
  , syscfgRegITLINE1     :: BitDataReg SYSCFG_ITLINE1
  , syscfgRegITLINE2     :: BitDataReg SYSCFG_ITLINE2
  , syscfgRegITLINE3     :: BitDataReg SYSCFG_ITLINE3
  , syscfgRegITLINE4     :: BitDataReg SYSCFG_ITLINE4
  , syscfgRegITLINE5     :: BitDataReg SYSCFG_ITLINE5
  , syscfgRegITLINE6     :: BitDataReg SYSCFG_ITLINE6
  , syscfgRegITLINE7     :: BitDataReg SYSCFG_ITLINE7
  , syscfgRegITLINE8     :: BitDataReg SYSCFG_ITLINE8
  , syscfgRegITLINE9     :: BitDataReg SYSCFG_ITLINE9
  , syscfgRegITLINE10    :: BitDataReg SYSCFG_ITLINE10
  , syscfgRegITLINE11    :: BitDataReg SYSCFG_ITLINE11
  , syscfgRegITLINE12    :: BitDataReg SYSCFG_ITLINE12
  , syscfgRegITLINE13    :: BitDataReg SYSCFG_ITLINE13
  , syscfgRegITLINE14    :: BitDataReg SYSCFG_ITLINE14
  , syscfgRegITLINE15    :: BitDataReg SYSCFG_ITLINE15
  , syscfgRegITLINE16    :: BitDataReg SYSCFG_ITLINE16
  , syscfgRegITLINE17    :: BitDataReg SYSCFG_ITLINE17
  , syscfgRegITLINE18    :: BitDataReg SYSCFG_ITLINE18
  , syscfgRegITLINE19    :: BitDataReg SYSCFG_ITLINE19
  , syscfgRegITLINE20    :: BitDataReg SYSCFG_ITLINE20
  , syscfgRegITLINE21    :: BitDataReg SYSCFG_ITLINE21
  , syscfgRegITLINE22    :: BitDataReg SYSCFG_ITLINE22
  , syscfgRegITLINE23    :: BitDataReg SYSCFG_ITLINE23
  , syscfgRegITLINE24    :: BitDataReg SYSCFG_ITLINE24
  , syscfgRegITLINE25    :: BitDataReg SYSCFG_ITLINE25
  , syscfgRegITLINE26    :: BitDataReg SYSCFG_ITLINE26
  , syscfgRegITLINE27    :: BitDataReg SYSCFG_ITLINE27
  , syscfgRegITLINE28    :: BitDataReg SYSCFG_ITLINE28
  , syscfgRegITLINE29    :: BitDataReg SYSCFG_ITLINE29
  , syscfgRegITLINE30    :: BitDataReg SYSCFG_ITLINE30
  , syscfgRegITLINE31    :: BitDataReg SYSCFG_ITLINE31
  , syscfgRCCEnable       :: forall eff . Ivory eff ()
  , syscfgRCCDisable      :: forall eff . Ivory eff ()
  }

-- | Create SYSCFG given the base register address.
mkSYSCFG  :: Integer
       -> (forall eff . Ivory eff ())
       -> (forall eff . Ivory eff ())
       -> SYSCFG
mkSYSCFG base rccen rccdis = SYSCFG
  { syscfgRegVREFBUF_CSR = reg 0x30 "vrefbuf_csr"
  , syscfgRegVREFBUF_CCR = reg 0x34 "vrefbuf_ccr"
  , syscfgRegCFGR1       = reg 0x0 "cfgr1"
  , syscfgRegCFGR2       = reg 0x18 "cfgr2"
  , syscfgRegITLINE0     = reg 0x80 "itline0"
  , syscfgRegITLINE1     = reg 0x84 "itline1"
  , syscfgRegITLINE2     = reg 0x88 "itline2"
  , syscfgRegITLINE3     = reg 0x8c "itline3"
  , syscfgRegITLINE4     = reg 0x90 "itline4"
  , syscfgRegITLINE5     = reg 0x94 "itline5"
  , syscfgRegITLINE6     = reg 0x98 "itline6"
  , syscfgRegITLINE7     = reg 0x9c "itline7"
  , syscfgRegITLINE8     = reg 0xa0 "itline8"
  , syscfgRegITLINE9     = reg 0xa4 "itline9"
  , syscfgRegITLINE10    = reg 0xa8 "itline10"
  , syscfgRegITLINE11    = reg 0xac "itline11"
  , syscfgRegITLINE12    = reg 0xb0 "itline12"
  , syscfgRegITLINE13    = reg 0xb4 "itline13"
  , syscfgRegITLINE14    = reg 0xb8 "itline14"
  , syscfgRegITLINE15    = reg 0xbc "itline15"
  , syscfgRegITLINE16    = reg 0xc0 "itline16"
  , syscfgRegITLINE17    = reg 0xc4 "itline17"
  , syscfgRegITLINE18    = reg 0xc8 "itline18"
  , syscfgRegITLINE19    = reg 0xcc "itline19"
  , syscfgRegITLINE20    = reg 0xd0 "itline20"
  , syscfgRegITLINE21    = reg 0xd4 "itline21"
  , syscfgRegITLINE22    = reg 0xd8 "itline22"
  , syscfgRegITLINE23    = reg 0xdc "itline23"
  , syscfgRegITLINE24    = reg 0xe0 "itline24"
  , syscfgRegITLINE25    = reg 0xe4 "itline25"
  , syscfgRegITLINE26    = reg 0xe8 "itline26"
  , syscfgRegITLINE27    = reg 0xec "itline27"
  , syscfgRegITLINE28    = reg 0xf0 "itline28"
  , syscfgRegITLINE29    = reg 0xf4 "itline29"
  , syscfgRegITLINE30    = reg 0xf8 "itline30"
  , syscfgRegITLINE31    = reg 0xfc "itline31"
    , syscfgRCCEnable      = rccen
    , syscfgRCCDisable     = rccdis
    }
  where
  reg :: (IvoryIOReg (BitDataRep d)) => Integer -> String -> BitDataReg d
  reg offs name = mkBitDataRegNamed (base + offs) ("syscfg->" ++ name)
