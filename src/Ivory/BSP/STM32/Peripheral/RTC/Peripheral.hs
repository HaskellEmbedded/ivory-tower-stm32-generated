{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE Rank2Types #-}

module Ivory.BSP.STM32.Peripheral.RTC.Peripheral where

import Ivory.Language

import Ivory.HW

import Ivory.BSP.STM32.Interrupt
import Ivory.BSP.STM32.Peripheral.RTC.Regs

-- Convenience type synonyms
data RTC = RTC
  { rtcRegTR       :: BitDataReg RTC_TR
  , rtcRegDR       :: BitDataReg RTC_DR
  , rtcRegCR       :: BitDataReg RTC_CR
  , rtcRegISR      :: BitDataReg RTC_ISR
  , rtcRegPRER     :: BitDataReg RTC_PRER
  , rtcRegALRMAR   :: BitDataReg RTC_ALRMAR
  , rtcRegWPR      :: BitDataReg RTC_WPR
  , rtcRegSSR      :: BitDataReg RTC_SSR
  , rtcRegSHIFTR   :: BitDataReg RTC_SHIFTR
  , rtcRegTSTR     :: BitDataReg RTC_TSTR
  , rtcRegTSDR     :: BitDataReg RTC_TSDR
  , rtcRegTSSSR    :: BitDataReg RTC_TSSSR
  , rtcRegCALR     :: BitDataReg RTC_CALR
  , rtcRegTAFCR    :: BitDataReg RTC_TAFCR
  , rtcRegALRMASSR :: BitDataReg RTC_ALRMASSR
  , rtcRegBKP0R    :: BitDataReg RTC_BKP0R
  , rtcRegBKP1R    :: BitDataReg RTC_BKP1R
  , rtcRegBKP2R    :: BitDataReg RTC_BKP2R
  , rtcRegBKP3R    :: BitDataReg RTC_BKP3R
  , rtcRegBKP4R    :: BitDataReg RTC_BKP4R
--  , rtcInterrupt       :: HasSTM32Interrupt
  , rtcRCCEnable       :: forall eff . Ivory eff ()
  , rtcRCCDisable      :: forall eff . Ivory eff ()
  }

-- | Create an RTC given the base register address.
--mkRTC  :: (STM32Interrupt i)
--       => Integer
mkRTC  ::
          Integer
       -> (forall eff . Ivory eff ())
       -> (forall eff . Ivory eff ())
       -- -> i
       -> RTC
mkRTC base rccen rccdis = RTC
  { rtcRegTR       = reg 0x0 "tr"
  , rtcRegDR       = reg 0x4 "dr"
  , rtcRegCR       = reg 0x8 "cr"
  , rtcRegISR      = reg 0xc "isr"
  , rtcRegPRER     = reg 0x10 "prer"
  , rtcRegALRMAR   = reg 0x1c "alrmar"
  , rtcRegWPR      = reg 0x24 "wpr"
  , rtcRegSSR      = reg 0x28 "ssr"
  , rtcRegSHIFTR   = reg 0x2c "shiftr"
  , rtcRegTSTR     = reg 0x30 "tstr"
  , rtcRegTSDR     = reg 0x34 "tsdr"
  , rtcRegTSSSR    = reg 0x38 "tsssr"
  , rtcRegCALR     = reg 0x3c "calr"
  , rtcRegTAFCR    = reg 0x40 "tafcr"
  , rtcRegALRMASSR = reg 0x44 "alrmassr"
  , rtcRegBKP0R    = reg 0x50 "bkp0r"
  , rtcRegBKP1R    = reg 0x54 "bkp1r"
  , rtcRegBKP2R    = reg 0x58 "bkp2r"
  , rtcRegBKP3R    = reg 0x5c "bkp3r"
  , rtcRegBKP4R    = reg 0x60 "bkp4r"
--    , rtcInterrupt      = HasSTM32Interrupt interrupt
    , rtcRCCEnable      = rccen
    , rtcRCCDisable     = rccdis
    }
  where
  reg :: (IvoryIOReg (BitDataRep d)) => Integer -> String -> BitDataReg d
  reg offs name = mkBitDataRegNamed (base + offs) ("rtc->" ++ name)

