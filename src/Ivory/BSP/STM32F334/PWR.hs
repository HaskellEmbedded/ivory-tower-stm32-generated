{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}

module Ivory.BSP.STM32F334.PWR where

import Ivory.Language
import Ivory.HW
import Ivory.BSP.STM32F334.MemoryMap (pwr_periph_base)

-- PWR Power control

-- Base address: 0x40007000

-- power control register
--  | offset : 0x0
--  | address: 0x40007000
[ivory|
 bitdata PWR_CR :: Bits 32 = pwr_cr
  { _          :: Bits 23  -- (Reserved)
  , pwr_cr_dbp   :: Bit      -- Disable backup domain write protection
  , pwr_cr_pls   :: Bits 3   -- PVD level selection
  , pwr_cr_pvde  :: Bit      -- Power voltage detector enable
  , pwr_cr_csbf  :: Bit      -- Clear standby flag
  , pwr_cr_cwuf  :: Bit      -- Clear wakeup flag
  , pwr_cr_pdds  :: Bit      -- Power down deepsleep
  , pwr_cr_lpds  :: Bit      -- Low-power deep sleep
  }
|]
pwr_reg_cr :: BitDataReg PWR_CR
pwr_reg_cr = mkBitDataRegNamed (pwr_periph_base + 0x0) "cr"

-- power control/status register
--  | offset : 0x4
--  | address: 0x40007004
[ivory|
 bitdata PWR_CSR :: Bits 32 = pwr_csr
  { _            :: Bits 22  -- (Reserved)
  , pwr_csr_ewup2  :: Bit      -- Enable WKUP2 pin
  , pwr_csr_ewup1  :: Bit      -- Enable WKUP1 pin
  , _            :: Bits 5   -- (Reserved)
  , pwr_csr_pvdo   :: Bit      -- PVD output
  , pwr_csr_sbf    :: Bit      -- Standby flag
  , pwr_csr_wuf    :: Bit      -- Wakeup flag
  }
|]
pwr_reg_csr :: BitDataReg PWR_CSR
pwr_reg_csr = mkBitDataRegNamed (pwr_periph_base + 0x4) "csr"

