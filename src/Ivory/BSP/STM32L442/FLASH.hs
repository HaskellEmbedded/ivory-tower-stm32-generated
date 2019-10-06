{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}

module Ivory.BSP.STM32L442.FLASH where

import Ivory.Language
import Ivory.HW
import Ivory.BSP.STM32L442.MemoryMap (flash_periph_base)

-- FLASH Flash

-- Base address: 0x40022000

-- Access control register
--  | offset : 0x0
--  | address: 0x40022000
[ivory|
 bitdata FLASH_ACR :: Bits 32 = flash_acr
  { _                 :: Bits 17  -- (Reserved)
  , flash_acr_sleep_pd  :: Bit      -- Flash Power-down mode during Low-power sleep mode
  , flash_acr_run_pd    :: Bit      -- Flash Power-down mode during Low-power run mode
  , flash_acr_dcrst     :: Bit      -- Data cache reset
  , flash_acr_icrst     :: Bit      -- Instruction cache reset
  , flash_acr_dcen      :: Bit      -- Data cache enable
  , flash_acr_icen      :: Bit      -- Instruction cache enable
  , flash_acr_prften    :: Bit      -- Prefetch enable
  , _                 :: Bits 5   -- (Reserved)
  , flash_acr_latency   :: Bits 3   -- Latency
  }
|]
flash_reg_acr :: BitDataReg FLASH_ACR
flash_reg_acr = mkBitDataRegNamed (flash_periph_base + 0x0) "acr"

-- Power down key register
--  | offset : 0x4
--  | address: 0x40022004
[ivory|
 bitdata FLASH_PDKEYR :: Bits 32 = flash_pdkeyr
  { flash_pdkeyr_pdkeyr  :: Bits 32  -- RUN_PD in FLASH_ACR key
  }
|]
flash_reg_pdkeyr :: BitDataReg FLASH_PDKEYR
flash_reg_pdkeyr = mkBitDataRegNamed (flash_periph_base + 0x4) "pdkeyr"

-- Flash key register
--  | offset : 0x8
--  | address: 0x40022008
[ivory|
 bitdata FLASH_KEYR :: Bits 32 = flash_keyr
  { flash_keyr_keyr  :: Bits 32  -- KEYR
  }
|]
flash_reg_keyr :: BitDataReg FLASH_KEYR
flash_reg_keyr = mkBitDataRegNamed (flash_periph_base + 0x8) "keyr"

-- Option byte key register
--  | offset : 0xc
--  | address: 0x4002200c
[ivory|
 bitdata FLASH_OPTKEYR :: Bits 32 = flash_optkeyr
  { flash_optkeyr_optkeyr  :: Bits 32  -- Option byte key
  }
|]
flash_reg_optkeyr :: BitDataReg FLASH_OPTKEYR
flash_reg_optkeyr = mkBitDataRegNamed (flash_periph_base + 0xc) "optkeyr"

-- Status register
--  | offset : 0x10
--  | address: 0x40022010
[ivory|
 bitdata FLASH_SR :: Bits 32 = flash_sr
  { _               :: Bits 15  -- (Reserved)
  , flash_sr_bsy      :: Bit      -- Busy
  , flash_sr_optverr  :: Bit      -- Option validity error
  , flash_sr_rderr    :: Bit      -- PCROP read error
  , _               :: Bits 4   -- (Reserved)
  , flash_sr_fasterr  :: Bit      -- Fast programming error
  , flash_sr_miserr   :: Bit      -- Fast programming data miss error
  , flash_sr_pgserr   :: Bit      -- Programming sequence error
  , flash_sr_sizerr   :: Bit      -- Size error
  , flash_sr_pgaerr   :: Bit      -- Programming alignment error
  , flash_sr_wrperr   :: Bit      -- Write protected error
  , flash_sr_progerr  :: Bit      -- Programming error
  , _               :: Bit      -- (Reserved)
  , flash_sr_operr    :: Bit      -- Operation error
  , flash_sr_eop      :: Bit      -- End of operation
  }
|]
flash_reg_sr :: BitDataReg FLASH_SR
flash_reg_sr = mkBitDataRegNamed (flash_periph_base + 0x10) "sr"

-- Flash control register
--  | offset : 0x14
--  | address: 0x40022014
[ivory|
 bitdata FLASH_CR :: Bits 32 = flash_cr
  { flash_cr_lock        :: Bit      -- FLASH_CR Lock
  , flash_cr_optlock     :: Bit      -- Options Lock
  , _                  :: Bits 2   -- (Reserved)
  , flash_cr_obl_launch  :: Bit      -- Force the option byte loading
  , flash_cr_rderrie     :: Bit      -- PCROP read error interrupt enable
  , flash_cr_errie       :: Bit      -- Error interrupt enable
  , flash_cr_eopie       :: Bit      -- End of operation interrupt enable
  , _                  :: Bits 5   -- (Reserved)
  , flash_cr_fstpg       :: Bit      -- Fast programming
  , flash_cr_optstrt     :: Bit      -- Options modification start
  , flash_cr_start       :: Bit      -- Start
  , flash_cr_mer2        :: Bit      -- Bank 2 Mass erase
  , _                  :: Bits 3   -- (Reserved)
  , flash_cr_bker        :: Bit      -- Bank erase
  , flash_cr_pnb         :: Bits 8   -- Page number
  , flash_cr_mer1        :: Bit      -- Bank 1 Mass erase
  , flash_cr_per         :: Bit      -- Page erase
  , flash_cr_pg          :: Bit      -- Programming
  }
|]
flash_reg_cr :: BitDataReg FLASH_CR
flash_reg_cr = mkBitDataRegNamed (flash_periph_base + 0x14) "cr"

-- Flash ECC register
--  | offset : 0x18
--  | address: 0x40022018
[ivory|
 bitdata FLASH_ECCR :: Bits 32 = flash_eccr
  { flash_eccr_eccd      :: Bit      -- ECC detection
  , flash_eccr_eccc      :: Bit      -- ECC correction
  , _                  :: Bits 5   -- (Reserved)
  , flash_eccr_eccie     :: Bit      -- ECC correction interrupt enable
  , _                  :: Bits 3   -- (Reserved)
  , flash_eccr_sysf_ecc  :: Bit      -- System Flash ECC fail
  , flash_eccr_bk_ecc    :: Bit      -- ECC fail bank
  , flash_eccr_addr_ecc  :: Bits 19  -- ECC fail address
  }
|]
flash_reg_eccr :: BitDataReg FLASH_ECCR
flash_reg_eccr = mkBitDataRegNamed (flash_periph_base + 0x18) "eccr"

-- Flash option register
--  | offset : 0x20
--  | address: 0x40022020
[ivory|
 bitdata FLASH_OPTR :: Bits 32 = flash_optr
  { _                    :: Bits 6   -- (Reserved)
  , flash_optr_sram2_rst   :: Bit      -- SRAM2 Erase when system reset
  , flash_optr_sram2_pe    :: Bit      -- SRAM2 parity check enable
  , flash_optr_nboot1      :: Bit      -- Boot configuration
  , _                    :: Bit      -- (Reserved)
  , flash_optr_dualbank    :: Bit      -- Dual-Bank on 512 KB or 256 KB Flash memory devices
  , flash_optr_bfb2        :: Bit      -- Dual-bank boot
  , flash_optr_wwdg_sw     :: Bit      -- Window watchdog selection
  , flash_optr_iwdg_stdby  :: Bit      -- Independent watchdog counter freeze in Standby mode
  , flash_optr_iwdg_stop   :: Bit      -- Independent watchdog counter freeze in Stop mode
  , flash_optr_idwg_sw     :: Bit      -- Independent watchdog selection
  , _                    :: Bits 2   -- (Reserved)
  , flash_optr_nrst_stdby  :: Bit      -- nRST_STDBY
  , flash_optr_nrst_stop   :: Bit      -- nRST_STOP
  , _                    :: Bit      -- (Reserved)
  , flash_optr_bor_lev     :: Bits 3   -- BOR reset Level
  , flash_optr_rdp         :: Bits 8   -- Read protection level
  }
|]
flash_reg_optr :: BitDataReg FLASH_OPTR
flash_reg_optr = mkBitDataRegNamed (flash_periph_base + 0x20) "optr"

-- Flash Bank 1 PCROP Start address register
--  | offset : 0x24
--  | address: 0x40022024
[ivory|
 bitdata FLASH_PCROP1SR :: Bits 32 = flash_pcrop1sr
  { _                         :: Bits 16  -- (Reserved)
  , flash_pcrop1sr_pcrop1_strt  :: Bits 16  -- Bank 1 PCROP area start offset
  }
|]
flash_reg_pcrop1sr :: BitDataReg FLASH_PCROP1SR
flash_reg_pcrop1sr = mkBitDataRegNamed (flash_periph_base + 0x24) "pcrop1sr"

-- Flash Bank 1 PCROP End address register
--  | offset : 0x28
--  | address: 0x40022028
[ivory|
 bitdata FLASH_PCROP1ER :: Bits 32 = flash_pcrop1er
  { flash_pcrop1er_pcrop_rdp   :: Bit      -- PCROP area preserved when RDP level decreased
  , _                        :: Bits 15  -- (Reserved)
  , flash_pcrop1er_pcrop1_end  :: Bits 16  -- Bank 1 PCROP area end offset
  }
|]
flash_reg_pcrop1er :: BitDataReg FLASH_PCROP1ER
flash_reg_pcrop1er = mkBitDataRegNamed (flash_periph_base + 0x28) "pcrop1er"

-- Flash Bank 1 WRP area A address register
--  | offset : 0x2c
--  | address: 0x4002202c
[ivory|
 bitdata FLASH_WRP1AR :: Bits 32 = flash_wrp1ar
  { _                      :: Bits 8   -- (Reserved)
  , flash_wrp1ar_wrp1a_end   :: Bits 8   -- Bank 1 WRP first area A end offset
  , _                      :: Bits 8   -- (Reserved)
  , flash_wrp1ar_wrp1a_strt  :: Bits 8   -- Bank 1 WRP first area tart offset
  }
|]
flash_reg_wrp1ar :: BitDataReg FLASH_WRP1AR
flash_reg_wrp1ar = mkBitDataRegNamed (flash_periph_base + 0x2c) "wrp1ar"

-- Flash Bank 1 WRP area B address register
--  | offset : 0x30
--  | address: 0x40022030
[ivory|
 bitdata FLASH_WRP1BR :: Bits 32 = flash_wrp1br
  { _                      :: Bits 8   -- (Reserved)
  , flash_wrp1br_wrp1b_strt  :: Bits 8   -- Bank 1 WRP second area B end offset
  , _                      :: Bits 8   -- (Reserved)
  , flash_wrp1br_wrp1b_end   :: Bits 8   -- Bank 1 WRP second area B start offset
  }
|]
flash_reg_wrp1br :: BitDataReg FLASH_WRP1BR
flash_reg_wrp1br = mkBitDataRegNamed (flash_periph_base + 0x30) "wrp1br"

-- Flash Bank 2 PCROP Start address register
--  | offset : 0x44
--  | address: 0x40022044
[ivory|
 bitdata FLASH_PCROP2SR :: Bits 32 = flash_pcrop2sr
  { _                         :: Bits 16  -- (Reserved)
  , flash_pcrop2sr_pcrop2_strt  :: Bits 16  -- Bank 2 PCROP area start offset
  }
|]
flash_reg_pcrop2sr :: BitDataReg FLASH_PCROP2SR
flash_reg_pcrop2sr = mkBitDataRegNamed (flash_periph_base + 0x44) "pcrop2sr"

-- Flash Bank 2 PCROP End address register
--  | offset : 0x48
--  | address: 0x40022048
[ivory|
 bitdata FLASH_PCROP2ER :: Bits 32 = flash_pcrop2er
  { _                        :: Bits 16  -- (Reserved)
  , flash_pcrop2er_pcrop2_end  :: Bits 16  -- Bank 2 PCROP area end offset
  }
|]
flash_reg_pcrop2er :: BitDataReg FLASH_PCROP2ER
flash_reg_pcrop2er = mkBitDataRegNamed (flash_periph_base + 0x48) "pcrop2er"

-- Flash Bank 2 WRP area A address register
--  | offset : 0x4c
--  | address: 0x4002204c
[ivory|
 bitdata FLASH_WRP2AR :: Bits 32 = flash_wrp2ar
  { _                      :: Bits 8   -- (Reserved)
  , flash_wrp2ar_wrp2a_end   :: Bits 8   -- Bank 2 WRP first area A end offset
  , _                      :: Bits 8   -- (Reserved)
  , flash_wrp2ar_wrp2a_strt  :: Bits 8   -- Bank 2 WRP first area A start offset
  }
|]
flash_reg_wrp2ar :: BitDataReg FLASH_WRP2AR
flash_reg_wrp2ar = mkBitDataRegNamed (flash_periph_base + 0x4c) "wrp2ar"

-- Flash Bank 2 WRP area B address register
--  | offset : 0x50
--  | address: 0x40022050
[ivory|
 bitdata FLASH_WRP2BR :: Bits 32 = flash_wrp2br
  { _                      :: Bits 8   -- (Reserved)
  , flash_wrp2br_wrp2b_end   :: Bits 8   -- Bank 2 WRP second area B end offset
  , _                      :: Bits 8   -- (Reserved)
  , flash_wrp2br_wrp2b_strt  :: Bits 8   -- Bank 2 WRP second area B start offset
  }
|]
flash_reg_wrp2br :: BitDataReg FLASH_WRP2BR
flash_reg_wrp2br = mkBitDataRegNamed (flash_periph_base + 0x50) "wrp2br"

