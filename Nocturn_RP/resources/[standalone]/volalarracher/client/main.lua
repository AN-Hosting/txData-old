local cooldown = false
local QBCore = exports['qb-core']:GetCoreObject()
local targetedPeds = {}
local stolenBag = nil
local bagObject = nil
local isStruggling = false
local carryingBag = false
local bagObj = nil

-- Fonction pour notifier la police
local function NotifyPolice(coords)
    -- Obtenir le nom de la rue
    local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
    
    -- Créer le message pour la police
    local message = "Vol à l'arraché signalé - Rue: " .. streetName
    
    -- Envoyer l'alerte aux deux services
    TriggerServerEvent('police:server:policeAlert', message, coords)
    
    -- Créer un blip sur la carte
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, 161)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 1)
    SetBlipAsShortRange(blip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Vol à l'arraché")
    EndTextCommandSetBlipName(blip)
    
    -- Faire disparaître le blip après 30 secondes
    Citizen.SetTimeout(30000, function()
        RemoveBlip(blip)
    end)
end

-- Charger l'animation
Citizen.CreateThread(function()
    RequestAnimDict(Config.Animation.dict)
    RequestAnimDict(Config.Animation.victimAnim)
    while not HasAnimDictLoaded(Config.Animation.dict) or not HasAnimDictLoaded(Config.Animation.victimAnim) do
        Citizen.Wait(100)
    end
end)

-- Fonction pour vérifier si le PNJ est une femme
local function IsPedFemale(ped)
    -- Vérifier si le ped est valide
    if not DoesEntityExist(ped) then return false end
    
    -- Obtenir le modèle du ped
    local model = GetEntityModel(ped)
    
    -- Liste des modèles féminins communs
    local femaleHashes = {
        `mp_f_freemode_01`, -- MP Female
        `a_f_m_beach_01`,
        `a_f_m_bevhills_01`,
        `a_f_m_bevhills_02`,
        `a_f_m_bodybuild_01`,
        `a_f_m_business_02`,
        `a_f_m_downtown_01`,
        `a_f_m_eastsa_01`,
        `a_f_m_eastsa_02`,
        `a_f_m_fatbla_01`,
        `a_f_m_fatcult_01`,
        `a_f_m_fatwhite_01`,
        `a_f_m_ktown_01`,
        `a_f_m_ktown_02`,
        `a_f_m_prolhost_01`,
        `a_f_m_salton_01`,
        `a_f_m_skidrow_01`,
        `a_f_m_soucent_01`,
        `a_f_m_soucent_02`,
        `a_f_m_soucentmc_01`,
        `a_f_m_tourist_01`,
        `a_f_m_tramp_01`,
        `a_f_m_trampbeac_01`,
        `a_f_o_genstreet_01`,
        `a_f_o_indian_01`,
        `a_f_o_ktown_01`,
        `a_f_o_salton_01`,
        `a_f_o_soucent_01`,
        `a_f_o_soucent_02`,
        `a_f_y_beach_01`,
        `a_f_y_bevhills_01`,
        `a_f_y_bevhills_02`,
        `a_f_y_bevhills_03`,
        `a_f_y_bevhills_04`,
        `a_f_y_business_01`,
        `a_f_y_business_02`,
        `a_f_y_business_03`,
        `a_f_y_business_04`,
        `a_f_y_eastsa_01`,
        `a_f_y_eastsa_02`,
        `a_f_y_eastsa_03`,
        `a_f_y_epsilon_01`,
        `a_f_y_fitness_01`,
        `a_f_y_fitness_02`,
        `a_f_y_genhot_01`,
        `a_f_y_golfer_01`,
        `a_f_y_hiker_01`,
        `a_f_y_hippie_01`,
        `a_f_y_hipster_01`,
        `a_f_y_hipster_02`,
        `a_f_y_hipster_03`,
        `a_f_y_hipster_04`,
        `a_f_y_indian_01`,
        `a_f_y_juggalo_01`,
        `a_f_y_runner_01`,
        `a_f_y_rurmeth_01`,
        `a_f_y_scdressy_01`,
        `a_f_y_skater_01`,
        `a_f_y_soucent_01`,
        `a_f_y_soucent_02`,
        `a_f_y_soucent_03`,
        `a_f_y_tennis_01`,
        `a_f_y_topless_01`,
        `a_f_y_tourist_01`,
        `a_f_y_tourist_02`,
        `a_f_y_vinewood_01`,
        `a_f_y_vinewood_02`,
        `a_f_y_vinewood_03`,
        `a_f_y_vinewood_04`,
        `a_f_y_yoga_01`,
        `g_f_y_ballas_01`,
        `g_f_y_families_01`,
        `g_f_y_lost_01`,
        `g_f_y_vagos_01`,
        `s_f_m_fembarber`,
        `s_f_m_maid_01`,
        `s_f_m_shop_high`,
        `s_f_m_sweatshop_01`,
        `s_f_y_airhostess_01`,
        `s_f_y_bartender_01`,
        `s_f_y_baywatch_01`,
        `s_f_y_cop_01`,
        `s_f_y_factory_01`,
        `s_f_y_hooker_01`,
        `s_f_y_hooker_02`,
        `s_f_y_hooker_03`,
        `s_f_y_migrant_01`,
        `s_f_y_movprem_01`,
        `s_f_y_ranger_01`,
        `s_f_y_scrubs_01`,
        `s_f_y_sheriff_01`,
        `s_f_y_shop_low`,
        `s_f_y_shop_mid`,
        `s_f_y_stripper_01`,
        `s_f_y_stripper_02`,
        `s_f_y_stripperlite`,
        `s_f_y_sweatshop_01`,
        `u_f_m_corpse_01`,
        `u_f_m_miranda`,
        `u_f_m_promourn_01`,
        `u_f_o_moviestar`,
        `u_f_o_prolhost_01`,
        `u_f_y_bikerchic`,
        `u_f_y_comjane`,
        `u_f_y_corpse_01`,
        `u_f_y_corpse_02`,
        `u_f_y_hotposh_01`,
        `u_f_y_jewelass_01`,
        `u_f_y_mistress`,
        `u_f_y_poppymich`,
        `u_f_y_princess`,
        `u_f_y_spyactress`
    }
    
    -- Vérifier si le modèle est dans la liste des modèles féminins
    for _, hash in ipairs(femaleHashes) do
        if model == hash then
            return true
        end
    end
    
    return false
end

-- Ajouter cette nouvelle fonction pour le blip de police
RegisterNetEvent('rob_npc:createPoliceBlip')
AddEventHandler('rob_npc:createPoliceBlip', function(coords)
    local alpha = 250
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)

    SetBlipSprite(blip, 161) -- Sprite du blip
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 1) -- Rouge
    SetBlipAsShortRange(blip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Vol à l'arraché")
    EndTextCommandSetBlipName(blip)

    -- Faire disparaître le blip progressivement
    while alpha ~= 0 do
        Citizen.Wait(100)
        alpha = alpha - 1
        SetBlipAlpha(blip, alpha)
        if alpha == 0 then
            RemoveBlip(blip)
            return
        end
    end
end)

-- Fonction pour obtenir le PNJ le plus proche
local function GetClosestNPC(playerPed, radius)
    local playerCoords = GetEntityCoords(playerPed)
    local handle, ped = FindFirstPed()
    local success
    local closestPed = nil
    local closestDistance = radius
    
    repeat
        if not IsPedAPlayer(ped) and not IsPedDeadOrDying(ped) then
            local pos = GetEntityCoords(ped)
            local distance = #(playerCoords - pos)
            
            if distance < closestDistance then
                closestPed = ped
                closestDistance = distance
            end
        end
        
        success, ped = FindNextPed(handle)
    until not success
    
    EndFindPed(handle)
    return closestPed
end

-- Modifier la fonction PlaySlapAnimation
local function PlaySlapAnimation(ped, player)
    -- Animation de la claque
    RequestAnimDict("melee@unarmed@streamed_variations")
    while not HasAnimDictLoaded("melee@unarmed@streamed_variations") do
        Citizen.Wait(100)
    end
    
    -- Le PNJ donne une claque
    TaskPlayAnim(ped, "melee@unarmed@streamed_variations", "plyr_takedown_front_slap", 8.0, -8.0, 2000, 0, 0, false, false, false)
    
    -- Le joueur réagit à la claque et tombe
    TaskPlayAnim(player, "melee@unarmed@streamed_variations", "victim_takedown_front_slap", 8.0, -8.0, 2000, 1, 0, false, false, false)
    
    -- Appliquer un effet de caméra secoué plus long
    ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.7)
    
    -- Désactiver temporairement les contrôles du joueur
    DisableControlAction(0, 24, true) -- Désactive l'attaque
    DisableControlAction(0, 257, true) -- Désactive l'attaque
    DisableControlAction(0, 31, true) -- Désactive l'avancement
    DisableControlAction(0, 30, true) -- Désactive le mouvement latéral
    
    -- Animation de "sonné"
    Citizen.Wait(2000)
    RequestAnimDict("missarmenian2")
    while not HasAnimDictLoaded("missarmenian2") do
        Citizen.Wait(100)
    end
    
    -- Jouer l'animation "sonné au sol"
    TaskPlayAnim(player, "missarmenian2", "corpse_search_exit_ped", 8.0, -8.0, 5000, 1, 0, false, false, false)
    
    -- Attendre la fin de l'animation complète
    Citizen.Wait(5000)
    
    -- Réactiver les contrôles
    EnableAllControlActions(0)
    
    -- Nettoyer les animations
    ClearPedTasks(ped)
    ClearPedTasks(player)
end

-- Fonction pour vérifier si un PNJ a déjà été ciblé
local function hasBeenTargeted(ped)
    return targetedPeds[ped] ~= nil
end

-- Fonction pour marquer un PNJ comme ciblé
local function markPedAsTargeted(ped)
    targetedPeds[ped] = true
    -- Nettoyer la liste après 30 minutes pour éviter qu'elle devienne trop grande
    Citizen.SetTimeout(1800000, function()
        targetedPeds[ped] = nil
    end)
end

-- Modifier la fonction CreateAndAttachBag
local function CreateAndAttachBag(ped)
    local coords = GetEntityCoords(ped)
    RequestModel(`prop_ld_case_01`)  -- Utilisons un modèle de sac différent
    while not HasModelLoaded(`prop_ld_case_01`) do
        Citizen.Wait(10)
    end
    
    bagObject = CreateObject(`prop_ld_case_01`, coords.x, coords.y, coords.z + 0.2, true, true, true)
    AttachEntityToEntity(bagObject, ped, GetPedBoneIndex(ped, 57005), 0.15, 0.0, -0.1, 0.0, 270.0, 180.0, true, true, false, true, 1, true)
    SetModelAsNoLongerNeeded(`prop_ld_case_01`)
end

-- Fonction pour afficher le texte à l'écran
local function DrawTextOnScreen(text)
    SetTextFont(4)
    SetTextScale(0.45, 0.45)
    SetTextColour(185, 185, 185, 255)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    DrawText(0.5, 0.9)
end

-- Modifier la fonction PlayBagStruggleAnimation
local function PlayBagStruggleAnimation(player, victim)
    isStruggling = true
    
    -- Charger les animations
    RequestAnimDict('missfbi3_toothpull')
    while not HasAnimDictLoaded('missfbi3_toothpull') do
        Citizen.Wait(100)
    end

    -- Faire face l'un à l'autre et positionner correctement
    local heading = GetEntityHeading(victim)
    local coords = GetOffsetFromEntityInWorldCoords(victim, 1.0, 1.0, 0.0)
    SetEntityHeading(player, heading - 170)
    SetEntityCoordsNoOffset(player, coords.x, coords.y, coords.z, 0)
    
    -- S'assurer que le PNJ ne bouge pas pendant l'animation
    SetEntityAsMissionEntity(victim)
    
    -- Créer et attacher le sac (nouveau modèle de sac)
    local obj = CreateObject(GetHashKey('prop_ld_handbag'), 0, 0, 0, true)
    AttachEntityToEntity(obj, player, GetPedBoneIndex(player, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
    
    -- Démarrer les animations
    TaskPlayAnim(player, 'missfbi3_toothpull', "pull_tooth_loop_player", 8.0, 1.0, 4000, 49, 0, false, false, false)
    TaskPlayAnim(victim, 'missfbi3_toothpull', "pull_tooth_loop_player", 8.0, 1.0, 4000, 49, 0, false, false, false)
    
    -- Notifier la police immédiatement lors de la tentative
    NotifyPolice(GetEntityCoords(player))
    
    -- Attendre un temps aléatoire pour la lutte
    local randomTime = math.random(2000, 4000)
    Citizen.Wait(randomTime)
    
    -- 15% de chance de réussir le vol (85% d'échec)
    if math.random(100) > 85 then
        -- Vol réussi
        ClearPedTasks(player)
        ClearPedTasks(victim)
        DeleteObject(obj)
        
        -- Créer le sac volé attaché au joueur (même modèle de sac)
        bagObj = CreateObject(GetHashKey('prop_ld_handbag'), 0, 0, 0, true)
        AttachEntityToEntity(bagObj, player, GetPedBoneIndex(player, 28422), -0.02, 0.00, -0.43, 0.00, 2.4, -58.05, 1, 1, 0, 1, 0, 1)
        
        -- Faire fuir le PNJ immédiatement
        ClearPedTasks(victim)
        PlayAmbientSpeech1(victim, 'FALL_BACK', 'SPEECH_PARAMS_FORCE_SHOUTED_CRITICAL')
        TaskReactAndFleePed(victim, player)
        
        -- Notification
        QBCore.Functions.Notify('Vous avez réussi à voler le sac!', 'success')
        
        -- Activer le mode "transport de sac"
        carryingBag = true
        
        -- Démarrer le thread pour gérer le sac volé
        Citizen.CreateThread(function()
            while carryingBag do
                Citizen.Wait(0)
                -- Afficher les instructions
                DrawTextOnScreen("Appuyez sur ~y~[E]~w~ pour fouiller le sac ou ~r~[X]~w~ pour le jeter")
                
                -- Touche E pour fouiller le sac
                if IsControlJustPressed(0, 38) then -- E
                    -- Animation de fouille du sac
                    RequestAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
                    while not HasAnimDictLoaded("anim@amb@clubhouse@tutorial@bkr_tut_ig3@") do
                        Citizen.Wait(10)
                    end

                    -- Jouer l'animation de fouille
                    TaskPlayAnim(player, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, -8.0, 3000, 1, 0, false, false, false)
                    
                    -- Timer pour l'animation
                    Citizen.Wait(3000)
                    
                    -- Supprimer le sac visuel
                    DeleteEntity(bagObj)
                    carryingBag = false

                    -- Donner des items aléatoires
                    local totalItems = math.random(2, 4)
                    local itemsFound = {}
                    
                    for i = 1, totalItems do
                        local item = Config.Items[math.random(#Config.Items)]
                        if math.random(100) <= item.chance then
                            local amount = math.random(item.min, item.max)
                            table.insert(itemsFound, {name = item.name, amount = amount, label = item.label})
                            TriggerServerEvent('rob_npc:giveItem', item.name, amount)
                        end
                    end

                    -- Notification des items trouvés
                    Citizen.Wait(500)
                    for _, item in ipairs(itemsFound) do
                        QBCore.Functions.Notify('Trouvé: ' .. item.amount .. 'x ' .. item.label, 'success')
                    end
                    
                    if #itemsFound == 0 then
                        QBCore.Functions.Notify('Le sac était vide!', 'error')
                    end

                    ClearPedTasks(player)
                end
                
                -- Touche X pour jeter le sac
                if IsControlJustPressed(0, 73) then -- X
                    -- Détacher et jeter le sac
                    DetachEntity(bagObj, true, true)
                    local coords = GetEntityCoords(player)
                    local forward = GetEntityForwardVector(player)
                    SetEntityCoords(bagObj, coords.x + forward.x * 1.0, coords.y + forward.y * 1.0, coords.z - 0.5, true, true, true, false)
                    SetEntityVelocity(bagObj, forward.x * 3.0, forward.y * 3.0, forward.z * 0.2)
                    
                    carryingBag = false
                    Citizen.Wait(30000)
                    DeleteEntity(bagObj)
                end
            end
        end)
    else
        -- 85% de chance d'échec - Animation de la claque
        DeleteObject(obj)
        ClearPedTasks(victim)
        ClearPedTasks(player)

        -- Charger l'animation de la claque
        RequestAnimDict("melee@unarmed@streamed_variations")
        while not HasAnimDictLoaded("melee@unarmed@streamed_variations") do
            Citizen.Wait(100)
        end

        -- Faire face l'un à l'autre pour la claque
        TaskTurnPedToFaceEntity(victim, player, 1000)
        TaskTurnPedToFaceEntity(player, victim, 1000)
        Citizen.Wait(1000)

        -- Le PNJ donne une claque
        TaskPlayAnim(victim, "melee@unarmed@streamed_variations", "plyr_takedown_front_slap", 8.0, -8.0, 1500, 0, 0, false, false, false)
        Citizen.Wait(300) -- Petit délai pour synchroniser l'animation

        -- Le joueur reçoit la claque et tombe
        TaskPlayAnim(player, "melee@unarmed@streamed_variations", "victim_takedown_front_slap", 8.0, -8.0, 1500, 0, 0, false, false, false)
        Citizen.Wait(400)
        
        -- Effet de ragdoll après la claque
        SetPedToRagdoll(player, 5000, 5000, 0, 0, 0, 0)
        
        -- Effets supplémentaires
        ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.7)
        PlayPedAmbientSpeechNative(victim, "GENERIC_INSULT_HIGH", "SPEECH_PARAMS_FORCE_NORMAL_CLEAR")
        
        -- Notification
        QBCore.Functions.Notify('Elle vous a giflé! Vol échoué!', 'error')
        
        -- Faire fuir le PNJ en riant
        Citizen.Wait(1500)
        TaskSmartFleePed(victim, player, 100.0, -1)
    end
    
    -- Nettoyer les animations
    Citizen.Wait(3000)
    ClearPedTasks(player)
    ClearPedTasks(victim)
    SetPedAsNoLongerNeeded(victim)
    isStruggling = false
end

-- Modifier la fonction RobNPC
function RobNPC()
    local player = PlayerPedId()
    local closestPed = GetClosestNPC(player, Config.Distance)
    
    if closestPed then
        -- Vérifier si le PNJ a déjà été ciblé
        if hasBeenTargeted(closestPed) then
            QBCore.Functions.Notify('Vous avez déjà essayé de voler cette personne!', 'error')
            return
        end

        if IsPedFemale(closestPed) then
            if not IsEntityDead(closestPed) then
                -- Marquer le PNJ comme ciblé immédiatement
                markPedAsTargeted(closestPed)
                
                -- Lancer directement l'animation de vol
                PlayBagStruggleAnimation(player, closestPed)
            end
        end
    end
end

-- Thread pour vérifier la touche E
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 38) then -- 38 est le code pour la touche E
            RobNPC()
        end
    end
end)

-- Ajouter un événement pour nettoyer la liste quand le joueur se déconnecte
AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    targetedPeds = {}
end)

-- Ajouter cette fonction pour gérer le sac
local function HandleStolenBag()
    Citizen.CreateThread(function()
        while carryingBag do
            Citizen.Wait(0)
            -- Afficher les instructions
            DrawTextOnScreen("Appuyez sur ~y~[E]~w~ pour fouiller le sac ou ~r~[X]~w~ pour le jeter")
            
            -- Touche E pour fouiller le sac
            if IsControlJustPressed(0, 38) then -- E
                -- Animation de fouille du sac
                RequestAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
                while not HasAnimDictLoaded("anim@amb@clubhouse@tutorial@bkr_tut_ig3@") do
                    Citizen.Wait(10)
                end

                -- Jouer l'animation de fouille
                local playerPed = PlayerPedId()
                TaskPlayAnim(playerPed, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, -8.0, -1, 1, 0, false, false, false)
                
                -- Timer pour l'animation
                Citizen.Wait(3000)
                
                -- Supprimer le sac visuel
                DeleteEntity(bagObj)
                carryingBag = false

                -- Donner des items aléatoires directement (sans passer par l'item "stolen_bag")
                local totalItems = math.random(2, 4) -- Entre 2 et 4 types d'items différents
                local itemsFound = {}
                
                for i = 1, totalItems do
                    local item = Config.Items[math.random(#Config.Items)]
                    if math.random(100) <= item.chance then
                        local amount = math.random(item.min, item.max)
                        table.insert(itemsFound, {name = item.name, amount = amount, label = item.label})
                        TriggerServerEvent('rob_npc:giveItem', item.name, amount)
                    end
                end

                -- Notification des items trouvés
                Citizen.Wait(500) -- Petit délai pour les notifications
                for _, item in ipairs(itemsFound) do
                    QBCore.Functions.Notify('Trouvé: ' .. item.amount .. 'x ' .. item.label, 'success')
                end
                
                if #itemsFound == 0 then
                    QBCore.Functions.Notify('Le sac était vide!', 'error')
                end

                ClearPedTasks(playerPed)
            end
            
            -- Touche X pour jeter le sac
            if IsControlJustPressed(0, 73) then -- X
                -- Détacher et jeter le sac immédiatement
                DetachEntity(bagObj, true, true)
                local coords = GetEntityCoords(PlayerPedId())
                local forward = GetEntityForwardVector(PlayerPedId())
                SetEntityCoords(bagObj, coords.x + forward.x * 1.0, coords.y + forward.y * 1.0, coords.z - 0.5, true, true, true, false)
                SetEntityVelocity(bagObj, forward.x * 3.0, forward.y * 3.0, forward.z * 0.2)
                
                carryingBag = false
                Citizen.Wait(30000) -- Le sac disparaît après 30 secondes
                DeleteEntity(bagObj)
            end
        end
    end)
end 