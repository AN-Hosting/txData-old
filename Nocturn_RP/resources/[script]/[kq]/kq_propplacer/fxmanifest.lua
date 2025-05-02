fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

author 'KuzQuality | Kuzkay'
description 'Prop Placer by KuzQuality'
version '1.1.4'

ui_page 'nui/dist/nui.html'

shared_scripts {
    'config.lua',
    'settings.lua',
    'shared/cache.lua',
    'shared/utils.lua',
    'shared/shared.lua',
}

client_scripts {
    'client/utils.lua',
    'client/editable/editable.lua',
    
    'client/gizmo/dataview.lua',
    'client/gizmo/gizmo.lua',
    'client/gizmo/camera.lua',
    
    'client/functions.lua',
    'client/nui.lua',
    'client/placer.lua',
    
    'client/spawner/prop.lua',
    'client/spawner/main.lua',
}

server_scripts {
    'server/editable/init.lua',
    'server/editable/editable.lua',
    'server/editable/sql.lua',
    'server/manager.lua',
    'server/server.lua',
}


files {
    'nui/dist/nui.html',
    'nui/dist/app.js',
    'nui/dist/app.css',
    'nui/dist/assets/*.*',
}

escrow_ignore {
    'config.lua',
    'settings.lua',
    'client/editable/*.*',
    'server/editable/*.*',
}

dependencies {
    'kq_link',
}

dependency '/assetpacks'