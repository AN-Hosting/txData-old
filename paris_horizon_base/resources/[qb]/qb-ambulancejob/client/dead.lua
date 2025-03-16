local deadAnimDict = 'dead'
local deadAnim = 'dead_a'
local hold = 5
deathTime = 200

-- Functions

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

function OnDeath()
    if not isDead then
        isDead = true
        TriggerServerEvent('hospital:server:SetDeathStatus', true)
        TriggerServerEvent('InteractSound_SV:PlayOnSource', 'flatline', 0.1)
        local player = PlayerPedId()

        while GetEntitySpeed(player) > 0.5 or IsPedRagdoll(player) do
            Wait(10)
        end

        if isDead then
            local pos = GetEntityCoords(player)
            local heading = GetEntityHeading(player)

            local ped = PlayerPedId()
            if IsPedInAnyVehicle(ped) then
                local veh = GetVehiclePedIsIn(ped)
                local vehseats = GetVehicleModelNumberOfSeats(GetHashKey(GetEntityModel(veh)))
                for i = -1, vehseats do
                    local occupant = GetPedInVehicleSeat(veh, i)
                    if occupant == ped then
                        NetworkResurrectLocalPlayer(pos.x, pos.y, pos.z + 0.5, heading, true, false)
                        SetPedIntoVehicle(ped, veh, i)
                    end
                end
            else
                NetworkResurrectLocalPlayer(pos.x, pos.y, pos.z + 0.5, heading, true, false)
            end

            SetEntityInvincible(player, true)
            SetEntityHealth(player, GetEntityMaxHealth(player))
            if IsPedInAnyVehicle(player, false) then
                loadAnimDict('veh@low@front_ps@idle_duck')
                TaskPlayAnim(player, 'veh@low@front_ps@idle_duck', 'sit', 1.0, 1.0, -1, 1, 0, 0, 0, 0)
            else
                loadAnimDict(deadAnimDict)
                TaskPlayAnim(player, deadAnimDict, deadAnim, 1.0, 1.0, -1, 1, 0, 0, 0, 0)
            end
            TriggerServerEvent('hospital:server:ambulanceAlert', "~r~⚠️ URGENCE MÉDICALE ⚠️~w~\nUn civil nécessite une intervention immédiate")
        end
    end
end

function DeathTimer()
    hold = 5
    while isDead do
        Wait(1000)
        deathTime = deathTime - 1
        if deathTime <= 0 then
            if IsControlPressed(0, 38) and hold <= 0 and not isInHospitalBed then
                TriggerEvent('hospital:client:RespawnAtHospital')
                hold = 5
            end
            if IsControlPressed(0, 38) then
                if hold - 1 >= 0 then
                    hold = hold - 1
                else
                    hold = 0
                end
            end
            if IsControlReleased(0, 38) then
                hold = 5
            end
        end
    end
end

-- Fonctions de dessin améliorées
local function DrawRect(x, y, width, height, r, g, b, a)
    DrawSprite("", "", x, y, width, height, 0.0, r, g, b, a)
end

-- Fonction pour dessiner un rectangle avec dégradé
local function DrawGradientRect(x, y, width, height, r1, g1, b1, r2, g2, b2, a)
    DrawRect(x, y, width, height, r1, g1, b1, a)
    DrawRect(x, y + height/2, width, height/2, r2, g2, b2, a)
end

local function DrawAdvancedText(x, y, scale, text, r, g, b, a, font, align)
    SetTextFont(font or 4)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextCentre(align)
    SetTextDropshadow(1, 0, 0, 0, 200)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

-- Damage Handler

AddEventHandler('gameEventTriggered', function(event, data)
    if event == 'CEventNetworkEntityDamage' then
        local victim, attacker, victimDied, weapon = data[1], data[2], data[4], data[7]
        if not IsEntityAPed(victim) then return end
        if victimDied and NetworkGetPlayerIndexFromPed(victim) == PlayerId() and IsEntityDead(PlayerPedId()) then
            if not InLaststand then
                SetLaststand(true)
            elseif InLaststand and not isDead then
                SetLaststand(false)
                local playerid = NetworkGetPlayerIndexFromPed(victim)
                local playerName = GetPlayerName(playerid) .. ' ' .. '(' .. GetPlayerServerId(playerid) .. ')' or Lang:t('info.self_death')
                local killerId = NetworkGetPlayerIndexFromPed(attacker)
                local killerName = GetPlayerName(killerId) .. ' ' .. '(' .. GetPlayerServerId(killerId) .. ')' or Lang:t('info.self_death')
                local weaponLabel = (QBCore.Shared.Weapons and QBCore.Shared.Weapons[weapon] and QBCore.Shared.Weapons[weapon].label) or 'Unknown'
                local weaponName = (QBCore.Shared.Weapons and QBCore.Shared.Weapons[weapon] and QBCore.Shared.Weapons[weapon].name) or 'Unknown'
                TriggerServerEvent('qb-log:server:CreateLog', 'death', Lang:t('logs.death_log_title', { playername = playerName, playerid = GetPlayerServerId(playerid) }), 'red', Lang:t('logs.death_log_message', { killername = killerName, playername = playerName, weaponlabel = weaponLabel, weaponname = weaponName }))
                deathTime = Config.DeathTime
                OnDeath()
                DeathTimer()
            end
        end
    end
end)

-- Threads

emsNotified = false

CreateThread(function()
    while true do
        local sleep = 1000
        if isDead or InLaststand then
            sleep = 0
            local ped = PlayerPedId()
            
            -- Ajout de l'effet de flou
            if InLaststand then
                SetTimecycleModifier("hud_def_blur") -- Flou léger pour blessé
                SetTimecycleModifierStrength(1.0)
            else
                SetTimecycleModifier("hud_def_desat_blur") -- Flou plus fort pour mort
                SetTimecycleModifierStrength(1.2)
            end

            -- Désactiver la plupart des contrôles quand mort/blessé
            DisableAllControlActions(0)
            EnableControlAction(0, 1, true) -- Camera pan
            EnableControlAction(0, 2, true) -- Camera tilt
            EnableControlAction(0, 38, true) -- E key
            EnableControlAction(0, 47, true) -- G key
            EnableControlAction(0, 245, true) -- T key
            EnableControlAction(0, 322, true) -- ESC key
            
            if isDead then
                if not isInHospitalBed then
                    -- Fond avec dégradé rouge foncé
                    DrawGradientRect(0.5, 0.2, 0.3, 0.15, 30, 0, 0, 45, 0, 0, 200)
                    
                    -- Bordures complètes du cadre en rouge
                    DrawRect(0.35, 0.2, 0.001, 0.15, 255, 0, 0, 255) -- Gauche
                    DrawRect(0.65, 0.2, 0.001, 0.15, 255, 0, 0, 255) -- Droite
                    DrawRect(0.5, 0.125, 0.3, 0.002, 255, 0, 0, 255) -- Haut
                    DrawRect(0.5, 0.275, 0.3, 0.002, 255, 0, 0, 255) -- Bas
                    
                    if deathTime > 0 then
                        -- État CRITIQUE avec effet de pulse
                        local pulse = math.abs(math.sin(GetGameTimer() / 500)) * 55 + 200
                        DrawAdvancedText(0.5, 0.145, 0.7, "ÉTAT CRITIQUE", 255, pulse, pulse, 255, 4, true)
                        
                        -- Temps avec icône et statut
                        DrawAdvancedText(0.5, 0.185, 0.5, "⏱ RÉANIMATION POSSIBLE", 255, 255, 255, 255, 4, true)
                        DrawAdvancedText(0.5, 0.235, 0.5, "⚠ TEMPS RESTANT - "..math.ceil(deathTime).."s", 255, 255, 255, 255, 4, true)
                    else
                        -- État DÉCÉDÉ avec effet de pulse
                        local pulse = math.abs(math.sin(GetGameTimer() / 500)) * 55 + 200
                        DrawAdvancedText(0.5, 0.145, 0.7, "DÉCÉDÉ", 255, pulse, pulse, 255, 4, true)
                        
                        -- Instructions avec icônes
                        DrawAdvancedText(0.5, 0.185, 0.5, "🏥 MAINTENEZ [E] "..hold.."s", 255, 255, 255, 255, 4, true)
                        DrawAdvancedText(0.5, 0.235, 0.5, "💰 FRAIS: "..Config.BillCost.."$", 255, 255, 255, 255, 4, true)
                    end
                end
            elseif InLaststand then
                -- Fond avec dégradé bleu (plus foncé)
                DrawGradientRect(0.5, 0.2, 0.3, 0.15, 0, 15, 30, 0, 25, 45, 200)
                
                -- Bordures complètes du cadre en bleu
                DrawRect(0.35, 0.2, 0.001, 0.15, 0, 140, 255, 255) -- Gauche
                DrawRect(0.65, 0.2, 0.001, 0.15, 0, 140, 255, 255) -- Droite
                DrawRect(0.5, 0.125, 0.3, 0.002, 0, 140, 255, 255) -- Haut
                DrawRect(0.5, 0.275, 0.3, 0.002, 0, 140, 255, 255) -- Bas
                
                -- Icône de blessure en bleu clair
                DrawAdvancedText(0.37, 0.145, 0.6, "🩺", 0, 180, 255, 255, 4, false)
                
                -- État BLESSÉ avec effet de pulse en bleu (position ajustée)
                local pulse = math.abs(math.sin(GetGameTimer() / 500)) * 55 + 200
                DrawAdvancedText(0.5, 0.145, 0.7, "BLESSÉ GRAVE", 0, pulse, 255, 255, 4, true)
                
                -- Temps avec icône et statut SAMU (positions ajustées)
                if not emsNotified then
                    DrawAdvancedText(0.5, 0.185, 0.5, "🚑  APPUYEZ [G] SAMU", 255, 255, 255, 255, 4, true)
                    
                    if IsControlJustPressed(0, 47) then
                        emsNotified = true
                        -- TriggerServerEvent('hospital:server:ambulanceAlert', "~r~⚠️ URGENCE MÉDICALE ⚠️~w~\nUn civil nécessite une intervention immédiate")
                        exports['ps-dispatch']:InjuriedPerson()
                        QBCore.Functions.Notify('Le SAMU a été notifié de votre situation', 'success')
                    end
                else
                    DrawAdvancedText(0.5, 0.185, 0.5, "🚨 SAMU EN ROUTE", 0, 180, 255, 255, 4, true)
                end
                
                -- Temps restant et message hémorragie (position ajustée)
                DrawAdvancedText(0.5, 0.235, 0.5, "⚠ HÉMORRAGIE CRITIQUE - "..math.ceil(LaststandTime).."s", 255, 255, 255, 255, 4, true)
            end
        else
            -- Réinitialiser l'effet de flou quand le joueur n'est plus mort/blessé
            ClearTimecycleModifier()
        end
        Wait(sleep)
    end
end)
