print("Chargement du fichier CopyEmote.lua côté serveur")

QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add('copyemote', 'Copier l\'emote d\'un joueur proche', {}, false, function(source)
    print("Commande copyemote reçue du joueur:", source)
    TriggerClientEvent('animations:client:CopyEmoteCommand', source)
    print("Événement envoyé au client:", source)
end)

print("Commande copyemote enregistrée")