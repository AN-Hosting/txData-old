client_script "@ThnAC/natives.lua"
client_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"
lua54 'yes'

fx_version 'cerulean'
game 'gta5'

this_is_a_map 'yes'

files {
    'meta/weaponanimations.meta'
}

client_script 'meta/*.lua'


data_file "INTERIOR_PROXY_ORDER_FILE" "meta/interiorproxies.meta"

data_file 'WEAPON_ANIMATIONS_FILE' 'meta/weaponanimations.meta'

data_file "DLC_ITYP_REQUEST" "stream/NoxInteriores/NoxCreative/creative_props.ytyp"              
data_file "DLC_ITYP_REQUEST" "stream/NoxMapas/NoxFood/mah_burger.ytyp"        