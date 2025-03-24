fx_version 'bodacious'
game 'gta5'

author 'kac5a'
description 'K5 Notify'
version '1.0'

client_scripts {
	'client/*.lua'
}

ui_page "html/index.html"

files({
    'html/**.**',
    'html/assets/**'
})

shared_script 'config.lua'


server_scripts {
    'server/*.lua'
}

export "notify"