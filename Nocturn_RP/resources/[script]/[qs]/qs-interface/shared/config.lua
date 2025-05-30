Config = Config or {}
Locales = Locales or {}

--[[
    Choose your preferred language!

    Default languages available:
        'ar'     -- Arabic
        'bg'     -- Bulgarian
        'ca'     -- Catalan
        'cs'     -- Czech
        'da'     -- Danish
        'de'     -- German
        'el'     -- Greek
        'en'     -- English
        'es'     -- Spanish
        'fa'     -- Persian
        'fr'     -- French
        'hi'     -- Hindi
        'hu'     -- Hungarian
        'it'     -- Italian
        'ja'     -- Japanese
        'ko'     -- Korean
        'nl'     -- Dutch
        'no'     -- Norwegian
        'pl'     -- Polish
        'pt'     -- Portuguese
        'ro'     -- Romanian
        'ru'     -- Russian
        'sl'     -- Slovenian
        'sv'     -- Swedish
        'th'     -- Thai
        'tr'     -- Turkish
        'zh-CN'  -- Chinese (Simplified)
        'zh-TW'  -- Chinese (Traditional)

    Here, you can set the primary language for your asset. Several default languages
    are available in the locales folder, but you can also create your own by adding a new file.
]]

Config.Language = 'fr' -- Default language of the asset

--[[
    Framework Detection

    The system automatically detects if you are using qb-core or es_extended.
    If you rename these, you need to manually set your framework below.
]]

local frameworks = {
    ['es_extended'] = 'esx',
    ['qb-core'] = 'qb',
}

Config.Framework = DependencyCheck(frameworks) or 'standalone' -- Automatically detects framework

--[[
    General Configuration

    Define basic settings such as the server name, keybinds,
    and whether the interface starts automatically.
]]

Config.ServerName = 'Nocturn Roleplay'                            -- Server name
Config.MenuKeybind = 'F9'                                        -- Key to open the menu
Config.SeatbeltKeybind = 'G'                                     -- Key to toggle seatbelt
Config.SeatbeltKeybind_Name = 'Toggle seatbelt'                  -- Seatbelt label in Settings > Keybinds > FiveM
Config.AutoStartUI = true                                        -- Automatically start the interface on server startup
Config.InitEditorEveryTime = GetConvarBool('qs:showcase', false) -- the player is forced to configure the hud every time he log into the game. (Mainly used for the showcase server)

--[[
    Interface Options

    Customize the user interface settings, including the configuration menu,
    stress bar, speed units, and whether to hide the radar.
]]

local voiceChatList = {
    ['pma-voice'] = 'pma',
    ['saltychat'] = 'saltychat'
}

Config.VoiceChat = DependencyCheck(voiceChatList) or 'standalone' -- Auto-detects voice chat system
Config.ConfigurationMenu = true                                   -- Welcome, preview, and configuration menu
Config.EnableCinematicMode = true
Config.UseStress = false                                           -- Enable stress bar in the HUD screen (just enables the stress bar, not the stress system)
Config.Stress = false                                              -- Enables stress system
Config.StressChance = 0.1                                         -- Default: 10% -- Percentage Stress Chance When Shooting (0-1)
Config.MinimumStress = 50                                         -- Minimum Stress Level For Screen Shaking
Config.MinimumSpeed = 100                                         -- Going Over This Speed Will Cause Stress
Config.MinimumSpeedUnbuckled = 50                                 -- Going Over This Speed Will Cause Stress
Config.DisableJobsStress = { 'police', 'ambulance' }              -- Add here jobs you want to disable stress - OLD: -- DisablePoliceStress = true, -- If true will disable stress for people with the police job
Config.WhitelistedWeaponStress = {
    `weapon_petrolcan`,
    `weapon_hazardcan`,
    `weapon_fireextinguisher`
}
Config.Intensity = {
    [1] = {
        min = 50,
        max = 60,
        intensity = 1500,
    },
    [2] = {
        min = 60,
        max = 70,
        intensity = 2000,
    },
    [3] = {
        min = 70,
        max = 80,
        intensity = 2500,
    },
    [4] = {
        min = 80,
        max = 90,
        intensity = 2700,
    },
    [5] = {
        min = 90,
        max = 100,
        intensity = 3000,
    },
}
Config.EffectInterval = {
    [1] = {
        min = 50,
        max = 60,
        timeout = math.random(50000, 60000)
    },
    [2] = {
        min = 60,
        max = 70,
        timeout = math.random(40000, 50000)
    },
    [3] = {
        min = 70,
        max = 80,
        timeout = math.random(30000, 40000)
    },
    [4] = {
        min = 80,
        max = 90,
        timeout = math.random(20000, 30000)
    },
    [5] = {
        min = 90,
        max = 100,
        timeout = math.random(15000, 20000)
    }
}

Config.HarnessUses = 20
Config.Units = 'kmh'                                                                -- Vehicle speed units ('kmh' or 'mph')
Config.HideRadar = true                                                             -- Hide the minimap when the player is not inside a vehicle
Config.PreviewScreenBackground = 'url(https://i.ibb.co/392hB0xf/Screenshot-35.png)' -- Background image for the preview screen

--[[
    Fuel System Dependencies

    Automatically detects compatible fuel systems. If using a custom fuel system,
    manual configuration may be needed.
]]

local fuels = {
    ['qs-fuelstations'] = 'qs-fuelstations'
}

Config.Fuel = DependencyCheck(fuels) or 'standalone' -- Auto-detects fuel system

--[[
    Multicharacter System

    Detects and integrates multicharacter support if applicable.
]]

local multicharacters = {
    ['qs-multicharacter'] = 'qs'
}

Config.Multicharacter = DependencyCheck(multicharacters) or 'standalone' -- Auto-detects multicharacter system

--[[
    HUD Creator Configuration

    Enable or disable different components of the heads-up display, such as notifications,
    progress indicators, and car-related UI elements.
]]

Config.Creator = {}
Config.Creator.Hud = true        -- Enable/disable HUD
Config.Creator.Notify = true     -- Enable/disable notifications
Config.Creator.Progress = true   -- Enable/disable progress bars
Config.Creator.Displayers = true -- Enable/disable displayers
Config.Creator.CarHud = true     -- Enable/disable car HUD

--[[
    Editable Files

    Allows enabling specific editable options, such as fuel, seatbelt,
    and street label configurations.
]]

Config.Editable = {}
Config.Editable.Fuel = false        -- Enable fuel editing in edt_carhud.lua
Config.Editable.Seatbelt = false    -- Enable seatbelt editing in edt_carhud.lua
Config.Editable.StreetLabel = false -- Enable street label editing in edt_carhud.lua

--[[
    Optional Display Settings

    Controls the visibility of certain UI elements, such as player ID,
    online count, job, cash, and bank balance.
]]

Config.Optional = {}
Config.Optional.Displayers = {}
Config.Optional.Displayers.ID = true     -- Display player ID
Config.Optional.Displayers.Online = true -- Show online player count
Config.Optional.Displayers.Job = true    -- Show job information
Config.Optional.Displayers.Cash = true   -- Show cash balance
Config.Optional.Displayers.Bank = true   -- Show bank balance

--[[
    Vehicle Data Tracking

    Stores real-time data related to vehicle speed, velocity,
    acceleration, health, and seatbelt status.
]]

Config.Shared = {}
Config.Shared.Vehicle = {
    currentSpeed = 0,  -- Current vehicle speed
    previousSpeed = 0, -- Previous vehicle speed
    prevVelocity = 0,  -- Previous velocity
    velocity = 0,      -- Current velocity
    acceleration = 0,  -- Current acceleration
    prevHealth = 0,    -- Previous vehicle health
    health = 0,        -- Current vehicle health
    seatbelt = false   -- Seatbelt status
}

--[[
    Interface Icons

    Defines the icons used for different UI elements like job
    display, cash, and bank balance.
]]

Config.Icons = {}
Config.Icons.Displayer_Job = 'fas fa-suitcase'     -- Job icon
Config.Icons.Displayer_Cash = 'fas fa-dollar-sign' -- Cash icon
Config.Icons.Displayer_Bank = 'fas fa-university'  -- Bank icon

--[[
    Debugging Mode

    Enable or disable debug mode to troubleshoot issues.
]]

Config.Debug = false -- Enable debug mode
