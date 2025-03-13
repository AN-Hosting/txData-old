local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('DeliveredDone')
AddEventHandler('DeliveredDone', function(damageMultiplier, difficulty)
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end 

    local baseAmount = Config.Difficulty[difficulty].reward
    local finalAmount = math.floor(baseAmount * damageMultiplier)
    
    -- Donner l'argent sale directement avec le bon nom d'item
    Player.Functions.AddItem('black', finalAmount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["black"], "add")
    
    local rewardMessage = string.format('Tu as gagné %d$ d\'argent sale pour la livraison en difficulté %s! (État du véhicule: %d%%)', 
        finalAmount, difficulty, math.floor(damageMultiplier * 100))
    TriggerClientEvent('QBCore:Notify', src, rewardMessage, 'success')
end)

-- Add police alert function
RegisterNetEvent('Alertpolice')
AddEventHandler('Alertpolice', function()
    local src = source
    local players = QBCore.Functions.GetQBPlayers()
    local policeCount = 0
    
    for _, v in pairs(players) do
        if v.PlayerData.job.name == Config.PoliceJob then
            policeCount = policeCount + 1
        end
    end
    
    if policeCount >= Config.MinimumPolice then
        -- Alert police
        for _, v in pairs(players) do
            if v.PlayerData.job.name == Config.PoliceJob then
                TriggerClientEvent('QBCore:Notify', v.PlayerData.source, 'A GoFast has been spotted!', 'police')
                TriggerClientEvent('gofast:createBlip', v.PlayerData.source)
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'Not enough police in the city', 'error')
        TriggerClientEvent('gofast:cancel', src)
    end
end)
