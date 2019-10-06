{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}

module Ivory.BSP.STM32F070.PWR where

import Ivory.Language
import Ivory.HW
import Ivory.BSP.STM32F070.MemoryMap (pwr_periph_base)

-- PWR Power control

-- Base address: 0x40007000

-- power control register
--  | offset : 0x0
--  | address: 0x40007000
[ivory|
 bitdata PWR_CR :: Bits 32 = pwr_cr
  { _          :: Bits 23  -- (Reserved)
  , pwr_cr_dbp   :: Bit      -- Disable backup domain write protection
  , _          :: Bits 4   -- (Reserved)
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
  { _            :: Bits 17  -- (Reserved)
  , pwr_csr_ewup7  :: Bit      -- Enable WKUP pin 7
  , pwr_csr_ewup6  :: Bit      -- Enable WKUP pin 6
  , pwr_csr_ewup5  :: Bit      -- Enable WKUP pin 5
  , pwr_csr_ewup4  :: Bit      -- Enable WKUP pin 4
  , _            :: Bit      -- (Reserved)
  , pwr_csr_ewup2  :: Bit      -- Enable WKUP pin 2
  , pwr_csr_ewup1  :: Bit      -- Enable WKUP pin 1
  , _            :: Bits 6   -- (Reserved)
  , pwr_csr_sbf    :: Bit      -- Standby flag
  , pwr_csr_wuf    :: Bit      -- Wakeup flag
  }
|]
pwr_reg_csr :: BitDataReg PWR_CSR
pwr_reg_csr = mkBitDataRegNamed (pwr_periph_base + 0x4) "csr"

