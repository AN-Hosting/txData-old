local QBCore = exports['qb-core']:GetCoreObject()
local activeRobberies = {}
local playerCooldown = false
local moneyPiles = {}
local brokenATMs = {} -- Pour suivre les ATMs cassés

-- Fonction pour vérifier si l'objet est un ATM
local function IsATM(entity)
    if entity and DoesEntityExist(entity) then
        local model = GetEntityModel(entity)
        for _, atm in pairs(Config.ATM) do
            if model == atm.model then
                return true
            end
        end
    end
    return false
end

-- Fonction pour vérifier le nombre de policiers
local function CheckPoliceCount(cb)
    QBCore.Functions.TriggerCallback('ph-atmrobbery:server:getPoliceCount', function(policeCount)
        cb(policeCount >= Config.RequiredPolice)
    end)
end

-- Fonction pour démarrer le braquage d'ATM
local function StartATMRobbery(atmEntity)
    local atmCoords = GetEntityCoords(atmEntity)
    -- Utiliser les coordonnées comme identifiant au lieu du networkID
    local atmId = string.format("%.2f_%.2f_%.2f", atmCoords.x, atmCoords.y, atmCoords.z)
    
    if activeRobberies[atmId] then
        QBCore.Functions.Notify(Config.Locale.atm_already_being_robbed, 'error')
        return
    end
    
    if brokenATMs[atmId] then
        QBCore.Functions.Notify(Config.Locale.atm_already_robbed, 'error')
        return
    end
    
    CheckPoliceCount(function(hasEnoughPolice)
        if not hasEnoughPolice then
            QBCore.Functions.Notify(Config.Locale.police_required, 'error')
            return
        end
        
        -- Vérifie si le joueur a l'item nécessaire
        QBCore.Functions.TriggerCallback('ph-atmrobbery:server:hasItem', function(hasItem)
            if hasItem then
                -- Animation de pose de bombe
                local ped = PlayerPedId()
                local dict = "anim@heists@ornate_bank@thermal_charge"
                
                RequestAnimDict(dict)
                while not HasAnimDictLoaded(dict) do
                    Citizen.Wait(50)
                end
                
                local atmCoords = GetEntityCoords(atmEntity)
                
                -- Faire face à l'ATM
                TaskTurnPedToFaceEntity(ped, atmEntity, 2000)
                Citizen.Wait(2000)
                
                -- Joue l'animation de pose de bombe
                TaskPlayAnim(ped, dict, "thermal_charge", 8.0, 1.0, -1, 2, 0, 0, 0, 0)
                
                QBCore.Functions.Progressbar("bomb_atm", "Pose de la bombe en cours...", 5000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    ClearPedTasks(ped)
                    
                    -- Initialise le braquage pour cet ATM
                    activeRobberies[atmId] = {
                        coords = atmCoords,
                        explosionsLeft = Config.ExplosionsNeeded,
                        money = {},
                        entity = atmEntity
                    }
                    
                    -- Retire l'item bombe
                    TriggerServerEvent('ph-atmrobbery:server:removeItem', Config.BombItem)
                    
                    -- Place la bombe
                    local bombObject = CreateObject(GetHashKey(Config.Props.bomb), 
                        atmCoords.x, atmCoords.y, atmCoords.z, 
                        true, true, true)
                    
                    -- Attache la bombe à l'ATM (position plus haute)
                    AttachEntityToEntity(bombObject, atmEntity, 0, 0.0, -0.11, 1.2, 0.0, 0.0, 0.0, true, true, true, false, 2, true)
                    
                    -- Notification
                    QBCore.Functions.Notify(Config.Locale.bomb_planted, 'success')
                    
                    -- Compte à rebours pour la première explosion avec bips
                    local countdown = Config.ExplosionDelay
                    Citizen.CreateThread(function()
                        while countdown > 0 do
                            -- Son de bip au lieu d'une notification
                            if countdown <= 5 then
                                -- Bips plus rapides pour les 5 dernières secondes
                                TriggerServerEvent('ph-atmrobbery:server:playSoundSync', atmCoords, 'Beep_Red', 'DLC_HEIST_HACKING_SNAKE_SOUNDS', 1.0)
                            else
                                -- Bips normaux
                                TriggerServerEvent('ph-atmrobbery:server:playSoundSync', atmCoords, 'Beep_Green', 'DLC_HEIST_HACKING_SNAKE_SOUNDS', 1.0)
                            end
                            
                            Wait(1000)
                            countdown = countdown - 1
                        end
                        
                        -- Plus de son spécial avant l'explosion, on laisse la fonction ExplodeATM s'en occuper
                        ExplodeATM(atmId, bombObject)
                    end)
                end)
            else
                QBCore.Functions.Notify(Config.Locale.need_item, 'error')
            end
        end, Config.BombItem)
    end)
end

-- Fonction pour gérer les ATMs cassés
function SetATMBroken(atmId)
    brokenATMs[atmId] = true
    
    -- Si on a l'entité de l'ATM, on place un prop cassé par-dessus
    if activeRobberies[atmId] and activeRobberies[atmId].entity then
        local entity = activeRobberies[atmId].entity
        local coords = GetEntityCoords(entity)
        local heading = GetEntityHeading(entity)
        
        -- Crée un modèle d'ATM cassé
        local brokenATM = CreateObject(GetHashKey(Config.Props.broken_atm), 
            coords.x, coords.y, coords.z, 
            true, false, false)
        
        SetEntityHeading(brokenATM, heading)
        FreezeEntityPosition(brokenATM, true)
        
        -- Met à jour l'entité dans les données de braquage
        if activeRobberies[atmId] then
            activeRobberies[atmId].brokenEntity = brokenATM
        end
    end
end

function ResetATM(atmId)
    brokenATMs[atmId] = nil
    
    -- Supprime l'ATM cassé s'il existe encore
    if activeRobberies[atmId] and activeRobberies[atmId].brokenEntity then
        local entity = activeRobberies[atmId].brokenEntity
        if DoesEntityExist(entity) then
            SetEntityAsMissionEntity(entity, true, true)
            DeleteEntity(entity)
        end
        activeRobberies[atmId] = nil
    end
end

-- Fonction pour faire exploser l'ATM
function ExplodeATM(atmId, bombObject)
    if not activeRobberies[atmId] then return end
    
    local atmData = activeRobberies[atmId]
    local coords = atmData.coords
    
    -- Supprime la bombe
    if bombObject and DoesEntityExist(bombObject) then
        DeleteObject(bombObject)
    end
    
    -- Son d'explosion
    TriggerServerEvent('ph-atmrobbery:server:playSoundSync', coords, 'Bomb_Disarmed', 'GTAO_Speed_Convoy_Soundset', 1.0)
    
    -- Effets d'explosion sans alerte - les paramètres sont modifiés pour éviter la détection automatique
    -- param1: x, param2: y, param3: z, param4: type d'explosion, param5: amplitude
    -- param6: audible (true/false), param7: invisible (true/false), param8: caméra secouée
    AddExplosion(coords.x, coords.y, coords.z, 'EXPLOSION_STICKYBOMB', 0.5, false, true, 0.0)
    
    -- Ajoute un effet visuel sans détection automatique
    AddExplodeAtmPtfxEffect(atmData.entity, coords)
    
    -- Alerte la police uniquement à la première explosion et uniquement via notre appel dispatch
    if atmData.explosionsLeft == Config.ExplosionsNeeded then
        -- Utiliser l'export ps-dispatch
        exports['ps-dispatch']:ATMRobbery()
    end
    
    -- Réduit le nombre d'explosions restantes
    atmData.explosionsLeft = atmData.explosionsLeft - 1
    
    -- Notification
    if atmData.explosionsLeft > 0 then
        QBCore.Functions.Notify(string.format(Config.Locale.atm_exploded, atmData.explosionsLeft), 'inform')
        
        -- Place une autre bombe pour la prochaine explosion
        local newBomb = CreateObject(GetHashKey(Config.Props.bomb), 
            coords.x, coords.y, coords.z + 0.2, 
            true, true, true)
        
        -- Attache la bombe à l'ATM (position plus haute)
        AttachEntityToEntity(newBomb, atmData.entity, 0, 0.0, -0.11, 1.2, 0.0, 0.0, 0.0, true, true, true, false, 2, true)
        
        -- Compte à rebours pour la prochaine explosion avec bips
        local countdown = Config.ExplosionDelay
        Citizen.CreateThread(function()
            while countdown > 0 do
                -- Son de bip au lieu d'une notification
                if countdown <= 5 then
                    -- Bips plus rapides pour les 5 dernières secondes
                    TriggerServerEvent('ph-atmrobbery:server:playSoundSync', coords, 'Beep_Red', 'DLC_HEIST_HACKING_SNAKE_SOUNDS', 1.0)
                else
                    -- Bips normaux
                    TriggerServerEvent('ph-atmrobbery:server:playSoundSync', coords, 'Beep_Green', 'DLC_HEIST_HACKING_SNAKE_SOUNDS', 1.0)
                end
                
                Wait(1000)
                countdown = countdown - 1
            end
            
            -- Plus de son spécial avant l'explosion, on laisse la fonction ExplodeATM s'en occuper
            ExplodeATM(atmId, newBomb)
        end)
    else
        -- ATM complètement ouvert
        QBCore.Functions.Notify(Config.Locale.atm_opened, 'success')
        
        -- Génère les piles d'argent
        SpawnMoneyPiles(atmId)
        
        -- Enregistre le braquage
        TriggerServerEvent('ph-atmrobbery:server:registerRobbery', atmId)
    end
end

-- Fonction pour ajouter des effets visuels d'explosion sans déclencher d'alertes
function AddExplodeAtmPtfxEffect(entity, coords)
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(1)
    end
    
    UseParticleFxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", 
        coords.x, coords.y, coords.z, 
        0.0, 0.0, 0.0, 
        1.0, false, false, false, false)
        
    Citizen.SetTimeout(4000, function()
        StopParticleFxLooped(effect, 0)
    end)
end

-- Fonction pour générer les piles d'argent
function SpawnMoneyPiles(atmId)
    if not activeRobberies[atmId] then return end
    
    local atmData = activeRobberies[atmId]
    local coords = atmData.coords
    
    -- Génère un nombre aléatoire de piles d'argent
    local moneyCount = math.random(Config.MoneyStacksAmount.min, Config.MoneyStacksAmount.max)
    
    for i = 1, moneyCount do
        -- Position aléatoire autour de l'ATM
        local offset = vector3(
            math.random(-15, 15) / 10,
            math.random(-15, 15) / 10,
            0.0
        )
        
        local moneyCoords = vector3(
            coords.x + offset.x,
            coords.y + offset.y,
            coords.z - 0.3  -- Positionner le sac d'argent au sol
        )
        
        -- Crée le sac d'argent et envoie les infos au serveur pour synchronisation
        TriggerServerEvent('ph-atmrobbery:server:createMoneyBag', moneyCoords, math.random(Config.MoneyPerStack.min, Config.MoneyPerStack.max), atmId)
    end
end

-- Événement pour recevoir les sacs d'argent depuis le serveur
RegisterNetEvent('ph-atmrobbery:client:syncMoneyBag')
AddEventHandler('ph-atmrobbery:client:syncMoneyBag', function(bagId, coords, amount, atmId)
    if moneyPiles[bagId] then return end -- Évite les doublons
    
    -- Crée le sac d'argent
    local moneyObject = CreateObject(GetHashKey(Config.Props.money), 
        coords.x, coords.y, coords.z, 
        true, true, true)
    
    -- Garde une trace du sac
    moneyPiles[bagId] = {
        object = moneyObject,
        coords = coords,
        amount = amount,
        atmId = atmId
    }
    
    -- Ajoute le target pour le ramassage
    exports['qb-target']:AddTargetEntity(moneyObject, {
        options = {
            {
                type = "client",
                event = "ph-atmrobbery:client:pickupMoneyBag",
                icon = "fas fa-money-bill",
                label = "Ramasser l'argent",
                bagId = bagId
            }
        },
        distance = 2.0
    })
end)

-- Événement pour jouer un son synchronisé reçu du serveur
RegisterNetEvent('ph-atmrobbery:client:playSoundSync')
AddEventHandler('ph-atmrobbery:client:playSoundSync', function(coords, name, set, volume)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local distance = #(playerCoords - coords)
    
    -- Joue le son seulement si le joueur est assez proche
    if distance < 30.0 then
        local vol = 1.0 - (distance / 30.0)
        PlaySoundFrontend(-1, name, set, vol * volume)
    end
end)

-- Événement pour ramasser un sac d'argent
RegisterNetEvent('ph-atmrobbery:client:pickupMoneyBag')
AddEventHandler('ph-atmrobbery:client:pickupMoneyBag', function(data)
    local bagId = data.bagId
    if not moneyPiles[bagId] then return end
    
    local moneyObject = moneyPiles[bagId].object
    local amount = moneyPiles[bagId].amount
    
    -- Animation de ramassage améliorée
    local ped = PlayerPedId()
    local dict = "pickup_object"
    local anim = "pickup_low"
    
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(10)
    end
    
    -- Faire face à l'objet
    local objCoords = GetEntityCoords(moneyObject)
    TaskTurnPedToFaceCoord(ped, objCoords.x, objCoords.y, objCoords.z, 500)
    Citizen.Wait(500)
    
    QBCore.Functions.Notify(Config.Locale.collecting_money, 'inform')
    
    TaskPlayAnim(ped, dict, anim, 8.0, -8.0, 1000, 0, 0, false, false, false)
    
    QBCore.Functions.Progressbar("picking_money", Config.Locale.collecting_money, 500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        ClearPedTasks(ped)
        
        -- Notifie le serveur que le sac a été ramassé
        TriggerServerEvent('ph-atmrobbery:server:pickupMoneyBag', bagId, amount)
        
        -- Supprime l'objet localement
        if DoesEntityExist(moneyObject) then
            exports['qb-target']:RemoveTargetEntity(moneyObject)
            DeleteObject(moneyObject)
        end
        
        -- Supprime de la liste locale
        moneyPiles[bagId] = nil
    end)
end)

-- Configuration du target
Citizen.CreateThread(function()
    -- Target pour les ATM
    exports['qb-target']:AddTargetModel(GetATMModels(), {
        options = {
            {
                type = "client",
                event = "ph-atmrobbery:client:robATM",
                icon = "fas fa-bomb",
                item = 'atm_bomb',
                label = "Braquer l'ATM",
                canInteract = function(entity)
                    local coords = GetEntityCoords(entity)
                    local atmId = string.format("%.2f_%.2f_%.2f", coords.x, coords.y, coords.z)
                    return IsATM(entity) and not brokenATMs[atmId]
                end
            }
        },
        distance = 2.0
    })
end)

-- Fonction pour obtenir les modèles d'ATM
function GetATMModels()
    local models = {}
    for _, atm in pairs(Config.ATM) do
        table.insert(models, atm.model)
    end
    return models
end

-- Helpers
function table.contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

-- Événements
RegisterNetEvent('ph-atmrobbery:client:robATM')
AddEventHandler('ph-atmrobbery:client:robATM', function(data)
    local entity = data.entity
    if IsATM(entity) then
        StartATMRobbery(entity)
    end
end)

-- Événement pour nettoyer les piles d'argent d'un ATM
RegisterNetEvent('ph-atmrobbery:client:cleanupATM')
AddEventHandler('ph-atmrobbery:client:cleanupATM', function(atmId)
    if activeRobberies[atmId] then
        for _, moneyData in pairs(activeRobberies[atmId].money) do
            if DoesEntityExist(moneyData.object) then
                DeleteObject(moneyData.object)
            end
        end
        
        activeRobberies[atmId] = nil
    end
end)

-- Événement pour supprimer un sac d'argent
RegisterNetEvent('ph-atmrobbery:client:removeMoneyBag')
AddEventHandler('ph-atmrobbery:client:removeMoneyBag', function(bagId)
    if moneyPiles[bagId] and moneyPiles[bagId].object then
        if DoesEntityExist(moneyPiles[bagId].object) then
            exports['qb-target']:RemoveTargetEntity(moneyPiles[bagId].object)
            DeleteObject(moneyPiles[bagId].object)
        end
        
        moneyPiles[bagId] = nil
    end
end)

-- Animations
Citizen.CreateThread(function()
    RequestAnimDict("mp_take_money_mg")
    while not HasAnimDictLoaded("mp_take_money_mg") do
        Citizen.Wait(0)
    end
    
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") do
        Citizen.Wait(0)
    end
    
    RequestAnimDict("pickup_object")
    while not HasAnimDictLoaded("pickup_object") do
        Citizen.Wait(0)
    end
    
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(0)
    end
end)

-- Préchargement des modèles
Citizen.CreateThread(function()
    -- Charge les modèles des objets
    local bombHash = GetHashKey(Config.Props.bomb)
    local moneyHash = GetHashKey(Config.Props.money)
    
    RequestModel(bombHash)
    RequestModel(moneyHash)
    
    while not HasModelLoaded(bombHash) or not HasModelLoaded(moneyHash) do
        Citizen.Wait(1)
    end
    
    print("[PH-ATM Robbery] Modèles chargés avec succès!")
end)

-- Événements pour la synchronisation des ATMs cassés
RegisterNetEvent('ph-atmrobbery:client:setATMBroken')
AddEventHandler('ph-atmrobbery:client:setATMBroken', function(atmId)
    SetATMBroken(atmId)
end)

RegisterNetEvent('ph-atmrobbery:client:resetATM')
AddEventHandler('ph-atmrobbery:client:resetATM', function(atmId)
    ResetATM(atmId)
end)
