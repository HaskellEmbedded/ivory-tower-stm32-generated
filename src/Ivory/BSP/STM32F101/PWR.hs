{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}

module Ivory.BSP.STM32F101.PWR where

import Ivory.Language
import Ivory.HW
import Ivory.BSP.STM32F101.MemoryMap (pwr_periph_base)

-- PWR Power control

-- Base address: 0x40007000

-- Power control register (PWR_CR)
--  | offset : 0x0
--  | address: 0x40007000
[ivory|
 bitdata PWR_CR :: Bits 32 = pwr_cr
  { _          :: Bits 23  -- (Reserved)
  , pwr_cr_dbp   :: Bit      -- Disable Backup Domain write protection
  , pwr_cr_pls   :: Bits 3   -- PVD Level Selection
  , pwr_cr_pvde  :: Bit      -- Power Voltage Detector Enable
  , pwr_cr_csbf  :: Bit      -- Clear STANDBY Flag
  , pwr_cr_cwuf  :: Bit      -- Clear Wake-up Flag
  , pwr_cr_pdds  :: Bit      -- Power Down Deep Sleep
  , pwr_cr_lpds  :: Bit      -- Low Power Deep Sleep
  }
|]
pwr_reg_cr :: BitDataReg PWR_CR
pwr_reg_cr = mkBitDataRegNamed (pwr_periph_base + 0x0) "cr"

-- Power control register (PWR_CR)
--  | offset : 0x4
--  | address: 0x40007004
[ivory|
 bitdata PWR_CSR :: Bits 32 = pwr_csr
  { _           :: Bits 23  -- (Reserved)
  , pwr_csr_ewup  :: Bit      -- Enable WKUP pin
  , _           :: Bits 5   -- (Reserved)
  , pwr_csr_pvdo  :: Bit      -- PVD Output
  , pwr_csr_sbf   :: Bit      -- STANDBY Flag
  , pwr_csr_wuf   :: Bit      -- Wake-Up Flag
  }
|]
pwr_reg_csr :: BitDataReg PWR_CSR
pwr_reg_csr = mkBitDataRegNamed (pwr_periph_base + 0x4) "csr"

