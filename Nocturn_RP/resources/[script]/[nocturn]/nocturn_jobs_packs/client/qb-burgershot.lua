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
	if QBCore.Shared.Jobs["burgershot"] == nil then print("Error: Job role not found - 'burgershot'") end
	-- if BGSConfig.Debug then print((#BGSConfig.Chairs).." Total seating locations") print((#items).." Items required") end
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
        if PlayerData.job.onduty then if PlayerData.job.name == "burgershot" then TriggerServerEvent("QBCore:ToggleDuty") end end
    end)
end)
RegisterNetEvent('QBCore:Client:OnJobUpdate') AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo) PlayerJob = JobInfo onDuty = PlayerJob.onduty end) 
RegisterNetEvent('QBCore:Client:SetDuty') AddEventHandler('QBCore:Client:SetDuty', function(duty) onDuty = duty end)

AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() == resource then
		installCheck()
		QBCore.Functions.GetPlayerData(function(PlayerData)
			PlayerJob = PlayerData.job
			if PlayerData.job.name == "burgershot" then onDuty = PlayerJob.onduty end 
		end)
    end
end)

CreateThread(function()
	-- local bossroles = {}
	-- for k, v in pairs(QBCore.Shared.Jobs["burgershot"].grades) do
	-- 	if QBCore.Shared.Jobs["burgershot"].grades[k].isboss == true then
	-- 		if bossroles["burgershot"] ~= nil then
	-- 			if bossroles["burgershot"] > tonumber(k) then bossroles["burgershot"] = tonumber(k) end
	-- 		else bossroles["burgershot"] = tonumber(k)	end
	-- 	end
	-- end
	-- for k, v in pairs(BGSConfig.Locations) do
	-- 	if BGSConfig.Locations[k].zoneEnable then
	-- 		JobLocation = PolyZone:Create(BGSConfig.Locations[k].zones, { name = BGSConfig.Locations[k].label, debugPoly = BGSConfig.Debug })
	-- 		JobLocation:onPlayerInOut(function(isPointInside) if not isPointInside and onDuty and PlayerJob.name == "burgershot" then TriggerServerEvent("QBCore:ToggleDuty") end end)	
	-- 	end
	-- end
	-- for k, v in pairs(BGSConfig.Locations) do
	-- 	if BGSConfig.Locations[k].zoneEnable then
	-- 		blip = AddBlipForCoord(BGSConfig.Locations[k].blip)
	-- 		SetBlipAsShortRange(blip, true)
	-- 		SetBlipSprite(blip, 267)
	-- 		SetBlipColour(blip, BGSConfig.Locations[k].blipcolor)
	-- 		SetBlipScale(blip, 0.6)
	-- 		SetBlipDisplay(blip, 6)
	-- 		BeginTextCommandSetBlipName('STRING')
	-- 		AddTextComponentString("BGS's Diner")
	-- 		EndTextCommandSetBlipName(blip)
	-- 	end
	-- end
	
	exports['qb-target']:AddBoxZone("BGSCounter", vector3(-1195.99, -891.26, 13.93), 0.4, 0.6, { name="BGSCounter", heading = 305.63, debugPoly=BGSConfig.Debug, minZ = 13.30, maxZ = 15, }, 
		{ options = { { event = "qb-burgershot:Counter", icon = "fas fa-hamburger", label = "Comptoir", stash = "BGSCounter1" },
                    { event = "qb-burgershot:Register", icon = "fas fa-money", label = "Caisse" } },
		  distance = 2.0
	})

	exports['qb-target']:AddBoxZone("BGSCounter2", vector3(-1194.74, -893.13, 13.75), 0.4, 0.6, { name="BGSCounter2", heading = 305.63, debugPoly=BGSConfig.Debug, minZ = 13.30, maxZ = 15, }, 
		{ options = { { event = "qb-burgershot:Counter", icon = "fas fa-hamburger", label = "Comptoir", stash = "BGSCounter2" },
                    { event = "qb-burgershot:Register", icon = "fas fa-money", label = "Caisse" } },
		  distance = 2.0
	})

	exports['qb-target']:AddBoxZone("BGSCounter3", vector3(-1193.32, -895.19, 13.54), 0.4, 0.6, { name="BGSCounter3", heading = 305.63, debugPoly=BGSConfig.Debug, minZ = 13.30, maxZ = 15, }, 
		{ options = { { event = "qb-burgershot:Counter", icon = "fas fa-hamburger", label = "Comptoir", stash = "BGSCounter3" },
                    { event = "qb-burgershot:Register", icon = "fas fa-money", label = "Caisse" } },
		  distance = 2.0
	})

    -- exports['qb-target']:AddBoxZone("BGSRegister", vector3(1589.88, 6455.46, 26.30), 0.4, 0.6, { name="BGSCounter3", heading = 305.63, debugPoly=BGSConfig.Debug, minZ = 13.30, maxZ = 15, }, 
	-- 	{ options = { { event = "qb-burgershot:Register", icon = "fas fa-money", label = "Caisse", job = "burgershot" }, },
	-- 	  distance = 2.0
	-- })

	exports['qb-target']:AddBoxZone("BGSCounter4", vector3(-1197.86, -894.17, 13.36), 1.0, 4.0, { name="BGSCounter4", heading = 305.63, debugPoly=BGSConfig.Debug, minZ = 13.30, maxZ = 15, }, 
		{ options = { { event = "qb-burgershot:Stash", icon = "fas fa-hamburger", label = "Frigot",job = "burgershot", stash = "BGSCounter4" }, },
		  distance = 2.0
	})
    
	exports['qb-target']:AddBoxZone("BGSCoffee", vector3(-1199.32, -896.09, 13.58), 0.6, 1.4, { name="BGSCoffee", heading = 305.63, debugPoly=BGSConfig.Debug, minZ = 13.30, maxZ = 15, }, 
		{ options = { { event = "qb-burgershot:Coffee", icon = "fas fa-mug-hot", label = "Faire du café", job = "burgershot", args = { item = "coffee" }}, },
		  distance = 2.0
	})
	
	-- exports['qb-target']:AddBoxZone("BGSClockin", vector3(1594.12, 6456.05, 26.01), 0.6, 0.6, { name="BGSClockin", heading = 325.0, debugPoly=BGSConfig.Debug, minZ = 13.30, maxZ = 15, }, 
	-- 	{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = "Prendre son servise", job = "burgershot" }, },
	-- 	  distance = 2.0
	-- })

	exports['qb-target']:AddBoxZone("BGSBoard", vector3(-1200.45, -900.99, 13.21), 0.6, 4.0, { name="BGSBoard", heading = 305.63, debugPoly=BGSConfig.Debug, minZ = 13.30, maxZ = 15, }, 
		{ options = { { event = "qb-burgershot:Board:Check", icon = "fas fa-utensils", label = "Faire un Sandwich", job = "burgershot" }, },
		  distance = 2.0
	})	

	exports['qb-target']:AddBoxZone("BGSDrinks", vector3(-1200.2, -894.87, 13.58), 0.6, 1.1, { name="BGSDrinks", heading = 305.63, debugPoly=BGSConfig.Debug, minZ = 13.30, maxZ = 15, }, 
		{ options = { { event = "qb-burgershot:Drinks", icon = "fas fa-beer", label = "Utilisez la machine a boissons", job = "burgershot" }, },
		  distance = 2.0
	})
    exports['qb-target']:AddBoxZone("BGSDrinks1", vector3(-1197.81, -898.45, 13.33), 0.6, 1.1, { name="BGSDrinks", heading = 305.63, debugPoly=BGSConfig.Debug, minZ = 13.30, maxZ = 15, }, 
		{ options = { { event = "qb-burgershot:Drinks", icon = "fas fa-beer", label = "Utilisez la machine a boissons", job = "burgershot" }, },
		  distance = 2.0
	})
end)

RegisterNetEvent('qb-burgershot:MakeItem', function(data)
    if not onDuty then 
        TriggerEvent('QBCore:Notify', "Pas en service!", 'error') 
        return 
    end
    
    -- Vérifier si la recette existe
    if not BGSConfig.Recipes[data.item] then 
        TriggerEvent('QBCore:Notify', "Recette invalide!", 'error')
        return
    end
    
    -- Vérifier les ingrédients
    QBCore.Functions.TriggerCallback('qb-burgershot:CheckIngredients', function(hasIngredients)
        if hasIngredients then
            FoodProgress(data.item)
        else
            TriggerEvent('QBCore:Notify', "Il vous manque des ingrédients!", 'error')
        end
    end, data.item)
end)

-- Menu des boissons
RegisterNetEvent('qb-burgershot:Drinks', function()
    local menuItems = {
        { header = "Machine à boissons", isMenuHeader = true },
        { header = "< Fermer", params = { event = "qb-menu:client:closeMenu" } }
    }
    local recipes = {}
    
    -- Vérifier les ingrédients disponibles pour chaque boisson
    for recipeName, recipeData in pairs(BGSConfig.Recipes) do
        if recipeData.type == "boisson" then
            QBCore.Functions.TriggerCallback('qb-burgershot:CheckIngredients', function(hasIngredients)
                recipes[recipeName] = hasIngredients and "✔" or ""
            end, recipeName)
        end
    end
    
    Wait(500) -- Attendre les résultats des callbacks
      -- Ajouter les boissons au menu
    for recipeName, recipeData in pairs(BGSConfig.Recipes) do
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
                header = "<img src=nui://"..BGSConfig.link..QBCore.Shared.Items[recipeName].image.." width=35px> "..recipeData.label.." "..(recipes[recipeName] or ""),
                txt = "Ingrédients nécessaires:<br>"..ingredientsList,
                params = { event = "qb-burgershot:MakeItem", args = { item = recipeName } }
            })
        end
    end
    
    exports['qb-menu']:openMenu(menuItems)
end)

RegisterNetEvent('qb-burgershot:Coffee', function()
    local menuItems = {
        { header = "Machine à café", isMenuHeader = true },
        { header = "< Fermer", params = { event = "qb-menu:client:closeMenu" } }
    }
    local recipes = {}
    
    -- Vérifier les ingrédients disponibles pour chaque boisson
    for recipeName, recipeData in pairs(BGSConfig.Recipes) do
        if recipeData.type == "coffee" then
            QBCore.Functions.TriggerCallback('qb-burgershot:CheckIngredients', function(hasIngredients)
                recipes[recipeName] = hasIngredients and "✔" or ""
            end, recipeName)
        end
    end
    
    Wait(500) -- Attendre les résultats des callbacks
      -- Ajouter les boissons au menu
    for recipeName, recipeData in pairs(BGSConfig.Recipes) do
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
                header = "<img src=nui://"..BGSConfig.link..QBCore.Shared.Items[recipeName].image.." width=35px> "..recipeData.label.." "..(recipes[recipeName] or ""),
                -- txt = "Ingrédients nécessaires:<br>"..ingredientsList,
                params = { event = "qb-burgershot:MakeItem", args = { item = recipeName } }
            })
        end
    end
    
    exports['qb-menu']:openMenu(menuItems)
end)
    

RegisterNetEvent('qb-burgershot:Counter', function(data)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgershot_"..data.stash)
    TriggerEvent("inventory:client:SetCurrentStash", "burgershot_"..data.stash)
end)

RegisterNetEvent('qb-burgershot:Stash', function(data)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgershot_"..data.stash)
    TriggerEvent("inventory:client:SetCurrentStash", "burgershot_"..data.stash)
end)

function FoodProgress(ItemMake)
    if not BGSConfig.Recipes[ItemMake] then return end
    
    local recipe = BGSConfig.Recipes[ItemMake]
    local bartext = "Prépare... "..recipe.label
    local bartime = recipe.time
    local animDictNow = recipe.anim.dict
    local animNow = recipe.anim.name
	QBCore.Functions.Progressbar('making_food', bartext, bartime, false, false, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, }, 
		{ animDict = animDictNow, anim = animNow, flags = 8, }, {}, {}, function()  
		TriggerServerEvent('qb-burgershot:GetFood', ItemMake)
		StopAnimTask(GetPlayerPed(-1), animDictNow, animNow, 1.0)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "Annulé!", 'error')
	end)
end

--Chopping board, sandwiches
RegisterNetEvent('qb-burgershot:Board:Check', function()
	QBCore.Functions.TriggerCallback('qb-burgershot:get:eggsandwich', function(amount) if amount then eggsandwich = "✔" else eggsandwich = "" end end)
	QBCore.Functions.TriggerCallback('qb-burgershot:get:tunasandwich', function(amount) if amount then tunasandwich = "✔" else tunasandwich = "" end end)
	QBCore.Functions.TriggerCallback('qb-burgershot:get:hamsandwich', function(amount) if amount then hamsandwich = "✔" else hamsandwich = "" end end)
	Wait(300)
	TriggerEvent('qb-burgershot:Board')
end)
RegisterNetEvent('qb-burgershot:Board', function()
    local menuItems = {
        { header = "Menu de Préparation", isMenuHeader = true },
        { header = "< Fermer", params = { event = "qb-menu:client:closeMenu" } }
    }
    local recipes = {}
    
    -- Vérifier les ingrédients disponibles pour chaque recette
    for recipeName, recipeData in pairs(BGSConfig.Recipes) do
        if recipeData.type == "plat" then
            QBCore.Functions.TriggerCallback('qb-burgershot:CheckIngredients', function(hasIngredients)
                recipes[recipeName] = hasIngredients and "✔" or ""
            end, recipeName)
        end
    end
    
    Wait(500) -- Attendre les résultats des callbacks
    
    -- Ajouter les éléments du menu
    for recipeName, recipeData in pairs(BGSConfig.Recipes) do
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
                header = "<img src=nui://"..BGSConfig.link..QBCore.Shared.Items[recipeName].image.." width=35px> "..recipeData.label.." "..(recipes[recipeName] or ""),
                txt = "Ingrédients nécessaires:<br>"..ingredientsList,
                params = {
                    event = "qb-burgershot:MakeItem",
                    args = { item = recipeName }
                }
            })
        end
    end
    
    exports['qb-menu']:openMenu(menuItems)
end)

RegisterNetEvent('qb-burgershot:Register', function()
 ExecuteCommand("invoices")
    
end)

RegisterNetEvent('qb-burgershot:JustGive', function(data) if not onDuty then TriggerEvent('QBCore:Notify', "Not clocked in!", 'error') else FoodProgress(data.id) end end)


AddEventHandler('onResourceStop', function(resource) 
	if resource == GetCurrentResourceName() then
		exports['qb-target']:RemoveZone("BGSCounter4") 
		exports['qb-target']:RemoveZone("BGSCounter") 
		exports['qb-target']:RemoveZone("BGSCounter2") 
		exports['qb-target']:RemoveZone("BGSCounter3") 
		exports['qb-target']:RemoveZone("BGSCoffee") 
		exports['qb-target']:RemoveZone("BGSClockin")  
		exports['qb-target']:RemoveZone("BGSBoard") 
		exports['qb-target']:RemoveZone("BGSDrinks")
        exports['qb-target']:RemoveZone("BGSRegister")
        exports['qb-target']:RemoveZone("BGSDrinks1")
	end
end)
