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
    'data/**/*.ytyp'
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
data_file 'AUDIO_GAMEDATA' 'audioconfig/tacumminsb_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/tacumminsb_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_tacumminsb'
data_file 'AUDIO_GAMEDATA' 'audioconfig/s63b44_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/s63b44_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_s63b44'
data_file 'AUDIO_GAMEDATA' 'audioconfig/aq67merm177_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/aq67merm177_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_aq67merm177'

client_scripts {
    'vehicle_names.lua',
}
