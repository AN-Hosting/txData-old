local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('qb-burgershot:GetFood')
AddEventHandler('qb-burgershot:GetFood', function(ItemMake)
    local Player = QBCore.Functions.GetPlayer(source)
    
    -- Vérifier si la recette existe
    if not BGSConfig.Recipes[ItemMake] then 
        TriggerClientEvent('QBCore:Notify', source, "Recette invalide!", 'error')
        return 
    end

    -- Vérifier que le joueur a tous les ingrédients
    for item, amount in pairs(BGSConfig.Recipes[ItemMake].ingredients) do
        if Player.Functions.GetItemByName(item) == nil then
            TriggerClientEvent('QBCore:Notify', source, "Il vous manque des ingrédients!", 'error')
            return
        end
    end

    -- Retirer les ingrédients
    for item, amount in pairs(BGSConfig.Recipes[ItemMake].ingredients) do
        Player.Functions.RemoveItem(item, amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "remove", amount)
    end

    -- Ajouter l'item crafté avec ses effets
    local info = BGSConfig.Recipes[ItemMake].effects or {}
	
	Player.Functions.AddItem(ItemMake, 1, false, info)
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[ItemMake], "add", 1)
end)

---ITEM REQUIREMENT CHECKS
QBCore.Functions.CreateCallback('qb-burgershot:CheckIngredients', function(source, cb, recipe)
    local Player = QBCore.Functions.GetPlayer(source)
    
    -- Vérifier si la recette existe
    if not BGSConfig.Recipes[recipe] then 
        cb(false) 
        return 
    end
    
    -- Vérifier tous les ingrédients nécessaires
    local hasAllIngredients = true
    for item, amount in pairs(BGSConfig.Recipes[recipe].ingredients) do
        local playerItem = Player.Functions.GetItemByName(item)
        if playerItem == nil or playerItem.amount < amount then
            hasAllIngredients = false
            break
        end
    end
    
    cb(hasAllIngredients)
end)
