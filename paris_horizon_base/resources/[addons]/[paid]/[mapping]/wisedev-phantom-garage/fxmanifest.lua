fx_version 'cerulean'
game 'gta5'
lua54 'yes'

this_is_a_map 'yes'

description 'Phantom  Mechanic MLO -Wise Development'
version '1.0.0'

files {
    'interiorproxies.meta',
    'audio/subham_driveline_door_audio_game.dat151.rel',
}

client_script {
    "subham_driveline_entities.lua"  -- Used to load entities from entity sets
}





data_file 'AUDIO_GAMEDATA' 'audio/subham_driveline_door_audio_game.dat'  -- Door audio file
data_file 'DLC_ITYP_REQUEST' 'stream/YTYP/subham_driveline_int.ytyp'  -- Ensures YTYP is loaded properly
data_file 'INTERIOR_PROXY_ORDER_FILE' 'interiorproxies.meta' -- Loads YMAP if relevant to interior setups
data_file 'DLC_ITYP_REQUEST' 'stream/YTYP/phantom_garage.ytyp'

escrow_ignore {
    'stream/YTD/*.ytd',

}