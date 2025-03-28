local maxSpeed = 240.0 / 3.6 -- Conversion km/h en m/s
local emergencyBonus = 10.0 / 3.6 -- 10 km/h supplémentaires en m/s

-- Classes de véhicules d'urgence selon la documentation
local emergencyClasses = {
    [18] = true, -- Emergency
    [19] = true  -- Military
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        local player = GetPlayerPed(-1)
        
        if IsPedInAnyVehicle(player, false) then
            local vehicle = GetVehiclePedIsIn(player, false)
            local vehicleClass = GetVehicleClass(vehicle)
            local currentSpeed = GetEntitySpeed(vehicle)
            
            local actualMaxSpeed = maxSpeed
            if emergencyClasses[vehicleClass] then
                actualMaxSpeed = maxSpeed + emergencyBonus
            end
            
            if currentSpeed > actualMaxSpeed then
                SetVehicleForwardSpeed(vehicle, actualMaxSpeed)
            end
        end
        
        Citizen.Wait(100) -- Contrôle toutes les 100ms
    end
end)
