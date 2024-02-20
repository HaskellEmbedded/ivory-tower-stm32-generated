module Ivory.BSP.STM32F429.ETH
  ( eth
  ) where

import Ivory.Language
import Ivory.HW

import Ivory.BSP.STM32F429.AF
import Ivory.BSP.STM32F429.RCC
import Ivory.BSP.STM32F429.MemoryMap
import qualified Ivory.BSP.STM32F429.Interrupt as F429

import Ivory.BSP.STM32.AF
import Ivory.BSP.STM32.Peripheral.ETH

ethdma :: ETHDMA
ethdma = mkETHDMA ethernet_dma_periph_base

mac :: MAC
mac =
  mkMAC
    ethernet_mac_periph_base
    rccenable
    rccdisable
    rccrxenable
    rccrxdisable
    rcctxenable
    rcctxdisable
    F429.ETH
  where
  rccenable    = modifyReg rcc_reg_ahb1enr $ setBit   rcc_ahb1enr_ethmacen
  rccdisable   = modifyReg rcc_reg_ahb1enr $ clearBit rcc_ahb1enr_ethmacen
  rccrxenable  = modifyReg rcc_reg_ahb1enr $ setBit   rcc_ahb1enr_ethmacrxen
  rccrxdisable = modifyReg rcc_reg_ahb1enr $ clearBit rcc_ahb1enr_ethmacrxen
  rcctxenable  = modifyReg rcc_reg_ahb1enr $ setBit   rcc_ahb1enr_ethmactxen
  rcctxdisable = modifyReg rcc_reg_ahb1enr $ clearBit rcc_ahb1enr_ethmactxen

mmc :: MMC
mmc = mkMMC ethernet_mmc_periph_base

ptp :: PTP
ptp =
  mkPTP
    ethernet_mmc_periph_base
    rccenable
    rccdisable
  where
  rccenable    = modifyReg rcc_reg_ahb1enr $ setBit   rcc_ahb1enr_ethmacptpen
  rccdisable   = modifyReg rcc_reg_ahb1enr $ clearBit rcc_ahb1enr_ethmacptpen

eth :: ETH
eth =
  mkETH
    ethdma
    mac
    mmc
    ptp
    (\pin -> findAFByPin pin "ETH" afDB)
