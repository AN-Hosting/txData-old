local QBCore = exports['qb-core']:GetCoreObject()

-- Variable globale pour stocker les informations de crafting
CustomCraftingInfos = {}

-- Event pour traiter la fabrication d'un item (version qs-inventory)
RegisterNetEvent('qs-inventory:server:CraftItems', function(itemName, itemCosts, points, amount, toSlot, rep, randomNum, chance)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    
    local amount = tonumber(amount)
    if not amount or amount < 1 then amount = 1 end
    
    -- Vérifier les ingrédients
    local canCraft = true
    for item, need in pairs(itemCosts) do
        local playerItem = Player.Functions.GetItemByName(item)
        if not playerItem or playerItem.amount < (need * amount) then
            canCraft = false
        end
    end
    
    -- Si le craft a une chance de réussir
    local success = true
    if randomNum and chance then
        success = tonumber(randomNum) <= tonumber(chance)
    end
    
    if canCraft then
        -- Retirer les ingrédients
        for item, need in pairs(itemCosts) do
            Player.Functions.RemoveItem(item, need * amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
        end
        
        -- Ajouter l'item crafté seulement si le craft a réussi
        if success then
            if Player.Functions.AddItem(itemName, amount, toSlot) then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], "add")
                TriggerClientEvent('QBCore:Notify', src, "Craft réussi !", "success")
                
                -- Ajouter des points de réputation si applicable
                if rep and points then
                    local info = {}
                    if Player.PlayerData.metadata["craftingrep"] then
                        Player.Functions.SetMetaData("craftingrep", Player.PlayerData.metadata["craftingrep"] + points)
                        info.repgain = points
                    elseif Player.PlayerData.metadata["attachmentcraftingrep"] then
                        Player.Functions.SetMetaData("attachmentcraftingrep", Player.PlayerData.metadata["attachmentcraftingrep"] + points)
                        info.repgain = points
                    end
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "Vous n'avez pas assez de place dans votre inventaire", "error")
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "Le craft a échoué", "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "Vous n'avez pas assez d'ingrédients", "error")
    end
end)

-- Version avec le préfixe inventory
RegisterNetEvent('inventory:server:CraftItems', function(itemName, itemCosts, amount, toSlot, itemInfo)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    
    local amount = tonumber(amount)
    if not amount or amount < 1 then amount = 1 end
    
    -- Vérifier les ingrédients
    local canCraft = true
    for item, need in pairs(itemCosts) do
        local playerItem = Player.Functions.GetItemByName(item)
        if not playerItem or playerItem.amount < (need * amount) then
            canCraft = false
            break
        end
    end
    
    if canCraft then
        -- Retirer les ingrédients
        for item, need in pairs(itemCosts) do
            Player.Functions.RemoveItem(item, need * amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
        end
        
        -- Ajouter l'item crafté
        if Player.Functions.AddItem(itemName, amount, toSlot) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], "add")
            TriggerClientEvent('QBCore:Notify', src, "Craft réussi !", "success")
        else
            TriggerClientEvent('QBCore:Notify', src, "Vous n'avez pas assez de place dans votre inventaire", "error")
            -- Rendre les ingrédients si l'ajout a échoué
            for item, need in pairs(itemCosts) do
                Player.Functions.AddItem(item, need * amount)
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "Vous n'avez pas assez d'ingrédients", "error")
    end
end)

-- Event pour ouvrir l'inventaire de crafting
RegisterNetEvent('inventory:server:OpenInventory', function(name, id, other)
    local src = source
    TriggerClientEvent('inventory:client:OpenInventory', src, name, id, other)
end)

-- Event pour mettre à jour les items dans l'inventaire
RegisterNetEvent('inventory:server:SetInventoryItems', function(items)
    local src = source
    if items then
        -- Mettre à jour CustomCraftingInfos
        for key, item in pairs(items) do
            CustomCraftingInfos[key] = item
        end
    end
end)

-- Fonction de debug
function Debug(...)
    local args = {...}
    local text = ''
    for i = 1, #args do
        text = text .. ' ' .. tostring(args[i])
    end
    print('[DEBUG]' .. text)
end

-- Fonction pour vérifier si le joueur a les items requis
function hasCraftItems(source, costs, amount)
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = tonumber(amount)
    if not amount or amount < 1 then amount = 1 end
    
    local hasItems = true
    for item, need in pairs(costs) do
        local playerItem = Player.Functions.GetItemByName(item)
        if not playerItem or playerItem.amount < (need * amount) then
            hasItems = false
        end
    end
    return hasItems
end

-- Événement pour gérer le click direct sur un item du menu craft
RegisterNetEvent('inventory:server:CraftItem', function(item, slot, amount)
    local src = source
    Debug('inventory:server:CraftItem triggered for', item, 'slot:', slot, 'amount:', amount)
    
    -- Vérifier que l'item existe dans le menu de craft
    local itemData = CustomCraftingInfos[slot]
    if not itemData then
        Debug('Item data not found for slot', slot)
        return
    end
    
    Debug('ItemData:', json.encode(itemData))
    
    -- Vérifier que le joueur a les items requis
    if hasCraftItems(src, itemData.costs, amount) then
        TriggerClientEvent('qs-inventory:client:CraftItems', src, itemData.name, itemData.costs, itemData.points or 1, amount, nil, itemData.rep or nil, itemData.time or 5000, itemData.chance or 100)
    else
        TriggerClientEvent('QBCore:Notify', src, "Vous n'avez pas tous les ingrédients nécessaires", "error")
    end
end)

-- Événement pour récupérer un item crafté directement
RegisterNetEvent('inventory:server:GetCraftingItem', function(itemName, slot, amount)
    local src = source
    Debug('inventory:server:GetCraftingItem triggered for', itemName, 'slot:', slot, 'amount:', amount)
    
    local itemData = CustomCraftingInfos[slot]
    if not itemData then
        Debug('Item data not found for slot', slot)
        return
    end
    
    if hasCraftItems(src, itemData.costs, amount) then
        TriggerEvent('qs-inventory:server:CraftItems', itemName, itemData.costs, itemData.points or 1, amount, nil, itemData.rep or nil, 100, 100)
    else
        TriggerClientEvent('QBCore:Notify', src, "Vous n'avez pas tous les ingrédients nécessaires", "error")
    end
end)

-- Fonction simplifiée pour vérifier si un joueur a les ingrédients requis
local function HasIngredients(source, ingredients)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return false end
    
    for _, ingredient in ipairs(ingredients) do
        local item = Player.Functions.GetItemByName(ingredient.item)
        if not item or item.amount < ingredient.amount then
            return false
        end
    end
    
    return true
end

-- Fonction pour retirer les ingrédients
local function RemoveIngredients(source, ingredients)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return false end
    
    for _, ingredient in ipairs(ingredients) do
        Player.Functions.RemoveItem(ingredient.item, ingredient.amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[ingredient.item], "remove")
    end
    
    return true
end

-- Événement de craft
RegisterNetEvent('n-crafting:server:craftItem', function(recipe)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    -- Vérifier si le joueur a les ingrédients requis
    if not HasIngredients(src, recipe.ingredients) then
        TriggerClientEvent('QBCore:Notify', src, "Il vous manque les ingrédients requis!", "error")
        return
    end
    
    -- Retirer les ingrédients
    RemoveIngredients(src, recipe.ingredients)
    
    -- Ajouter l'item crafté
    Player.Functions.AddItem(recipe.name, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[recipe.name], "add")
    
    -- Notification de succès
    TriggerClientEvent('QBCore:Notify', src, "Vous avez préparé un(e) " .. (QBCore.Shared.Items[recipe.name].label or recipe.label), "success")
end)
