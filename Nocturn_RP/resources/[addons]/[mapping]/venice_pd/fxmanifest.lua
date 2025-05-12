fx_version "cerulean"
lua54 "yes"

game 'gta5'

this_is_a_map 'yes'



dependency '/assetpacks'

author 'Bigpax Modz'
description 'MRPD at Vespucci'
version '1.0.0'

this_is_a_map 'yes'


data_file 'TIMECYCLEMOD_FILE' 'gabz_mrpd_timecycle.xml'
data_file 'INTERIOR_PROXY_ORDER_FILE' 'interiorproxies.meta'

files {
	'gabz_mrpd_timecycle.xml',
	'interiorproxies.meta'
}

client_script {
    "gabz_mrpd_entitysets.lua",
    "gabz_mrpd_entitysets2.lua"
}
dependency '/assetpacks'