if GetResourceState('qbx_core') == 'started' then return end
if GetResourceState('qb-core') ~= 'started' then return end

Config.Framework = 'qbcore'

server = {}

QBCore = exports['qb-core']:GetCoreObject()

server.GetPlayerFromId = QBCore.Functions.GetPlayer
server.GetPlayers = QBCore.Functions.GetQBPlayers

server.isPlayerPolice = function(Player)
    return (Player.PlayerData.job.type == 'leo' or Player.PlayerData.job.name == 'police') and Player.PlayerData.job.onduty
end

server.getPlayerData = function(Player)
    return {
        source = Player.PlayerData.source,
        identifier = Player.PlayerData.citizenid,
        name = Player.PlayerData.name,
    }
end

server.addMoney = function(Player, moneyType, amount, reason)
    return Player.Functions.AddMoney(moneyType, amount, reason)
end

server.createLog = function(source, event, message)
    if Config.Logging == 'ox_lib' then
        lib.logger(source, event, message)
    elseif Config.Logging == 'qb' then
        TriggerEvent('qb-log:server:CreateLog', 'weedplanting', event, 'default', message)
    end
end

server.hasItem = function(source, items, amount)
    amount = amount or 1

    if Config.Inventory == 'ox_inventory' then
        local count = exports['ox_inventory']:Search(source, 'count', items)

        if type(items) == 'table' and type(count) == 'table' then
            for _, v in pairs(count) do
                if v < amount then
                    return false
                end
            end
    
            return true
        end
    
        return count >= amount
    else
        -- Vérifier si l'export GetItemByName existe dans qs-inventory
        if Config.Inventory == 'qs-inventory' then
            local success, result = pcall(function()
                return exports['qs-inventory']:GetItemByName(source, items)
            end)
            
            if success and result then
                if type(result) == 'table' and result.amount then
                    return result.amount >= amount
                end
                return true
            end
        end
        
        -- Fallback à la méthode QB standard
        return QBCore.Functions.HasItem(source, items, amount)
    end
end

server.removeItem = function(source, item, count, metadata, slot, ignoreTotal)
    if Config.Inventory == 'ox_inventory' then
        print('^3[ps-weedplanting] ^5Utilisation de ox_inventory RemoveItem^7')
        return exports['ox_inventory']:RemoveItem(source, item, count, metadata, slot, ignoreTotal)
    elseif Config.Inventory == 'qs-inventory' then
        print('^3[ps-weedplanting] ^5Utilisation de qs-inventory RemoveItem pour l\'item: ' .. item .. '^7')
        -- Tenter de trouver l'item de l'inventaire
        local itemData = exports['qs-inventory']:GetItemByName(source, item)
        print('^3[ps-weedplanting] ^5Données d\'item: ' .. (itemData and 'trouvé' or 'non trouvé') .. '^7')
        if itemData then
            print('^3[ps-weedplanting] ^5Slot d\'item: ' .. (itemData.slot or 'inconnu') .. '^7')
            return exports['qs-inventory']:RemoveItem(source, item, count, itemData.slot, 'ps-weedplanting')
        else
            print('^3[ps-weedplanting] ^1Item non trouvé dans l\'inventaire^7')
            return false
        end
    elseif Config.Inventory == 'ps-inventory' then
        print('^3[ps-weedplanting] ^5Utilisation de ps-inventory RemoveItem^7')
        return exports['ps-inventory']:RemoveItem(source, item, count, slot)
    else
        print('^3[ps-weedplanting] ^5Utilisation de QB-Core RemoveItem^7')
        local Player = server.GetPlayerFromId(source)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'remove', count)
        return Player.Functions.RemoveItem(item, count, slot)
    end
end

server.addItem = function(source, item, count, metadata, slot)
    print('^3[ps-weedplanting] ^5Tentative d\'ajout d\'item: ' .. item .. ' x' .. count .. ' à l\'inventaire du joueur ' .. source .. '^7')
    
    if Config.Inventory == 'ox_inventory' then
        if exports['ox_inventory']:CanCarryItem(source, item, count, metadata) then
            return exports['ox_inventory']:AddItem(source, item, count, metadata, slot)
        else
            utils.notify(source, Locales['notify_title_planting'], Locales['notify_invent_full'], 'error', 5000)
            
            exports['ox_inventory']:CustomDrop(Locales['notify_title'], {
                { item, count, metadata }
            }, GetEntityCoords(GetPlayerPed(source)))
            return true
        end
    elseif Config.Inventory == 'qs-inventory' then
        -- Suppression de la vérification CanAddItem puisqu'elle n'existe pas
        print('^3[ps-weedplanting] ^5Ajout d\'item avec qs-inventory: ' .. item .. ' x' .. count .. '^7')
        
        -- Ajouter les items un par un pour éviter les métadonnées
        -- Cette méthode ajoute chaque item séparément sans métadonnées
        local success = true
        local totalAdded = 0
        
        for i = 1, count do
            local itemAdded = false
            pcall(function()
                -- Appel simplifié sans métadonnées
                itemAdded = exports['qs-inventory']:AddItem(source, item, 1)
            end)
            
            if itemAdded then
                totalAdded = totalAdded + 1
            else
                print('^3[ps-weedplanting] ^1Erreur lors de l\'ajout de l\'item #' .. i .. '^7')
                success = false
            end
        end
        
        print('^3[ps-weedplanting] ^5' .. totalAdded .. '/' .. count .. ' items ajoutés avec succès^7')
        return totalAdded > 0
    elseif Config.Inventory == 'ps-inventory' then
        return exports['ps-inventory']:AddItem(source, item, count, slot, metadata)
    else
        local Player = server.GetPlayerFromId(source)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add', count)
        return Player.Functions.AddItem(item, count, slot, nil) -- Suppression des métadonnées ici aussi
    end
end

server.getItem = function(source, itemName)
    if Config.Inventory == 'ox_inventory' then
        local items = exports['ox_inventory']:Search(source, 1, itemName)
        return items[1]
    elseif Config.Inventory == 'qs-inventory' then
        local success, result = pcall(function()
            return exports['qs-inventory']:GetItemByName(source, itemName)
        end)
        
        if success then
            return result
        else
            print('^3[ps-weedplanting] ^1Erreur lors de l\'appel à GetItemByName: ' .. tostring(result) .. '^7')
            -- Tenter une méthode alternative si l'export échoue
            local Player = QBCore.Functions.GetPlayer(source)
            if Player then
                return Player.Functions.GetItemByName(itemName)
            end
        end
    elseif Config.Inventory == 'ps-inventory' then
        local item = exports['ps-inventory']:GetItemByName(source, itemName)
        return item
    else
        local Player = server.GetPlayerFromId(source)
        local item = Player.Functions.GetItemByName(itemName)
        return item
    end
    
    return nil
end

server.setMetaData = function(source, slot, metadata)
    if Config.Inventory == 'ox_inventory' then
        metadata.durability = math.floor(metadata.uses * 100 / Config.LaptopUses)
        exports['ox_inventory']:SetMetadata(source, slot, metadata)
    else
        local Player = server.GetPlayerFromId(source)
        Player.PlayerData.items[slot].info = metadata
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end

server.registerUseableItem = QBCore.Functions.CreateUseableItem

-- Ajout d'une fonction pour ajouter des items directement avec QBCore en cas d'échec de l'inventaire personnalisé
server.addItemDirect = function(source, item, count, metadata)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        -- Ajouter les items un par un sans métadonnées
        local success = false
        for i = 1, count do
            local itemAdded = Player.Functions.AddItem(item, 1, nil, nil) -- Suppression des métadonnées
            if itemAdded then 
                success = true
            end
        end
        
        if success then
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add', count)
        end
        return success
    end
    return false
end
