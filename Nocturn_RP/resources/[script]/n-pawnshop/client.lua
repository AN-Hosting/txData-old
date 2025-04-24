local QBCore = exports['qb-core']:GetCoreObject()
local items = {
    {name = "Téléphone", buyPrice = 100, sellPrice = 50},
    {name = "Montre", buyPrice = 200, sellPrice = 100},
    {name = "Bijoux", buyPrice = 500, sellPrice = 250},
    {name = "Console", buyPrice = 800, sellPrice = 400}
}

local isUIOpen = false
local isAdminMode = false

-- Fonction pour ouvrir l'interface
function OpenPawnshopUI()
    if not isUIOpen then
        isUIOpen = true
        SetNuiFocus(true, true)
        SendNUIMessage({
            type = "open",
            items = items,
            isAdmin = isAdminMode
        })
    end
end

-- Fonction pour fermer l'interface
function ClosePawnshopUI()
    if isUIOpen then
        isUIOpen = false
        SetNuiFocus(false, false)
        SendNUIMessage({
            type = "close"
        })
    end
end

-- Événement pour ouvrir l'interface
RegisterNetEvent('pawnshop:openUI')
AddEventHandler('pawnshop:openUI', function()
    OpenPawnshopUI()
end)

-- Événement pour ouvrir l'interface en mode admin
RegisterNetEvent('pawnshop:openAdminUI')
AddEventHandler('pawnshop:openAdminUI', function()
    isAdminMode = true
    OpenPawnshopUI()
end)

-- Callback NUI pour l'achat
RegisterNUICallback('buyItem', function(data, cb)
    TriggerServerEvent('pawnshop:buyItem', data.itemName)
    cb('ok')
end)

-- Callback NUI pour la vente
RegisterNUICallback('sellItem', function(data, cb)
    TriggerServerEvent('pawnshop:sellItem', data.itemName)
    cb('ok')
end)

-- Callback NUI pour recevoir un item d'un joueur
RegisterNUICallback('receiveItem', function(data, cb)
    TriggerServerEvent('pawnshop:receiveItem', data.itemName, data.playerId)
    cb('ok')
end)

-- Callback NUI pour fermer l'interface
RegisterNUICallback('closeUI', function(data, cb)
    isAdminMode = false
    ClosePawnshopUI()
    cb('ok')
end)

-- Callback NUI pour récupérer la liste des joueurs
RegisterNUICallback('getPlayers', function(data, cb)
    local players = {}
    for _, player in ipairs(GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(tonumber(player))
        if Player then
            table.insert(players, {
                id = player,
                name = Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
            })
        end
    end
    SendNUIMessage({
        type = "players",
        players = players
    })
    cb('ok')
end)

-- Commande pour ouvrir l'interface
RegisterCommand('pawnshop', function()
    OpenPawnshopUI()
end, false)

-- Commande pour ouvrir l'interface en mode admin
RegisterCommand('pawnshopadmin', function()
    TriggerServerEvent('pawnshop:checkAdmin')
end, false)