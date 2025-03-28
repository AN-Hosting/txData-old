local QBCore = exports['qb-core']:GetCoreObject()
local sleepingPlayers = {}
local activeStashes = {}

local function Debug(...)
    if Config.Debug then
        print('[caticus-logoutsleep:DEBUG]', ...)
    end
end

local function UpdateOfflinePlayerInventory(citizenid, stashId)
    local stashItems = exports.ox_inventory:GetInventoryItems(stashId)
    Debug('Current stash items:', json.encode(stashItems))
    local newInventory = {}
    if stashItems then
        for _, item in pairs(stashItems) do
            if item.count and item.count > 0 then
                table.insert(newInventory, {
                    name = item.name,
                    count = item.count,
                    slot = item.slot
                })
            end
        end
    end
    

    MySQL.update.await('UPDATE players SET inventory = ? WHERE citizenid = ?', {
        json.encode(newInventory),
        citizenid
    })
    Debug('Updated offline player inventory:', citizenid, json.encode(newInventory))
end

AddEventHandler('playerDropped', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local citizenid = Player.PlayerData.citizenid
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local result = MySQL.Sync.fetchAll('SELECT model, skin FROM playerskins WHERE citizenid = ? AND active = 1', {citizenid})
    if result[1] then
        sleepingPlayers[citizenid] = {
            coords = vector4(coords.x, coords.y, coords.z, heading),
            model = result[1].model,
            appearance = result[1].skin
        }
        
        TriggerClientEvent('caticus-logoutsleep:client:CreateSleepingPed', -1, {
            citizenid = citizenid,
            coords = vector4(coords.x, coords.y, coords.z, heading),
            model = result[1].model,
            appearance = result[1].skin
        })
    end
end)


RegisterServerEvent('caticus-logoutsleep:server:CreateSleepingPed', function(playerData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local citizenid = playerData.citizenid
    local result = MySQL.Sync.fetchAll('SELECT skin FROM playerskins WHERE citizenid = ? AND active = 1', {citizenid})
    if result[1] then
        local skin = result[1].skin
        playerData.appearance = skin
        sleepingPlayers[citizenid] = playerData
        
        TriggerClientEvent('caticus-logoutsleep:client:CreateSleepingPed', -1, {
            citizenid = citizenid,
            coords = playerData.coords,
            model = playerData.model,
            appearance = skin
        })
    end
end)


RegisterServerEvent('caticus-logoutsleep:server:CheckSleepingPed', function(citizenid)
    if sleepingPlayers[citizenid] then
        sleepingPlayers[citizenid] = nil
        activeStashes[citizenid] = nil
        TriggerClientEvent('caticus-logoutsleep:client:RemoveSleepingPed', -1, citizenid)
    end
end)


AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        sleepingPlayers = {}
    end
end)


RegisterServerEvent("caticus-logoutsleep:server:OpenInventory", function(citizenid)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    
    Debug('Opening inventory for citizenid:', citizenid)
    local stashId = 'sleeping_'..citizenid
    local result = MySQL.Sync.fetchAll('SELECT charinfo, inventory FROM players WHERE citizenid = ?', {citizenid})
    if not result[1] then return end
    
    local charinfo = json.decode(result[1].charinfo)
    local inventory = json.decode(result[1].inventory)
    local playerName = charinfo.firstname .. ' ' .. charinfo.lastname
    exports.ox_inventory:RegisterStash(stashId, playerName..'\'s Pockets', Config.MaxSlots, Config.MaxWeight)
    for _, item in pairs(inventory) do
        if item.count and item.count > 0 then
            exports.ox_inventory:AddItem(stashId, item.name, item.count, nil, item.slot)
        end
    end

    TriggerClientEvent('ox_inventory:openInventory', src, 'stash', stashId)
end)

AddEventHandler('ox_inventory:swapItems', function(payload)
    if payload.fromType == 'stash' and string.find(payload.fromInventory, 'sleeping_') then
        local citizenid = string.gsub(payload.fromInventory, 'sleeping_', '')
        Debug('Item being removed:', json.encode(payload))
        local result = MySQL.Sync.fetchAll('SELECT inventory FROM players WHERE citizenid = ?', {citizenid})
        if result[1] then
            local inventory = json.decode(result[1].inventory)
            for i, item in pairs(inventory) do
                if item.name == payload.fromItem.name and item.slot == payload.fromSlot then
                    table.remove(inventory, i)
                    
                    MySQL.Sync.execute('UPDATE players SET inventory = ? WHERE citizenid = ?', {
                        json.encode(inventory),
                        citizenid
                    })

                    if sleepingPlayers[citizenid] then
                        sleepingPlayers[citizenid].inventory = inventory
                        Debug('Updated sleeping player inventory:', citizenid)
                    end

                    Debug('Item removed from database:', item.name)
                    break
                end
            end
        end
    end
end)


AddEventHandler('ox_inventory:closed', function(name)
    if string.find(name, 'sleeping_') then
        local items = exports.ox_inventory:GetInventoryItems(name)
        if items then
            local citizenid = string.gsub(name, 'sleeping_', '')
            local newInventory = {}
            for _, item in pairs(items) do
                if item.count and item.count > 0 then
                    table.insert(newInventory, {
                        name = item.name,
                        count = item.count,
                        slot = item.slot
                    })
                end
            end
            

            MySQL.Sync.execute('UPDATE players SET inventory = ? WHERE citizenid = ?', {
                json.encode(newInventory),
                citizenid
            })
        end
        

        exports.ox_inventory:RemoveInventory(name)
    end
end)


AddEventHandler('ox_inventory:removeItem', function(payload)
    if string.find(payload.inventoryId, 'sleeping_') then
        local citizenid = string.gsub(payload.inventoryId, 'sleeping_', '')
        Debug('Item removed from sleeping player:', citizenid, json.encode(payload))
        UpdateOfflinePlayerInventory(citizenid, payload.inventoryId)
    end
end)


AddEventHandler('ox_inventory:addItem', function(payload)
    if string.find(payload.inventoryId, 'sleeping_') then
        local citizenid = string.gsub(payload.inventoryId, 'sleeping_', '')
        Debug('Item added to sleeping player:', citizenid, json.encode(payload))
        UpdateOfflinePlayerInventory(citizenid, payload.inventoryId)
    end
end)


RegisterServerEvent("caticus-logoutsleep:server:GetPlayerItems", function(citizenid)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local result = MySQL.Sync.fetchAll('SELECT charinfo, inventory FROM players WHERE citizenid = ?', {citizenid})
    if not result[1] then return end
    
    local charinfo = json.decode(result[1].charinfo)
    local inventory = json.decode(result[1].inventory)
    local playerName = charinfo.firstname .. ' ' .. charinfo.lastname

    TriggerClientEvent('caticus-logoutsleep:client:ShowRobMenu', src, {
        citizenid = citizenid,
        name = playerName,
        inventory = inventory
    })
end)


RegisterServerEvent("caticus-logoutsleep:server:StealItem", function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local result = MySQL.Sync.fetchAll('SELECT inventory FROM players WHERE citizenid = ?', {data.citizenid})
    if result[1] then
        local inventory = json.decode(result[1].inventory)
        local newInventory = {}

        for _, item in pairs(inventory) do
            if not (item.name == data.item.name and item.slot == data.item.slot) then
                table.insert(newInventory, item)
            end
        end

        MySQL.Sync.execute('UPDATE players SET inventory = ? WHERE citizenid = ?', {
            json.encode(newInventory),
            data.citizenid
        })

        Player.Functions.AddItem(data.item.name, data.item.count)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[data.item.name], "add")
    end
end)

RegisterServerEvent('caticus-logoutsleep:server:UpdateSleepingPedPosition', function(citizenid, newCoords)
    if sleepingPlayers[citizenid] then
        -- Update both the temporary table and the stored data
        sleepingPlayers[citizenid].coords = newCoords
        
        -- Update the stored position in the database
        MySQL.Sync.execute('UPDATE players SET position = ? WHERE citizenid = ?', {
            json.encode({
                x = newCoords.x,
                y = newCoords.y,
                z = newCoords.z,
                w = newCoords.w -- heading
            }),
            citizenid
        })
        
        Debug('Updated sleeping player position:', citizenid, json.encode(newCoords))
    end
end) 

RegisterNetEvent('caticus-logoutsleep:server:SyncAnimation', function(netId)
    TriggerClientEvent('caticus-logoutsleep:client:SyncAnimation', -1, netId)
end)