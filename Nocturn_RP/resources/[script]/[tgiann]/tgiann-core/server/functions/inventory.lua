-- server

-- Support for inventory scripts:
-- qb-inventory
-- tgiann-inventory
-- ox_inventory
-- qs-inventory
-- codem-inventory
-- origen_inventory
-- core_inventory

tgiCore.RegisterStash = function(src, data)
    if config.ox_inventory then
        --- id, label, slots, maxWeight, owner, groups, coords
        exports.ox_inventory:RegisterStash(data.stashName, data.label or data.stashName, data.slots or 100, data.maxWeight or 10000000)
    elseif config["tgiann-inventory"] then
        exports["tgiann-inventory"]:RegisterStash(data)
    elseif config.origen_inventory then
        exports.origen_inventory:RegisterStash(data.stashName, {
            label = data.label or data.stashName,
            slots = data.slots,
            weight = data.maxWeight,
        })
    end
    return true
end

--- @param src number
--- @param data table {stashName: string, slots: number, maxWeight: number, label: string, blacklist: table, whitelist: table, isPlayer: boolean}
--- @diagnostic disable-next-line dublicate-function
tgiCore.OpenStash = function(src, data)
    if config["qs-inventory"] or config["codem-inventory"] then
        TriggerClientEvent("tgiann-core:client:openInventory", src, data)
    elseif config.ox_inventory then
        tgiCore.RegisterStash(src, data)
        exports.ox_inventory:forceOpenInventory(src, "stash", data.stashName)
    elseif config["tgiann-inventory"] then
        tgiCore.RegisterStash(src, data)
        exports["tgiann-inventory"]:OpenInventory(src, "stash", data.stashName, {
            maxweight = data.maxWeight,
            slots = data.slots,
        }, {
            isPlayer = data.isPlayer,
            password = data.password
        })
    elseif config.origen_inventory then
        tgiCore.RegisterStash(src, data)
        exports.origen_inventory:OpenInventory(src, 'stash', data.stashName)
    elseif config.core_inventory then
        --- source, inventory, inventoryType, x, y, open, content, discoverItem)
        exports.core_inventory:openInventory(src, data.stashName, "stash", nil, nil, true, nil, false)
    elseif config.framework == "qb" then
        exports["qb-inventory"]:OpenInventory(src, data.stashName, {
            maxweight = data.maxWeight,
            slots     = data.slots,
            label     = data.label
        })
    elseif config.framework == "esx" then
        return tgiCore.DebugErrorLog("Not Found ESX inventory script for open stash!")
    else
        return tgiCore.DebugErrorLog("Not Found inventory script for open stash!")
    end
end

RegisterNetEvent("tgiann-core:server:openInventory")
AddEventHandler("tgiann-core:server:openInventory", function(data)
    tgiCore.OpenStash(source, data)
end)

-- SHOP

--- @param shopName string
--- @param items table
--- @param location vector3
tgiCore.RegisterShop = function(shopName, items, location)
    if config["tgiann-inventory"] then
        exports["tgiann-inventory"]:RegisterShop(shopName, items)
    elseif config.ox_inventory then
        exports.ox_inventory:RegisterShop(shopName, {
            name = shopName,
            inventory = items,
            locations = {
                location.xyz
            },
            groups = {
                police = 0
            },
        })
    elseif config.framework == "qb" then
        exports['qb-inventory']:CreateShop({
            name = shopName,
            label = shopName,
            slots = #items,
            coords = location.xyz,
            items = items,
        })
    end
end

--- @param src number
--- @param data table {shopName: string, items: table}
--- @diagnostic disable-next-line dublicate-function
tgiCore.OpenShop = function(src, data)
    if config.ox_inventory or config["qs-inventory"] or config["codem-inventory"] then
        TriggerClientEvent("tgiann-core:client:OpenShop", src, data)
    elseif config["tgiann-inventory"] then
        exports["tgiann-inventory"]:OpenShop(src, data.shopName)
    elseif config.origen_inventory then
        -- stash items need add to config file
        exports.origen_inventory:OpenInventory(src, 'shop', data.stashName)
    elseif config.core_inventory then
        -- there is no shop in core_inventory
    elseif config.framework == "qb" then
        exports['qb-inventory']:OpenShop(src, data.shopName)
    elseif config.framework == "esx" then
        return tgiCore.DebugErrorLog("Not Found ESX inventory script for open shop!")
    else
        return tgiCore.DebugErrorLog("Not Found inventory script for open shop!")
    end
end

RegisterNetEvent("tgiann-core:server:openShop")
--- @param data table {shopName: string, items: table}
AddEventHandler("tgiann-core:server:openShop", function(data)
    tgiCore.OpenShop(source, data)
end)

-- Open Target Player

--- @param src number
--- @param targetSrc table {shopName: string, items: table}
--- @diagnostic disable-next-line dublicate-function
tgiCore.OpenTargetPlayerInventory = function(src, targetSrc)
    if config.ox_inventory or config["qs-inventory"] or config["codem-inventory"] or config.core_inventory then
        TriggerClientEvent("tgiann-core:client:OpenTargetPlayerInventory", src, targetSrc)
    elseif config["tgiann-inventory"] then
        exports["tgiann-inventory"]:OpenInventoryById(src, targetSrc)
    elseif config.origen_inventory then
        exports.origen_inventory:OpenInventoryById(playerId, otherPlayerId)
    elseif config.framework == "qb" then
        exports["qb-inventory"]:OpenInventoryById(src, targetSrc)
    elseif config.framework == "esx" then
        return tgiCore.DebugErrorLog("Not Found ESX inventory script for open stash!")
    else
        return tgiCore.DebugErrorLog("Not Found inventory script for open stash!")
    end
end

RegisterNetEvent("tgiann-core:server:OpenTargetPlayerInventory")
--- @param targetSrc number
AddEventHandler("tgiann-core:server:OpenTargetPlayerInventory", function(targetSrc)
    tgiCore.OpenTargetPlayerInventory(source, targetSrc)
end)
