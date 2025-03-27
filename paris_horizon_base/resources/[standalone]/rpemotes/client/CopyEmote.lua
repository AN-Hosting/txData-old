print("Fichier CopyEmote.lua chargé")

RegisterNetEvent('animations:client:RequestCopyEmote')
AddEventHandler('animations:client:RequestCopyEmote', function()
    local closestPlayer, closestDistance = QBCore.Functions.GetClosestPlayer()
    if closestPlayer ~= -1 and closestDistance <= 3.0 then
        local targetPed = GetPlayerPed(closestPlayer)
        local emoteName = GetCurrentEmoteName(targetPed)
        
        if emoteName then
            TriggerEvent('chat:addMessage', {
                color = {255, 255, 0},
                multiline = true,
                args = {"[EMOTE]", "Emote détectée: " .. emoteName}
            })
        else
            QBCore.Functions.Notify("Le joueur n'effectue aucune emote", "error")
        end
    else
        QBCore.Functions.Notify("Aucun joueur à proximité", "error")
    end
end)

-- Fonction pour obtenir le nom de l'emote en cours
function GetCurrentEmoteName(ped)
    -- Vérifie les emotes avec props
    for emoteName, emoteData in pairs(RP.PropEmotes) do
        if type(emoteData) == "table" and emoteData[1] and emoteData[2] then
            if IsEntityPlayingAnim(ped, emoteData[1], emoteData[2], 3) then
                TriggerEvent('chat:addMessage', {
                    color = {255, 255, 0},
                    multiline = true,
                    args = {"[DEBUG]", "PropEmote trouvée: " .. emoteName .. " - Dict: " .. emoteData[1] .. " - Anim: " .. emoteData[2]}
                })
                return emoteName
            end
        end
    end

    -- Vérifie les emotes normales
    for emoteName, emoteData in pairs(RP.Emotes) do
        if type(emoteData) == "table" and emoteData[1] and emoteData[2] then
            if IsEntityPlayingAnim(ped, emoteData[1], emoteData[2], 3) then
                TriggerEvent('chat:addMessage', {
                    color = {255, 255, 0},
                    multiline = true,
                    args = {"[DEBUG]", "Emote trouvée: " .. emoteName .. " - Dict: " .. emoteData[1] .. " - Anim: " .. emoteData[2]}
                })
                return emoteName
            end
        end
    end

    -- Vérifie les danses
    for emoteName, emoteData in pairs(RP.Dances) do
        if type(emoteData) == "table" and emoteData[1] and emoteData[2] then
            if IsEntityPlayingAnim(ped, emoteData[1], emoteData[2], 3) then
                TriggerEvent('chat:addMessage', {
                    color = {255, 255, 0},
                    multiline = true,
                    args = {"[DEBUG]", "Danse trouvée: " .. emoteName .. " - Dict: " .. emoteData[1] .. " - Anim: " .. emoteData[2]}
                })
                return emoteName
            end
        end
    end

    return nil
end