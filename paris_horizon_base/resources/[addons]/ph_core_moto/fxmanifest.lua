fx_version 'cerulean'
game 'gta5'


files {
	'data/**/carcols.meta',
	'data/**/carvariations.meta',
	'data/**/handling.meta',
	'data/**/vehiclelayouts.meta',
	'data/**/vehicles.meta',
	'data/**/dlctext.meta',
	'audioconfig/*.dat151.rel',
	'audioconfig/*.dat54.rel',
	'sfx/**/*.awc'
}

data_file 'HANDLING_FILE' 'data/**/handling.meta'
data_file 'DLC_TEXT_FILE' 'data/**/dlctext.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/**/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/**/carvariations.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/**/vehiclelayouts.meta'
data_file 'AUDIO_GAMEDATA' 'audioconfig/batic_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/batic_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_batic'

client_scripts {
    'vehicle_names.lua',
}