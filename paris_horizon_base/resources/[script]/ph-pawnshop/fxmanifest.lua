fx_version 'cerulean'
game 'gta5'

author 'Minox'
description 'Pawnshop System for QB Core'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/fr.lua',
    'config.lua'
}

client_scripts {
    '@qb-target/client/target.lua',
    'client/main.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/fonts/*.ttf',
    'html/img/*.png'
}

dependencies {
    'qb-core',
    'qb-target'
}

lua54 'yes' 