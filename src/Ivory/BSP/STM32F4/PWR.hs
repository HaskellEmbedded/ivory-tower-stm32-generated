{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}

module Ivory.BSP.STM32F4.PWR where

import Ivory.Language
import Ivory.HW
import Ivory.BSP.STM32F4.MemoryMap (pwr_periph_base)

-- PWR Power control

-- Base address: 0x40007000

-- power control register
--  | offset : 0x0
--  | address: 0x40007000
[ivory|
 bitdata PWR_CR :: Bits 32 = pwr_cr
  { _            :: Bits 12  -- (Reserved)
  , pwr_cr_uden    :: Bits 2   -- Under-drive enable in stop mode
  , pwr_cr_odswen  :: Bit      -- Over-drive switching enabled
  , pwr_cr_oden    :: Bit      -- Over-drive enable
  , pwr_cr_vos     :: Bits 2   -- Regulator voltage scaling output selection
  , _            :: Bits 2   -- (Reserved)
  , pwr_cr_mrlvds  :: Bit      -- Main regulator low voltage in deepsleep mode
  , pwr_cr_lplvds  :: Bit      -- Low-Power Regulator Low Voltage in deepsleep
  , pwr_cr_fpds    :: Bit      -- Flash power down in Stop mode
  , pwr_cr_dbp     :: Bit      -- Disable backup domain write protection
  , pwr_cr_pls     :: Bits 3   -- PVD level selection
  , pwr_cr_pvde    :: Bit      -- Power voltage detector enable
  , pwr_cr_csbf    :: Bit      -- Clear standby flag
  , pwr_cr_cwuf    :: Bit      -- Clear wakeup flag
  , pwr_cr_pdds    :: Bit      -- Power down deepsleep
  , pwr_cr_lpds    :: Bit      -- Low-power deep sleep
  }
|]
pwr_reg_cr :: BitDataReg PWR_CR
pwr_reg_cr = mkBitDataRegNamed (pwr_periph_base + 0x0) "cr"

-- power control/status register
--  | offset : 0x4
--  | address: 0x40007004
[ivory|
 bitdata PWR_CSR :: Bits 32 = pwr_csr
  { _              :: Bits 12  -- (Reserved)
  , pwr_csr_udrdy    :: Bits 2   -- Under-drive ready flag
  , pwr_csr_odswrdy  :: Bit      -- Over-drive mode switching ready
  , pwr_csr_odrdy    :: Bit      -- Over-drive mode ready
  , _              :: Bit      -- (Reserved)
  , pwr_csr_vosrdy   :: Bit      -- Regulator voltage scaling output selection ready bit
  , _              :: Bits 4   -- (Reserved)
  , pwr_csr_bre      :: Bit      -- Backup regulator enable
  , pwr_csr_ewup     :: Bit      -- Enable WKUP pin
  , _              :: Bits 4   -- (Reserved)
  , pwr_csr_brr      :: Bit      -- Backup regulator ready
  , pwr_csr_pvdo     :: Bit      -- PVD output
  , pwr_csr_sbf      :: Bit      -- Standby flag
  , pwr_csr_wuf      :: Bit      -- Wakeup flag
  }
|]
pwr_reg_csr :: BitDataReg PWR_CSR
pwr_reg_csr = mkBitDataRegNamed (pwr_periph_base + 0x4) "csr"

