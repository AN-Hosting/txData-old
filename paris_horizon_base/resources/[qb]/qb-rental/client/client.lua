local QBCore = exports['qb-core']:GetCoreObject()
local ox_lib = exports.ox_lib
local rentalPeds = {} -- Pour stocker les peds créés

-- Vérification que ox_lib est chargée
if not ox_lib then
    print("Erreur: ox_lib n'est pas chargée")
    return
end

-- Fonctions utilitaires
local function GetVehiclesInArea(coords, maxDistance)
    local vehicles = GetGamePool('CVehicle')
    local nearbyVehicles = {}
    
    for _, vehicle in pairs(vehicles) do
        local distance = #(coords - GetEntityCoords(vehicle))
        if distance <= maxDistance then
            nearbyVehicles[#nearbyVehicles + 1] = vehicle
        end
    end
    return nearbyVehicles
end

local function IsSpawnPointClear(coords, maxDistance)
    return #GetVehiclesInArea(coords, maxDistance) == 0
end

local function getVehicleSpawnPoint(garage)
    local spawns = nil
    for k, v in pairs(Config.locations) do
        if v.id == garage then 
            spawns = v.spawns 
            break 
        end
    end

    if not spawns then return nil end

    local near = nil
    local distance = 10000
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)

    for k, v in pairs(spawns) do
        if IsSpawnPointClear(vector3(v.x, v.y, v.z), 2.5) then
            local cur_distance = #(pos - vector3(v.x, v.y, v.z))
            if cur_distance < distance then
                distance = cur_distance
                near = k
            end
        end
    end

    return near
end

-- Création des blips
CreateThread(function()
    for _, location in pairs(Config.locations) do
        local rentBlip = AddBlipForCoord(location.spawnPed.x, location.spawnPed.y, location.spawnPed.z)
        SetBlipSprite(rentBlip, 227)
        SetBlipScale(rentBlip, 0.7)
        SetBlipDisplay(rentBlip, 4)
        SetBlipColour(rentBlip, 2)
        SetBlipAsShortRange(rentBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Location de véhicules')
        EndTextCommandSetBlipName(rentBlip)
    end
end)

-- Création des peds et targets
CreateThread(function()
    -- Supprimer les anciens peds
    for _, ped in pairs(rentalPeds) do
        if DoesEntityExist(ped) then
            DeletePed(ped)
        end
    end
    rentalPeds = {} -- Réinitialiser la table

    for _, v in pairs(Config.locations) do
        local model = 'a_m_m_indian_01'
        
        -- Chargement du modèle de manière plus robuste
        if not HasModelLoaded(model) then
            RequestModel(model)
            while not HasModelLoaded(model) do
                Wait(10)
            end
        end
        
        local ped = CreatePed(4, model, v.spawnPed.x, v.spawnPed.y, v.spawnPed.z-1, v.spawnPed.w, false, false)
        if DoesEntityExist(ped) then
            TaskStartScenarioInPlace(ped, "WORLD_HUMAN_AA_COFFEE", 0, true)
            FreezeEntityPosition(ped, true)
            SetEntityInvincible(ped, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
            table.insert(rentalPeds, ped)

            exports['qb-target']:AddTargetEntity(ped, {
                options = {
                    {
                        type = "client",
                        event = "qb-rental:vehiclelist",
                        icon = "fas fa-car",
                        label = Config.translations[Config.locale].rent,
                        garage = v.id
                    },
                    {
                        type = "client",
                        event = "qb-rental:returnvehicle",
                        icon = "fas fa-undo",
                        label = Config.translations[Config.locale].back,
                    }
                },
                distance = 3.5
            })
        else
            print("^1Erreur lors de la création du PED pour la location^7")
        end
        
        -- Libérer le modèle après création
        SetModelAsNoLongerNeeded(model)
    end
end)

-- Events
RegisterNetEvent("qb-rental:vehiclelist", function(data)
    local vehicles = {}
    for _, vehicle in pairs(Config.vehicleList) do
        vehicles[#vehicles + 1] = {
            title = vehicle.name,
            description = "$" .. vehicle.price .. ".00",
            event = 'qb-rental:attemptvehiclespawn',
            args = {
                id = vehicle.model,
                price = vehicle.price,
                needLicense = vehicle.needLicense,
                garage = data.garage
            }
        }
    end
    
    lib.registerContext({
        id = 'rental_menu',
        title = 'Location de véhicules',
        options = vehicles
    })
    lib.showContext('rental_menu')
end)

RegisterNetEvent("qb-rental:attemptvehiclespawn", function(args)
    TriggerServerEvent("qb-rental:attemptPurchase", args.id, args.price, args.needLicense, args.garage)
end)

RegisterNetEvent("qb-rental:vehiclespawn", function(car, price, garage)
    local SpawnPoint = getVehicleSpawnPoint(garage)
    if not SpawnPoint then 
        QBCore.Functions.Notify(Config.translations[Config.locale].error_all_emplacement_used, 'error')
        return 
    end

    local spawns = nil
    for _, v in pairs(Config.locations) do
        if v.id == garage then
            spawns = v.spawns
            break
        end
    end

    local coords = vector3(spawns[SpawnPoint].x, spawns[SpawnPoint].y, spawns[SpawnPoint].z)
    
    QBCore.Functions.SpawnVehicle(car, function(veh)
        local plate = "RT" .. tostring(math.random(1000, 9999))
        SetVehicleNumberPlateText(veh, plate)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        SetEntityHeading(veh, spawns[SpawnPoint].w)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        SetVehicleEngineOn(veh, true, true)
        TriggerServerEvent("qb-rental:purchase", price)
        TriggerServerEvent("qb-rental:giverentalpaperServer", plate)
    end, coords, true)
end)

RegisterNetEvent("qb-rental:returnvehicle", function()
    local car = GetVehiclePedIsIn(PlayerPedId(), true)
    if car == 0 then 
        QBCore.Functions.Notify(Config.translations[Config.locale].error_to_far, "error")
        return
    end

    local plate = GetVehicleNumberPlateText(car)
    if not string.find(tostring(plate), "RT") then
        QBCore.Functions.Notify(Config.translations[Config.locale].error_not_a_rent, "error")
        return
    end

    local vehname = string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(car)))
    QBCore.Functions.TriggerCallback('qb-rental:server:hasrentalpapers', function(HasItem)
        if HasItem then
            TriggerServerEvent('qb-rental:server:payreturn', vehname)
            DeleteVehicle(car)
        else
            QBCore.Functions.Notify(Config.translations[Config.locale].error_no_papers, "error")
        end
    end)
end)

-- Notifications
RegisterNetEvent("qb-rental:attemptvehiclespawnfail", function()
    QBCore.Functions.Notify(Config.translations[Config.locale].error_no_money, "error")
end)

RegisterNetEvent("qb-rental:noDriverLicense", function()
    QBCore.Functions.Notify(Config.translations[Config.locale].error_no_license, "error")
end)

-- Ajouter cette fonction pour nettoyer les peds lors de l'arrêt de la ressource
AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        for _, ped in pairs(rentalPeds) do
            if DoesEntityExist(ped) then
                DeletePed(ped)
            end
        end
    end
end)
