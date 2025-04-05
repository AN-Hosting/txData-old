if Config.Framework ~= 'qb' then
    return
end

QBCore = exports['qb-core']:GetCoreObject()

function RegisterServerCallback(name, cb)
    QBCore.Functions.CreateCallback(name, cb)
end

function RegisterUsableItem(name, cb)
    QBCore.Functions.CreateUseableItem(name, cb)
end

function GetPlayerFromId(source)
    return QBCore.Functions.GetPlayer(source)
end

function GetItem(player, item)
    local data = player.Functions.GetItemByName(item)
    data.count = data.amount
    return data
end

function AddItem(source, item, count)
    local player = GetPlayerFromId(source)
    return player.Functions.AddItem(item, count)
end

function RemoveItem(source, item, count, slot)
    local player = GetPlayerFromId(source)
    player.Functions.RemoveItem(item, count, slot)
end
