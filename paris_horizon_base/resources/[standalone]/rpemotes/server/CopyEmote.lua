print("Chargement du fichier CopyEmote.lua côté serveur")

local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('animations:server:CopyEmoteCommand')
AddEventHandler('animations:server:CopyEmoteCommand', function(emoteName)
    local src = source
    print("Emote copiée:", emoteName)
    TriggerClientEvent('animations:client:CopyEmoteCommand', src)
end)

QBCore.Commands.Add('copyemote', 'Copier l\'emote d\'un joueur proche', {}, false, function(source)
    TriggerClientEvent('animations:client:RequestCopyEmote', source)
end)

print("Commande copyemote enregistrée")