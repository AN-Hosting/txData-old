local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('ps-drugprocessing:server:sellDrugs', function(drugType, amount, price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    -- Vérifier si le joueur a la drogue
    if Player.Functions.GetItemByName(drugType) then
        -- Retirer la drogue
        if Player.Functions.RemoveItem(drugType, amount) then
            -- Ajouter l'argent sale comme item
            exports['qb-inventory']:AddItem(src, "black", price)
            
            -- Notifications
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[drugType], "remove", amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["black"], "add", price)
            TriggerClientEvent('QBCore:Notify', src, "Vous avez vendu "..amount.."x "..QBCore.Shared.Items[drugType].label.." pour $"..price.." en argent sale", "success")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "Vous n'avez pas assez de "..QBCore.Shared.Items[drugType].label, "error")
    end
end) 