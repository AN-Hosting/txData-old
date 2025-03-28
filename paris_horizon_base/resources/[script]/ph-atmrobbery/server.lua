local QBCore = exports['qb-core']:GetCoreObject()

-- Liste des ATMs en cours de braquage avec leur cooldown
local robbedATMs = {}

-- Liste des sacs d'argent actifs
local activeMoneyBags = {}
local nextBagId = 1

-- Callback pour vérifier si le joueur a l'item nécessaire
QBCore.Functions.CreateCallback('ph-atmrobbery:server:hasItem', function(source, cb, item)
    local Player = QBCore.Functions.GetPlayer(source)
    local hasItem = Player.Functions.GetItemByName(item)
    
    if hasItem and hasItem.amount > 0 then
        cb(true)
    else
        cb(false)
    end
end)

-- Retire l'item du joueur
RegisterNetEvent('ph-atmrobbery:server:removeItem')
AddEventHandler('ph-atmrobbery:server:removeItem', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    Player.Functions.RemoveItem(item, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
end)

-- Donne de l'argent au joueur
RegisterNetEvent('ph-atmrobbery:server:giveMoney')
AddEventHandler('ph-atmrobbery:server:giveMoney', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    -- Détermine si l'argent est sale ou propre
    local isDirty = math.random(1, 100) <= Config.BlackMoneyChance
    
    if isDirty then
        -- Donne l'item d'argent sale
        Player.Functions.AddItem(Config.MoneyTypes.dirty, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.MoneyTypes.dirty], "add")
    else
        -- Donne l'item d'argent propre  
        Player.Functions.AddItem(Config.MoneyTypes.clean, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.MoneyTypes.clean], "add")
    end
    
    -- Notification
    TriggerClientEvent('QBCore:Notify', src, string.format(Config.Locale.collected_money, amount), 'success')
end)

-- Enregistre un ATM comme braqué pour le cooldown
RegisterNetEvent('ph-atmrobbery:server:registerRobbery')
AddEventHandler('ph-atmrobbery:server:registerRobbery', function(atmId)
    local src = source
    
    -- Enregistre l'ATM comme étant en cooldown
    robbedATMs[atmId] = {
        time = os.time() + (Config.ATMCooldown * 60),
        robber = src
    }
    
    -- Annonce à tous les clients qu'un ATM a été braqué
    TriggerClientEvent('ph-atmrobbery:client:setATMBroken', -1, atmId)
end)

-- Alerte la police
RegisterNetEvent('ph-atmrobbery:server:alertPolice')
AddEventHandler('ph-atmrobbery:server:alertPolice', function(coords)
    -- Cette fonction n'est plus utilisée car nous utilisons maintenant l'export ps-dispatch directement
end)

-- Helper function
function table.contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

-- Vérifier si l'ATM est en cooldown
QBCore.Functions.CreateCallback('ph-atmrobbery:server:isATMOnCooldown', function(source, cb, atmId)
    local src = source
    local cooldownData = robbedATMs[atmId]
    
    if cooldownData and cooldownData.time > os.time() then
        -- Si c'est le même joueur, autorisé
        if cooldownData.robber == src then
            cb(false, 0)
        else
            -- ATM toujours en cooldown
            cb(true, math.ceil((cooldownData.time - os.time()) / 60))
        end
    else
        -- ATM disponible
        cb(false, 0)
    end
end)

-- Récupérer le nombre de policiers en service
QBCore.Functions.CreateCallback('ph-atmrobbery:server:getPoliceCount', function(source, cb)
    local policeCount = 0
    local players = QBCore.Functions.GetPlayers()
    
    for _, v in pairs(players) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player and Player.PlayerData.job and table.contains(Config.PoliceJobs, Player.PlayerData.job.type) then
            policeCount = policeCount + 1
        end
    end
    
    cb(policeCount)
end)

-- Nettoie le braquage si le joueur se déconnecte pendant
AddEventHandler('playerDropped', function()
    local src = source
    
    -- Vérifie si ce joueur était en train de braquer un ATM
    for atmId, _ in pairs(robbedATMs) do
        TriggerClientEvent('ph-atmrobbery:client:cleanupATM', -1, atmId)
    end
end)

-- Ajoute l'item bomb aux items partagés si nécessaire
Citizen.CreateThread(function()
    if not QBCore.Shared.Items[Config.BombItem] then
        QBCore.Shared.Items[Config.BombItem] = {
            name = Config.BombItem,
            label = 'Bombe ATM',
            weight = 1000,
            type = 'item',
            image = 'bomb.png',
            unique = false,
            useable = true,
            shouldClose = true,
            combinable = nil,
            description = 'Une bombe utilisée pour braquer les ATMs'
        }
    end
end)

-- Crée un sac d'argent synchronisé
RegisterNetEvent('ph-atmrobbery:server:createMoneyBag')
AddEventHandler('ph-atmrobbery:server:createMoneyBag', function(coords, amount, atmId)
    local bagId = nextBagId
    nextBagId = nextBagId + 1
    
    -- Stocke les informations du sac
    activeMoneyBags[bagId] = {
        coords = coords,
        amount = amount,
        atmId = atmId,
        time = os.time() + (Config.MoneyBagLifetime * 60) -- Durée de vie de 2 heures
    }
    
    -- Synchronise le sac avec tous les joueurs
    TriggerClientEvent('ph-atmrobbery:client:syncMoneyBag', -1, bagId, coords, amount, atmId)
end)

-- Ramassage d'un sac d'argent
RegisterNetEvent('ph-atmrobbery:server:pickupMoneyBag')
AddEventHandler('ph-atmrobbery:server:pickupMoneyBag', function(bagId, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player or not activeMoneyBags[bagId] then return end
    
    -- Détermine si l'argent est sale ou propre
    local isDirty = math.random(1, 100) <= Config.BlackMoneyChance
    
    if isDirty then
        -- Donne l'item d'argent sale
        Player.Functions.AddItem(Config.MoneyTypes.dirty, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.MoneyTypes.dirty], "add")
    else
        -- Donne l'item d'argent propre  
        Player.Functions.AddItem(Config.MoneyTypes.clean, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.MoneyTypes.clean], "add")
    end
    
    -- Notification
    TriggerClientEvent('QBCore:Notify', src, string.format(Config.Locale.collected_money, amount), 'success')
    
    -- Supprime le sac pour tous les joueurs
    TriggerClientEvent('ph-atmrobbery:client:removeMoneyBag', -1, bagId)
    
    -- Supprime de la liste des sacs actifs
    activeMoneyBags[bagId] = nil
end)

-- Synchronise les sons
RegisterNetEvent('ph-atmrobbery:server:playSoundSync')
AddEventHandler('ph-atmrobbery:server:playSoundSync', function(coords, name, set, volume)
    TriggerClientEvent('ph-atmrobbery:client:playSoundSync', -1, coords, name, set, volume)
end)

-- Nettoie les braquages lorsque l'ATM n'est plus en cooldown et les sacs d'argent expirés
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10000) -- Vérifie toutes les 10 secondes
        
        local currentTime = os.time()
        local atmsToRemove = {}
        local bagsToRemove = {}
        
        -- Vérifier les ATMs dont le cooldown est expiré
        for atmId, cooldownData in pairs(robbedATMs) do
            if cooldownData.time <= currentTime then
                table.insert(atmsToRemove, atmId)
            end
        end
        
        -- Vérifier les sacs d'argent expirés
        for bagId, bagData in pairs(activeMoneyBags) do
            if bagData.time <= currentTime then
                table.insert(bagsToRemove, bagId)
            end
        end
        
        -- Supprimer les ATMs dont le cooldown est expiré
        for _, atmId in ipairs(atmsToRemove) do
            -- Notifie tous les clients que l'ATM n'est plus cassé
            TriggerClientEvent('ph-atmrobbery:client:resetATM', -1, atmId)
            robbedATMs[atmId] = nil
        end
        
        -- Supprimer les sacs d'argent expirés
        for _, bagId in ipairs(bagsToRemove) do
            TriggerClientEvent('ph-atmrobbery:client:removeMoneyBag', -1, bagId)
            activeMoneyBags[bagId] = nil
        end
    end
end)

-- Synchronise les sacs d'argent pour les joueurs qui se connectent
RegisterNetEvent('QBCore:Server:PlayerLoaded')
AddEventHandler('QBCore:Server:PlayerLoaded', function()
    local src = source
    
    -- Envoie tous les sacs d'argent actifs au joueur
    for bagId, bagData in pairs(activeMoneyBags) do
        TriggerClientEvent('ph-atmrobbery:client:syncMoneyBag', src, bagId, bagData.coords, bagData.amount, bagData.atmId)
    end
end)
