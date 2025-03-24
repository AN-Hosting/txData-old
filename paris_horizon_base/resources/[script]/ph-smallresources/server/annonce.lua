local QBCore = exports['qb-core']:GetCoreObject()

-- Gestion des annonces prédéfinies
RegisterNetEvent('k5_notify:server:sendAnnouncement')
AddEventHandler('k5_notify:server:sendAnnouncement', function(type, jobLabel)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    if Player.PlayerData.job.name == 'unemployed' then return end

    if type == "open" then
        TriggerClientEvent('k5_notify:notify', -1, jobLabel, "Nous sommes maintenant ouverts et prêts à vous accueillir !", 'entreprise_open')
    elseif type == "close" then
        TriggerClientEvent('k5_notify:notify', -1, jobLabel, "Nous sommes maintenant fermés. À bientôt !", 'entreprise_close')
    end
end)

-- Gestion des annonces personnalisées
RegisterNetEvent('k5_notify:server:sendCustomAnnouncement')
AddEventHandler('k5_notify:server:sendCustomAnnouncement', function(message)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    if Player.PlayerData.job.name == 'unemployed' then return end

    local jobLabel = Player.PlayerData.job.label
    TriggerClientEvent('k5_notify:notify', -1, jobLabel, message, 'entreprise_annonce')
end)