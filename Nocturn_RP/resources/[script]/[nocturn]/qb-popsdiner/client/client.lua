local QBCore = exports['qb-core']:GetCoreObject()

PlayerJob = {}
local onDuty = false

local function installCheck()
	local items = {
				"eggsandwich", "tunasandwich", "hamsandwich", "cocacola", "coffee", "sprunk",
				"water", "egg", "tuna", "ham", "lettuce", "bread"
			}
	for k, v in pairs(items) do if QBCore.Shared.Items[v] == nil then print("Missing Item from QBCore.Shared.Items: '"..v.."'") end end
	if QBCore.Shared.Jobs["popsdiner"] == nil then print("Error: Job role not found - 'popsdiner'") end
	-- if Config.Debug then print((#Config.Chairs).." Total seating locations") print((#items).." Items required") end
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
	local bossroles = {}
	for k, v in pairs(QBCore.Shared.Jobs["popsdiner"].grades) do
		if QBCore.Shared.Jobs["popsdiner"].grades[k].isboss == true then
			if bossroles["popsdiner"] ~= nil then
				if bossroles["popsdiner"] > tonumber(k) then bossroles["popsdiner"] = tonumber(k) end
			else bossroles["popsdiner"] = tonumber(k)	end
		end
	end
	for k, v in pairs(Config.Locations) do
		if Config.Locations[k].zoneEnable then
			JobLocation = PolyZone:Create(Config.Locations[k].zones, { name = Config.Locations[k].label, debugPoly = Config.Debug })
			JobLocation:onPlayerInOut(function(isPointInside) if not isPointInside and onDuty and PlayerJob.name == "popsdiner" then TriggerServerEvent("QBCore:ToggleDuty") end end)	
		end
	end
	for k, v in pairs(Config.Locations) do
		if Config.Locations[k].zoneEnable then
			blip = AddBlipForCoord(Config.Locations[k].blip)
			SetBlipAsShortRange(blip, true)
			SetBlipSprite(blip, 267)
			SetBlipColour(blip, Config.Locations[k].blipcolor)
			SetBlipScale(blip, 0.6)
			SetBlipDisplay(blip, 6)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString("Pop's Diner")
			EndTextCommandSetBlipName(blip)
		end
	end
	if atm == nil then
		RequestModel(GetHashKey("prop_atm_01"))
		while not HasModelLoaded(GetHashKey("prop_atm_01")) do Citizen.Wait(1) end
		atm = CreateObject(GetHashKey("prop_atm_01"),1580.31, 6455.34, 25.32-1.03,false,false,false)
		SetEntityHeading(atm,GetEntityHeading(atm)-25)
		FreezeEntityPosition(atm, true)
	end
	
	if board == nil then
		RequestModel(GetHashKey("bkr_prop_fakeid_clipboard_01a"))
		while not HasModelLoaded(GetHashKey("bkr_prop_fakeid_clipboard_01a")) do Citizen.Wait(1) end
		board = CreateObject(GetHashKey("bkr_prop_fakeid_clipboard_01a"),1594.12, 6456.05, 26.01+0.07,false,false,false)
		SetEntityHeading(board,GetEntityHeading(board)-46)
		FreezeEntityPosition(board, true)
	end	

	CreateModelHide(vector3(1593.85, 6455.37, 26.01), 1.5, 1251246798, true)
	
	exports['qb-target']:AddBoxZone("PopCounter", vector3(1586.69, 6457.08, 26.01), 0.4, 0.6, { name="PopCounter", heading = 331.0, debugPoly=Config.Debug, minZ = 26.01, maxZ = 26.51, }, 
		{ options = { { event = "qb-popsdiner:Counter", icon = "fas fa-hamburger", label = "Comptoir", stash = "Counter1" }, },
		  distance = 2.0
	})

	exports['qb-target']:AddBoxZone("PopCounter2", vector3(1590.37, 6455.31, 26.01), 0.4, 0.6, { name="PopCounter2", heading = 336.0, debugPoly=Config.Debug, minZ = 26.01, maxZ = 26.51, }, 
		{ options = { { event = "qb-popsdiner:Counter", icon = "fas fa-hamburger", label = "Comptoir", stash = "Counter2" }, },
		  distance = 2.0
	})

	exports['qb-target']:AddBoxZone("PopCounter3", vector3(1593.6, 6453.82, 26.01), 0.4, 0.6, { name="PopCounter3", heading = 336.0, debugPoly=Config.Debug, minZ = 26.01, maxZ = 26.51, }, 
		{ options = { { event = "qb-popsdiner:Counter", icon = "fas fa-hamburger", label = "Comptoir", stash = "Counter3" }, },
		  distance = 2.0
	})

	exports['qb-target']:AddBoxZone("PopCounter4", vector3(1586.05, 6459.57, 25.01), 0.6, 2.0, { name="PopCounter4", heading = 335.0, debugPoly=Config.Debug, minZ = 24.96, maxZ = 25.96, }, 
		{ options = { { event = "qb-popsdiner:Stash", icon = "fas fa-hamburger", label = "Frigot", stash = "Counter4" }, },
		  distance = 2.0
	})

	exports['qb-target']:AddBoxZone("PopCoffee", vector3(1592.6, 6456.8, 26.01), 0.6, 1.4, { name="PopCoffee", heading = 335.0, debugPoly=Config.Debug, minZ = 26.01, maxZ = 27.01, }, 
		{ options = { { event = "qb-popsdiner:JustGive", icon = "fas fa-mug-hot", label = "Faire du café", job = "popsdiner", id = "coffee"}, },
		  distance = 2.0
	})
	
	exports['qb-target']:AddBoxZone("PopClockin", vector3(1594.12, 6456.05, 26.01), 0.6, 0.6, { name="PopClockin", heading = 325.0, debugPoly=Config.Debug, minZ = 25.81, maxZ = 26.61, }, 
		{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = "Prendre son servise", job = "popsdiner" }, },
		  distance = 2.0
	})

	exports['qb-target']:AddBoxZone("PopBoard", vector3(1587.94, 6459.02, 26.01), 0.6, 1.4, { name="PopBoard", heading = 335.0, debugPoly=Config.Debug, minZ = 25.81, maxZ = 26.61, }, 
		{ options = { { event = "qb-popsdiner:Board:Check", icon = "fas fa-utensils", label = "Faire un Sandwich", job = "popsdiner" }, },
		  distance = 2.0
	})	

	exports['qb-target']:AddBoxZone("PopDrinks", vector3(1586.03, 6459.62, 26.01), 0.6, 1.1, { name="PopDrinks", heading = 335.0, debugPoly=Config.Debug, minZ = 26.01, maxZ = 27.01, }, 
		{ options = { { event = "qb-popsdiner:Drinks", icon = "fas fa-beer", label = "Utilisez la machine a boissons", job = "popsdiner" }, },
		  distance = 2.0
	})
end)

RegisterNetEvent('qb-popsdiner:MakeItem', function(data)
	local items = { "hamsandwich", "tunasandwich", "eggsandwich" }
	if not onDuty then TriggerEvent('QBCore:Notify', "Pas en servise!", 'error') else
		for k,v in pairs(items) do 
			if data.item == v then QBCore.Functions.TriggerCallback('qb-popsdiner:get:'..data.item, function(amount) 
				if not amount then TriggerEvent('QBCore:Notify', "Vous n'avez pas les bons ingrédients", 'error') else FoodProgress(data.item) end end)
			end
		end
	end
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
	if ItemMake == "eggsandwich" or ItemMake == "tunasandwich" or ItemMake == "hamsandwich" then
		bartext = "Fabrique... "..QBCore.Shared.Items[ItemMake].label
		bartime = 9000
        animDictNow = "amb@prop_human_bbq@male@base"
        animNow = "base"
	elseif ItemMake == "coffee" or ItemMake == "cocacola" or ItemMake == "sprunk" or ItemMake == "water" then
		bartext = "Coule... "..QBCore.Shared.Items[ItemMake].label
		bartime = 5000
		animDictNow = "mp_ped_interaction"
		animNow = "handshake_guy_a"	
	end
	QBCore.Functions.Progressbar('making_food', bartext, bartime, false, false, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, }, 
		{ animDict = animDictNow, anim = animNow, flags = 8, }, {}, {}, function()  
		TriggerServerEvent('qb-popsdiner:GetFood', ItemMake)
		StopAnimTask(GetPlayerPed(-1), animDictNow, animNow, 1.0)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "Annulé!", 'error')
	end)
end

RegisterNetEvent('qb-popsdiner:Drinks', function()
	exports['qb-menu']:openMenu({
		{ header = "Machine a boissons", isMenuHeader = true }, 
		{header = "< Fermé",},
		{ header = "<img src=nui://"..Config.link..QBCore.Shared.Items["cocacola"].image.." width=35px> "..QBCore.Shared.Items["cocacola"].label, params = { event = "qb-popsdiner:JustGive", args = { id = 'cocacola' } } },
		{ header = "<img src=nui://"..Config.link..QBCore.Shared.Items["sprunk"].image.." width=35px> "..QBCore.Shared.Items["sprunk"].label, params = { event = "qb-popsdiner:JustGive", args = { id = 'sprunk' } } },
		{ header = "<img src=nui://"..Config.link..QBCore.Shared.Items["water"].image.." width=35px> "..QBCore.Shared.Items["water"].label, params = { event = "qb-popsdiner:JustGive", args = { id = 'water' } } },
	})
end)


--Chopping board, sandwiches
RegisterNetEvent('qb-popsdiner:Board:Check', function()
	QBCore.Functions.TriggerCallback('qb-popsdiner:get:eggsandwich', function(amount) if amount then eggsandwich = "✔" else eggsandwich = "" end end)
	QBCore.Functions.TriggerCallback('qb-popsdiner:get:tunasandwich', function(amount) if amount then tunasandwich = "✔" else tunasandwich = "" end end)
	QBCore.Functions.TriggerCallback('qb-popsdiner:get:hamsandwich', function(amount) if amount then hamsandwich = "✔" else hamsandwich = "" end end)
	Wait(300)
	TriggerEvent('qb-popsdiner:Board')
end)
RegisterNetEvent('qb-popsdiner:Board', function()
	exports['qb-menu']:openMenu({
		{ header = "Menu", isMenuHeader = true },
		{header = "< Fermé",},
		{ header = "<img src=nui://"..Config.link..QBCore.Shared.Items["eggsandwich"].image.." width=35px> "..QBCore.Shared.Items["eggsandwich"].label.." "..eggsandwich, txt = "- "..QBCore.Shared.Items["egg"].label.."<br>- "..QBCore.Shared.Items["lettuce"].label.."<br>- "..QBCore.Shared.Items["bread"].label, params = { event = "qb-popsdiner:MakeItem", args = { item = 'eggsandwich' } } },
		{ header = "<img src=nui://"..Config.link..QBCore.Shared.Items["tunasandwich"].image.." width=35px> "..QBCore.Shared.Items["tunasandwich"].label.." "..tunasandwich, txt = "- "..QBCore.Shared.Items["tuna"].label.."<br>- "..QBCore.Shared.Items["lettuce"].label.."<br>- "..QBCore.Shared.Items["bread"].label, params = { event = "qb-popsdiner:MakeItem", args = { item = 'tunasandwich' } } },
		{ header = "<img src=nui://"..Config.link..QBCore.Shared.Items["hamsandwich"].image.." width=35px> "..QBCore.Shared.Items["hamsandwich"].label.." "..hamsandwich, txt = "- "..QBCore.Shared.Items["ham"].label.."<br>- "..QBCore.Shared.Items["lettuce"].label.."<br>- "..QBCore.Shared.Items["bread"].label, params = { event = "qb-popsdiner:MakeItem", args = { item = 'hamsandwich' } } },
	})
end)

RegisterNetEvent('qb-popsdiner:JustGive', function(data) if not onDuty then TriggerEvent('QBCore:Notify', "Not clocked in!", 'error') else FoodProgress(data.id) end end)


AddEventHandler('onResourceStop', function(resource) 
	if resource == GetCurrentResourceName() then
		DeleteEntity(board)
		DeleteEntity(atm)
		exports['qb-target']:RemoveZone("PopCounter4") 
		exports['qb-target']:RemoveZone("PopCounter") 
		exports['qb-target']:RemoveZone("PopCounter2") 
		exports['qb-target']:RemoveZone("PopCounter3") 
		exports['qb-target']:RemoveZone("PopCoffee") 
		exports['qb-target']:RemoveZone("PopClockin")  
		exports['qb-target']:RemoveZone("PopBoard") 
		exports['qb-target']:RemoveZone("PopDrinks")
	end
end)
