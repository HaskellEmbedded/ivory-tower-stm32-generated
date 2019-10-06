{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}

module Ivory.BSP.STM32F401.FLASH where

import Ivory.Language
import Ivory.HW
import Ivory.BSP.STM32F401.MemoryMap (flash_periph_base)

-- FLASH FLASH

-- Base address: 0x40023c00

-- Flash access control register
--  | offset : 0x0
--  | address: 0x40023c00
[ivory|
 bitdata FLASH_ACR :: Bits 32 = flash_acr
  { _                :: Bits 19  -- (Reserved)
  , flash_acr_dcrst    :: Bit      -- Data cache reset
  , flash_acr_icrst    :: Bit      -- Instruction cache reset
  , flash_acr_dcen     :: Bit      -- Data cache enable
  , flash_acr_icen     :: Bit      -- Instruction cache enable
  , flash_acr_prften   :: Bit      -- Prefetch enable
  , _                :: Bits 5   -- (Reserved)
  , flash_acr_latency  :: Bits 3   -- Latency
  }
|]
flash_reg_acr :: BitDataReg FLASH_ACR
flash_reg_acr = mkBitDataRegNamed (flash_periph_base + 0x0) "acr"

-- Flash key register
--  | offset : 0x4
--  | address: 0x40023c04
[ivory|
 bitdata FLASH_KEYR :: Bits 32 = flash_keyr
  { flash_keyr_key  :: Bits 32  -- FPEC key
  }
|]
flash_reg_keyr :: BitDataReg FLASH_KEYR
flash_reg_keyr = mkBitDataRegNamed (flash_periph_base + 0x4) "keyr"

-- Flash option key register
--  | offset : 0x8
--  | address: 0x40023c08
[ivory|
 bitdata FLASH_OPTKEYR :: Bits 32 = flash_optkeyr
  { flash_optkeyr_optkey  :: Bits 32  -- Option byte key
  }
|]
flash_reg_optkeyr :: BitDataReg FLASH_OPTKEYR
flash_reg_optkeyr = mkBitDataRegNamed (flash_periph_base + 0x8) "optkeyr"

-- Status register
--  | offset : 0xc
--  | address: 0x40023c0c
[ivory|
 bitdata FLASH_SR :: Bits 32 = flash_sr
  { _              :: Bits 15  -- (Reserved)
  , flash_sr_bsy     :: Bit      -- Busy
  , _              :: Bits 8   -- (Reserved)
  , flash_sr_pgserr  :: Bit      -- Programming sequence error
  , flash_sr_pgperr  :: Bit      -- Programming parallelism error
  , flash_sr_pgaerr  :: Bit      -- Programming alignment error
  , flash_sr_wrperr  :: Bit      -- Write protection error
  , _              :: Bits 2   -- (Reserved)
  , flash_sr_operr   :: Bit      -- Operation error
  , flash_sr_eop     :: Bit      -- End of operation
  }
|]
flash_reg_sr :: BitDataReg FLASH_SR
flash_reg_sr = mkBitDataRegNamed (flash_periph_base + 0xc) "sr"

-- Control register
--  | offset : 0x10
--  | address: 0x40023c10
[ivory|
 bitdata FLASH_CR :: Bits 32 = flash_cr
  { flash_cr_lock   :: Bit      -- Lock
  , _             :: Bits 5   -- (Reserved)
  , flash_cr_errie  :: Bit      -- Error interrupt enable
  , flash_cr_eopie  :: Bit      -- End of operation interrupt enable
  , _             :: Bits 7   -- (Reserved)
  , flash_cr_strt   :: Bit      -- Start
  , _             :: Bits 6   -- (Reserved)
  , flash_cr_psize  :: Bits 2   -- Program size
  , _             :: Bit      -- (Reserved)
  , flash_cr_snb    :: Bits 4   -- Sector number
  , flash_cr_mer    :: Bit      -- Mass Erase
  , flash_cr_ser    :: Bit      -- Sector Erase
  , flash_cr_pg     :: Bit      -- Programming
  }
|]
flash_reg_cr :: BitDataReg FLASH_CR
flash_reg_cr = mkBitDataRegNamed (flash_periph_base + 0x10) "cr"

-- Flash option control register
--  | offset : 0x14
--  | address: 0x40023c14
[ivory|
 bitdata FLASH_OPTCR :: Bits 32 = flash_optcr
  { _                     :: Bits 4   -- (Reserved)
  , flash_optcr_nwrp        :: Bits 12  -- Not write protect
  , flash_optcr_rdp         :: Bits 8   -- Read protect
  , flash_optcr_nrst_stdby  :: Bit      -- nRST_STDBY User option bytes
  , flash_optcr_nrst_stop   :: Bit      -- nRST_STOP User option bytes
  , flash_optcr_wdg_sw      :: Bit      -- WDG_SW User option bytes
  , _                     :: Bit      -- (Reserved)
  , flash_optcr_bor_lev     :: Bits 2   -- BOR reset Level
  , flash_optcr_optstrt     :: Bit      -- Option start
  , flash_optcr_optlock     :: Bit      -- Option lock
  }
|]
flash_reg_optcr :: BitDataReg FLASH_OPTCR
flash_reg_optcr = mkBitDataRegNamed (flash_periph_base + 0x14) "optcr"

