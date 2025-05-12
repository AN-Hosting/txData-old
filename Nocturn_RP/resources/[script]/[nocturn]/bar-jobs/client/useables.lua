local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
local onDuty = true
PlayerJob = {}

DrinkMesaCoffee = {
    ["mesa-coffee"] = math.random(5, 10),
}

DrinkMesaBeer = {
    ["pisswasser"] = math.random(5, 10),
    ["pisswasser-lite"] = math.random(5, 10),
    ["pisswasser-dark"] = math.random(5, 10),
}

DrinkMesaCocktails = {
    ["beach-cocktail"] = math.random(5, 10),
    ["bloody-mary"] = math.random(5, 10),
    ["cherry-bomb"] = math.random(5, 10),
    ["orange-blast"] = math.random(5, 10),
    ["orange-vodka"] = math.random(5, 10),
    ["pina-colada"] = math.random(5, 10),
    ["pineapple-gin"] = math.random(5, 10),
    ["polarbear"] = math.random(5, 10),
    ["rumcoke"] = math.random(5, 10),
}

DrinkMesaShots = {
    ["cherrydrop-shot"] = math.random(5, 10),
    ["firedrop-shot"] = math.random(5, 10),
    ["lemonchello-shot"] = math.random(5, 10),
    ["liquidflame-shot"] = math.random(5, 10),
    ["minihulk-shot"] = math.random(5, 10),
    ["sourblast-shot"] = math.random(5, 10),
    ["tequila-shot"] = math.random(5, 10),
    ["vampireskiss-shot"] = math.random(5, 10),
    ["vampireslove-shot"] = math.random(5, 10),
}

-- Fonction générique pour consommer une boisson
RegisterNetEvent('bar-jobs:DrinkItem')
AddEventHandler('bar-jobs:DrinkItem', function(itemName)
    -- Vérifier si l'item existe dans la configuration
    if Config.DrinkEffects[itemName] then
        local drinkData = Config.DrinkEffects[itemName]
        local animDict, anim, prop, propCoords, propRotation
        
        -- Déterminer l'animation et le prop en fonction du type de boisson
        if itemName == "mesa-coffee" then
            animDict = 'amb@world_human_drinking@coffee@male@idle_a'
            anim = 'idle_b'
            prop = 'v_res_mcofcup'
            propCoords = { x = -0.020, y = -0.020, z = -0.000 }
            propRotation = { x = 350.0, y = 360.0, z = 0.0 }
        elseif string.find(itemName, "shot") then
            animDict = 'amb@world_human_drinking@coffee@male@idle_a'
            anim = 'idle_b'
            prop = 'prop_shot_glass'
            propCoords = { x = -0.00, y = -0.020, z = -0.000 }
            propRotation = { x = 350.0, y = 360.0, z = 0.0 }
        elseif string.find(itemName, "cocktail") or string.find(itemName, "mary") or string.find(itemName, "bomb") or string.find(itemName, "blast") then
            animDict = 'amb@world_human_drinking@coffee@male@idle_a'
            anim = 'idle_b'
            prop = 'p_wine_glass_s'
            propCoords = { x = -0.020, y = -0.020, z = -0.070 }
            propRotation = { x = 350.0, y = 360.0, z = 0.0 }
        else
            animDict = 'amb@world_human_drinking@coffee@male@idle_a'
            anim = 'idle_b'
            prop = 'prop_amb_beer_bottle'
            propCoords = { x = -0.00, y = -0.00, z = -0.00 }
            propRotation = { x = 350.0, y = 360.0, z = 0.0 }
        end
        
        -- Animation de consommation
        QBCore.Functions.Progressbar('drink', 'Boire...', 4000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
        disableInventory = true,
    }, {
            animDict = animDict,
            anim = anim,
        flags = 8,
    }, {
            model = prop,
        bone = 28422,
            coords = propCoords,
            rotation = propRotation,
    }, {}, function()
            -- Retirer l'item
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
            
            -- Appliquer les effets
            if drinkData.thirst then
                TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + drinkData.thirst)
            end
            
            if drinkData.stress then
                TriggerServerEvent("QBCore:Server:SetMetaData", "stress", math.max(0, QBCore.Functions.GetPlayerData().metadata["stress"] + drinkData.stress))
            end
            
            -- Appliquer des effets spécifiques selon le type
            if drinkData.effect then
                ApplyDrinkEffect(drinkData.effect, drinkData.duration)
            end
            
    end, function() -- Cancel
            StopAnimTask(PlayerPedId(), animDict, anim, 1.0)
            QBCore.Functions.Notify("Annulé...", "error")
    end)
    else
        QBCore.Functions.Notify("Cet item n'a pas d'effet configuré", "error")
    end
end)

-- Fonction pour appliquer des effets spécifiques
function ApplyDrinkEffect(effectType, duration)
    if effectType == "caffeine" then
        -- Effet caféine: Augmente temporairement la vitesse de marche
        SetRunSprintMultiplierForPlayer(PlayerId(), 1.1)
        
        -- Retour à la normale après la durée
        Citizen.SetTimeout(duration, function()
            SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
        end)
        
    elseif effectType == "alcohol" then
        -- Effet alcool: Légère ivresse
        SetTimecycleModifier("spectator5")
        AnimpostfxPlay("HeistCelebPass", duration, false)
        ShakeGameplayCam("DRUNK_SHAKE", 0.5)
        
        -- Retour à la normale après la durée
        Citizen.SetTimeout(duration, function()
            SetTimecycleModifier("")
            AnimpostfxStopAll()
            ShakeGameplayCam("DRUNK_SHAKE", 0.0)
        end)
        
    elseif effectType == "alcohol_strong" then
        -- Effet alcool fort: Forte ivresse
        SetTimecycleModifier("spectator5")
        AnimpostfxPlay("HeistCelebPass", duration, false)
        ShakeGameplayCam("DRUNK_SHAKE", 1.0)
        
        -- Retour à la normale après la durée
        Citizen.SetTimeout(duration, function()
            SetTimecycleModifier("")
            AnimpostfxStopAll()
            ShakeGameplayCam("DRUNK_SHAKE", 0.0)
        end)
        
    elseif effectType == "alcohol_special" then
        -- Effet spécial: Très forte ivresse avec effets visuels
        SetTimecycleModifier("drug_flying_base")
        AnimpostfxPlay("DrugsMichaelAliensFight", duration, false)
        ShakeGameplayCam("DRUNK_SHAKE", 1.5)
        
        -- Retour à la normale après la durée
        Citizen.SetTimeout(duration, function()
            SetTimecycleModifier("")
            AnimpostfxStopAll()
            ShakeGameplayCam("DRUNK_SHAKE", 0.0)
        end)
    end
end

-- Maintenir la compatibilité avec les anciens événements
RegisterNetEvent('bar-jobs:DrinkCoffee')
AddEventHandler('bar-jobs:DrinkCoffee', function(itemName)
    TriggerEvent('bar-jobs:DrinkItem', itemName)
end)

RegisterNetEvent('bar-jobs:DrinkCocktail1')
AddEventHandler('bar-jobs:DrinkCocktail1', function(itemName)
    TriggerEvent('bar-jobs:DrinkItem', itemName)
end)

RegisterNetEvent('bar-jobs:DrinkBeer1')
AddEventHandler('bar-jobs:DrinkBeer1', function(itemName)
    TriggerEvent('bar-jobs:DrinkItem', itemName)
end)

RegisterNetEvent('bar-jobs:DrinkShot1')
AddEventHandler('bar-jobs:DrinkShot1', function(itemName)
    TriggerEvent('bar-jobs:DrinkItem', itemName)
end)

RegisterNetEvent("bar-jobs:OpenCrate")
AddEventHandler("bar-jobs:OpenCrate", function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward * 1.0)

    local pcase = `hei_heist_cs_beer_box` 
    RequestModel(pcase)
    while (not HasModelLoaded(pcase)) do
        Wait(1)
    end
    local pobj = CreateObject(pcase, x, y, z, true, false, true)
    PlaceObjectOnGroundProperly(pobj)
    SetEntityAsMissionEntity(pobj)

    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
    QBCore.Functions.Progressbar('name_here', 'Déballage des bières...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})

        DeleteEntity(pobj)

        TriggerServerEvent('QBCore:Server:RemoveItem', 'pisswasser-crate', 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['pisswasser-crate'], "remove")
        TriggerServerEvent('QBCore:Server:AddItem', "pisswasser", 10)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['pisswasser'], "add")
		TriggerServerEvent('QBCore:Server:AddItem', "pisswasser-lite", 10)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['pisswasser-lite'], "add")
		TriggerServerEvent('QBCore:Server:AddItem', "pisswasser-dark", 10)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['pisswasser-dark'], "add")
        
    end)
end)