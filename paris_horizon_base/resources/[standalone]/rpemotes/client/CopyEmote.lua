print("Fichier CopyEmote.lua chargé")

RegisterNetEvent('animations:client:CopyEmoteCommand')
AddEventHandler('animations:client:CopyEmoteCommand', function()
    print("Événement CopyEmoteCommand reçu")
    local closestPlayer, closestDistance = QBCore.Functions.GetClosestPlayer()
    print("Joueur le plus proche:", closestPlayer, "Distance:", closestDistance)
    
    if closestPlayer ~= -1 and closestDistance <= 3.0 then
        local targetPed = GetPlayerPed(closestPlayer)
        print("Ped du joueur cible:", targetPed)
        
        local anim = GetCurrentAnimation(targetPed)
        print("Animation trouvée:", anim)
        
        if anim then
            print("Tentative de démarrage de l'animation:", anim)
            EmoteCommandStart(nil, {anim})
        else
            print("Aucune animation trouvée")
            QBCore.Functions.Notify("Le joueur n'effectue aucune emote", "error")
        end
    else
        print("Aucun joueur à proximité")
        QBCore.Functions.Notify("Aucun joueur à proximité", "error")
    end
end)

-- Fonction utilitaire pour obtenir l'animation en cours
function GetCurrentAnimation(ped)
    print("Recherche d'animation pour le ped:", ped)
    
    print("Vérification des danses...")
    for k, v in pairs(RP.Dances) do
        if type(v) == "table" then
            print("Vérification de la danse:", k)
            if v[1] and v[2] and IsEntityPlayingAnim(ped, v[1], v[2], 3) then
                print("Danse trouvée:", k)
                return k
            end
        end
    end

    print("Vérification des emotes...")
    for k, v in pairs(RP.Emotes) do
        if type(v) == "table" then
            print("Vérification de l'emote:", k)
            if v[1] and v[2] and IsEntityPlayingAnim(ped, v[1], v[2], 3) then
                print("Emote trouvée:", k)
                return k
            end
        end
    end

    print("Vérification des prop emotes...")
    for k, v in pairs(RP.PropEmotes) do
        if type(v) == "table" then
            print("Vérification de la prop emote:", k)
            if v[1] and v[2] and IsEntityPlayingAnim(ped, v[1], v[2], 3) then
                print("Prop emote trouvée:", k)
                return k
            end
        end
    end

    print("Aucune animation trouvée")
    return nil
end