local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand('deployramp', function ()
    local player = PlayerPedId()
    local playerCoords = GetEntityCoords(player)
    local radius = 5.0

    local vehicle = nil

    if IsAnyVehicleNearPoint(playerCoords, radius) then
        vehicle = getClosestVehicle(playerCoords)
        local vehicleName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
        TriggerEvent('QBCore:Notify', "Tentative de déploiement d'une rampe pour : ".. vehicleName , 'primary')
        if contains(vehicleName, Config.whitelist) then
            local vehicleCoords = GetEntityCoords(vehicle)

            for _, value in pairs(Config.offsets) do
                if vehicleName == value.model then
                    local ramp = CreateObject(RampHash, vector3(value.offset.x, value.offset.y, value.offset.z), true, false, false)
                    AttachEntityToEntity(ramp, vehicle, GetEntityBoneIndexByName(vehicle, 'chassis'), value.offset.x, value.offset.y, value.offset.z , 180.0, 180.0, 0.0, 0, 0, 1, 0, 0, 1)
                end
            end
            TriggerEvent('QBCore:Notify', "La rampe a été déployée." , 'success')
            return
        end
        TriggerEvent('QBCore:Notify', "Impossible de déployer une rampe pour ce véhicule" , 'error')
        return
    end
end)

RegisterCommand('ramprm', function()
    local player = PlayerPedId()
    local playerCoords = GetEntityCoords(player)

    local object = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, 5.0, RampHash, false, 0, 0)

    if not IsPedInAnyVehicle(player, false) then
        if GetHashKey(RampHash) == GetEntityModel(object) then
            DeleteObject(object)
            TriggerEvent('QBCore:Notify',"Rampe retirée avec succès." , 'success')
            return
        end
    end

    TriggerEvent('QBCore:Notify',"Sortez de votre véhicule ou rapprochez-vous de la rampe." , "error")
end)

RegisterCommand('attach', function()
    local player = PlayerPedId()
    local vehicle = nil

    if IsPedInAnyVehicle(player, false) then
        vehicle = GetVehiclePedIsIn(player, false)
        if GetPedInVehicleSeat(vehicle, -1) == player then
            local vehicleCoords = GetEntityCoords(vehicle)
            local vehicleOffset = GetOffsetFromEntityInWorldCoords(vehicle, 1.0, 0.0, -1.5)
            local vehicleRotation = GetEntityRotation(vehicle, 2)
            local belowEntity = GetVehicleBelowMe(vehicleCoords, vehicleOffset)
            local vehicleBelowRotation = GetEntityRotation(belowEntity, 2)
            local vehicleBelowName = GetDisplayNameFromVehicleModel(GetEntityModel(belowEntity))

            local vehiclesOffset = GetOffsetFromEntityGivenWorldCoords(belowEntity, vehicleCoords)

            local vehiclePitch = vehicleRotation.x - vehicleBelowRotation.x
            local vehicleYaw = vehicleRotation.z - vehicleBelowRotation.z

            if contains(vehicleBelowName, Config.whitelist) then
                if not IsEntityAttached(vehicle) then
                    AttachEntityToEntity(vehicle, belowEntity, GetEntityBoneIndexByName(belowEntity, 'chassis'), vehiclesOffset, vehiclePitch, 0.0, vehicleYaw, false, false, true, false, 0, true)
                    return TriggerEvent('QBCore:Notify','Véhicule correctement attaché.' , "success")
                end
                return TriggerEvent('QBCore:Notify','Véhicule déjà attaché.' , "primary")
            end
            return TriggerEvent('QBCore:Notify','impossible de s\'attacher à cette entité: ' .. vehicleBelowName , "error")
        end
        return TriggerEvent('QBCore:Notify','Pas sur le siège conducteur.' , "error")
    end
    TriggerEvent('QBCore:Notify','Vous n\'êtes pas dans un véhicule.' , "error")
end)

RegisterCommand('detach', function()
    local player = PlayerPedId()
    local vehicle = nil

    if IsPedInAnyVehicle(player, false) then
        vehicle = GetVehiclePedIsIn(player, false)
        if GetPedInVehicleSeat(vehicle, -1) == player then
            if IsEntityAttached(vehicle) then
                DetachEntity(vehicle, false, true)
                return TriggerEvent('QBCore:Notify','Le véhicule a été détaché.' , "success")
            else
                return TriggerEvent('QBCore:Notify','Le véhicule n\'est attaché à rien.' , "error")
            end
        else
            return TriggerEvent('QBCore:Notify','Vous n\'êtes pas dans le siège du conducteur.' , "error")
        end
    else
        return TriggerEvent('QBCore:Notify','Vous n\'êtes pas dans un véhicule.' , "error")
    end
end)

function getClosestVehicle(coords)
    local ped = PlayerPedId()
    local vehicles = GetGamePool('CVehicle')
    local closestDistance = -1
    local closestVehicle = -1
    if coords then
        coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
    else
        coords = GetEntityCoords(ped)
    end
    for i = 1, #vehicles, 1 do
        local vehicleCoords = GetEntityCoords(vehicles[i])
        local distance = #(vehicleCoords - coords)

        if closestDistance == -1 or closestDistance > distance then
            closestVehicle = vehicles[i]
            closestDistance = distance
        end
    end
    return closestVehicle, closestDistance
end

function GetVehicleBelowMe(cFrom, cTo) -- Function to get the vehicle under me
    local rayHandle = CastRayPointToPoint(cFrom.x, cFrom.y, cFrom.z, cTo.x, cTo.y, cTo.z, 10, PlayerPedId(), 0) -- Sends raycast under me
    local _, _, _, _, vehicle = GetRaycastResult(rayHandle) -- Stores the vehicle under me
    return vehicle -- Returns the vehicle under me
end

function contains(item, list)
    for _, value in ipairs(list) do
        if value == item then return true end
    end
    return false
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(true, false)
end
