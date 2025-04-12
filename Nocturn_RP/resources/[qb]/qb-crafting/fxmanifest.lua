fx_version 'cerulean'
game 'gta5'

author 'NocturnRP'
description 'Système de craft pour QBCore'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/fr.lua',
    'shared/config.lua',
    'shared/configs/*.lua'
}

client_script 'client.lua'
server_script 'server.lua'

dependencies {
    'qb-core',
    'qb-target',
    'qb-menu',
    'qb-input'
}

lua54 'yes'
