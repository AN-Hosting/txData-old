local QBCore = exports['qb-core']:GetCoreObject()

-- Fonction générique pour enregistrer des items utilisables
local function RegisterUsableItem(itemName, clientEvent)
    QBCore.Functions.CreateUseableItem(itemName, function(source, item)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        if Player.Functions.RemoveItem(item.name, 1, item.slot) then
            TriggerClientEvent(clientEvent, src, item.name)
        end
    end)
end

--====CAFÉ===---
RegisterUsableItem("mesa-coffee", "bar-jobs:DrinkCoffee")

--=====COCKTAILS====---
RegisterUsableItem("beach-cocktail", "bar-jobs:DrinkCocktail1")
RegisterUsableItem("bloody-mary", "bar-jobs:DrinkCocktail1")
RegisterUsableItem("cherry-bomb", "bar-jobs:DrinkCocktail1")
RegisterUsableItem("orange-blast", "bar-jobs:DrinkCocktail1")
RegisterUsableItem("orange-vodka", "bar-jobs:DrinkCocktail1")
RegisterUsableItem("pina-colada", "bar-jobs:DrinkCocktail1")
RegisterUsableItem("pineapple-gin", "bar-jobs:DrinkCocktail1")
RegisterUsableItem("polarbear", "bar-jobs:DrinkCocktail1")
RegisterUsableItem("rumcoke", "bar-jobs:DrinkCocktail1")
RegisterUsableItem("vanilla-special", "bar-jobs:DrinkCocktail1")

---====BIÈRE====----
RegisterUsableItem("pisswasser", "bar-jobs:DrinkBeer1")
RegisterUsableItem("pisswasser-lite", "bar-jobs:DrinkBeer1")
RegisterUsableItem("pisswasser-dark", "bar-jobs:DrinkBeer1")

-- Cas spécial pour la caisse de bières
QBCore.Functions.CreateUseableItem("pisswasser-crate", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("bar-jobs:OpenCrate", src, item.name)
    end
end)

--==CONSOMMATION DE SHOTS==--
RegisterUsableItem("cherrydrop-shot", "bar-jobs:DrinkShot1")
RegisterUsableItem("firedrop-shot", "bar-jobs:DrinkShot1")
RegisterUsableItem("lemonchello-shot", "bar-jobs:DrinkShot1")
RegisterUsableItem("liquidflame-shot", "bar-jobs:DrinkShot1")
RegisterUsableItem("minihulk-shot", "bar-jobs:DrinkShot1")
RegisterUsableItem("sourblast-shot", "bar-jobs:DrinkShot1")
RegisterUsableItem("tequila-shot", "bar-jobs:DrinkShot1")
RegisterUsableItem("vampireskiss-shot", "bar-jobs:DrinkShot1")
RegisterUsableItem("vampireslove-shot", "bar-jobs:DrinkShot1")
RegisterUsableItem("blue-shot", "bar-jobs:DrinkShot1")
RegisterUsableItem("green-shot", "bar-jobs:DrinkShot1")

