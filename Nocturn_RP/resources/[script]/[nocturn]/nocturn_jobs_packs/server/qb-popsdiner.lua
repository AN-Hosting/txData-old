local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('qb-popsdiner:GetFood')
AddEventHandler('qb-popsdiner:GetFood', function(ItemMake)
    local Player = QBCore.Functions.GetPlayer(source)
    
    -- Vérifier si la recette existe
    if not PopConfig.Recipes[ItemMake] then 
        TriggerClientEvent('QBCore:Notify', source, "Recette invalide!", 'error')
        return 
    end

    -- Vérifier que le joueur a tous les ingrédients
    for item, amount in pairs(PopConfig.Recipes[ItemMake].ingredients) do
        if Player.Functions.GetItemByName(item) == nil then
            TriggerClientEvent('QBCore:Notify', source, "Il vous manque des ingrédients!", 'error')
            return
        end
    end

    -- Retirer les ingrédients
    for item, amount in pairs(PopConfig.Recipes[ItemMake].ingredients) do
        Player.Functions.RemoveItem(item, amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "remove", amount)
    end

    -- Ajouter l'item crafté avec ses effets
    local info = PopConfig.Recipes[ItemMake].effects or {}
	
	Player.Functions.AddItem(ItemMake, 1, false, info)
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[ItemMake], "add", 1)
end)

---ITEM REQUIREMENT CHECKS
QBCore.Functions.CreateCallback('qb-popsdiner:CheckIngredients', function(source, cb, recipe)
    local Player = QBCore.Functions.GetPlayer(source)
    
    -- Vérifier si la recette existe
    if not PopConfig.Recipes[recipe] then 
        cb(false) 
        return 
    end
    
    -- Vérifier tous les ingrédients nécessaires
    local hasAllIngredients = true
    for item, amount in pairs(PopConfig.Recipes[recipe].ingredients) do
        local playerItem = Player.Functions.GetItemByName(item)
        if playerItem == nil or playerItem.amount < amount then
            hasAllIngredients = false
            break
        end
    end
    
    cb(hasAllIngredients)
end)

-- -- Effets lors de la consommation des items
-- QBCore.Functions.CreateUseableItem("coffee", function(source, item)
--     local Player = QBCore.Functions.GetPlayer(source)
--     if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
--     TriggerClientEvent("consumables:client:Drink", source, item.name)
    
--     -- Appliquer les effets du café
--     if item.info and item.info.thirst then
--         TriggerClientEvent("hud:client:UpdateNeeds", source, "thirst", item.info.thirst)
--     end
--     if item.info and item.info.stress then
--         TriggerClientEvent("hud:client:UpdateStress", source, item.info.stress)
--     end
-- end)