resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

files {
    'data/vehicles.meta',  
    'data/carvariations.meta',
    'data/carcols.meta',  
    'data/handling.meta',  
    'data/vehiclelayouts_cw2019.meta', 
    'audio/cw2019_game.dat151',   
    'audio/cw2019_game.dat151.nametable', 
    'audio/cw2019_game.dat151.rel', 
    'audio/cw2019_sounds.dat54', 
    'audio/cw2019_sounds.dat54.nametable', 
    'audio/cw2019_sounds.dat54.rel',   
    'audio/sfx/dlc_cw2019/cw2019.awc', 
    'audio/sfx/dlc_cw2019/cw2019_npc.awc', 


}

data_file 'HANDLING_FILE' 'data/handling.meta'  
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'  
data_file 'CARCOLS_FILE' 'data/carcols.meta'  
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/vehiclelayouts_cw2019.meta'   


data_file 'AUDIO_GAMEDATA' 'audio/cw2019_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/cw2019_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'audio/sfx/dlc_cw2019'

client_script {
    'vehicle_names.lua'    
}




--Made by Vanilla Works--