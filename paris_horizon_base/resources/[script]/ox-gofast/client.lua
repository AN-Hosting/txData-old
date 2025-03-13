local QBCore = exports['qb-core']:GetCoreObject()
local GoFastStarted = false
local cooldown = false
local policeBlip = nil
local currentDifficulty = 'easy' -- Default difficulty
local deliveryTimer = nil
local currentVehicleHash = nil -- Nouvelle variable pour stocker le hash du véhicule actuel

-- Add function to start GoFast with selected difficulty
local function StartGoFast(difficulty)
    currentDifficulty = difficulty
    
    -- Show warning message first with longer display times
    QBCore.Functions.Notify("Ramène cette caisse là où je te dis, mais fais attention...", "primary", 8000)
    Wait(2000)
    QBCore.Functions.Notify("Si la voiture est abîmée, tu seras moins payé!", "warning", 8000)
    Wait(2000)
    QBCore.Functions.Notify("Tu as 3 minutes et 30 secondes pour livrer le véhicule!", "error", 8000)
    Wait(1000)

    local vehicleList = Config.Difficulty[difficulty].vehicle_list
    local randomVehicle = vehicleList[math.random(#vehicleList)]
    local vehicle = GetHashKey(randomVehicle)
    currentVehicleHash = vehicle -- Stocke le hash du véhicule spawn
    
    QBCore.Functions.SpawnVehicle(vehicle, function(spawn)
        SetPedIntoVehicle(PlayerPedId(), spawn, -1)
        SetVehicleEngineOn(spawn, true, true, true)
        SetVehicleNumberPlateText(spawn, "GOFAST")
        SetVehicleDirtLevel(spawn, 0.0)
        exports['LegacyFuel']:SetFuel(spawn, 100.0)
        -- Add vehicle keys using temporary key system
        local plate = GetVehicleNumberPlateText(spawn)
        TriggerServerEvent('sna-vehiclekeys:server:GiveTempKey', plate)
        
        -- Max out vehicle mods
        SetVehicleModKit(spawn, 0)
        -- Engine
        SetVehicleMod(spawn, 11, 3, false)
        -- Brakes
        SetVehicleMod(spawn, 12, 2, false)
        -- Transmission
        SetVehicleMod(spawn, 13, 2, false)
        -- Suspension
        SetVehicleMod(spawn, 15, 3, false)
        -- Turbo
        ToggleVehicleMod(spawn, 18, true)
        -- Max out vehicle performance stats
        SetVehicleHandlingFloat(spawn, "CHandlingData", "fInitialDriveForce", 1.0)
        SetVehicleHandlingFloat(spawn, "CHandlingData", "fDriveInertia", 1.0)
        
        -- Start timer - exactement 3 minutes et 30 secondes (210000 millisecondes)
        deliveryTimer = GetGameTimer() + 210000
    end, Config.StartGoFast.VehicleCoords, true)
    
    cooldown = true
    GoFastStarted = true
    TriggerEvent('GoFastRun')
    TriggerServerEvent('Alertpolice')
    
    -- Reset cooldown after Config.CooldownTime minutes
    SetTimeout(Config.CooldownTime * 60000, function()
        cooldown = false
    end)
end

-- Add difficulty selection menu
local function OpenDifficultyMenu()
    local difficultyMenu = {
        {
            header = "🏎️ Go Fast - Choix de la difficulté",
            isMenuHeader = true
        },
        {
            header = "Facile",
            txt = "Récompense: $" .. Config.Difficulty.easy.reward .. " | Voitures standards",
            params = {
                event = "gofast:selectDifficulty",
                args = {
                    difficulty = "easy"
                }
            }
        },
        {
            header = "Moyen",
            txt = "Récompense: $" .. Config.Difficulty.medium.reward .. " | Voitures sportives",
            params = {
                event = "gofast:selectDifficulty",
                args = {
                    difficulty = "medium"
                }
            }
        },
        {
            header = "Difficile",
            txt = "Récompense: $" .. Config.Difficulty.hard.reward .. " | Voitures de luxe",
            params = {
                event = "gofast:selectDifficulty",
                args = {
                    difficulty = "hard"
                }
            }
        },
        {
            header = "❌ Fermer",
            txt = "",
            params = {
                event = "qb-menu:client:closeMenu"
            }
        }
    }
    exports['qb-menu']:openMenu(difficultyMenu)
end

-- Add event handler for difficulty selection
RegisterNetEvent('gofast:selectDifficulty')
AddEventHandler('gofast:selectDifficulty', function(data)
    if cooldown then
        QBCore.Functions.Notify("Please wait before starting another GoFast", "error")
        return
    end
    StartGoFast(data.difficulty)
end)

CreateThread(function()
    local pedHash = GetHashKey(Config.StartGoFast.PedHash)
    RequestModel(pedHash)
    while not HasModelLoaded(pedHash) do
        Wait(0)
    end
    local ped = CreatePed(4, pedHash, Config.StartGoFast.PedCoords.x, Config.StartGoFast.PedCoords.y, Config.StartGoFast.PedCoords.z, Config.StartGoFast.PedCoords.w, false, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)

    exports.qtarget:AddBoxZone("goFast", vector3(Config.StartGoFast.TargetCoords.x, Config.StartGoFast.TargetCoords.y, Config.StartGoFast.TargetCoords.z), 1, 1, {
        name = "goFast",
        heading = 0,
        debugPoly = false,
        minZ = Config.StartGoFast.TargetCoords.z - 1.0,
        maxZ = Config.StartGoFast.TargetCoords.z + 1.0
    }, {
        options = {
            {
                icon = "fas fa-car",
                label = "Parler au contact",
                canInteract = function()
                    if not GoFastStarted then
                        return true
                    end
                end,
                action = function()
                    OpenDifficultyMenu()
                end
            },
        },
        distance = 2.5
    })
end)

RegisterNetEvent('GoFastRun')
AddEventHandler('GoFastRun', function()
    local randomIndex = math.random(1, #Config.DeliveryCoords)
    local randomCoord = Config.DeliveryCoords[randomIndex]

    local randomIndex2 = math.random(1, #Config.DeliveryModel)
    local randomModel = Config.DeliveryModel[randomIndex2]

    local model = GetHashKey(randomModel)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
    
    local ped = CreatePed(4, model, randomCoord[1], randomCoord[2], randomCoord[3], randomCoord[4], false, true)
    SetEntityAsMissionEntity(ped, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)

    local blip = AddBlipForCoord(randomCoord[1], randomCoord[2], randomCoord[3])
    SetBlipSprite(blip, 304)
    SetBlipColour(blip, 59)
    SetBlipScale(blip, 0.8)
    SetBlipRoute(blip, true)
    SetBlipRouteColour(blip, 59)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("Go Fast Delivery")
    EndTextCommandSetBlipName(blip)

    exports.qtarget:AddBoxZone('deliverygofast', randomCoord, 1.0, 1.0, {
        name = 'deliverygofast',
        heading = randomCoord[4],
        debugPoly = false,
        minZ = randomCoord.z - 1.5,
        maxZ = randomCoord.z + 1.5
    }, {
        options = { 
            {
                icon = "fas fa-box-open",
                label = 'Deliver vehicle',
                canInteract = function()
                    if GoFastStarted then
                        return true
                    end
                end,
                action = function()
                    local vehicle = QBCore.Functions.GetClosestVehicle()
                    if DoesEntityExist(vehicle) and GetEntityModel(vehicle) == currentVehicleHash and GoFastStarted then
                        if deliveryTimer and (GetGameTimer() <= deliveryTimer) then
                            local vehicleHealth = GetVehicleBodyHealth(vehicle)
                            local healthPercentage = vehicleHealth / 1000.0
                            local damageMultiplier = math.max(Config.DamageMultiplier.min, 
                                math.min(Config.DamageMultiplier.max, healthPercentage))
                            
                            QBCore.Functions.DeleteVehicle(vehicle)
                            RemoveBlip(blip)
                            if policeBlip then RemoveBlip(policeBlip) end
                            DeleteEntity(ped)
                            GoFastStarted = false
                            deliveryTimer = nil
                            TriggerServerEvent('DeliveredDone', damageMultiplier, currentDifficulty)
                            exports.qtarget:RemoveZone('deliverygofast')
                        else
                            QBCore.Functions.Notify("Temps écoulé! La livraison a échoué!", "error")
                        end
                    else
                        QBCore.Functions.Notify("Ce n'est pas le bon véhicule", "error")
                    end
                end,
            },
        },
        distance = 1.5
    })
end)

RegisterNetEvent('gofast:createBlip')
AddEventHandler('gofast:createBlip', function()
    local player = GetPlayerPed(-1)
    local blip = AddBlipForEntity(player)
    
    SetBlipSprite(blip, 161)
    SetBlipScale(blip, 1.4)
    SetBlipColour(blip, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("GoFast Vehicle")
    EndTextCommandSetBlipName(blip)
    
    policeBlip = blip
end)

-- Add timer check thread
CreateThread(function()
    while true do
        Wait(1000)
        if GoFastStarted and deliveryTimer then
            local timeLeft = deliveryTimer - GetGameTimer()
            if timeLeft <= 0 then
                -- Time's up, fail the mission
                GoFastStarted = false
                deliveryTimer = nil
                -- Delete vehicle if player is in one
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                if vehicle ~= 0 then
                    QBCore.Functions.DeleteVehicle(vehicle)
                end
                -- Remove blips and cleanup
                TriggerEvent('gofast:cleanup')
                QBCore.Functions.Notify("Temps écoulé! La livraison a échoué!", "error", 5000)
            end
        end
    end
end)

-- Add cleanup event
RegisterNetEvent('gofast:cleanup')
AddEventHandler('gofast:cleanup', function()
    if policeBlip then RemoveBlip(policeBlip) end
    -- Remove delivery zone and blip if they exist
    exports.qtarget:RemoveZone('deliverygofast')
    local blips = GetActiveBlips()
    for _, blip in pairs(blips) do
        if GetBlipSprite(blip) == 304 then -- Delivery blip sprite
            RemoveBlip(blip)
        end
    end
end)

-- Helper function to get all active blips
function GetActiveBlips()
    local blips = {}
    for i = 1, 500 do -- arbitrary maximum number of blips
        local blip = GetFirstBlipInfoId(i)
        if blip ~= 0 then
            table.insert(blips, blip)
        end
    end
    return blips
end

-- Add timer display thread
CreateThread(function()
    while true do
        Wait(0)
        if GoFastStarted and deliveryTimer then
            local timeLeft = deliveryTimer - GetGameTimer()
            if timeLeft > 0 then
                -- Convert milliseconds to minutes and seconds
                local seconds = math.floor(timeLeft / 1000)
                local minutes = math.floor(seconds / 60)
                seconds = seconds % 60
                
                -- Format time string
                local timeString = string.format("~w~TEMPS RESTANT~n~~r~%02d:%02d", minutes, seconds)
                
                -- Draw black background
                DrawRect(0.5, 0.05, 0.13, 0.045, 0, 0, 0, 150)
                
                -- Draw timer text on screen
                SetTextScale(0.45, 0.45)
                SetTextFont(4)
                SetTextProportional(1)
                SetTextColour(255, 255, 255, 255)
                SetTextEntry("STRING")
                SetTextCentre(true)
                SetTextDropShadow(0, 0, 0, 0, 255)
                SetTextEdge(2, 0, 0, 0, 255)
                SetTextDropShadow()
                SetTextOutline()
                AddTextComponentString(timeString)
                DrawText(0.5, 0.03)
            end
        end
    end
end)
