local QBCore = exports['qb-core']:GetCoreObject()

-- Ajouter cette fonction pour vérifier le nombre de policiers
local function GetCopCount()
    local cops = 0
    for _, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if (v.PlayerData.job.name == "police_nationale" or v.PlayerData.job.name == "gendarmerie_nationale") and v.PlayerData.job.onduty then
            cops = cops + 1
        end
    end
    return cops
end

-- Event pour endormir un PNJ
RegisterNetEvent('illegal:sleepPed', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    -- Vérifier le nombre de policiers
    if GetCopCount() < 1 then
        TriggerClientEvent('QBCore:Notify', src, 'Il n\'y a pas assez de forces de l\'ordre en ville pour faire ça...', 'error', 10000)
        return
    end
    
    if Player.Functions.RemoveItem('chloroform', 1) and Player.Functions.RemoveItem('cloth', 1) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['chloroform'], "remove")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cloth'], "remove")
        TriggerClientEvent('illegal:sleepPedClient', src)
    else
        TriggerClientEvent('QBCore:Notify', src, 'Il vous manque des items...', 'error')
    end
end)

-- Event pour la récupération des organes
RegisterNetEvent('illegal:harvestOrgans', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player.Functions.RemoveItem('scalpel', 1) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['scalpel'], "remove")
        TriggerClientEvent('illegal:harvestOrgansClient', src)
    else
        TriggerClientEvent('QBCore:Notify', src, 'Il vous faut un scalpel...', 'error')
    end
end)

-- Event pour jeter le corps
RegisterNetEvent('illegal:disposeBody', function()
    local src = source
    TriggerClientEvent('illegal:disposeBodyClient', src)
end)

QBCore.Functions.CreateUseableItem('chloroform', function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemByName('cloth') then
        TriggerClientEvent('qb-organe:client:useChloroform', source)
    else
        TriggerClientEvent('QBCore:Notify', source, 'Il vous faut un torchon...', 'error')
    end
end)

-- Modifier l'event pour mettre le corps dans le coffre
RegisterNetEvent('qb-organe:server:addBodyToTrunk', function(plate)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    -- Ajouter directement l'item dans l'inventaire du coffre
    local trunk = exports['qb-inventory']:GetInventory('trunk'..plate)
    if trunk then
        -- Ajouter l'item au joueur d'abord
        Player.Functions.AddItem('dead_body', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['dead_body'], "add")
        -- Puis le transférer dans le coffre
        exports['qb-inventory']:AddItem('trunk'..plate, 'dead_body', 1)
        TriggerClientEvent('QBCore:Notify', src, 'Corps mis dans le coffre', 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'Impossible d\'accéder au coffre', 'error')
    end
end)

-- Ajouter l'event pour donner l'item dead_body
RegisterNetEvent('qb-organe:server:giveDeadBody', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player then
        Player.Functions.AddItem('dead_body', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['dead_body'], "add")
        TriggerClientEvent('QBCore:Notify', src, 'Vous avez récupéré le corps', 'success')
    end
end)

-- Ajouter ceci après les autres events
QBCore.Functions.CreateUseableItem('scalpel', function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemByName('dead_body') then
        TriggerClientEvent('qb-organe:client:cutBody', source)
    else
        TriggerClientEvent('QBCore:Notify', source, 'Il vous faut un corps à découper...', 'error')
    end
end)

-- Event pour donner les organes après découpe
RegisterNetEvent('qb-organe:server:giveRandomOrgans', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    -- Vérifier si le joueur a les items nécessaires
    if Player.Functions.GetItemByName('scalpel') and Player.Functions.GetItemByName('dead_body') then
        if Player.Functions.RemoveItem('dead_body', 1) then -- On retire uniquement le corps
            -- Liste des organes possibles
            local possibleOrgans = {
                "kidney", "liver", "heart", "lung", "blood", "skin", 
                "spleen", "eye", "stomach", "tongue", "tooth", 
                "brain", "pancreas", "ear"
            }
            
            -- Créer une table temporaire pour éviter les doublons
            local availableOrgans = {}
            for _, organ in ipairs(possibleOrgans) do
                table.insert(availableOrgans, organ)
            end
            
            -- Donner entre 3 et 4 organes aléatoires sans doublon
            local numOrgans = math.random(3, 4)
            for i = 1, numOrgans do
                if #availableOrgans > 0 then
                    -- Choisir un index aléatoire dans les organes disponibles
                    local randomIndex = math.random(#availableOrgans)
                    local selectedOrgan = availableOrgans[randomIndex]
                    
                    -- Donner l'organe au joueur
                    Player.Functions.AddItem(selectedOrgan, 1)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[selectedOrgan], "add")
                    
                    -- Retirer l'organe de la liste disponible pour éviter les doublons
                    table.remove(availableOrgans, randomIndex)
                end
            end
            
            -- Notifications pour les items retirés (uniquement le corps)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['dead_body'], "remove")
            TriggerClientEvent('QBCore:Notify', src, 'Opération réussie', 'success')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'Il vous manque les items nécessaires', 'error')
    end
end)

-- Ajouter l'event pour acheter des items
RegisterNetEvent('qb-organe:server:buyItem', function(itemName, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    -- Trouver l'item dans la config
    local item = nil
    for _, v in pairs(Config.Dealer.items) do
        if v.name == itemName then
            item = v
            break
        end
    end
    
    if not item then return end
    
    -- Calculer le prix total
    local price = item.price * amount
    
    -- Vérifier si le joueur a assez d'argent
    if Player.Functions.RemoveMoney('cash', price) then
        -- Donner l'item
        Player.Functions.AddItem(itemName, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], "add")
        TriggerClientEvent('QBCore:Notify', src, 'Achat effectué', 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'Vous n\'avez pas assez d\'argent', 'error')
    end
end)

-- Modifier l'event pour vendre les organes
RegisterNetEvent('qb-organe:server:sellOrgan', function(itemName, amount, paymentType)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    -- Vérifier si l'organe est dans la liste des prix
    if not Config.OrganBuyer.items[itemName] then return end
    
    -- Vérifier si le joueur a l'organe
    if Player.Functions.GetItemByName(itemName) then
        if Player.Functions.RemoveItem(itemName, amount) then
            local basePrice = Config.OrganBuyer.items[itemName].price * amount
            local finalPrice = basePrice
            
            -- Ajuster le prix et donner l'argent selon le type
            if paymentType == "cash" then
                finalPrice = math.floor(basePrice * 0.35) -- Réduction de 65% pour l'argent propre
                Player.Functions.AddMoney('cash', finalPrice)
            else
                -- Pour l'argent sale, on garde le prix de base
                Player.Functions.AddItem('black', finalPrice)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['black'], "add")
            end
            
            -- Notifications
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], "remove")
            local moneyTypeText = paymentType == "cash" and "propre" or "sale"
            TriggerClientEvent('QBCore:Notify', src, 'Vous avez vendu ' .. amount .. ' ' .. QBCore.Shared.Items[itemName].label .. ' pour $' .. finalPrice .. ' en argent ' .. moneyTypeText, 'success')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'Vous n\'avez pas cet organe', 'error')
    end
end)

-- Ajouter l'event pour vendre tous les organes
RegisterNetEvent('qb-organe:server:sellAllOrgans', function(allOrgans, paymentType)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local totalPrice = 0
    
    for _, organ in ipairs(allOrgans) do
        if Config.OrganBuyer.items[organ.name] then
            if Player.Functions.GetItemByName(organ.name) then
                local basePrice = Config.OrganBuyer.items[organ.name].price * organ.amount
                
                if Player.Functions.RemoveItem(organ.name, organ.amount) then
                    totalPrice = totalPrice + basePrice
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[organ.name], "remove")
                end
            end
        end
    end
    
    if totalPrice > 0 then
        if paymentType == "cash" then
            -- 35% du prix en argent propre
            local cashAmount = math.floor(totalPrice * 0.35)
            Player.Functions.AddMoney('cash', cashAmount)
            TriggerClientEvent('QBCore:Notify', src, 'Vous avez vendu tous vos organes pour $' .. cashAmount .. ' en argent propre', 'success')
        else
            -- Prix total en argent sale
            Player.Functions.AddItem('black', totalPrice)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['black'], "add")
            TriggerClientEvent('QBCore:Notify', src, 'Vous avez vendu tous vos organes pour $' .. totalPrice .. ' en argent sale', 'success')
        end
    end
end)

-- Modifier le callback pour vérifier le nombre de policiers
QBCore.Functions.CreateCallback('qb-organe:server:getCopCount', function(source, cb)
    local cops = 0
    for _, v in pairs(QBCore.Functions.GetQBPlayers()) do
        -- Ajouter un print pour voir les jobs
        print("Job trouvé:", v.PlayerData.job.name)
        
        if (v.PlayerData.job.name == "police_nationale" or v.PlayerData.job.name == "gendarmerie_nationale") and v.PlayerData.job.onduty then
            cops = cops + 1
            -- Print quand on trouve un policier/gendarme
            print("Force de l'ordre trouvée:", v.PlayerData.job.name, "En service:", v.PlayerData.job.onduty)
        end
    end
    -- Print du nombre total
    print("Nombre total de forces de l'ordre:", cops)
    cb(cops)
end) 