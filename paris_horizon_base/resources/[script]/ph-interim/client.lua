-- Initialisation de QBCore
local QBCore = exports['qb-core']:GetCoreObject()

-- Création d'un PNJ à une position spécifique
local function CreatePedMenu()
    local menuOptions = {
        {
            header = "Agence d'Intérim",
            isMenuHeader = true
        }
    }

    table.insert(menuOptions, {
        header = "Fermer",
        txt = "",
        params = {
            event = "qb-menu:client:closeMenu"
        }
    })

    -- Ajouter chaque lieu de travail au menu
    for _, job in ipairs(Config.JobLocations) do
        table.insert(menuOptions, {
            header = job.icon .. " " .. job.name,
            txt = "Définir un waypoint vers ce lieu",
            params = {
                event = "ph-interim:client:setWaypoint",
                args = {
                    coords = job.coords,
                    name = job.name
                }
            }
        })
    end
    exports['qb-menu']:openMenu(menuOptions)
end

local function SpawnPed()
    local coords = Config.PedLocation.position
    local pedHash = Config.PedLocation.model
    
    RequestModel(pedHash)
    while not HasModelLoaded(pedHash) do
        Wait(1)
    end
    
    local ped = CreatePed(4, pedHash, coords.x, coords.y, coords.z - 1, coords.w, false, true)
    
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    -- Ajout de l'interaction qb-target
    exports['qb-target']:AddTargetEntity(ped, {
        options = {
            {
                type = "client",
                event = "ph-interim:client:openMenu",
                icon = "fas fa-briefcase",
                label = "Parler à l'agent d'intérim",
            }
        },
        distance = 2.0
    })
    
    return ped
end

local function CreateInterimBlip()
    local coords = Config.PedLocation.position
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    
    SetBlipSprite(blip, Config.Blip.sprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, Config.Blip.scale)
    SetBlipColour(blip, Config.Blip.color)
    SetBlipAsShortRange(blip, true)
    
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.Blip.name)
    EndTextCommandSetBlipName(blip)
end

CreateThread(function()
    SpawnPed()
    CreateInterimBlip()
end)

-- Events handlers
RegisterNetEvent('ph-interim:client:openMenu', function()
    CreatePedMenu()
end)

-- Event handler pour définir le waypoint
RegisterNetEvent('ph-interim:client:setWaypoint', function(data)
    -- Supprime l'ancien waypoint
    SetWaypointOff()
    -- Définit le nouveau waypoint
    SetNewWaypoint(data.coords.x, data.coords.y)
    
    -- Notifications
    QBCore.Functions.Notify('GPS mis à jour', 'success', 3000)
    Wait(1000)
    QBCore.Functions.Notify('Direction : ' .. data.name, 'primary', 3500)
    Wait(1000)
    QBCore.Functions.Notify('Rendez-vous sur place pour commencer à travailler', 'info', 4000)
end)
