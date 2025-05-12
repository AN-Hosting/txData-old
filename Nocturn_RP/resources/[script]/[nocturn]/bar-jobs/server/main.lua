local QBCore = exports['qb-core']:GetCoreObject()

-- Callback générique pour vérifier les ingrédients
QBCore.Functions.CreateCallback('bar-jobs:server:CheckIngredients', function(source, cb, ingredients)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local hasItems = true
    
    -- Vérifier chaque ingrédient
    for item, amount in pairs(ingredients) do
        local playerItem = Player.Functions.GetItemByName(item)
        if not playerItem or playerItem.amount < amount then
            hasItems = false
            break
        end
    end
    
    cb(hasItems)
end)

-- Maintenir la compatibilité avec les anciens callbacks
QBCore.Functions.CreateCallback('bar-jobs:server:get:ingredientCoffee', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local beans = Ply.Functions.GetItemByName("mesa-beans")
    local cup = Ply.Functions.GetItemByName("mesa-cup")
    if beans ~= nil and cup ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('bar-jobs:server:get:ingredientCocktail', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local mix = Ply.Functions.GetItemByName("cocktail-mix")
    local cglass = Ply.Functions.GetItemByName("cocktail-glass")
    if mix ~= nil and cglass ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('bar-jobs:server:get:ingredientShots', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local smix = Ply.Functions.GetItemByName("shots-mix")
    local sglass = Ply.Functions.GetItemByName("shot-glass")
    if smix ~= nil and sglass ~= nil then
        cb(true)
    else
        cb(false)
    end
end)
