local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('ps-drugprocessing:pickedUpHydrochloricAcid', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.AddItem("hydrochloric_acid", 1) then
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["hydrochloric_acid"], "add")
	end
end)

RegisterServerEvent('ps-drugprocessing:pickedUpSodiumHydroxide', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.AddItem("sodium_hydroxide", 1) then 
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["sodium_hydroxide"], "add")
	end
end)

RegisterServerEvent('ps-drugprocessing:pickedUpSulfuricAcid', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.AddItem("sulfuric_acid", 1) then
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["sulfuric_acid"], "add")
	end
end)

RegisterServerEvent('ps-drugprocessing:processChemicals', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem("sulfuric_acid", Config.MethProcessing.SulfAcid) then
		if Player.Functions.RemoveItem("hydrochloric_acid", Config.MethProcessing.HydAcid) then
			if Player.Functions.RemoveItem("sodium_hydroxide", Config.MethProcessing.SodHyd) then
				if Player.Functions.AddItem("liquidmix", 1) then
					TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["sulfuric_acid"], "remove", Config.MethProcessing.SulfAcid)
					TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["hydrochloric_acid"], "remove", Config.MethProcessing.HydAcid)
					TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["sodium_hydroxide"], "remove", Config.MethProcessing.SodHyd)
					TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["liquidmix"], "add", 1)
				else
					Player.Functions.AddItem("sulfuric_acid", Config.MethProcessing.SulfAcid)
					Player.Functions.AddItem("hydrochloric_acid", Config.MethProcessing.HydAcid)
					Player.Functions.AddItem("sodium_hydroxide", Config.MethProcessing.SodHyd)
				end
			else
				Player.Functions.AddItem("sulfuric_acid", Config.MethProcessing.SulfAcid)
				Player.Functions.AddItem("hydrochloric_acid", Config.MethProcessing.HydAcid)
				TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_sodium_hydroxide"), "error")
			end
		else
			Player.Functions.AddItem("sulfuric_acid", Config.MethProcessing.SulfAcid)
			TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_hydrochloric_acid"), "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_sulfuric_acid"), "error")
	end

end)

RegisterServerEvent('ps-drugprocessing:processTempUp', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem("liquidmix", 1) then
		if Player.Functions.AddItem("chemicalvapor", 1) then
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["liquidmix"], "remove")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["chemicalvapor"], "add")
		else
			Player.Functions.AddItem("liquidmix", 1)
		end
	else
		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_liquidmix"), "error")
	end
end)

RegisterServerEvent('ps-drugprocessing:processTempDown', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	
	-- Vérifier si le joueur a l'item
	local hasItem = Player.Functions.GetItemByName('chemicalvapor')
	if not hasItem then 
		TriggerClientEvent('QBCore:Notify', src, "Il vous manque des vapeurs chimiques", "error")
		return 
	end
	
	-- Retirer l'item
	if Player.Functions.RemoveItem('chemicalvapor', 1) then
		-- Ajouter le nouveau avec le bon nom
		if Player.Functions.AddItem('meth_tray', 1) then
			-- Notifications avec le bon nom d'item
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["chemicalvapor"], "remove")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meth_tray"], "add")
			TriggerClientEvent('QBCore:Notify', src, "Vous avez obtenu un plateau de meth", "success")
		else
			-- Si l'ajout échoue, on rend l'item
			Player.Functions.AddItem('chemicalvapor', 1)
			TriggerClientEvent('QBCore:Notify', src, "Impossible d'ajouter le plateau", "error")
		end
	end
end)

RegisterServerEvent('ps-drugprocessing:processMeth', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem("meth_tray", 1) then
		if Player.Functions.AddItem("meth", Config.MethProcessing.Meth) then
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meth_tray"], "remove")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meth"], "add", Config.MethProcessing.Meth)
			TriggerClientEvent('QBCore:Notify', src, Lang:t("success.meth"), "success")
		else
			Player.Functions.AddItem("meth_tray", 1)
		end
	else
		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_meth_tray"), "error")
	end
end)

RegisterServerEvent('ps-drugprocessing:processFailUp', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.RemoveItem("liquidmix", 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["liquidmix"], "remove")
	TriggerClientEvent('QBCore:Notify', src, Lang:t("error.temp_too_high"), "error")
end)

RegisterServerEvent('ps-drugprocessing:processFailDown', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	Player.Functions.RemoveItem("chemicalvapor", 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["chemicalvapor"], "remove")
	TriggerClientEvent('QBCore:Notify', src, Lang:t("error.temp_too_low"), "error")
end)

RegisterServerEvent('ps-drugprocessing:processMethBags', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	
	-- Vérifier si le joueur a un plateau de meth et des pochons vides
	if not Player.Functions.GetItemByName('meth_tray') then
		TriggerClientEvent('QBCore:Notify', src, "Il vous manque un plateau de meth", "error")
		return
	end

	if not Player.Functions.GetItemByName('empty_weed_bag') then
		TriggerClientEvent('QBCore:Notify', src, "Il vous manque des pochons vides", "error")
		return
	end

	-- Générer un nombre aléatoire de pochons (entre 1 et 3)
	local bags = math.random(1, 3)
	
	-- Vérifier si le joueur a assez de pochons vides
	if Player.Functions.GetItemByName('empty_weed_bag').amount < bags then
		TriggerClientEvent('QBCore:Notify', src, "Il vous faut au moins " .. bags .. " pochons vides", "error")
		return
	end

	-- Retirer les items
	if Player.Functions.RemoveItem('meth_tray', 1) and Player.Functions.RemoveItem('empty_weed_bag', bags) then
		-- Ajouter les pochons de meth
		if Player.Functions.AddItem('meth_baggy', bags) then
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['meth_tray'], "remove")
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['empty_weed_bag'], "remove", bags)
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['meth_baggy'], "add", bags)
			TriggerClientEvent('QBCore:Notify', src, "Vous avez obtenu " .. bags .. " pochons de meth", "success")
		else
			-- En cas d'erreur, rendre les items
			Player.Functions.AddItem('meth_tray', 1)
			Player.Functions.AddItem('empty_weed_bag', bags)
		end
	end
end)
