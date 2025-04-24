local QBCore = exports['qb-core']:GetCoreObject()

-- Vérifier si le joueur peut crafter l'item
QBCore.Functions.CreateCallback('nrp-crafting:server:CanCraft', function(source, cb, craftingType, itemIndex)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local recipe = Config.Recipes[craftingType].items[itemIndex]
    local canCraft = true

    if not Player or not recipe then 
        cb(false)
        return
    end

    for material, amount in pairs(recipe.ingredients) do
        local hasItem = exports['qs-inventory']:GetItemTotalAmount(src, material)
        if not hasItem or hasItem < amount then
            canCraft = false
            break
        end
    end

    cb(canCraft)
end)

-- Event pour crafter un item
RegisterNetEvent('nrp-crafting:server:CraftItem')
AddEventHandler('nrp-crafting:server:CraftItem', function(craftingType, itemIndex)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local recipe = Config.Recipes[craftingType].items[itemIndex]

    if not Player or not recipe then return end

    -- Vérifier à nouveau les ingrédients
    for material, amount in pairs(recipe.ingredients) do
        local hasItem = exports['qs-inventory']:GetItemTotalAmount(src, material)
        if not hasItem or hasItem < amount then
            TriggerClientEvent('QBCore:Notify', src, "Vous n'avez pas les ingrédients nécessaires", "error")
            return
        end
    end

    -- Calculer la chance de réussite
    local success = math.random(1, 100) <= recipe.chance

    if success then
        -- Retirer les ingrédients
        for material, amount in pairs(recipe.ingredients) do
            exports['qs-inventory']:RemoveItem(src, material, amount)
        end

        -- Ajouter l'item crafté avec les métadonnées
        local info = {
            crafted = true,
            craftedBy = Player.PlayerData.citizenid,
            craftedAt = os.time(),
            quality = math.random(1, 100)
        }
        
        exports['qs-inventory']:AddItem(src, recipe.item, recipe.amount, false, info)
        TriggerClientEvent('QBCore:Notify', src, "Vous avez fabriqué " .. recipe.label, "success")
    else
        -- En cas d'échec, retirer une partie des ingrédients
        for material, amount in pairs(recipe.ingredients) do
            local lostAmount = math.ceil(amount * 0.5) -- Perte de 50% des matériaux
            exports['qs-inventory']:RemoveItem(src, material, lostAmount)
        end
        TriggerClientEvent('QBCore:Notify', src, "Le craft a échoué et vous avez perdu des matériaux", "error")
    end
end) 