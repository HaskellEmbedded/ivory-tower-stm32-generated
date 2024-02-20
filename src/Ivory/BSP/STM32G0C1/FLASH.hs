{-# LANGUAGE DataKinds #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TypeFamilies #-}

module Ivory.BSP.STM32G0C1.FLASH where

import Ivory.Language
import Ivory.HW
import Ivory.BSP.STM32G0C1.MemoryMap (flash_periph_base)

-- FLASH Flash

-- Base address: 0x40022000

-- Access control register
--  | offset : 0x0
--  | address: 0x40022000
[ivory|
 bitdata FLASH_ACR :: Bits 32 = flash_acr
  { _                 :: Bits 13  -- (Reserved)
  , flash_acr_dbg_swen  :: Bit      -- Debug access software enable
  , _                 :: Bit      -- (Reserved)
  , flash_acr_empty     :: Bit      -- Flash User area empty
  , _                 :: Bits 4   -- (Reserved)
  , flash_acr_icrst     :: Bit      -- Instruction cache reset
  , _                 :: Bit      -- (Reserved)
  , flash_acr_icen      :: Bit      -- Instruction cache enable
  , flash_acr_prften    :: Bit      -- Prefetch enable
  , _                 :: Bits 5   -- (Reserved)
  , flash_acr_latency   :: Bits 3   -- Latency
  }
|]
flash_reg_acr :: BitDataReg FLASH_ACR
flash_reg_acr = mkBitDataRegNamed (flash_periph_base + 0x0) "acr"

-- Flash key register
--  | offset : 0x8
--  | address: 0x40022008
[ivory|
 bitdata FLASH_KEYR :: Bits 32 = flash_keyr
  { flash_keyr_key  :: Bits 32  -- KEYR
  }
|]
flash_reg_keyr :: BitDataReg FLASH_KEYR
flash_reg_keyr = mkBitDataRegNamed (flash_periph_base + 0x8) "keyr"

-- Option byte key register
--  | offset : 0xc
--  | address: 0x4002200c
[ivory|
 bitdata FLASH_OPTKEYR :: Bits 32 = flash_optkeyr
  { flash_optkeyr_optkey  :: Bits 32  -- Option byte key
  }
|]
flash_reg_optkeyr :: BitDataReg FLASH_OPTKEYR
flash_reg_optkeyr = mkBitDataRegNamed (flash_periph_base + 0xc) "optkeyr"

-- Status register
--  | offset : 0x10
--  | address: 0x40022010
[ivory|
 bitdata FLASH_SR :: Bits 32 = flash_sr
  { _               :: Bits 13  -- (Reserved)
  , flash_sr_cfgbsy   :: Bit      -- Programming or erase configuration busy.
  , _               :: Bit      -- (Reserved)
  , flash_sr_bsy      :: Bit      -- Busy
  , flash_sr_optverr  :: Bit      -- Option and Engineering bits loading validity error
  , flash_sr_rderr    :: Bit      -- PCROP read error
  , _               :: Bits 4   -- (Reserved)
  , flash_sr_fasterr  :: Bit      -- Fast programming error
  , flash_sr_misserr  :: Bit      -- Fast programming data miss error
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
  , _                  :: Bit      -- (Reserved)
  , flash_cr_sec_prot    :: Bit      -- Securable memory area protection enable
  , flash_cr_obl_launch  :: Bit      -- Force the option byte loading
  , flash_cr_rderrie     :: Bit      -- PCROP read error interrupt enable
  , flash_cr_errie       :: Bit      -- Error interrupt enable
  , flash_cr_eopie       :: Bit      -- End of operation interrupt enable
  , _                  :: Bits 5   -- (Reserved)
  , flash_cr_fstpg       :: Bit      -- Fast programming
  , flash_cr_optstrt     :: Bit      -- Options modification start
  , flash_cr_strt        :: Bit      -- Start
  , _                  :: Bits 7   -- (Reserved)
  , flash_cr_pnb         :: Bits 6   -- Page number
  , flash_cr_mer         :: Bit      -- Mass erase
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
  , flash_eccr_sysf_ecc  :: Bit      -- ECC fail for Corrected ECC Error or Double ECC Error in info block
  , _                  :: Bits 5   -- (Reserved)
  , flash_eccr_addr_ecc  :: Bits 15  -- ECC fail address
  }
|]
flash_reg_eccr :: BitDataReg FLASH_ECCR
flash_reg_eccr = mkBitDataRegNamed (flash_periph_base + 0x18) "eccr"

-- Flash ECC register 2
--  | offset : 0x1c
--  | address: 0x4002201c
[ivory|
 bitdata FLASH_ECCR2 :: Bits 32 = flash_eccr2
  { flash_eccr2_eccd      :: Bit      -- ECC detection
  , flash_eccr2_eccc      :: Bit      -- ECC correction
  , _                   :: Bits 5   -- (Reserved)
  , flash_eccr2_eccie     :: Bit      -- ECC correction interrupt enable
  , _                   :: Bits 3   -- (Reserved)
  , flash_eccr2_sysf_ecc  :: Bit      -- ECC fail for Corrected ECC Error or Double ECC Error in info block
  , _                   :: Bits 5   -- (Reserved)
  , flash_eccr2_addr_ecc  :: Bits 15  -- ECC fail address
  }
|]
flash_reg_eccr2 :: BitDataReg FLASH_ECCR2
flash_reg_eccr2 = mkBitDataRegNamed (flash_periph_base + 0x1c) "eccr2"

-- Flash option register
--  | offset : 0x20
--  | address: 0x40022020
[ivory|
 bitdata FLASH_OPTR :: Bits 32 = flash_optr
  { _                          :: Bits 2   -- (Reserved)
  , flash_optr_irhen             :: Bit      -- Internal reset holder enable bit
  , flash_optr_nrst_mode         :: Bits 2   -- NRST_MODE
  , flash_optr_nboot0            :: Bit      -- nBOOT0 option bit
  , flash_optr_nboot1            :: Bit      -- Boot configuration
  , flash_optr_nboot_sel         :: Bit      -- nBOOT_SEL
  , _                          :: Bit      -- (Reserved)
  , flash_optr_ram_parity_check  :: Bit      -- SRAM parity check control
  , _                          :: Bits 2   -- (Reserved)
  , flash_optr_wwdg_sw           :: Bit      -- Window watchdog selection
  , flash_optr_iwdg_stdby        :: Bit      -- Independent watchdog counter freeze in Standby mode
  , flash_optr_iwdg_stop         :: Bit      -- Independent watchdog counter freeze in Stop mode
  , flash_optr_iwdg_sw           :: Bit      -- Independent watchdog selection
  , flash_optr_nrsts_hdw         :: Bit      -- nRSTS_HDW
  , flash_optr_nrst_stdby        :: Bit      -- nRST_STDBY
  , flash_optr_nrst_stop         :: Bit      -- nRST_STOP
  , flash_optr_borr_lev          :: Bits 2   -- These bits contain the VDD supply level threshold that releases the reset.
  , flash_optr_borf_lev          :: Bits 2   -- These bits contain the VDD supply level threshold that activates the reset
  , flash_optr_boren             :: Bit      -- BOR reset Level
  , flash_optr_rdp               :: Bits 8   -- Read protection level
  }
|]
flash_reg_optr :: BitDataReg FLASH_OPTR
flash_reg_optr = mkBitDataRegNamed (flash_periph_base + 0x20) "optr"

-- Flash PCROP zone A Start address register
--  | offset : 0x24
--  | address: 0x40022024
[ivory|
 bitdata FLASH_PCROP1ASR :: Bits 32 = flash_pcrop1asr
  { _                           :: Bits 24  -- (Reserved)
  , flash_pcrop1asr_pcrop1a_strt  :: Bits 8   -- PCROP1A area start offset
  }
|]
flash_reg_pcrop1asr :: BitDataReg FLASH_PCROP1ASR
flash_reg_pcrop1asr = mkBitDataRegNamed (flash_periph_base + 0x24) "pcrop1asr"

-- Flash PCROP zone A End address register
--  | offset : 0x28
--  | address: 0x40022028
[ivory|
 bitdata FLASH_PCROP1AER :: Bits 32 = flash_pcrop1aer
  { flash_pcrop1aer_pcrop_rdp    :: Bit      -- PCROP area preserved when RDP level decreased
  , _                          :: Bits 23  -- (Reserved)
  , flash_pcrop1aer_pcrop1a_end  :: Bits 8   -- PCROP1A area end offset
  }
|]
flash_reg_pcrop1aer :: BitDataReg FLASH_PCROP1AER
flash_reg_pcrop1aer = mkBitDataRegNamed (flash_periph_base + 0x28) "pcrop1aer"

-- Flash WRP area A address register
--  | offset : 0x2c
--  | address: 0x4002202c
[ivory|
 bitdata FLASH_WRP1AR :: Bits 32 = flash_wrp1ar
  { _                      :: Bits 10  -- (Reserved)
  , flash_wrp1ar_wrp1a_end   :: Bits 6   -- WRP area A end offset
  , _                      :: Bits 10  -- (Reserved)
  , flash_wrp1ar_wrp1a_strt  :: Bits 6   -- WRP area A start offset
  }
|]
flash_reg_wrp1ar :: BitDataReg FLASH_WRP1AR
flash_reg_wrp1ar = mkBitDataRegNamed (flash_periph_base + 0x2c) "wrp1ar"

-- Flash WRP area B address register
--  | offset : 0x30
--  | address: 0x40022030
[ivory|
 bitdata FLASH_WRP1BR :: Bits 32 = flash_wrp1br
  { _                      :: Bits 10  -- (Reserved)
  , flash_wrp1br_wrp1b_end   :: Bits 6   -- WRP area B end offset
  , _                      :: Bits 10  -- (Reserved)
  , flash_wrp1br_wrp1b_strt  :: Bits 6   -- WRP area B start offset
  }
|]
flash_reg_wrp1br :: BitDataReg FLASH_WRP1BR
flash_reg_wrp1br = mkBitDataRegNamed (flash_periph_base + 0x30) "wrp1br"

-- Flash PCROP zone B Start address register
--  | offset : 0x34
--  | address: 0x40022034
[ivory|
 bitdata FLASH_PCROP1BSR :: Bits 32 = flash_pcrop1bsr
  { _                           :: Bits 24  -- (Reserved)
  , flash_pcrop1bsr_pcrop1b_strt  :: Bits 8   -- PCROP1B area start offset
  }
|]
flash_reg_pcrop1bsr :: BitDataReg FLASH_PCROP1BSR
flash_reg_pcrop1bsr = mkBitDataRegNamed (flash_periph_base + 0x34) "pcrop1bsr"

-- Flash PCROP area B End address register
--  | offset : 0x38
--  | address: 0x40022038
[ivory|
 bitdata FLASH_PCROP1BER :: Bits 32 = flash_pcrop1ber
  { _                          :: Bits 23  -- (Reserved)
  , flash_pcrop1ber_pcrop1b_end  :: Bits 9   -- PCROP1B area end offset
  }
|]
flash_reg_pcrop1ber :: BitDataReg FLASH_PCROP1BER
flash_reg_pcrop1ber = mkBitDataRegNamed (flash_periph_base + 0x38) "pcrop1ber"

-- Flash PCROP2 area A start address register
--  | offset : 0x44
--  | address: 0x40022044
[ivory|
 bitdata FLASH_PCROP2ASR :: Bits 32 = flash_pcrop2asr
  { _                           :: Bits 23  -- (Reserved)
  , flash_pcrop2asr_pcrop2a_strt  :: Bits 9   -- PCROP2A area start offset, bank2
  }
|]
flash_reg_pcrop2asr :: BitDataReg FLASH_PCROP2ASR
flash_reg_pcrop2asr = mkBitDataRegNamed (flash_periph_base + 0x44) "pcrop2asr"

-- Flash PCROP2 area A end address register
--  | offset : 0x48
--  | address: 0x40022048
[ivory|
 bitdata FLASH_PCROP2AER :: Bits 32 = flash_pcrop2aer
  { _                          :: Bits 23  -- (Reserved)
  , flash_pcrop2aer_pcrop2a_end  :: Bits 9   -- PCROP2A area end offset, bank2
  }
|]
flash_reg_pcrop2aer :: BitDataReg FLASH_PCROP2AER
flash_reg_pcrop2aer = mkBitDataRegNamed (flash_periph_base + 0x48) "pcrop2aer"

-- Flash WRP2 area A address register
--  | offset : 0x4c
--  | address: 0x4002204c
[ivory|
 bitdata FLASH_WRP2AR :: Bits 32 = flash_wrp2ar
  { _                      :: Bits 9   -- (Reserved)
  , flash_wrp2ar_wrp2a_end   :: Bits 7   -- WRP area A end offset, Bank 2
  , _                      :: Bits 9   -- (Reserved)
  , flash_wrp2ar_wrp2a_strt  :: Bits 7   -- WRP area A start offset, Bank 2
  }
|]
flash_reg_wrp2ar :: BitDataReg FLASH_WRP2AR
flash_reg_wrp2ar = mkBitDataRegNamed (flash_periph_base + 0x4c) "wrp2ar"

-- Flash WRP2 area B address register
--  | offset : 0x50
--  | address: 0x40022050
[ivory|
 bitdata FLASH_WRP2BR :: Bits 32 = flash_wrp2br
  { _                      :: Bits 9   -- (Reserved)
  , flash_wrp2br_wrp2b_end   :: Bits 7   -- WRP area B end offset, Bank 2
  , _                      :: Bits 9   -- (Reserved)
  , flash_wrp2br_wrp2b_strt  :: Bits 7   -- WRP area B start offset, Bank 2
  }
|]
flash_reg_wrp2br :: BitDataReg FLASH_WRP2BR
flash_reg_wrp2br = mkBitDataRegNamed (flash_periph_base + 0x50) "wrp2br"

-- FLASH PCROP2 area B start address register
--  | offset : 0x54
--  | address: 0x40022054
[ivory|
 bitdata FLASH_PCROP2BSR :: Bits 32 = flash_pcrop2bsr
  { _                           :: Bits 23  -- (Reserved)
  , flash_pcrop2bsr_pcrop2b_strt  :: Bits 9   -- PCROP2B area start offset, Bank 2
  }
|]
flash_reg_pcrop2bsr :: BitDataReg FLASH_PCROP2BSR
flash_reg_pcrop2bsr = mkBitDataRegNamed (flash_periph_base + 0x54) "pcrop2bsr"

-- FLASH PCROP2 area B end address register
--  | offset : 0x58
--  | address: 0x40022058
[ivory|
 bitdata FLASH_PCROP2BER :: Bits 32 = flash_pcrop2ber
  { _                          :: Bits 23  -- (Reserved)
  , flash_pcrop2ber_pcrop2b_end  :: Bits 9   -- PCROP2B area end offset, Bank 2
  }
|]
flash_reg_pcrop2ber :: BitDataReg FLASH_PCROP2BER
flash_reg_pcrop2ber = mkBitDataRegNamed (flash_periph_base + 0x58) "pcrop2ber"

-- Flash Security register
--  | offset : 0x80
--  | address: 0x40022080
[ivory|
 bitdata FLASH_SECR :: Bits 32 = flash_secr
  { _                   :: Bits 4   -- (Reserved)
  , flash_secr_sec_size2  :: Bits 8   -- Securable memory area size
  , _                   :: Bits 3   -- (Reserved)
  , flash_secr_boot_lock  :: Bit      -- used to force boot from user area
  , _                   :: Bits 8   -- (Reserved)
  , flash_secr_sec_size   :: Bits 8   -- Securable memory area size
  }
|]
flash_reg_secr :: BitDataReg FLASH_SECR
flash_reg_secr = mkBitDataRegNamed (flash_periph_base + 0x80) "secr"

