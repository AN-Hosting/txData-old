local QBCore = exports['qb-core']:GetCoreObject()
local items = {
    {name = "Téléphone", buyPrice = 100, sellPrice = 50},
    {name = "Montre", buyPrice = 200, sellPrice = 100},
    {name = "Bijoux", buyPrice = 500, sellPrice = 250},
    {name = "Console", buyPrice = 800, sellPrice = 400}
}

-- Vérification des droits admin
RegisterNetEvent('pawnshop:checkAdmin')
AddEventHandler('pawnshop:checkAdmin', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    
    if Player.PlayerData.permission == 'admin' then
        TriggerClientEvent('pawnshop:openAdminUI', source)
    else
        TriggerClientEvent('QBCore:Notify', source, 'Vous n\'avez pas les droits nécessaires', 'error')
    end
end)

-- Événement pour recevoir un item d'un joueur
RegisterNetEvent('pawnshop:receiveItem')
AddEventHandler('pawnshop:receiveItem', function(itemName, targetPlayerId)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local TargetPlayer = QBCore.Functions.GetPlayer(tonumber(targetPlayerId))
    
    if Player.PlayerData.permission == 'admin' and TargetPlayer then
        local item = nil
        for _, v in pairs(items) do
            if v.name == itemName then
                item = v
                break
            end
        end
        
        if item then
            local hasItem = TargetPlayer.Functions.GetItemByName(itemName)
            if hasItem and hasItem.amount > 0 then
                TargetPlayer.Functions.RemoveItem(itemName, 1)
                Player.Functions.AddItem(itemName, 1)
                TriggerClientEvent('QBCore:Notify', source, 'Vous avez reçu ' .. itemName .. ' de ' .. TargetPlayer.PlayerData.charinfo.firstname, 'success')
                TriggerClientEvent('QBCore:Notify', targetPlayerId, 'Vous avez donné ' .. itemName .. ' au pawnshop', 'success')
            else
                TriggerClientEvent('QBCore:Notify', source, 'Le joueur n\'a pas cet item', 'error')
            end
        end
    end
end)

-- Événement pour acheter un item
RegisterNetEvent('pawnshop:buyItem')
AddEventHandler('pawnshop:buyItem', function(itemName)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    
    if Player then
        local item = nil
        for _, v in pairs(items) do
            if v.name == itemName then
                item = v
                break
            end
        end
        
        if item then
            if Player.PlayerData.money.cash >= item.buyPrice then
                Player.Functions.RemoveMoney('cash', item.buyPrice)
                Player.Functions.AddItem(itemName, 1)
                TriggerClientEvent('QBCore:Notify', source, 'Vous avez acheté ' .. itemName .. ' pour $' .. item.buyPrice, 'success')
            else
                TriggerClientEvent('QBCore:Notify', source, 'Vous n\'avez pas assez d\'argent', 'error')
            end
        end
    end
end)

-- Événement pour vendre un item
RegisterNetEvent('pawnshop:sellItem')
AddEventHandler('pawnshop:sellItem', function(itemName)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    
    if Player then
        local item = nil
        for _, v in pairs(items) do
            if v.name == itemName then
                item = v
                break
            end
        end
        
        if item then
            local hasItem = Player.Functions.GetItemByName(itemName)
            if hasItem and hasItem.amount > 0 then
                Player.Functions.RemoveItem(itemName, 1)
                Player.Functions.AddMoney('cash', item.sellPrice)
                TriggerClientEvent('QBCore:Notify', source, 'Vous avez vendu ' .. itemName .. ' pour $' .. item.sellPrice, 'success')
            else
                TriggerClientEvent('QBCore:Notify', source, 'Vous n\'avez pas cet item', 'error')
            end
        end
    end
end) 