{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}

module Ivory.BSP.STM32G0B0.FLASH where

import Ivory.Language
import Ivory.HW
import Ivory.BSP.STM32G0B0.MemoryMap (flash_periph_base)

-- FLASH Flash

-- Base address: 0x40022000

-- Access control register
--  | offset : 0x0
--  | address: 0x40022000
[ivory|
 bitdata FLASH_ACR :: Bits 32 = flash_acr
  { _                 :: Bits 15 -- (Reserved)
  , flash_acr_empty   :: Bit     -- Flash User area empty
  , _                 :: Bits 4  -- (Reserved)
  , flash_acr_icrst   :: Bit     -- Instruction cache reset
  , _                 :: Bit     -- (Reserved)
  , flash_acr_icen    :: Bit     -- Instruction cache enable
  , flash_acr_prften  :: Bit     -- Prefetch enable
  , _                 :: Bits 5  -- (Reserved)
  , flash_acr_latency :: Bits 3  -- Latency
  }
|]
flash_reg_acr :: BitDataReg FLASH_ACR
flash_reg_acr = mkBitDataRegNamed (flash_periph_base + 0x0) "acr"

-- Flash key register
--  | offset : 0x8
--  | address: 0x40022008
[ivory|
 bitdata FLASH_KEYR :: Bits 32 = flash_keyr
  { flash_keyr_key :: Bits 32 -- KEYR
  }
|]
flash_reg_keyr :: BitDataReg FLASH_KEYR
flash_reg_keyr = mkBitDataRegNamed (flash_periph_base + 0x8) "keyr"

-- Option byte key register
--  | offset : 0xc
--  | address: 0x4002200c
[ivory|
 bitdata FLASH_OPTKEYR :: Bits 32 = flash_optkeyr
  { flash_optkeyr_optkey :: Bits 32 -- Option byte key
  }
|]
flash_reg_optkeyr :: BitDataReg FLASH_OPTKEYR
flash_reg_optkeyr = mkBitDataRegNamed (flash_periph_base + 0xc) "optkeyr"

-- Status register
--  | offset : 0x10
--  | address: 0x40022010
[ivory|
 bitdata FLASH_SR :: Bits 32 = flash_sr
  { _                :: Bits 13 -- (Reserved)
  , flash_sr_cfgbsy  :: Bit     -- Programming or erase configuration busy.
  , flash_sr_bsy2    :: Bit     -- BSY2
  , flash_sr_bsy1    :: Bit     -- BSY1
  , flash_sr_optverr :: Bit     -- Option and Engineering bits loading validity error
  , _                :: Bits 5  -- (Reserved)
  , flash_sr_fasterr :: Bit     -- Fast programming error
  , flash_sr_misserr :: Bit     -- Fast programming data miss error
  , flash_sr_pgserr  :: Bit     -- Programming sequence error
  , flash_sr_sizerr  :: Bit     -- Size error
  , flash_sr_pgaerr  :: Bit     -- Programming alignment error
  , flash_sr_wrperr  :: Bit     -- Write protected error
  , flash_sr_progerr :: Bit     -- Programming error
  , _                :: Bit     -- (Reserved)
  , flash_sr_operr   :: Bit     -- Operation error
  , flash_sr_eop     :: Bit     -- End of operation
  }
|]
flash_reg_sr :: BitDataReg FLASH_SR
flash_reg_sr = mkBitDataRegNamed (flash_periph_base + 0x10) "sr"

-- Flash control register
--  | offset : 0x14
--  | address: 0x40022014
[ivory|
 bitdata FLASH_CR :: Bits 32 = flash_cr
  { flash_cr_lock       :: Bit     -- FLASH_CR Lock
  , flash_cr_optlock    :: Bit     -- Options Lock
  , _                   :: Bits 2  -- (Reserved)
  , flash_cr_obl_launch :: Bit     -- Force the option byte loading
  , _                   :: Bit     -- (Reserved)
  , flash_cr_errie      :: Bit     -- Error interrupt enable
  , flash_cr_eopie      :: Bit     -- End of operation interrupt enable
  , _                   :: Bits 5  -- (Reserved)
  , flash_cr_fstpg      :: Bit     -- Fast programming
  , flash_cr_optstrt    :: Bit     -- Options modification start
  , flash_cr_strt       :: Bit     -- Start
  , flash_cr_mer2       :: Bit     -- MER2
  , _                   :: Bit     -- (Reserved)
  , flash_cr_bker       :: Bit     -- BKER
  , flash_cr_pnb        :: Bits 10 -- Page number
  , flash_cr_mer1       :: Bit     -- Mass erase
  , flash_cr_per        :: Bit     -- Page erase
  , flash_cr_pg         :: Bit     -- Programming
  }
|]
flash_reg_cr :: BitDataReg FLASH_CR
flash_reg_cr = mkBitDataRegNamed (flash_periph_base + 0x14) "cr"

-- Flash ECC register
--  | offset : 0x18
--  | address: 0x40022018
[ivory|
 bitdata FLASH_ECCR :: Bits 32 = flash_eccr
  { flash_eccr_eccd     :: Bit     -- ECC detection
  , flash_eccr_eccc     :: Bit     -- ECC correction
  , _                   :: Bits 5  -- (Reserved)
  , flash_eccr_eccie    :: Bit     -- ECC correction interrupt enable
  , _                   :: Bits 3  -- (Reserved)
  , flash_eccr_sysf_ecc :: Bit     -- ECC fail for Corrected ECC Error or Double ECC Error in info block
  , _                   :: Bits 6  -- (Reserved)
  , flash_eccr_addr_ecc :: Bits 14 -- ECC fail address
  }
|]
flash_reg_eccr :: BitDataReg FLASH_ECCR
flash_reg_eccr = mkBitDataRegNamed (flash_periph_base + 0x18) "eccr"

-- Flash option register
--  | offset : 0x20
--  | address: 0x40022020
[ivory|
 bitdata FLASH_OPTR :: Bits 32 = flash_optr
  { _                           :: Bits 5 -- (Reserved)
  , flash_optr_nboot0           :: Bit    -- nBOOT0 option bit
  , flash_optr_nboot1           :: Bit    -- Boot configuration
  , flash_optr_nboot_sel        :: Bit    -- nBOOT_SEL
  , _                           :: Bit    -- (Reserved)
  , flash_optr_ram_parity_check :: Bit    -- SRAM parity check control
  , flash_optr_dual_bank        :: Bit    -- DUAL_BANK
  , flash_optr_nswap_bank       :: Bit    -- nSWAP_BANK
  , flash_optr_wwdg_sw          :: Bit    -- Window watchdog selection
  , flash_optr_iwdg_stdby       :: Bit    -- Independent watchdog counter freeze in Standby mode
  , flash_optr_iwdg_stop        :: Bit    -- Independent watchdog counter freeze in Stop mode
  , flash_optr_iwdg_sw          :: Bit    -- Independent watchdog selection
  , _                           :: Bit    -- (Reserved)
  , flash_optr_nrst_stdby       :: Bit    -- nRST_STDBY
  , flash_optr_nrst_stop        :: Bit    -- nRST_STOP
  , _                           :: Bits 5 -- (Reserved)
  , flash_optr_rdp              :: Bits 8 -- Read protection level
  }
|]
flash_reg_optr :: BitDataReg FLASH_OPTR
flash_reg_optr = mkBitDataRegNamed (flash_periph_base + 0x20) "optr"

-- Flash WRP area A address register
--  | offset : 0x2c
--  | address: 0x4002202c
[ivory|
 bitdata FLASH_WRP1AR :: Bits 32 = flash_wrp1ar
  { _                       :: Bits 9 -- (Reserved)
  , flash_wrp1ar_wrp1a_end  :: Bits 7 -- WRP area A end offset
  , _                       :: Bits 9 -- (Reserved)
  , flash_wrp1ar_wrp1a_strt :: Bits 7 -- WRP area A start offset
  }
|]
flash_reg_wrp1ar :: BitDataReg FLASH_WRP1AR
flash_reg_wrp1ar = mkBitDataRegNamed (flash_periph_base + 0x2c) "wrp1ar"

-- Flash WRP area B address register
--  | offset : 0x30
--  | address: 0x40022030
[ivory|
 bitdata FLASH_WRP1BR :: Bits 32 = flash_wrp1br
  { _                       :: Bits 9 -- (Reserved)
  , flash_wrp1br_wrp1b_end  :: Bits 7 -- WRP area B end offset
  , _                       :: Bits 9 -- (Reserved)
  , flash_wrp1br_wrp1b_strt :: Bits 7 -- WRP area B start offset
  }
|]
flash_reg_wrp1br :: BitDataReg FLASH_WRP1BR
flash_reg_wrp1br = mkBitDataRegNamed (flash_periph_base + 0x30) "wrp1br"

-- FLASH WRP2 area A address register
--  | offset : 0x4c
--  | address: 0x4002204c
[ivory|
 bitdata FLASH_WRP2AR :: Bits 32 = flash_wrp2ar
  { _                       :: Bits 9 -- (Reserved)
  , flash_wrp2ar_wrp2a_end  :: Bits 7 -- WRP2A_END
  , _                       :: Bits 9 -- (Reserved)
  , flash_wrp2ar_wrp2a_strt :: Bits 7 -- WRP2A_STRT
  }
|]
flash_reg_wrp2ar :: BitDataReg FLASH_WRP2AR
flash_reg_wrp2ar = mkBitDataRegNamed (flash_periph_base + 0x4c) "wrp2ar"

-- FLASH WRP2 area B address register
--  | offset : 0x50
--  | address: 0x40022050
[ivory|
 bitdata FLASH_WRP2BR :: Bits 32 = flash_wrp2br
  { _                       :: Bits 9 -- (Reserved)
  , flash_wrp2br_wrp2b_end  :: Bits 7 -- WRP2B_END
  , _                       :: Bits 9 -- (Reserved)
  , flash_wrp2br_wrp2b_strt :: Bits 7 -- WRP2B_STRT
  }
|]
flash_reg_wrp2br :: BitDataReg FLASH_WRP2BR
flash_reg_wrp2br = mkBitDataRegNamed (flash_periph_base + 0x50) "wrp2br"
