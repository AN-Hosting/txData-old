local QBCore = exports['qb-core']:GetCoreObject()

-- Fonction pour vérifier si le joueur a le bon job
local function HasRequiredJob(source)
    local Player = QBCore.Functions.GetPlayer(source)
    return Player.PlayerData.job.name == Config.RequiredJob
end

-- Fonction pour gérer la transaction bancaire
local function HandleBankingTransaction(source, amount, type)
    if Config.UseOkokBanking then
        if type == "add" then
            exports['okokBanking']:AddMoney(source, amount, "Pawnshop Purchase")
        else
            exports['okokBanking']:RemoveMoney(source, amount, "Pawnshop Sale")
        end
    else
        local Player = QBCore.Functions.GetPlayer(source)
        if type == "add" then
            Player.Functions.AddMoney('bank', amount)
        else
            Player.Functions.RemoveMoney('bank', amount)
        end
    end
end

-- Fonction pour envoyer une notification via lb-phone
local function SendPhoneNotification(source, message)
    if Config.UseLbPhone then
        exports['lb-phone']:SendNotification(source, {
            title = "Pawnshop",
            text = message,
            icon = "fas fa-store",
            color = "#4CAF50"
        })
    else
        TriggerClientEvent('QBCore:Notify', source, message, 'success')
    end
end

-- Événement pour acheter un item
RegisterNetEvent('ph-pawnshop:server:buyItem', function(item, price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    if Player.PlayerData.job.name ~= Config.RequiredJob then
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.no_job'), 'error')
        return
    end

    if Config.UseOkokBanking then
        exports['okokBanking']:AddMoney(src, price, "Pawnshop Purchase")
    else
        Player.Functions.AddMoney('bank', price)
    end

    Player.Functions.AddItem(item, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
    TriggerClientEvent('QBCore:Notify', src, Lang:t('success.item_bought'), 'success')
end)

-- Événement pour vendre un item
RegisterNetEvent('ph-pawnshop:server:sellItem', function(item, price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    if Player.PlayerData.job.name ~= Config.RequiredJob then
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.no_job'), 'error')
        return
    end

    local hasItem = Player.Functions.GetItemByName(item)
    if not hasItem or hasItem.amount < 1 then
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.no_item'), 'error')
        return
    end

    Player.Functions.RemoveItem(item, 1)
    if Config.UseOkokBanking then
        exports['okokBanking']:RemoveMoney(src, price, "Pawnshop Sale")
    else
        Player.Functions.RemoveMoney('bank', price)
    end

    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
    TriggerClientEvent('QBCore:Notify', src, Lang:t('success.item_sold'), 'success')
end)

-- Validation du panier
RegisterNetEvent('ph-pawnshop:server:checkout', function(items)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    if Player.PlayerData.job.name ~= Config.RequiredJob then
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.no_job'), 'error')
        return
    end

    local total = 0
    for _, item in ipairs(items) do
        local itemData = Config.Items[item.item]
        if itemData then
            total = total + item.price
        end
    end

    if Config.UseOkokBanking then
        exports['okokBanking']:AddMoney(src, total, "Pawnshop Checkout")
    else
        Player.Functions.AddMoney('bank', total)
    end

    for _, item in ipairs(items) do
        Player.Functions.AddItem(item.item, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.item], "add")
    end

    TriggerClientEvent('QBCore:Notify', src, Lang:t('success.checkout_complete'), 'success')
end) 