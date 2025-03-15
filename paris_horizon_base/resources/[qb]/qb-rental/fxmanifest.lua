fx_version 'cerulean'
game 'gta5'

description 'QB-Rental'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}

dependencies {
    'qb-core',
    'qb-target',
    'ox_lib'
}

lua54 'yes'
