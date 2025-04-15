fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'config.lua'
}
server_script 'server/*.lua'
client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/*.lua'
}
