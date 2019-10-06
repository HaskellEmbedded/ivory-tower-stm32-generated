{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}

module Ivory.BSP.STM32F765.PWR where

import Ivory.Language
import Ivory.HW
import Ivory.BSP.STM32F765.MemoryMap (pwr_periph_base)

-- PWR Power control

-- Base address: 0x40007000

-- power control register
--  | offset : 0x0
--  | address: 0x40007000
[ivory|
 bitdata PWR_CR1 :: Bits 32 = pwr_cr1
  { _             :: Bits 12  -- (Reserved)
  , pwr_cr1_uden    :: Bits 2   -- Under-drive enable in stop mode
  , pwr_cr1_odswen  :: Bit      -- Over-drive switching enabled
  , pwr_cr1_oden    :: Bit      -- Over-drive enable
  , pwr_cr1_vos     :: Bits 2   -- Regulator voltage scaling output selection
  , pwr_cr1_adcdc1  :: Bit      -- ADCDC1
  , _             :: Bit      -- (Reserved)
  , pwr_cr1_mruds   :: Bit      -- Main regulator in deepsleep under-drive mode
  , pwr_cr1_lpuds   :: Bit      -- Low-power regulator in deepsleep under-drive mode
  , pwr_cr1_fpds    :: Bit      -- Flash power down in Stop mode
  , pwr_cr1_dbp     :: Bit      -- Disable backup domain write protection
  , pwr_cr1_pls     :: Bits 3   -- PVD level selection
  , pwr_cr1_pvde    :: Bit      -- Power voltage detector enable
  , pwr_cr1_csbf    :: Bit      -- Clear standby flag
  , _             :: Bit      -- (Reserved)
  , pwr_cr1_pdds    :: Bit      -- Power down deepsleep
  , pwr_cr1_lpds    :: Bit      -- Low-power deep sleep
  }
|]
pwr_reg_cr1 :: BitDataReg PWR_CR1
pwr_reg_cr1 = mkBitDataRegNamed (pwr_periph_base + 0x0) "cr1"

-- power control/status register
--  | offset : 0x4
--  | address: 0x40007004
[ivory|
 bitdata PWR_CSR1 :: Bits 32 = pwr_csr1
  { _               :: Bits 12  -- (Reserved)
  , pwr_csr1_udrdy    :: Bits 2   -- Under-drive ready flag
  , pwr_csr1_odswrdy  :: Bit      -- Over-drive mode switching ready
  , pwr_csr1_odrdy    :: Bit      -- Over-drive mode ready
  , _               :: Bit      -- (Reserved)
  , pwr_csr1_vosrdy   :: Bit      -- Regulator voltage scaling output selection ready bit
  , _               :: Bits 4   -- (Reserved)
  , pwr_csr1_bre      :: Bit      -- Backup regulator enable
  , _               :: Bits 5   -- (Reserved)
  , pwr_csr1_brr      :: Bit      -- Backup regulator ready
  , pwr_csr1_pvdo     :: Bit      -- PVD output
  , pwr_csr1_sbf      :: Bit      -- Standby flag
  , pwr_csr1_wuif     :: Bit      -- Wakeup internal flag
  }
|]
pwr_reg_csr1 :: BitDataReg PWR_CSR1
pwr_reg_csr1 = mkBitDataRegNamed (pwr_periph_base + 0x4) "csr1"

-- power control register
--  | offset : 0x8
--  | address: 0x40007008
[ivory|
 bitdata PWR_CR2 :: Bits 32 = pwr_cr2
  { _             :: Bits 18  -- (Reserved)
  , pwr_cr2_wupp6   :: Bit      -- Wakeup pin polarity bit for PI11
  , pwr_cr2_wupp5   :: Bit      -- Wakeup pin polarity bit for PI8
  , pwr_cr2_wupp4   :: Bit      -- Wakeup pin polarity bit for PC13
  , pwr_cr2_wupp3   :: Bit      -- Wakeup pin polarity bit for PC1
  , pwr_cr2_wupp2   :: Bit      -- Wakeup pin polarity bit for PA2
  , pwr_cr2_wupp1   :: Bit      -- Wakeup pin polarity bit for PA0
  , _             :: Bits 2   -- (Reserved)
  , pwr_cr2_cwupf6  :: Bit      -- Clear Wakeup Pin flag for PI11
  , pwr_cr2_cwupf5  :: Bit      -- Clear Wakeup Pin flag for PI8
  , pwr_cr2_cwupf4  :: Bit      -- Clear Wakeup Pin flag for PC13
  , pwr_cr2_cwupf3  :: Bit      -- Clear Wakeup Pin flag for PC1
  , pwr_cr2_cwupf2  :: Bit      -- Clear Wakeup Pin flag for PA2
  , pwr_cr2_cwupf1  :: Bit      -- Clear Wakeup Pin flag for PA0
  }
|]
pwr_reg_cr2 :: BitDataReg PWR_CR2
pwr_reg_cr2 = mkBitDataRegNamed (pwr_periph_base + 0x8) "cr2"

-- power control/status register
--  | offset : 0xc
--  | address: 0x4000700c
[ivory|
 bitdata PWR_CSR2 :: Bits 32 = pwr_csr2
  { _             :: Bits 18  -- (Reserved)
  , pwr_csr2_ewup6  :: Bit      -- Enable Wakeup pin for PI11
  , pwr_csr2_ewup5  :: Bit      -- Enable Wakeup pin for PI8
  , pwr_csr2_ewup4  :: Bit      -- Enable Wakeup pin for PC13
  , pwr_csr2_ewup3  :: Bit      -- Enable Wakeup pin for PC1
  , pwr_csr2_ewup2  :: Bit      -- Enable Wakeup pin for PA2
  , pwr_csr2_ewup1  :: Bit      -- Enable Wakeup pin for PA0
  , _             :: Bits 2   -- (Reserved)
  , pwr_csr2_wupf6  :: Bit      -- Wakeup Pin flag for PI11
  , pwr_csr2_wupf5  :: Bit      -- Wakeup Pin flag for PI8
  , pwr_csr2_wupf4  :: Bit      -- Wakeup Pin flag for PC13
  , pwr_csr2_wupf3  :: Bit      -- Wakeup Pin flag for PC1
  , pwr_csr2_wupf2  :: Bit      -- Wakeup Pin flag for PA2
  , pwr_csr2_wupf1  :: Bit      -- Wakeup Pin flag for PA0
  }
|]
pwr_reg_csr2 :: BitDataReg PWR_CSR2
pwr_reg_csr2 = mkBitDataRegNamed (pwr_periph_base + 0xc) "csr2"

