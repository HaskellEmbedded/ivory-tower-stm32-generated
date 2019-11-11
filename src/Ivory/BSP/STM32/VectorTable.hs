{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE RankNTypes #-}

module Ivory.BSP.STM32.VectorTable
  ( vector_table
  , reset_handler
  ) where

import Ivory.Artifact
import Ivory.Artifact.Template
import Ivory.BSP.ARMv7M.Exception
import Ivory.BSP.STM32.Interrupt
import Data.CMX
import Data.STM32

import qualified Paths_ivory_bsp_stm32 as P

import qualified Ivory.BSP.STM32F030.Interrupt as F030
import qualified Ivory.BSP.STM32F031.Interrupt as F031
import qualified Ivory.BSP.STM32F038.Interrupt as F038
import qualified Ivory.BSP.STM32F042.Interrupt as F042
import qualified Ivory.BSP.STM32F048.Interrupt as F048
import qualified Ivory.BSP.STM32F051.Interrupt as F051
import qualified Ivory.BSP.STM32F058.Interrupt as F058
import qualified Ivory.BSP.STM32F070.Interrupt as F070
import qualified Ivory.BSP.STM32F071.Interrupt as F071
import qualified Ivory.BSP.STM32F072.Interrupt as F072
import qualified Ivory.BSP.STM32F078.Interrupt as F078
import qualified Ivory.BSP.STM32F091.Interrupt as F091
import qualified Ivory.BSP.STM32F098.Interrupt as F098
import qualified Ivory.BSP.STM32F100.Interrupt as F100
import qualified Ivory.BSP.STM32F101.Interrupt as F101
import qualified Ivory.BSP.STM32F102.Interrupt as F102
import qualified Ivory.BSP.STM32F103.Interrupt as F103
import qualified Ivory.BSP.STM32F107.Interrupt as F107
import qualified Ivory.BSP.STM32F301.Interrupt as F301
import qualified Ivory.BSP.STM32F302.Interrupt as F302
import qualified Ivory.BSP.STM32F303.Interrupt as F303
import qualified Ivory.BSP.STM32F318.Interrupt as F318
import qualified Ivory.BSP.STM32F328.Interrupt as F328
import qualified Ivory.BSP.STM32F334.Interrupt as F334
import qualified Ivory.BSP.STM32F358.Interrupt as F358
import qualified Ivory.BSP.STM32F373.Interrupt as F373
import qualified Ivory.BSP.STM32F378.Interrupt as F378
import qualified Ivory.BSP.STM32F398.Interrupt as F398
import qualified Ivory.BSP.STM32F401.Interrupt as F401
import qualified Ivory.BSP.STM32F405.Interrupt as F405
import qualified Ivory.BSP.STM32F407.Interrupt as F407
import qualified Ivory.BSP.STM32F410.Interrupt as F410
import qualified Ivory.BSP.STM32F411.Interrupt as F411
import qualified Ivory.BSP.STM32F412.Interrupt as F412
import qualified Ivory.BSP.STM32F413.Interrupt as F413
import qualified Ivory.BSP.STM32F427.Interrupt as F427
import qualified Ivory.BSP.STM32F429.Interrupt as F429
import qualified Ivory.BSP.STM32F446.Interrupt as F446
import qualified Ivory.BSP.STM32F469.Interrupt as F469
import qualified Ivory.BSP.STM32F722.Interrupt as F722
import qualified Ivory.BSP.STM32F723.Interrupt as F723
import qualified Ivory.BSP.STM32F730.Interrupt as F730
import qualified Ivory.BSP.STM32F732.Interrupt as F732
import qualified Ivory.BSP.STM32F733.Interrupt as F733
import qualified Ivory.BSP.STM32F745.Interrupt as F745
import qualified Ivory.BSP.STM32F746.Interrupt as F746
import qualified Ivory.BSP.STM32F750.Interrupt as F750
import qualified Ivory.BSP.STM32F756.Interrupt as F756
import qualified Ivory.BSP.STM32F765.Interrupt as F765
import qualified Ivory.BSP.STM32F767.Interrupt as F767
import qualified Ivory.BSP.STM32F768.Interrupt as F768
import qualified Ivory.BSP.STM32F769.Interrupt as F769
import qualified Ivory.BSP.STM32F777.Interrupt as F777
import qualified Ivory.BSP.STM32F778.Interrupt as F778
import qualified Ivory.BSP.STM32F779.Interrupt as F779
import qualified Ivory.BSP.STM32G030.Interrupt as G030
import qualified Ivory.BSP.STM32G031.Interrupt as G031
import qualified Ivory.BSP.STM32G041.Interrupt as G041
import qualified Ivory.BSP.STM32G070.Interrupt as G070
import qualified Ivory.BSP.STM32G071.Interrupt as G071
import qualified Ivory.BSP.STM32G081.Interrupt as G081
import qualified Ivory.BSP.STM32G431.Interrupt as G431
import qualified Ivory.BSP.STM32G441.Interrupt as G441
import qualified Ivory.BSP.STM32G471.Interrupt as G471
import qualified Ivory.BSP.STM32G473.Interrupt as G473
import qualified Ivory.BSP.STM32G474.Interrupt as G474
import qualified Ivory.BSP.STM32G483.Interrupt as G483
import qualified Ivory.BSP.STM32G484.Interrupt as G484
import qualified Ivory.BSP.STM32L412.Interrupt as L412
import qualified Ivory.BSP.STM32L422.Interrupt as L422
import qualified Ivory.BSP.STM32L431.Interrupt as L431
import qualified Ivory.BSP.STM32L432.Interrupt as L432
import qualified Ivory.BSP.STM32L433.Interrupt as L433
import qualified Ivory.BSP.STM32L442.Interrupt as L442
import qualified Ivory.BSP.STM32L443.Interrupt as L443
import qualified Ivory.BSP.STM32L451.Interrupt as L451
import qualified Ivory.BSP.STM32L452.Interrupt as L452
import qualified Ivory.BSP.STM32L462.Interrupt as L462
import qualified Ivory.BSP.STM32L471.Interrupt as L471
import qualified Ivory.BSP.STM32L475.Interrupt as L475
import qualified Ivory.BSP.STM32L476.Interrupt as L476
import qualified Ivory.BSP.STM32L485.Interrupt as L485
import qualified Ivory.BSP.STM32L486.Interrupt as L486
import qualified Ivory.BSP.STM32L496.Interrupt as L496
import qualified Ivory.BSP.STM32L4A6.Interrupt as L4A6
import qualified Ivory.BSP.STM32L4R5.Interrupt as L4R5
import qualified Ivory.BSP.STM32L4R7.Interrupt as L4R7
import qualified Ivory.BSP.STM32L4R9.Interrupt as L4R9
import qualified Ivory.BSP.STM32L4S5.Interrupt as L4S5
import qualified Ivory.BSP.STM32L4S7.Interrupt as L4S7
import qualified Ivory.BSP.STM32L4S9.Interrupt as L4S9

byDevice :: (STM32DevName, MCU) -> [(String, String)]
byDevice (n, _d) | shortName n == "F030" = attrs F030.WWDG
byDevice (n, _d) | shortName n == "F031" = attrs F031.WWDG
byDevice (n, _d) | shortName n == "F038" = attrs F038.WWDG
byDevice (n, _d) | shortName n == "F042" = attrs F042.WWDG
byDevice (n, _d) | shortName n == "F048" = attrs F048.WWDG
byDevice (n, _d) | shortName n == "F051" = attrs F051.WWDG
byDevice (n, _d) | shortName n == "F058" = attrs F058.WWDG
byDevice (n, _d) | shortName n == "F070" = attrs F070.WWDG
byDevice (n, _d) | shortName n == "F071" = attrs F071.WWDG
byDevice (n, _d) | shortName n == "F072" = attrs F072.WWDG
byDevice (n, _d) | shortName n == "F078" = attrs F078.WWDG
byDevice (n, _d) | shortName n == "F091" = attrs F091.WWDG
byDevice (n, _d) | shortName n == "F098" = attrs F098.WWDG
byDevice (n, _d) | shortName n == "F100" = attrs F100.WWDG
byDevice (n, _d) | shortName n == "F101" = attrs F101.WWDG
byDevice (n, _d) | shortName n == "F102" = attrs F102.WWDG
byDevice (n, _d) | shortName n == "F103" = attrs F103.WWDG
byDevice (n, _d) | shortName n == "F107" = attrs F107.WWDG
byDevice (n, _d) | shortName n == "F301" = attrs F301.WWDG
byDevice (n, _d) | shortName n == "F302" = attrs F302.WWDG
byDevice (n, _d) | shortName n == "F303" = attrs F303.WWDG
byDevice (n, _d) | shortName n == "F318" = attrs F318.WWDG
byDevice (n, _d) | shortName n == "F328" = attrs F328.WWDG
byDevice (n, _d) | shortName n == "F334" = attrs F334.WWDG
byDevice (n, _d) | shortName n == "F358" = attrs F358.WWDG
byDevice (n, _d) | shortName n == "F373" = attrs F373.WWDG
byDevice (n, _d) | shortName n == "F378" = attrs F378.WWDG
byDevice (n, _d) | shortName n == "F398" = attrs F398.WWDG
byDevice (n, _d) | shortName n == "F401" = attrs F401.WWDG
byDevice (n, _d) | shortName n == "F405" = attrs F405.WWDG
byDevice (n, _d) | shortName n == "F407" = attrs F407.WWDG
byDevice (n, _d) | shortName n == "F410" = attrs F410.WWDG
byDevice (n, _d) | shortName n == "F411" = attrs F411.WWDG
byDevice (n, _d) | shortName n == "F412" = attrs F412.WWDG
byDevice (n, _d) | shortName n == "F413" = attrs F413.WWDG
byDevice (n, _d) | shortName n == "F427" = attrs F427.WWDG
byDevice (n, _d) | shortName n == "F429" = attrs F429.WWDG
byDevice (n, _d) | shortName n == "F446" = attrs F446.WWDG
byDevice (n, _d) | shortName n == "F469" = attrs F469.WWDG
byDevice (n, _d) | shortName n == "F722" = attrs F722.WWDG
byDevice (n, _d) | shortName n == "F723" = attrs F723.WWDG
byDevice (n, _d) | shortName n == "F730" = attrs F730.WWDG
byDevice (n, _d) | shortName n == "F732" = attrs F732.WWDG
byDevice (n, _d) | shortName n == "F733" = attrs F733.WWDG
byDevice (n, _d) | shortName n == "F745" = attrs F745.WWDG
byDevice (n, _d) | shortName n == "F746" = attrs F746.WWDG
byDevice (n, _d) | shortName n == "F750" = attrs F750.WWDG
byDevice (n, _d) | shortName n == "F756" = attrs F756.WWDG
byDevice (n, _d) | shortName n == "F765" = attrs F765.WWDG
byDevice (n, _d) | shortName n == "F767" = attrs F767.WWDG
byDevice (n, _d) | shortName n == "F768" = attrs F768.WWDG
byDevice (n, _d) | shortName n == "F769" = attrs F769.WWDG
byDevice (n, _d) | shortName n == "F777" = attrs F777.WWDG
byDevice (n, _d) | shortName n == "F778" = attrs F778.WWDG
byDevice (n, _d) | shortName n == "F779" = attrs F779.WWDG
byDevice (n, _d) | shortName n == "G030" = attrs G030.WWDG
byDevice (n, _d) | shortName n == "G031" = attrs G031.WWDG
byDevice (n, _d) | shortName n == "G041" = attrs G041.WWDG
byDevice (n, _d) | shortName n == "G070" = attrs G070.WWDG
byDevice (n, _d) | shortName n == "G071" = attrs G071.WWDG
byDevice (n, _d) | shortName n == "G081" = attrs G081.WWDG
byDevice (n, _d) | shortName n == "G431" = attrs G431.WWDG
byDevice (n, _d) | shortName n == "G441" = attrs G441.WWDG
byDevice (n, _d) | shortName n == "G471" = attrs G471.WWDG
byDevice (n, _d) | shortName n == "G473" = attrs G473.WWDG
byDevice (n, _d) | shortName n == "G474" = attrs G474.WWDG
byDevice (n, _d) | shortName n == "G483" = attrs G483.WWDG
byDevice (n, _d) | shortName n == "G484" = attrs G484.WWDG
byDevice (n, _d) | shortName n == "L412" = attrs L412.WWDG
byDevice (n, _d) | shortName n == "L422" = attrs L422.WWDG
byDevice (n, _d) | shortName n == "L431" = attrs L431.WWDG
byDevice (n, _d) | shortName n == "L432" = attrs L432.WWDG
byDevice (n, _d) | shortName n == "L433" = attrs L433.WWDG
byDevice (n, _d) | shortName n == "L442" = attrs L442.WWDG
byDevice (n, _d) | shortName n == "L443" = attrs L443.WWDG
byDevice (n, _d) | shortName n == "L451" = attrs L451.WWDG
byDevice (n, _d) | shortName n == "L452" = attrs L452.WWDG
byDevice (n, _d) | shortName n == "L462" = attrs L462.WWDG
byDevice (n, _d) | shortName n == "L471" = attrs L471.WWDG
byDevice (n, _d) | shortName n == "L475" = attrs L475.WWDG
byDevice (n, _d) | shortName n == "L476" = attrs L476.WWDG
byDevice (n, _d) | shortName n == "L485" = attrs L485.WWDG
byDevice (n, _d) | shortName n == "L486" = attrs L486.WWDG
byDevice (n, _d) | shortName n == "L496" = attrs L496.WWDG
byDevice (n, _d) | shortName n == "L4A6" = attrs L4A6.WWDG
byDevice (n, _d) | shortName n == "L4R5" = attrs L4R5.WWDG
byDevice (n, _d) | shortName n == "L4R7" = attrs L4R7.WWDG
byDevice (n, _d) | shortName n == "L4R9" = attrs L4R9.WWDG
byDevice (n, _d) | shortName n == "L4S5" = attrs L4S5.WWDG
byDevice (n, _d) | shortName n == "L4S7" = attrs L4S7.WWDG
byDevice (n, _d) | shortName n == "L4S9" = attrs L4S9.WWDG
byDevice (n, _d) = error $ "Device not supported" ++ show n

reset_handler :: String
reset_handler = exceptionHandlerName Reset

vector_table :: (STM32DevName, MCU) -> Located Artifact
vector_table x =
  Src $ artifactCabalFileTemplate P.getDataDir fname (byDevice x)
  where
  fname = "support/vector_table.s.template"

attrs :: forall i . (STM32Interrupt i) => i -> [(String, String)]
attrs i = [ ("entries", entries)
          , ("weakdefs", weakdefs)
          , ("reset_handler", reset_handler)
          ]
  where
  itable :: [Maybe i]
  itable = interruptTable i
  entries = unlines $
    map (entry . (fmap exceptionHandlerName)) exceptionTable ++
    map (entry . (fmap interruptHandlerName)) itable
  weakdefs = unlines $
    map (weakdef . (fmap exceptionHandlerName)) (drop 1 exceptionTable) ++
    map (weakdef . (fmap interruptHandlerName)) itable

  entry (Just e) = "\t.word " ++ e
  entry Nothing  = "\t.word 0"
  weakdef (Just handler) = "\t.weak " ++ handler ++
    "\n\t.thumb_set " ++ handler ++ ",defaultExceptionHandler\n"
  weakdef Nothing = ""
