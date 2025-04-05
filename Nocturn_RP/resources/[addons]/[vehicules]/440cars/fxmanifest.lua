--[[-- Resource Metadata
fx_version 'adamant'
game 'gta5'
description ''
author ''

files {
    'data/**/*.meta',
    'data/**/*.xml',
    'data/**/*.dat',
    'data/**/*.ytyp'
    
}


data_file 'HANDLING_FILE'                   'data/**/handling*.meta'
data_file 'VEHICLE_LAYOUTS_FILE'            'data/**/vehiclelayouts*.meta'
data_file 'VEHICLE_METADATA_FILE'           'data/**/vehicles*.meta'
data_file 'CARCOLS_FILE'                    'data/**/carcols*.meta'
data_file 'VEHICLE_VARIATION_FILE'          'data/**/carvariations*.meta'
data_file 'CONTENT_UNLOCKING_META_FILE'     'data/**/*unlocks.meta'
data_file 'PTFXASSETINFO_FILE'              'data/**/ptfxassetinfo.meta'

-- client_scripts {
--     'vehicle_names.lua',
-- }

-- server_script 'server.lua']]

-- Resource Metadata
fx_version 'cerulean'
game 'gta5'

author 'PLOKMJNB#8692'
description 'A single resource car pack to eliminate the rest'
repository 'https://github.com/PLOKMJNB/FiveM-Civ-Car-Pack'

files {
    'data/**/*.meta',
    'data/**/*.xml',
    'data/**/*.dat',
    'data/**/*.ytyp',
    'audioconfig/*.dat151.rel',
	'audioconfig/*.dat54.rel',
	'sfx/**/*.awc'
}


data_file 'HANDLING_FILE'            'data/**/handling*.meta'
data_file 'VEHICLE_LAYOUTS_FILE'    'data/**/vehiclelayouts*.meta'
data_file 'VEHICLE_METADATA_FILE'    'data/**/vehicles*.meta'
data_file 'CARCOLS_FILE'            'data/**/carcols*.meta'
data_file 'VEHICLE_VARIATION_FILE'    'data/**/carvariations*.meta'
data_file 'CONTENT_UNLOCKING_META_FILE' 'data/**/*unlocks.meta'
data_file 'PTFXASSETINFO_FILE' 'data/**/ptfxassetinfo.meta'


data_file 'AUDIO_GAMEDATA' 'audioconfig/bmws55_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/bmws55_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_bmws55'

client_scripts {
    'vehicle_names.lua',
}
