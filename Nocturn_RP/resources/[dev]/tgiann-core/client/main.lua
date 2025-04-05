function sendNuiMessage(method, data)
    SendNUIMessage({
        app = "app-name",
        method = method,
        data = data,
    })
end

function cbNuiMessage(method, data)
    SendNUIMessage({
        app = "app-name",
        method = method .. "Success",
        data = data,
    })
    return ""
end

local hasCustomNuiFocus = false
RegisterNetEvent('tgiann-core:nui-focus')
AddEventHandler('tgiann-core:nui-focus', function(hasFocus, hasKeyboard, hasMouse, allControl)
    hasCustomNuiFocus = hasFocus
    TriggerEvent("tgiann-main:focus", hasCustomNuiFocus)
    if not hasCustomNuiFocus then return end
    CreateThread(function()
        while hasCustomNuiFocus do
            if hasKeyboard and not allControl then
                DisableAllControlActions(0)
                EnableControlAction(0, 249, true)
            elseif hasKeyboard and allControl then
                DisableControlAction(0, 24, true) -- disable attack
                DisableControlAction(0, 25, true) -- disable aim
                DisableControlAction(0, 1, true)  -- LookLeftRight
                DisableControlAction(0, 2, true)  -- LookUpDown
            end

            if not hasKeyboard and hasMouse then
                DisableControlAction(0, 1, true)
                DisableControlAction(0, 2, true)
            elseif hasKeyboard and not hasMouse then
                EnableControlAction(0, 1, true)
                EnableControlAction(0, 2, true)
            end
            HudWeaponWheelIgnoreSelection()
            DisableFrontendThisFrame()
            Wait(0)
        end
    end)
end)

local function updateUiClientData()
    sendNuiMessage("updateClientData", {
        lang = langs[config.lang],
        config = {
            textUiLocation = config.textUiLocation
        },
        defaultColor = config.defaultColor
    })
end

local playerLoadedEvent = custom.playerLoadedEvent.active and custom.playerLoadedEvent.event or 'tgiCore:Client:OnPlayerLoaded'
AddEventHandler(playerLoadedEvent, updateUiClientData)
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    Wait(2000)
    updateUiClientData()
end)

AddEventHandler('onResourceStop', function(resourceName)
    if not PlayerData then return end
    if GetCurrentResourceName() == resourceName then return end
    if not string.find(resourceName, "tgiann") then return end
    while GetResourceState(resourceName) ~= "started" do Wait(100) end
    Wait(1000)
    TriggerEvent("tgiCore:Client:OnPlayerLoaded", PlayerData)
end)

if custom.deadReviveEvent.active then
    RegisterNetEvent(custom.deadReviveEvent.deadEvent)
    AddEventHandler(custom.deadReviveEvent.deadEvent, function(data)
        TriggerEvent("tgiCore:playerdead", data ~= nil and data or true)
    end)
    RegisterNetEvent(custom.deadReviveEvent.reviveEvent)
    AddEventHandler(custom.deadReviveEvent.reviveEvent, function(data)
        TriggerEvent("tgiCore:playerdead", data ~= nil and data or false)
    end)
elseif config.wasabi_ambulance then
    AddStateBagChangeHandler("dead", ('player:%s'):format(GetPlayerServerId(PlayerId())), function(bagName, key, value)
        local entity = GetEntityFromStateBagName(bagName)
        if entity == 0 then return end
        TriggerEvent("tgiCore:playerdead", value)
    end)
end

RegisterNetEvent("tgiann-lumihud:setLumiHudColor")
AddEventHandler("tgiann-lumihud:setLumiHudColor", function(color)
    sendNuiMessage("setLumiHudColor", color)
end)
