EXTERNAL_EVENTS_NAMES = {
    ["esx:getSharedObject"] = nil, -- This is nil because it will be found automatically, change it to your one ONLY in the case it can't be found
}

-- Ped models that WON'T be used for NPC mugging
BLACKLISTED_PEDS_MODELS = {
    --[[
        Some examples:
        
        [ GetHashKey("a_m_o_tramp_01") ] = true,
        [ GetHashKey("csb_rashcosvki") ] = true,
        [ GetHashKey("csb_stripper_02") ] = true,
    ]]
}

INTERACTION_POINTS_REFRESH = 1000

-- Seconds the blip of police alert will remain in the map
BLIP_TIME_AFTER_POLICE_ALERT = 40

-- Seconds each time the gas will damage the player
GAS_INTERVAL_SECONDS = 1

-- Used to investigate on an issue, keep false if you don't know what this is
DEBUG_OUTPUT_HEIST_STEPS = false

--[[
    Default progressbar color (must be a hex code). Examples:
    "#0fffef" - Light blue
    "#ff0f0f" - Red
    "#0f0fff" - Blue
]]
DEFAULT_PROGRESSBAR_COLOR = "#ff0f0f"


-- In robberies_creator/integrations/cl_integrations.lua
RegisterNetEvent("robberies_creator:framework:ready", function() 
    -- Disables the default script progress bar (otherwise there would be 2 progress bars)
    exports["robberies_creator"]:disableScriptEvent("robberies_creator:internalProgressBar")
end)

-- Example to replace the script progress bar with an external one
RegisterNetEvent("robberies_creator:internalProgressBar", function(time, text)
    -- Utilisation de l'interface qs-interface pour la barre de progression
    local success = exports['qs-interface']:ProgressBar({
        duration = time,          -- Durée de la barre de progression (en millisecondes)
        label = text,             -- Texte qui apparaîtra sur la barre de progression
        position = 'bottom',      -- Position de la barre de progression sur l'écran
        useWhileDead = false,     -- La barre de progression ne s'affiche pas quand le joueur est mort
        canCancel = true,         -- Le joueur peut annuler la progression
        disable = {               -- Désactivation des contrôles du joueur pendant la progression
            car = false,
            movement = false,
            combat = false,
            mouse = false
        },
        anim = {                  -- Animation à jouer pendant la progression
            dict = nil,
            clip = nil,
            flag = 0
        },
        prop = nil                -- Pas de prop à afficher avec la barre de progression
    })
end)


RegisterNetEvent("robberies_creator:framework:ready", function() 
    -- Disables the default script notification (otherwise there would be 2 notifications)
    exports["robberies_creator"]:disableScriptEvent("robberies_creator:notify")
end)

RegisterNetEvent("robberies_creator:notify", function(message, uncoloredMessage)
    -- Utilisation de l'interface qs-interface pour les notifications
    exports['qs-interface']:AddNotify(message, "Notification", 5000, icon)
    
    -- Si vous préférez utiliser le message coloré, remplacez uncoloredMessage par message
    -- exports['qs-interface']:AddNotify(message, "Notification", 5000, "info")
end)