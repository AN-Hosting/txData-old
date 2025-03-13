local QBCore = exports['qb-core']:GetCoreObject()

-- Purchase attempts
RegisterNetEvent('qb-rental:attemptPurchase', function(car, price, needLicense, garage)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local driverLicense = Player.PlayerData.metadata["licences"]["driver"]

    if needLicense and not driverLicense then
        TriggerClientEvent('qb-rental:noDriverLicense', src)
        return
    end

    if Player.PlayerData.money.cash < price then
        TriggerClientEvent('qb-rental:attemptvehiclespawnfail', src)
        return
    end

    TriggerClientEvent('qb-rental:vehiclespawn', src, car, price, garage)
end)

-- Purchase and return handling
RegisterNetEvent('qb-rental:purchase', function(price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveMoney("cash", price, "vehicle-rental")
    TriggerClientEvent('QBCore:Notify', src, Config.translations[Config.locale].info_back, "success")
end)

RegisterNetEvent('qb-rental:server:payreturn', function(model)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    for _, vehicle in pairs(Config.vehicleList) do
        if string.lower(vehicle.model) == model then
            local price = math.floor(vehicle.price / 2)
            Player.Functions.AddMoney("cash", price, "rental-return")
            TriggerClientEvent('QBCore:Notify', src, Config.translations[Config.locale].success_back .. price, "success")
            break
        end
    end
end)

-- Rental papers handling
RegisterNetEvent('qb-rental:giverentalpaperServer', function(plateText)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = { label = plateText }
    
    Player.Functions.AddItem('rentalpapers', 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rentalpapers'], "add")
end)

QBCore.Functions.CreateCallback('qb-rental:server:hasrentalpapers', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName("rentalpapers")
    
    if Item then
        Player.Functions.RemoveItem('rentalpapers', 1)
        cb(true)
    else
        cb(false)
    end
end)
