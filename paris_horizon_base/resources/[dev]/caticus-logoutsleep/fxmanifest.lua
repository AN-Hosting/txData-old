fx_version 'cerulean'
game 'gta5'

author 'Caticus / Team 5M'
description 'A simple system that makes the player character sleep in the position where they log out'
version '1.0.0'
website 'www.5Mservers.com'

shared_script {
    '@qb-core/shared/locale.lua',
    'config.lua'
}

client_script 'client/main.lua'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

lua54 'yes' 