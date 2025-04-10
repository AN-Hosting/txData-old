fx_version "cerulean"
game "gta5"
version "4.16.3"

lua54 "yes"

ui_page "ui/build/index.html"

files {
	"ui/build/**.*",
}

escrow_ignore {
	"configs/*.lua",
	"client/functions/progressbar.lua",
	"client/functions/skillCheck.lua",
	"client/functions/setVehicleProperties.lua",
	"client/functions/getVehicleProperties.lua",
	"client/functions/duty.lua",
	"client/functions/boss.lua",
	"client/functions/inventory.lua",
	"client/functions/mechanic.lua",
	"client/functions/clothing.lua",
	"client/functions/vehicleKey.lua",
	"client/main.lua",
	"server/functions/inventory.lua",
	"server/functions/vehicleKey.lua",
	"languages/*.lua"
}

shared_scripts {
	"import.lua",
	"configs/config.lua",
	"languages/*.lua",
	"shared/functions/*.lua",
	"shared/other/*.lua",
}

client_scripts {
	"client/**.lua",
}

server_scripts {
	"@oxmysql/lib/MySQL.lua",
	"configs/discordConfig.lua",
	"configs/screenshotConfig.lua",
	"server/functions/*.lua",
	"server/framework/**.lua",
	"server/inventory/**.lua",
	"server/playerOwnable/**.lua",
}

dependency '/assetpacks'