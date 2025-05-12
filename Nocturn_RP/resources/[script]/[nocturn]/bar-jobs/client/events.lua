local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
local onDuty = true
PlayerJob = {}
local IsMakingDrink = false

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

RegisterNetEvent("bar-jobs:GetShotGlass")
AddEventHandler("bar-jobs:GetShotGlass", function()
		TriggerServerEvent('QBCore:Server:AddItem', "shot-glass", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['shot-glass'], "add")
end)

RegisterNetEvent("bar-jobs:GetCockGlass")
AddEventHandler("bar-jobs:GetCockGlass", function()
    TriggerServerEvent('QBCore:Server:AddItem', "cocktail-glass", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['cocktail-glass'], "add")
end)

RegisterNetEvent('bar-jobs:BrewCoffee')
AddEventHandler('bar-jobs:BrewCoffee', function() 
    local jobName = PlayerJob.name
    
    if Config.BarJobs[jobName] and Config.BarJobs[jobName].locations.crafting.coffee then
        local coffeeRecipe = Config.BarJobs[jobName].locations.crafting.coffee.recipes["mesa-coffee"]
        
        if coffeeRecipe then
            TriggerEvent("bar-jobs:CraftDrink", "mesa-coffee", coffeeRecipe)
        else
            QBCore.Functions.Notify("Recette non trouvée", "error")
        end
    else
        QBCore.Functions.Notify("Vous ne pouvez pas faire ça ici", "error")
end
end)

RegisterNetEvent('bar-jobs:MakeBeachCocktail')
AddEventHandler('bar-jobs:MakeBeachCocktail', function() 
    local jobName = PlayerJob.name
    
    if Config.BarJobs[jobName] and Config.BarJobs[jobName].locations.crafting.cocktails then
        local cocktailRecipe = Config.BarJobs[jobName].locations.crafting.cocktails.recipes["beach-cocktail"]
        
        if cocktailRecipe then
            TriggerEvent("bar-jobs:CraftDrink", "beach-cocktail", cocktailRecipe)
        else
            QBCore.Functions.Notify("Recette non trouvée", "error")
        end
    else
        QBCore.Functions.Notify("Vous ne pouvez pas faire ça ici", "error")
end
end)

RegisterNetEvent('bar-jobs:MakeBloodyMary')
AddEventHandler('bar-jobs:MakeBloodyMary', function() 
    local jobName = PlayerJob.name
    
    if Config.BarJobs[jobName] and Config.BarJobs[jobName].locations.crafting.cocktails then
        local cocktailRecipe = Config.BarJobs[jobName].locations.crafting.cocktails.recipes["bloody-mary"]
        
        if cocktailRecipe then
            TriggerEvent("bar-jobs:CraftDrink", "bloody-mary", cocktailRecipe)
        else
            QBCore.Functions.Notify("Recette non trouvée", "error")
        end
    else
        QBCore.Functions.Notify("Vous ne pouvez pas faire ça ici", "error")
end
end)

RegisterNetEvent('bar-jobs:MakeCherryBomb')
AddEventHandler('bar-jobs:MakeCherryBomb', function() 
    local jobName = PlayerJob.name
    
    if Config.BarJobs[jobName] and Config.BarJobs[jobName].locations.crafting.cocktails then
        local cocktailRecipe = Config.BarJobs[jobName].locations.crafting.cocktails.recipes["cherry-bomb"]
        
        if cocktailRecipe then
            TriggerEvent("bar-jobs:CraftDrink", "cherry-bomb", cocktailRecipe)
        else
            QBCore.Functions.Notify("Recette non trouvée", "error")
        end
    else
        QBCore.Functions.Notify("Vous ne pouvez pas faire ça ici", "error")
end
end)

RegisterNetEvent('bar-jobs:MakeOrangeBlast')
AddEventHandler('bar-jobs:MakeOrangeBlast', function() 
    local jobName = PlayerJob.name
    
    if Config.BarJobs[jobName] and Config.BarJobs[jobName].locations.crafting.cocktails then
        local cocktailRecipe = Config.BarJobs[jobName].locations.crafting.cocktails.recipes["orange-blast"]
        
        if cocktailRecipe then
            TriggerEvent("bar-jobs:CraftDrink", "orange-blast", cocktailRecipe)
        else
            QBCore.Functions.Notify("Recette non trouvée", "error")
        end
    else
        QBCore.Functions.Notify("Vous ne pouvez pas faire ça ici", "error")
end
end)

function MakeCocktail(itemName)
    local jobName = PlayerJob.name
    
    if Config.BarJobs[jobName] and Config.BarJobs[jobName].locations.crafting.cocktails then
        local cocktailRecipe = Config.BarJobs[jobName].locations.crafting.cocktails.recipes[itemName]
        
        if cocktailRecipe then
            TriggerEvent("bar-jobs:CraftDrink", itemName, cocktailRecipe)
        else
            QBCore.Functions.Notify("Recette non trouvée", "error")
        end
    else
        QBCore.Functions.Notify("Vous ne pouvez pas faire ça ici", "error")
    end
end

function MakeShot(itemName)
    local jobName = PlayerJob.name
    
    if Config.BarJobs[jobName] and Config.BarJobs[jobName].locations.crafting.shots then
        local shotRecipe = Config.BarJobs[jobName].locations.crafting.shots.recipes[itemName]
        
        if shotRecipe then
            TriggerEvent("bar-jobs:CraftDrink", itemName, shotRecipe)
        else
            QBCore.Functions.Notify("Recette non trouvée", "error")
        end
    else
        QBCore.Functions.Notify("Vous ne pouvez pas faire ça ici", "error")
    end
end

-- Créer dynamiquement les événements pour les différentes boissons
Citizen.CreateThread(function()
    Citizen.Wait(1000)
    
    -- print("=== DÉBUT DE CRÉATION DES ÉVÉNEMENTS DE CRAFT ===")
    local eventCount = 0
    
    -- Pour chaque job
    for jobName, jobData in pairs(Config.BarJobs) do
        -- Pour chaque station de craft
        if jobData.locations and jobData.locations.crafting then
            for stationType, station in pairs(jobData.locations.crafting) do
                -- Pour chaque recette disponible
                for itemName, _ in pairs(station.recipes) do
                    -- Créer un gestionnaire d'événement pour cette recette spécifique
                    local eventName = "bar-jobs:Make" .. string.gsub(itemName, "-", "")
                    
                    -- Enregistre l'événement de manière inconditionnelle
                    -- Nous ne vérifions pas s'il existe déjà, car nous ne pouvons pas accéder à _EVENTS
                    -- En cas de double enregistrement, le dernier gestionnaire sera prioritaire 
                    AddEventHandler(eventName, function()
                        local type = stationType
                        -- print("Événement appelé:", eventName, "Type:", type, "Item:", itemName)
                        if type == "cocktails" then
                            MakeCocktail(itemName)
                        elseif type == "shots" then
                            MakeShot(itemName)
                        else
                            -- Type générique
                            TriggerEvent("bar-jobs:CraftDrink", itemName, station.recipes[itemName])
                        end
                        end)

                    eventCount = eventCount + 1
                    -- print("Événement enregistré:", eventName, "pour l'item:", itemName, "type:", stationType)
                end
            end
        end
    end
    
    -- print("=== FIN DE CRÉATION DES ÉVÉNEMENTS DE CRAFT ===")
    -- print("Total d'événements créés:", eventCount)
end)