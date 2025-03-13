QBCore = exports['qb-core']:GetCoreObject()

local sellableItems = {
    ["iron"] = { 
        name = "iron",
        label = "Fer", 
        price = 10,
        amount = 999999, -- Stock illimité pour la vente
        info = {},
        type = "item",
        slot = 1,
    },
    ["copper"] = { 
        name = "copper",
        label = "Cuivre", 
        price = 8,
        amount = 999999,
        info = {},
        type = "item",
        slot = 2,
    },
    ["gold"] = { 
        name = "gold",
        label = "Or", 
        price = 25,
        amount = 999999,
        info = {},
        type = "item",
        slot = 3,
    }
}

QBCore.Functions.CreateCallback("npc_buyer:getSellableItems", function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local items = {}
    
    for itemName, itemData in pairs(sellableItems) do
        local item = Player.Functions.GetItemByName(itemName)
        if item and item.amount > 0 then
            local itemInfo = QBCore.Shared.Items[itemName]
            items[#items + 1] = {
                name = itemName,
                price = itemData.price,
                amount = item.amount,
                info = itemInfo.info or {},
                type = "item",
                slot = #items + 1,
                label = itemInfo.label,
                image = itemInfo.image,
                weight = itemInfo.weight,
                unique = itemInfo.unique,
                useable = itemInfo.useable,
                description = "Prix de vente: $" .. itemData.price
            }
        end
    end

    cb(items)
end)

RegisterNetEvent("npc_buyer:sellItems", function(items)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local totalEarned = 0

    for k, item in pairs(items) do
        local itemData = sellableItems[item.name]
        if itemData then
            local playerItem = Player.Functions.GetItemByName(item.name)
            if playerItem and playerItem.amount >= item.amount then
                Player.Functions.RemoveItem(item.name, item.amount)
                totalEarned = totalEarned + (item.amount * itemData.price)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], "remove", item.amount)
            end
        end
    end

    if totalEarned > 0 then
        Player.Functions.AddMoney("cash", totalEarned)
        TriggerClientEvent("QBCore:Notify", src, "Vous avez vendu pour $" .. totalEarned, "success")
    end
end)
