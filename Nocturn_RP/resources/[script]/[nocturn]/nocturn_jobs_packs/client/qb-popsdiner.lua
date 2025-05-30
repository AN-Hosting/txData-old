local QBCore = exports['qb-core']:GetCoreObject()

PlayerJob = {}
local onDuty = false

local function installCheck()
	local items = {
		-- Ingrédients de base
		"raw_patty", "burger_bun", "lettuce", "tomato_slice", "cheddar_slice", 
		"fries_raw", "soda_syrup", "cup", "ice_cubes", "milk", "icecream_mix", "nuggets_raw",
		-- Plats finaux
		"burger_classic", "burger_cheese", "burger_double", "fries", "nuggets",
		"cola", "sprite", "milkshake"
	}
	for k, v in pairs(items) do if QBCore.Shared.Items[v] == nil then print("Missing Item from QBCore.Shared.Items: '"..v.."'") end end
	if QBCore.Shared.Jobs["popsdiner"] == nil then print("Error: Job role not found - 'popsdiner'") end
	-- if PopConfig.Debug then print((#PopConfig.Chairs).." Total seating locations") print((#items).." Items required") end
end

local function jobCheck()
	canDo = true
	if not onDuty then TriggerEvent('QBCore:Notify', "Pas en servise!", 'error') canDo = false end
	return canDo
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
		installCheck()
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then if PlayerData.job.name == "popsdiner" then TriggerServerEvent("QBCore:ToggleDuty") end end
    end)
end)
RegisterNetEvent('QBCore:Client:OnJobUpdate') AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo) PlayerJob = JobInfo onDuty = PlayerJob.onduty end) 
RegisterNetEvent('QBCore:Client:SetDuty') AddEventHandler('QBCore:Client:SetDuty', function(duty) onDuty = duty end)

AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() == resource then
		installCheck()
		QBCore.Functions.GetPlayerData(function(PlayerData)
			PlayerJob = PlayerData.job
			if PlayerData.job.name == "popsdiner" then onDuty = PlayerJob.onduty end 
		end)
    end
end)

CreateThread(function()
	-- local bossroles = {}
	-- for k, v in pairs(QBCore.Shared.Jobs["popsdiner"].grades) do
	-- 	if QBCore.Shared.Jobs["popsdiner"].grades[k].isboss == true then
	-- 		if bossroles["popsdiner"] ~= nil then
	-- 			if bossroles["popsdiner"] > tonumber(k) then bossroles["popsdiner"] = tonumber(k) end
	-- 		else bossroles["popsdiner"] = tonumber(k)	end
	-- 	end
	-- end
	-- for k, v in pairs(PopConfig.Locations) do
	-- 	if PopConfig.Locations[k].zoneEnable then
	-- 		JobLocation = PolyZone:Create(PopConfig.Locations[k].zones, { name = PopConfig.Locations[k].label, debugPoly = PopConfig.Debug })
	-- 		JobLocation:onPlayerInOut(function(isPointInside) if not isPointInside and onDuty and PlayerJob.name == "popsdiner" then TriggerServerEvent("QBCore:ToggleDuty") end end)	
	-- 	end
	-- end
	-- for k, v in pairs(PopConfig.Locations) do
	-- 	if PopConfig.Locations[k].zoneEnable then
	-- 		blip = AddBlipForCoord(PopConfig.Locations[k].blip)
	-- 		SetBlipAsShortRange(blip, true)
	-- 		SetBlipSprite(blip, 267)
	-- 		SetBlipColour(blip, PopConfig.Locations[k].blipcolor)
	-- 		SetBlipScale(blip, 0.6)
	-- 		SetBlipDisplay(blip, 6)
	-- 		BeginTextCommandSetBlipName('STRING')
	-- 		AddTextComponentString("Pop's Diner")
	-- 		EndTextCommandSetBlipName(blip)
	-- 	end
	-- end
	
	exports['qb-target']:AddBoxZone("PopCounter", vector3(1586.69, 6457.08, 26.01), 0.4, 0.6, { name="PopCounter", heading = 331.0, debugPoly=PopConfig.Debug, minZ = 26.01, maxZ = 26.51, }, 
		{ options = { { event = "qb-popsdiner:Counter", icon = "fas fa-hamburger", label = "Comptoir", stash = "Counter1" }, },
		  distance = 2.0
	})

	exports['qb-target']:AddBoxZone("PopCounter2", vector3(1590.37, 6455.31, 26.01), 0.4, 0.6, { name="PopCounter2", heading = 336.0, debugPoly=PopConfig.Debug, minZ = 26.01, maxZ = 26.51, }, 
		{ options = { { event = "qb-popsdiner:Counter", icon = "fas fa-hamburger", label = "Comptoir", stash = "Counter2" }, },
		  distance = 2.0
	})

	exports['qb-target']:AddBoxZone("PopCounter3", vector3(1593.6, 6453.82, 26.01), 0.4, 0.6, { name="PopCounter3", heading = 336.0, debugPoly=PopConfig.Debug, minZ = 26.01, maxZ = 26.51, }, 
		{ options = { { event = "qb-popsdiner:Counter", icon = "fas fa-hamburger", label = "Comptoir", stash = "Counter3" }, },
		  distance = 2.0
	})

    exports['qb-target']:AddBoxZone("PopRegister", vector3(1589.88, 6455.46, 26.30), 0.4, 0.6, { name="PopCounter3", heading = 336.0, debugPoly=PopConfig.Debug, minZ = 26.01, maxZ = 26.51, }, 
		{ options = { { event = "qb-popsdiner:Register", icon = "fas fa-money", label = "Caisse", job = "popsdiner" }, },
		  distance = 2.0
	})

	exports['qb-target']:AddBoxZone("PopCounter4", vector3(1586.05, 6459.57, 25.01), 0.6, 2.0, { name="PopCounter4", heading = 335.0, debugPoly=PopConfig.Debug, minZ = 24.96, maxZ = 25.96, }, 
		{ options = { { event = "qb-popsdiner:Stash", icon = "fas fa-hamburger", label = "Frigot", stash = "Counter4" }, },
		  distance = 2.0
	})
    
	exports['qb-target']:AddBoxZone("PopCoffee", vector3(1592.6, 6456.8, 26.01), 0.6, 1.4, { name="PopCoffee", heading = 335.0, debugPoly=PopConfig.Debug, minZ = 26.01, maxZ = 27.01, }, 
		{ options = { { event = "qb-popsdiner:Coffee", icon = "fas fa-mug-hot", label = "Faire du café", job = "popsdiner", args = { item = "coffee" }}, },
		  distance = 2.0
	})
	
	-- exports['qb-target']:AddBoxZone("PopClockin", vector3(1594.12, 6456.05, 26.01), 0.6, 0.6, { name="PopClockin", heading = 325.0, debugPoly=PopConfig.Debug, minZ = 25.81, maxZ = 26.61, }, 
	-- 	{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = "Prendre son servise", job = "popsdiner" }, },
	-- 	  distance = 2.0
	-- })

	exports['qb-target']:AddBoxZone("PopBoard", vector3(1587.94, 6459.02, 26.01), 0.6, 1.4, { name="PopBoard", heading = 335.0, debugPoly=PopConfig.Debug, minZ = 25.81, maxZ = 26.61, }, 
		{ options = { { event = "qb-popsdiner:Board:Check", icon = "fas fa-utensils", label = "Faire un Sandwich", job = "popsdiner" }, },
		  distance = 2.0
	})	

	exports['qb-target']:AddBoxZone("PopDrinks", vector3(1586.03, 6459.62, 26.01), 0.6, 1.1, { name="PopDrinks", heading = 335.0, debugPoly=PopConfig.Debug, minZ = 26.01, maxZ = 27.01, }, 
		{ options = { { event = "qb-popsdiner:Drinks", icon = "fas fa-beer", label = "Utilisez la machine a boissons", job = "popsdiner" }, },
		  distance = 2.0
	})
end)

RegisterNetEvent('qb-popsdiner:MakeItem', function(data)
    if not onDuty then 
        TriggerEvent('QBCore:Notify', "Pas en service!", 'error') 
        return 
    end
    
    -- Vérifier si la recette existe
    if not PopConfig.Recipes[data.item] then 
        TriggerEvent('QBCore:Notify', "Recette invalide!", 'error')
        return
    end
    
    -- Vérifier les ingrédients
    QBCore.Functions.TriggerCallback('qb-popsdiner:CheckIngredients', function(hasIngredients)
        if hasIngredients then
            FoodProgress(data.item)
        else
            TriggerEvent('QBCore:Notify', "Il vous manque des ingrédients!", 'error')
        end
    end, data.item)
end)

-- Menu des boissons
RegisterNetEvent('qb-popsdiner:Drinks', function()
    local menuItems = {
        { header = "Machine à boissons", isMenuHeader = true },
        { header = "< Fermer", params = { event = "qb-menu:client:closeMenu" } }
    }
    local recipes = {}
    
    -- Vérifier les ingrédients disponibles pour chaque boisson
    for recipeName, recipeData in pairs(PopConfig.Recipes) do
        if recipeData.type == "boisson" then
            QBCore.Functions.TriggerCallback('qb-popsdiner:CheckIngredients', function(hasIngredients)
                recipes[recipeName] = hasIngredients and "✔" or ""
            end, recipeName)
        end
    end
    
    Wait(500) -- Attendre les résultats des callbacks
      -- Ajouter les boissons au menu
    for recipeName, recipeData in pairs(PopConfig.Recipes) do
        if recipeData.type == "boisson" then
            local ingredientsList = ""
            for item, amount in pairs(recipeData.ingredients) do
                ingredientsList = ingredientsList .. "- " .. QBCore.Shared.Items[item].label
                if amount > 1 then
                    ingredientsList = ingredientsList .. " x" .. amount
                end
                ingredientsList = ingredientsList .. "<br>"
            end
            
            table.insert(menuItems, {
                header = "<img src=nui://"..PopConfig.link..QBCore.Shared.Items[recipeName].image.." width=35px> "..recipeData.label.." "..(recipes[recipeName] or ""),
                txt = "Ingrédients nécessaires:<br>"..ingredientsList,
                params = { event = "qb-popsdiner:MakeItem", args = { item = recipeName } }
            })
        end
    end
    
    exports['qb-menu']:openMenu(menuItems)
end)

RegisterNetEvent('qb-popsdiner:Coffee', function()
    local menuItems = {
        { header = "Machine à café", isMenuHeader = true },
        { header = "< Fermer", params = { event = "qb-menu:client:closeMenu" } }
    }
    local recipes = {}
    
    -- Vérifier les ingrédients disponibles pour chaque boisson
    for recipeName, recipeData in pairs(PopConfig.Recipes) do
        if recipeData.type == "coffee" then
            QBCore.Functions.TriggerCallback('qb-popsdiner:CheckIngredients', function(hasIngredients)
                recipes[recipeName] = hasIngredients and "✔" or ""
            end, recipeName)
        end
    end
    
    Wait(500) -- Attendre les résultats des callbacks
      -- Ajouter les boissons au menu
    for recipeName, recipeData in pairs(PopConfig.Recipes) do
        if recipeData.type == "coffee" then
            local ingredientsList = ""
            for item, amount in pairs(recipeData.ingredients) do
                ingredientsList = ingredientsList .. "- " .. QBCore.Shared.Items[item].label
                if amount > 1 then
                    ingredientsList = ingredientsList .. " x" .. amount
                end
                ingredientsList = ingredientsList .. "<br>"
            end
            
            table.insert(menuItems, {
                header = "<img src=nui://"..PopConfig.link..QBCore.Shared.Items[recipeName].image.." width=35px> "..recipeData.label.." "..(recipes[recipeName] or ""),
                -- txt = "Ingrédients nécessaires:<br>"..ingredientsList,
                params = { event = "qb-popsdiner:MakeItem", args = { item = recipeName } }
            })
        end
    end
    
    exports['qb-menu']:openMenu(menuItems)
end)
    

RegisterNetEvent('qb-popsdiner:Counter', function(data)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "popsdiner_"..data.stash)
    TriggerEvent("inventory:client:SetCurrentStash", "popsdiner_"..data.stash)
end)

RegisterNetEvent('qb-popsdiner:Stash', function(data)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "popsdiner_"..data.stash)
    TriggerEvent("inventory:client:SetCurrentStash", "popsdiner_"..data.stash)
end)

function FoodProgress(ItemMake)
    if not PopConfig.Recipes[ItemMake] then return end
    
    local recipe = PopConfig.Recipes[ItemMake]
    local bartext = "Prépare... "..recipe.label
    local bartime = recipe.time
    local animDictNow = recipe.anim.dict
    local animNow = recipe.anim.name
	QBCore.Functions.Progressbar('making_food', bartext, bartime, false, false, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, }, 
		{ animDict = animDictNow, anim = animNow, flags = 8, }, {}, {}, function()  
		TriggerServerEvent('qb-popsdiner:GetFood', ItemMake)
		StopAnimTask(GetPlayerPed(-1), animDictNow, animNow, 1.0)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "Annulé!", 'error')
	end)
end

--Chopping board, sandwiches
RegisterNetEvent('qb-popsdiner:Board:Check', function()
	QBCore.Functions.TriggerCallback('qb-popsdiner:get:eggsandwich', function(amount) if amount then eggsandwich = "✔" else eggsandwich = "" end end)
	QBCore.Functions.TriggerCallback('qb-popsdiner:get:tunasandwich', function(amount) if amount then tunasandwich = "✔" else tunasandwich = "" end end)
	QBCore.Functions.TriggerCallback('qb-popsdiner:get:hamsandwich', function(amount) if amount then hamsandwich = "✔" else hamsandwich = "" end end)
	Wait(300)
	TriggerEvent('qb-popsdiner:Board')
end)
RegisterNetEvent('qb-popsdiner:Board', function()
    local menuItems = {
        { header = "Menu de Préparation", isMenuHeader = true },
        { header = "< Fermer", params = { event = "qb-menu:client:closeMenu" } }
    }
    local recipes = {}
    
    -- Vérifier les ingrédients disponibles pour chaque recette
    for recipeName, recipeData in pairs(PopConfig.Recipes) do
        if recipeData.type == "plat" then
            QBCore.Functions.TriggerCallback('qb-popsdiner:CheckIngredients', function(hasIngredients)
                recipes[recipeName] = hasIngredients and "✔" or ""
            end, recipeName)
        end
    end
    
    Wait(500) -- Attendre les résultats des callbacks
    
    -- Ajouter les éléments du menu
    for recipeName, recipeData in pairs(PopConfig.Recipes) do
        if recipeData.type == "plat" then
            local ingredientsList = ""
            for item, amount in pairs(recipeData.ingredients) do
                ingredientsList = ingredientsList .. "- " .. QBCore.Shared.Items[item].label
                if amount > 1 then
                    ingredientsList = ingredientsList .. " x" .. amount
                end
                ingredientsList = ingredientsList .. "<br>"
            end
              table.insert(menuItems, {
                header = "<img src=nui://"..PopConfig.link..QBCore.Shared.Items[recipeName].image.." width=35px> "..recipeData.label.." "..(recipes[recipeName] or ""),
                txt = "Ingrédients nécessaires:<br>"..ingredientsList,
                params = {
                    event = "qb-popsdiner:MakeItem",
                    args = { item = recipeName }
                }
            })
        end
    end
    
    exports['qb-menu']:openMenu(menuItems)
end)

RegisterNetEvent('qb-popsdiner:Register', function()
 ExecuteCommand("invoices")
    
end)

RegisterNetEvent('qb-popsdiner:JustGive', function(data) if not onDuty then TriggerEvent('QBCore:Notify', "Not clocked in!", 'error') else FoodProgress(data.id) end end)


AddEventHandler('onResourceStop', function(resource) 
	if resource == GetCurrentResourceName() then
		exports['qb-target']:RemoveZone("PopCounter4") 
		exports['qb-target']:RemoveZone("PopCounter") 
		exports['qb-target']:RemoveZone("PopCounter2") 
		exports['qb-target']:RemoveZone("PopCounter3") 
		exports['qb-target']:RemoveZone("PopCoffee") 
		exports['qb-target']:RemoveZone("PopClockin")  
		exports['qb-target']:RemoveZone("PopBoard") 
		exports['qb-target']:RemoveZone("PopDrinks")
        exports['qb-target']:RemoveZone("PopRegister")
	end
end)
