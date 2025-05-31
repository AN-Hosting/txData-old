fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Thug Studios - vibeR'
description 'N Multicharacter'
version '1.0.0'

shared_scripts {
    'no_escrow/settings.lua',
    'no_escrow/locale.lua'
}

files {
    'html/**/*.*' 
}

client_scripts {
    'no_escrow/functions.lua',
    'client/cl_functions.lua',
    'no_escrow/framework.lua',
    'client/cl_main.lua',
    'no_escrow/cl_open.lua',
}

server_scripts {
    'server/sv_functions.lua',
    'no_escrow/framework.lua',
    'server/sv_main.lua',
}

ui_page 'html/index.html'

escrow_ignore {
    'no_escrow/framework.lua',
    'no_escrow/functions.lua',
    'no_escrow/settings.lua',
    'no_escrow/locale.lua',
    'no_escrow/cl_open.lua',
}
dependency '/assetpacks'