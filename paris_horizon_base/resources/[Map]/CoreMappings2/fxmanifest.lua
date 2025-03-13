fx_version 'cerulean'
game 'gta5'

this_is_a_map 'yes'

-- Information

Author "TS"
description "CoreMap - N°2"

files {

"interiorproxies.meta",
'stream/vHopital/ocean_h_timecycle.xml',
"stream/vCayominimap/int3232302352.gfx",
'ub-maccys.ytyp',
'crossmap.ytyp',
'crossmur.ytyp',

}

client_scripts {
    'client.lua',
    'client2.lua'
  }

data_file 'INTERIOR_PROXY_ORDER_FILE' 'interiorproxies.meta'

-- Samumap

data_file 'TIMECYCLEMOD_FILE' 'stream/vHopital/ocean_h_timecycle.xml'
data_file 'SCALEFORM_DLC_FILE' 'stream/vHopital/minimap/int164437691.gfx'
data_file 'SCALEFORM_DLC_FILE' 'stream/vHopital/minimap/int1855188787.gfx'
data_file 'SCALEFORM_DLC_FILE' 'stream/vHopital/minimap/int1975778630.gfx'
data_file 'SCALEFORM_DLC_FILE' 'stream/vHopital/minimap/int2439777779.gfx'
data_file 'SCALEFORM_DLC_FILE' 'stream/vHopital/minimap/int2574468285.gfx'
data_file 'SCALEFORM_DLC_FILE' 'stream/vHopital/minimap/int3680022772.gfx'

-- Cayominimap

data_file "SCALEFORM_DLC_FILE" "stream/vCayominimap/int3232302352.gfx"

-- Peage

data_file 'DLC_ITYP_REQUEST' 'stream/vPeage/peage.ytyp'

-- Justice
data_file 'DLC_ITYP_REQUEST' 'stream/vJusticemap/cs4_09_long_0.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/vJusticemap/texte_tribunal.ytyp'

-- Dir

data_file 'DLC_ITYP_REQUEST' 'stream/vDir/panneau_dir2023.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/vDir/dir.ytyp'

-- Propsmap

data_file 'DLC_ITYP_REQUEST' 'stream/vPropsmap/watermonitor.ytyp'

-- Vigneron

data_file "DLC_ITYP_REQUEST" "stream/vVigneron/DomainePaoli.ytyp"

-- Props Dodane

data_file "DLC_ITYP_REQUEST" "stream/Props_Dodane/edr_do.ytyp"

-- Macdo
data_file 'DLC_ITYP_REQUEST' 'ub-maccys.ytyp'

