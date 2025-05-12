fx_version 'cerulean'

game 'gta5'

version '1.0.74'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/functions.lua',
    'shared/config.lua',
    'locales/*'
}

client_scripts {
    'custom/client.lua',
    'client/custom/**',
    'client/modules/**',
    'client/main.lua'
}

ox_libs {
    'table'
}

files {
    'html/**',
    'custom/**'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'custom/server.lua',
    'server/modules/*.lua',
    'server/main.lua'
}

dependencies {
    'ox_lib'
}

ui_page 'html/index.html'

escrow_ignore {
    'custom/**/*',
    'client/custom/**',
    'server/custom/**',
    'shared/**/*',
    'config/*',
    'locales/*'
}

dependency '/assetpacks'