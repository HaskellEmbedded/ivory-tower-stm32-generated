{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}

module Ivory.BSP.STM32F3.FLASH where

import Ivory.Language
import Ivory.HW
import Ivory.BSP.STM32F3.MemoryMap (flash_periph_base)

-- FLASH Flash

-- Base address: 0x40022000

-- Flash access control register
--  | offset : 0x0
--  | address: 0x40022000
[ivory|
 bitdata FLASH_ACR :: Bits 32 = flash_acr
  { _                :: Bits 26  -- (Reserved)
  , flash_acr_prftbs   :: Bit      -- PRFTBS
  , flash_acr_prftbe   :: Bit      -- PRFTBE
  , _                :: Bit      -- (Reserved)
  , flash_acr_latency  :: Bits 3   -- LATENCY
  }
|]
flash_reg_acr :: BitDataReg FLASH_ACR
flash_reg_acr = mkBitDataRegNamed (flash_periph_base + 0x0) "acr"

-- Flash key register
--  | offset : 0x4
--  | address: 0x40022004
[ivory|
 bitdata FLASH_KEYR :: Bits 32 = flash_keyr
  { flash_keyr_fkeyr  :: Bits 32  -- Flash Key
  }
|]
flash_reg_keyr :: BitDataReg FLASH_KEYR
flash_reg_keyr = mkBitDataRegNamed (flash_periph_base + 0x4) "keyr"

-- Flash option key register
--  | offset : 0x8
--  | address: 0x40022008
[ivory|
 bitdata FLASH_OPTKEYR :: Bits 32 = flash_optkeyr
  { flash_optkeyr_optkeyr  :: Bits 32  -- Option byte key
  }
|]
flash_reg_optkeyr :: BitDataReg FLASH_OPTKEYR
flash_reg_optkeyr = mkBitDataRegNamed (flash_periph_base + 0x8) "optkeyr"

-- Flash status register
--  | offset : 0xc
--  | address: 0x4002200c
[ivory|
 bitdata FLASH_SR :: Bits 32 = flash_sr
  { _             :: Bits 26  -- (Reserved)
  , flash_sr_eop    :: Bit      -- End of operation
  , flash_sr_wrprt  :: Bit      -- Write protection error
  , _             :: Bit      -- (Reserved)
  , flash_sr_pgerr  :: Bit      -- Programming error
  , _             :: Bit      -- (Reserved)
  , flash_sr_bsy    :: Bit      -- Busy
  }
|]
flash_reg_sr :: BitDataReg FLASH_SR
flash_reg_sr = mkBitDataRegNamed (flash_periph_base + 0xc) "sr"

-- Flash control register
--  | offset : 0x10
--  | address: 0x40022010
[ivory|
 bitdata FLASH_CR :: Bits 32 = flash_cr
  { _                     :: Bits 18  -- (Reserved)
  , flash_cr_force_optload  :: Bit      -- Force option byte loading
  , flash_cr_eopie          :: Bit      -- End of operation interrupt enable
  , _                     :: Bit      -- (Reserved)
  , flash_cr_errie          :: Bit      -- Error interrupt enable
  , flash_cr_optwre         :: Bit      -- Option bytes write enable
  , _                     :: Bit      -- (Reserved)
  , flash_cr_lock           :: Bit      -- Lock
  , flash_cr_strt           :: Bit      -- Start
  , flash_cr_opter          :: Bit      -- Option byte erase
  , flash_cr_optpg          :: Bit      -- Option byte programming
  , _                     :: Bit      -- (Reserved)
  , flash_cr_mer            :: Bit      -- Mass erase
  , flash_cr_per            :: Bit      -- Page erase
  , flash_cr_pg             :: Bit      -- Programming
  }
|]
flash_reg_cr :: BitDataReg FLASH_CR
flash_reg_cr = mkBitDataRegNamed (flash_periph_base + 0x10) "cr"

-- Flash address register
--  | offset : 0x14
--  | address: 0x40022014
[ivory|
 bitdata FLASH_AR :: Bits 32 = flash_ar
  { flash_ar_far  :: Bits 32  -- Flash address
  }
|]
flash_reg_ar :: BitDataReg FLASH_AR
flash_reg_ar = mkBitDataRegNamed (flash_periph_base + 0x14) "ar"

-- Option byte register
--  | offset : 0x1c
--  | address: 0x4002201c
[ivory|
 bitdata FLASH_OBR :: Bits 32 = flash_obr
  { flash_obr_data1                :: Bits 8   -- Data1
  , flash_obr_data0                :: Bits 8   -- Data0
  , flash_obr_sdadc12_vdd_monitor  :: Bit      -- SDADC12_VDD_MONITOR
  , flash_obr_sram_parity_check    :: Bit      -- SRAM_PARITY_CHECK
  , flash_obr_vdda_monitor         :: Bit      -- VDDA_MONITOR
  , flash_obr_boot1                :: Bit      -- BOOT1
  , _                            :: Bit      -- (Reserved)
  , flash_obr_nrst_stdby           :: Bit      -- nRST_STDBY
  , flash_obr_nrst_stop            :: Bit      -- nRST_STOP
  , flash_obr_wdg_sw               :: Bit      -- WDG_SW
  , _                            :: Bits 5   -- (Reserved)
  , flash_obr_level2_prot          :: Bit      -- Level 2 protection status
  , flash_obr_level1_prot          :: Bit      -- Level 1 protection status
  , flash_obr_opterr               :: Bit      -- Option byte error
  }
|]
flash_reg_obr :: BitDataReg FLASH_OBR
flash_reg_obr = mkBitDataRegNamed (flash_periph_base + 0x1c) "obr"

-- Write protection register
--  | offset : 0x20
--  | address: 0x40022020
[ivory|
 bitdata FLASH_WRPR :: Bits 32 = flash_wrpr
  { flash_wrpr_wrp  :: Bits 32  -- Write protect
  }
|]
flash_reg_wrpr :: BitDataReg FLASH_WRPR
flash_reg_wrpr = mkBitDataRegNamed (flash_periph_base + 0x20) "wrpr"

