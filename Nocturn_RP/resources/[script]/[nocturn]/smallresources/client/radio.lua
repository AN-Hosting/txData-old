local QBCore = exports['qb-core']:GetCoreObject()


-- Variable pour suivre la première entrée dans un véhicule
local isFirstEntry = true

-- Désactiver la radio quand on entre dans un véhicule
local function DisableRadioOnEntry(vehicle)
    if not DoesEntityExist(vehicle) then return end
    
    -- Garder la radio activée (pour pouvoir utiliser la roue)
    SetVehicleRadioEnabled(vehicle, true)
    
    -- Mais définir la station sur OFF
    if isFirstEntry then
        SetVehRadioStation(vehicle, 'OFF')
        isFirstEntry = false
    end
end

-- Événement quand le joueur entre dans un véhicule
RegisterNetEvent('QBCore:Client:EnterVehicle')
AddEventHandler('QBCore:Client:EnterVehicle', function(vehicle, seat)
    DisableRadioOnEntry(vehicle)
end)

-- Événement quand un véhicule est créé
RegisterNetEvent('QBCore:Client:VehicleSpawned')
AddEventHandler('QBCore:Client:VehicleSpawned', function(vehicle)
    isFirstEntry = true
    DisableRadioOnEntry(vehicle)
end)

-- Boucle principale
Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        local playerPed = PlayerPedId()
        
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            
            if DoesEntityExist(vehicle) and isFirstEntry then
                DisableRadioOnEntry(vehicle)
                sleep = 0
            end
        else
            -- Réinitialiser pour le prochain véhicule
            isFirstEntry = true
        end
        
        Citizen.Wait(sleep)
    end
end)

-- Initialisation
AddEventHandler('onClientResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    
    local playerPed = PlayerPedId()
    
    if IsPedInAnyVehicle(playerPed, false) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        isFirstEntry = true
        DisableRadioOnEntry(vehicle)
    end
end)
