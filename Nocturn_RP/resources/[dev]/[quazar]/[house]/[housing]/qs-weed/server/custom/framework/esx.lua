if Config.Framework ~= 'esx' then
    return
end

ESX = exports['es_extended']:getSharedObject()

function RegisterServerCallback(name, cb)
    ESX.RegisterServerCallback(name, cb)
end

function RegisterUsableItem(name, cb)
    ESX.RegisterUsableItem(name, cb)
end

function GetPlayerFromId(source)
    return ESX.GetPlayerFromId(source)
end

function GetItem(player, item)
    return player.getInventoryItem(item)
end

function AddItem(source, item, count)
    local player = GetPlayerFromId(source)
    local success = player.addInventoryItem(item, count)
    if GetResourceState('ox_inventory'):find('started') then
        Debug('ox_inventory add item success:::', success)
        return success
    end
    return true
end

---@param source string
---@param item string
---@param count number
function RemoveItem(source, item, count)
    local player = GetPlayerFromId(source)
    player.removeInventoryItem(item, count)
end
