-- Variables globales
local calls = {} -- Table pour stocker les appels
local callCount = 0 -- Compteur d'appels

-- Fonctions
exports('GetDispatchCalls', function() -- Fonction pour récupérer tous les appels
    return calls
end)

-- Événements
RegisterServerEvent('ps-dispatch:server:notify', function(data) -- Événement pour notifier un nouvel appel
    callCount = callCount + 1
    data.id = callCount
    data.time = os.time() * 1000 -- Timestamp en millisecondes
    data.units = {} -- Unités assignées à l'appel
    data.responses = {} -- Réponses à l'appel

    -- Vérification des doublons
    if #calls > 0 then
        if calls[#calls] == data then
            return
        end
    end
        
    -- Limite du nombre d'appels
    if #calls >= Config.MaxCallList then
        table.remove(calls, 1) -- Supprime le plus ancien appel
    end

    calls[#calls + 1] = data -- Ajoute le nouvel appel

    TriggerClientEvent('ps-dispatch:client:notify', -1, data) -- Notifie tous les clients
end)

-- Événement pour attacher une unité à un appel
RegisterServerEvent('ps-dispatch:server:attach', function(id, player)
    for i=1, #calls do
        if calls[i]['id'] == id then
            for j = 1, #calls[i]['units'] do
                if calls[i]['units'][j]['citizenid'] == player.citizenid then
                    return -- Évite les doublons d'unités
                end
            end
            calls[i]['units'][#calls[i]['units'] + 1] = player
            return
        end
    end
end)

-- Événement pour détacher une unité d'un appel
RegisterServerEvent('ps-dispatch:server:detach', function(id, player)
    for i = #calls, 1, -1 do
        if calls[i]['id'] == id then
            if calls[i]['units'] and (#calls[i]['units'] or 0) > 0 then
                for j = #calls[i]['units'], 1, -1 do
                    if calls[i]['units'][j]['citizenid'] == player.citizenid then
                        table.remove(calls[i]['units'], j)
                    end
                end
            end
            return
        end
    end
end)

-- Callbacks (Rappels)
lib.callback.register('ps-dispatch:callback:getLatestDispatch', function(source) -- Récupère le dernier appel
    return calls[#calls]
end)

lib.callback.register('ps-dispatch:callback:getCalls', function(source) -- Récupère tous les appels
    return calls
end)

-- Commandes
lib.addCommand('dispatch', {
    help = 'Ouvrir le dispatch'
}, function(source, raw)
    TriggerClientEvent("ps-dispatch:client:openMenu", source, calls)
end)

lib.addCommand('911', {
    help = 'Envoyer un message au 911',
    params = { { name = 'message', type = 'string', help = 'Message pour le 911' }},
}, function(source, args, raw)
    local fullMessage = raw:sub(5)
    TriggerClientEvent('ps-dispatch:client:sendEmergencyMsg', source, fullMessage, "911", false)
end)
lib.addCommand('911a', {
    help = 'Envoyer un message anonyme au 911',
    params = { { name = 'message', type = 'string', help = 'Message pour le 911' }},
}, function(source, args, raw)
    local fullMessage = raw:sub(5)
    TriggerClientEvent('ps-dispatch:client:sendEmergencyMsg', source, fullMessage, "911", true)
end)

lib.addCommand('311', {
    help = 'Envoyer un message au 311',
    params = { { name = 'message', type = 'string', help = 'Message pour le 311' }},
}, function(source, args, raw)
    local fullMessage = raw:sub(5)
    TriggerClientEvent('ps-dispatch:client:sendEmergencyMsg', source, fullMessage, "311", false)
end)

lib.addCommand('311a', {
    help = 'Envoyer un message anonyme au 311',
    params = { { name = 'message', type = 'string', help = 'Message pour le 311' }},
}, function(source, args, raw)
    local fullMessage = raw:sub(5)
    TriggerClientEvent('ps-dispatch:client:sendEmergencyMsg', source, fullMessage, "311", true)
end)

