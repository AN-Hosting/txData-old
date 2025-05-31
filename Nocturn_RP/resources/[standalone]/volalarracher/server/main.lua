local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('rob_npc:giveItem')
AddEventHandler('rob_npc:giveItem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player then
        if item == "cash" then
            -- Gérer l'argent liquide
            Player.Functions.AddMoney('cash', amount)
            TriggerClientEvent('QBCore:Notify', src, 'Vous avez reçu $' .. amount, 'success')
        else
            -- Gérer les items normaux
            if Player.Functions.AddItem(item, amount) then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
                TriggerClientEvent('QBCore:Notify', src, 'Vous avez reçu ' .. amount .. 'x ' .. QBCore.Shared.Items[item].label, 'success')
            else
                TriggerClientEvent('QBCore:Notify', src, 'Vous n\'avez pas assez de place dans votre inventaire!', 'error')
            end
        end
    end
end)

RegisterNetEvent('rob_npc:notifyPolice')
AddEventHandler('rob_npc:notifyPolice', function(coords)
    local src = source
    -- Notification à tous les policiers en service
    local players = QBCore.Functions.GetQBPlayers()
    
    for _, v in pairs(players) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            TriggerClientEvent('QBCore:Notify', v.PlayerData.source, 'Un vol à l\'arraché a été signalé!', 'inform')
            -- Créer un blip sur la carte pour les policiers
            TriggerClientEvent('rob_npc:createPoliceBlip', v.PlayerData.source, coords)
        end
    end
end)

QBCore.Functions.CreateUseableItem('stolen_bag', function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem('stolen_bag', 1) then
        -- Donner les items aléatoires du sac
        for _, item in pairs(Config.Items) do
            if math.random(100) <= item.chance then
                local amount = math.random(item.min, item.max)
                Player.Functions.AddItem(item.name, amount)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item.name], "add")
            end
        end
        TriggerClientEvent('QBCore:Notify', source, 'Vous avez ouvert le sac!', 'success')
    end
end)

RegisterNetEvent('rob_npc:giveStolenBag')
AddEventHandler('rob_npc:giveStolenBag', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player then
        Player.Functions.AddItem('stolen_bag', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['stolen_bag'], "add")
    end
end)

-- Ajouter l'événement pour l'alerte police
RegisterNetEvent('police:server:policeAlert')
AddEventHandler('police:server:policeAlert', function(message, coords)
    local src = source
    local Players = QBCore.Functions.GetQBPlayers()
    
    for _, v in pairs(Players) do
        if v.PlayerData.job.name == "police_nationale" or v.PlayerData.job.name == "gendarmerie_nationale" then
            if v.PlayerData.job.onduty then
                TriggerClientEvent('QBCore:Notify', v.PlayerData.source, message, 'police')
                TriggerClientEvent('rob_npc:createPoliceBlip', v.PlayerData.source, coords)
            end
        end
    end
end) 