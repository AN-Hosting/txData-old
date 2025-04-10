--[[
    Start tgiann-core script after es_extented/qb-core/oxmysql script and before tgiann-* scripts
    Adjust the tgiann-core config file according to the framework you are using

    - If you are having any problems, please check the channels on my discord. If your problem is not resolved, open a ticket.
    - Discord: http://discord.gg/9SEg2WNf7Y
    - Docs: https://tgiann.gitbook.io/tgiann
    - Core Exports: https://docs.tgiann.com/scripts/tgiann-core
]]

config = {}
config.lang = "en" -- "en" - "tr"

-- number of online police needed to control
config.policeJobs = {
    "police",
}

config.defaultColor = { background = "#36ff9f", color = "#252525" } -- Changes the main hud color of tgiann scripts.
config.textUiLocation = "left"                                     -- "left"   |   "right"
config.tgiannDrawText3D = false                                      -- Use tgiann's drawtext3d function instead of QB and ESX
config.checkArtifactVersion = false                                  -- Check the artifact version of the server

frameworkConfig = {
    esxScriptName = "es_extended",                  -- https://github.com/esx-framework/esx_core/tree/main/%5Bcore%5D/es_extended
    qbScriptName = "qb-core",                       -- https://github.com/qbcore-framework/qb-core
    qbxScriptName = "qbx_core",                     -- https://github.com/Qbox-project/qbx_core
    oxlibScriptName = "ox_lib",                     -- https://github.com/overextended/ox_lib
    tgiannInventoryScriptName = "tgiann-inventory", -- https://store.tgiann.com/package/6251398
    oxInventoryScriptName = "ox_inventory",         -- https://github.com/overextended/ox_inventory
    qsInventoryScriptName = "qs-inventory",
    codemInventoryScriptName = "codem-inventory",
    origenInventoryScriptName = "origen_inventory",
    coreInventoryScriptName = "core_inventory",
    oxMysqlScriptName = "oxmysql", -- https://github.com/overextended/oxmysql
    esxService = "esx_service",    -- https://github.com/esx-framework/esx_service
    wasabiAmbulance = "wasabi_ambulance",
    oxTarget = "ox_target",
    qbTarget = "qb-target",
}

custom = {
    drawText = {
        active = true,
        openFunc = function(uniqName, button, text)
            exports['qb-core']:DrawText(text, 'left')
        end,
        closeFunc = function(uniqName)
            exports['qb-core']:HideText()
        end
    },
    notif = {
        active = true, -- If you are using a different notify system, set active to true and edit the notify function
        func = function(msg, type, time)
            local title = 'Notification'
            exports['qs-interface']:AddNotify(msg, title, time, icon)
        end
    },
    playerLoadedEvent = {
        active = false,         -- for core, the player loaded event needs to be triggered to load the ui data. if you are using a different loaded event than qb or esx, make it true and edit the event (-- also u can change event from client/main.lua)
        event = "playerSpawned" --https://docs.fivem.net/docs/resources/spawnmanager/events/playerSpawned/
    },
    deadReviveEvent = {
        active = false,                        -- if you are using a different ambulance script, make it true and edit the events (-- also u can change event from client/main.lua)
        deadEvent = "baseevents:onPlayerDied", -- https://docs.fivem.net/docs/resources/baseevents/events/onPlayerDied/
        reviveEvent = "playerSpawned",         -- https://docs.fivem.net/docs/resources/spawnmanager/events/playerSpawned/
    }
}

config.test = false         -- Dont touch this
config.tgiannServer = false -- Dont touch this

langs = {}

exports("getConfig", function()
    return config
end)
