local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('vehiclekeys:client:PoliceUnlock')
AddEventHandler('vehiclekeys:client:PoliceUnlock', function()
    local ped = PlayerPedId()
    local pedcoord = GetEntityCoords(ped)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local vehiclepos = GetEntityCoords(vehicle)
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    
    if #(pedcoord - vehiclepos) < 2.0 then
        if (GetVehicleDoorLockStatus(vehicle) == 0) then QBCore.Functions.Notify("Véhicule déjà ouvert", "primary") return end
        if (PlayerJob.type == 'leo' and PlayerJob.onduty) then -- start unlock
            TriggerEvent('animations:client:EmoteCommandStart', {"weld"})
            QBCore.Functions.Progressbar("policeunlock", "Déverrouillage du véhicule !", 6000, false, true, {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function( ) -- finish
                TriggerEvent('animations:client:EmoteCommandStart', {"weld"})
                Wait(500)
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                Wait(600)
                TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "lock", 0.3)
                QBCore.Functions.Notify('Véhicule déverrouillé.', 'success')
                SetVehicleDoorsLocked(vehicle, 0)
                TriggerEvent('vehiclekeys:client:SetOwner', GetVehicleNumberPlateText(vehicle))
            end, function() -- cancel
                QBCore.Functions.Notify("Action annulée", "error")
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            end)
        elseif (not PlayerJob.type == 'leo') then 
            QBCore.Functions.Notify("Tu n'es pas un flic", "error")
        end
    else 
        QBCore.Functions.Notify("Aucun véhicule trouvé", "error")
    end
end)       