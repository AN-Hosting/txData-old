fx_version 'cerulean'
game 'gta5'

author 'Paris Horizon'
description 'Système de braquage d\'ATM'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

lua54 'yes'