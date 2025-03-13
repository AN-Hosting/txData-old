local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('ps-drugprocessing:validate_items', function(source, cb, data)
	local Player = QBCore.Functions.GetPlayer(source)
	local ret = true
	local items = {}
	
	for name,amount in pairs(data) do
		local item = Player.Functions.GetItemByName(name)
		if not item or item.amount < amount then
			ret = false
			items[#items + 1] = QBCore.Shared.Items[name].label
			break
		end
	end

	cb({ret = ret, item = table.concat(items, ", ")})
end)

RegisterServerEvent('ps-drugprocessing:pickedUpCocaLeaf', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.AddItem("coca_leaf", 1) then 
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["coca_leaf"], "add")
		TriggerClientEvent('QBCore:Notify', src, Lang:t("success.coca_leaf"), "success")
	else
		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_coca_leaf"), "error")
	end
end)

RegisterServerEvent('ps-drugprocessing:processCocaLeaf', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('coca_leaf', Config.CokeProcessing.CokeLeaf) then
		if Player.Functions.AddItem('coke', Config.CokeProcessing.ProcessCokeLeaf) then
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['coca_leaf'], "remove", Config.CokeProcessing.CokeLeaf)
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['coke'], "add", Config.CokeProcessing.ProcessCokeLeaf)
			TriggerClientEvent('QBCore:Notify', src, Lang:t("success.coke"), "success")
		else
			Player.Functions.AddItem('coca_leaf', Config.CokeProcessing.CokeLeaf)
		end
	else
		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_coca_leaf"), "error")
	end
end)

RegisterServerEvent('ps-drugprocessing:processCocaPowder', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    -- Debug prints plus détaillés
    local cokeItem = Player.Functions.GetItemByName('coke')
    local bakingSodaItem = Player.Functions.GetItemByName('bakingsoda')
    
    print("=== DEBUG TRAITEMENT COCAINE ===")
    print("Requis:")
    print("- Cocaïne:", Config.CokeProcessing.Coke)
    print("- Bicarbonate:", Config.CokeProcessing.BakingSoda)
    print("\nInventaire du joueur:")
    print("- Cocaïne:", cokeItem and cokeItem.amount or 0)
    print("- Bicarbonate:", bakingSodaItem and bakingSodaItem.amount or 0)
    print("===============================")

    if not cokeItem or cokeItem.amount < Config.CokeProcessing.Coke then
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_cokain_amount", {value = Config.CokeProcessing.Coke}), "error")
        return
    end

    if not bakingSodaItem or bakingSodaItem.amount < Config.CokeProcessing.BakingSoda then
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_bakingsoda_amount", {value = Config.CokeProcessing.BakingSoda}), "error")
        return
    end

    -- Si on arrive ici, le joueur a les quantités requises
    if Player.Functions.RemoveItem('coke', Config.CokeProcessing.Coke) then
        if Player.Functions.RemoveItem('bakingsoda', Config.CokeProcessing.BakingSoda) then
            if Player.Functions.AddItem('coke_small_brick', Config.CokeProcessing.SmallCokeBrick) then
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['coke'], "remove", Config.CokeProcessing.Coke)
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['bakingsoda'], "remove", Config.CokeProcessing.BakingSoda)
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['coke_small_brick'], "add", Config.CokeProcessing.SmallCokeBrick)
                TriggerClientEvent('QBCore:Notify', src, Lang:t("success.coke_small_brick"), "success")
            else
                Player.Functions.AddItem('coke', Config.CokeProcessing.Coke)
                Player.Functions.AddItem('bakingsoda', Config.CokeProcessing.BakingSoda)
            end
        else
            Player.Functions.AddItem('coke', Config.CokeProcessing.Coke)
            TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_bakingsoda"), "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_cokain"), "error")
    end
end)

RegisterServerEvent('ps-drugprocessing:processCocaBrick', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('coke_small_brick', Config.CokeProcessing.SmallBrick) then
		if Player.Functions.AddItem('coke_brick', Config.CokeProcessing.LargeBrick) then
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['coke_small_brick'], "remove", Config.CokeProcessing.SmallBrick)
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['coke_brick'], "add", Config.CokeProcessing.LargeBrick)
			TriggerClientEvent('QBCore:Notify', src, Lang:t("success.coke_brick"), "success")
		else
			Player.Functions.AddItem('coke_small_brick', Config.CokeProcessing.SmallBrick)
		end
	end
end)

RegisterServerEvent('ps-drugprocessing:cutCokeBrick', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    -- Vérifier si le joueur a une brick de coke et un pochon vide
    if not Player.Functions.GetItemByName('coke_brick') then
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_coke_brick"), "error")
        return
    end

    if not Player.Functions.GetItemByName('empty_weed_bag') then
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_empty_weed_bag"), "error")
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
    if Player.Functions.RemoveItem('coke_brick', 1) and Player.Functions.RemoveItem('empty_weed_bag', bags) then
        -- Ajouter les pochons de coke
        if Player.Functions.AddItem('cocainebaggy', bags) then
            -- Notifications d'inventaire
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['coke_brick'], "remove")
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['empty_weed_bag'], "remove", bags)
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['cocainebaggy'], "add", bags)
            TriggerClientEvent('QBCore:Notify', src, "Vous avez obtenu " .. bags .. " pochons de cocaïne", "success")
        else
            -- En cas d'erreur, rendre les items
            Player.Functions.AddItem('coke_brick', 1)
            Player.Functions.AddItem('empty_weed_bag', bags)
        end
    end
end)
