local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('qb-popsdiner:GetFood')
AddEventHandler('qb-popsdiner:GetFood', function(ItemMake)
    local Player = QBCore.Functions.GetPlayer(source)
	--FOOD
	if ItemMake == "eggsandwich" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['egg'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lettuce'], "remove", 1) 
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['bread'], "remove", 1) 
		Player.Functions.RemoveItem('egg', 1)
		Player.Functions.RemoveItem('lettuce', 1)
		Player.Functions.RemoveItem('bread', 1)
	elseif ItemMake == "tunasandwich" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tuna'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lettuce'], "remove", 1) 
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['bread'], "remove", 1) 
		Player.Functions.RemoveItem('tuna', 1)
		Player.Functions.RemoveItem('lettuce', 1)
		Player.Functions.RemoveItem('bread', 1)
	elseif ItemMake == "hamsandwich" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['ham'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lettuce'], "remove", 1) 
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['bread'], "remove", 1) 
		Player.Functions.RemoveItem('ham', 1)
		Player.Functions.RemoveItem('lettuce', 1)
		Player.Functions.RemoveItem('bread', 1)
	end
	Player.Functions.AddItem(ItemMake, 1, false, {["quality"] = nil})
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[ItemMake], "add", 1) 
end)

---ITEM REQUIREMENT CHECKS
--Food
QBCore.Functions.CreateCallback('qb-popsdiner:get:eggsandwich', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('egg') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('lettuce') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('bread') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-popsdiner:get:tunasandwich', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('tuna') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('lettuce') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('bread') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-popsdiner:get:hamsandwich', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('ham') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('lettuce') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('bread') ~= nil then cb(true) else cb(false) end end)