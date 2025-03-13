local QBCore = exports['qb-core']:GetCoreObject()
local targetPed = nil
local carryingPed = false
local operationInProgress = false
local dealerPed = nil
local organBuyerPed = nil

-- Configuration des items nécessaires
local requiredItems = {
    chloroform = 'chloroform',
    cloth = 'cloth',
    scalpel = 'scalpel'
}

-- Ajouter au début du fichier, après les variables
AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    
    if targetPed then
        if carryingPed then
            DetachEntity(targetPed, true, true)
            carryingPed = false
        end
        DeleteEntity(targetPed)
        targetPed = nil
    end
    
    if dealerPed then
        DeletePed(dealerPed)
    end

    if organBuyerPed then
        DeletePed(organBuyerPed)
    end
end)

-- Ajouter aussi pour le démarrage du script
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    
    if targetPed then
        DeleteEntity(targetPed)
        targetPed = nil
        carryingPed = false
    end
    
    if dealerPed then
        DeletePed(dealerPed)
    end

    if organBuyerPed then
        DeletePed(organBuyerPed)
    end

    -- Recréer les PNJs au démarrage
    Wait(1000) -- Attendre un peu que tout soit chargé
    CreateDealer()
    CreateOrganBuyer()
end)

-- Fonction pour endormir un PNJ
local function sleepPed(ped)
    if not IsPedDeadOrDying(ped) then
        local playerPed = PlayerPedId()
        
        -- Animation du joueur qui utilise le chloroforme
        RequestAnimDict("mp_arresting")
        while not HasAnimDictLoaded("mp_arresting") do
            Wait(100)
        end
        
        -- Faire face au PNJ
        TaskTurnPedToFaceEntity(playerPed, ped, 1000)
        Wait(1000)
        
        -- Animation d'utilisation du chloroforme
        TaskPlayAnim(playerPed, "mp_arresting", "a_uncuff", 8.0, -8.0, 3000, 0, 0, false, false, false)
        
        -- Animation du PNJ qui tombe
        RequestAnimDict("dead")
        while not HasAnimDictLoaded("dead") do
            Wait(100)
        end
        TaskPlayAnim(ped, "dead", "dead_a", 8.0, -8.0, -1, 1, 0, false, false, false)
        
        Wait(3000)
        
        -- Le PNJ tombe
        SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
        SetEntityHealth(ped, 0)
        targetPed = ped
    end
end

-- Fonction pour porter le PNJ
local function carryPed()
    if targetPed and not carryingPed then
        -- Supprimer le PNJ et déclencher l'event serveur pour donner l'item
        DeleteEntity(targetPed)
        TriggerServerEvent('qb-organe:server:giveDeadBody')
        targetPed = nil
        carryingPed = false
    end
end

-- Fonction pour l'opération
local function harvestOrgans(operationTable)
    if not operationInProgress then
        operationInProgress = true
        
        -- Animation de l'opération
        TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
        
        QBCore.Functions.Progressbar("harvest_organs", "Récupération des organes...", 10000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            -- Liste des organes possibles
            local organs = {
                {name = "kidney", label = "Rein", chance = 70},
                {name = "liver", label = "Foie", chance = 30},
                {name = "heart", label = "Coeur", chance = 15},
                {name = "lung", label = "Poumon", chance = 60},
                {name = "blood", label = "Sang", chance = 90},
                {name = "skin", label = "Peau", chance = 85},
                {name = "spleen", label = "Rate", chance = 65},
                {name = "eye", label = "Œil", chance = 45},
                {name = "stomach", label = "Estomac", chance = 55},
                {name = "tongue", label = "Langue", chance = 75},
                {name = "tooth", label = "Dent", chance = 95},
                {name = "brain", label = "Cerveau", chance = 20},
                {name = "pancreas", label = "Pancréas", chance = 60},
                {name = "ear", label = "Oreille", chance = 80}
            }
            
            -- Attribution aléatoire des organes
            for _, organ in pairs(organs) do
                if math.random(100) <= organ.chance then
                    QBCore.Functions.AddItem(organ.name, 1)
                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[organ.name], "add")
                end
            end
            
            operationInProgress = false
            DeleteEntity(targetPed)
            targetPed = nil
            carryingPed = false
            
            ClearPedTasks(PlayerPedId())
        end)
    end
end

-- Au début du fichier, après les variables existantes
local function HasRequiredItems()
    local hasChloroform = QBCore.Functions.HasItem('chloroform')
    local hasCloth = QBCore.Functions.HasItem('cloth')
    return hasChloroform and hasCloth
end

-- Ajouter cette fonction pour vérifier si c'est un PNJ valide
local function IsValidPed(ped)
    return not IsPedAPlayer(ped) and not IsPedDeadOrDying(ped) and not IsPedInAnyVehicle(ped, false)
end

-- Modifier la fonction GetCopCount
local function GetCopCount()
    local cops = 0
    local players = QBCore.Functions.GetQBPlayers()
    for _, v in pairs(players) do
        if (v.PlayerData.job.name == "police_nationale" or v.PlayerData.job.name == "gendarmerie") and v.PlayerData.job.onduty then
            cops = cops + 1
        end
    end
    return cops
end

-- Modifier l'event pour utiliser le chloroforme
RegisterNetEvent('qb-organe:client:useChloroform', function()
    QBCore.Functions.TriggerCallback('qb-organe:server:getCopCount', function(copCount)
        if copCount < 1 then
            QBCore.Functions.Notify('Il n\'y a pas assez de forces de l\'ordre en ville pour faire ça...', 'error', 10000)
            return
        end
        
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        
        -- Chercher le PNJ le plus proche
        local closestPed = nil
        local closestDistance = 2.0
        
        local peds = GetGamePool('CPed')
        for _, ped in ipairs(peds) do
            if IsValidPed(ped) then
                local pedCoords = GetEntityCoords(ped)
                local distance = #(coords - pedCoords)
                
                if distance < closestDistance then
                    closestPed = ped
                    closestDistance = distance
                end
            end
        end
        
        if closestPed then
            -- Déclencher d'abord l'event pour endormir le PNJ
            TriggerServerEvent('illegal:sleepPed')
            
            -- Envoyer l'alerte aux forces de l'ordre
            local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
            
            -- Utiliser ps-dispatch
            exports['ps-dispatch']:CustomAlert({
                coords = coords,
                message = "Activité suspecte signalée - Possible enlèvement",
                dispatchCode = "10-31",
                description = "Enlèvement signalé à " .. streetName,
                radius = 0,
                sprite = 153,
                color = 1,
                scale = 1.0,
                length = 3,
            })
            
            -- Définir le PNJ ciblé
            targetPed = closestPed
        else
            QBCore.Functions.Notify('Aucun PNJ à proximité', 'error')
        end
    end)
end)

-- Ajouter cette fonction pour porter le PNJ
RegisterNetEvent('qb-organe:client:carryPed', function()
    if targetPed and not carryingPed then
        carryPed()
    end
end)

-- Modifier la partie des zones d'interaction
CreateThread(function()
    -- Zone pour l'opération
    exports['qb-target']:AddBoxZone("operation_table", vector3(107.29, 266.08, 102.23), 1.5, 1.5, {
        name = "operation_table",
        heading = 0,
        debugPoly = false,
    }, {
        options = {
            {
                type = "client",
                event = "qb-organe:client:cutBody",
                icon = "fas fa-cut",
                label = "Opérer",
                item = 'scalpel',
                canInteract = function()
                    return QBCore.Functions.HasItem('dead_body')
                end,
            },
        },
        distance = 2.5
    })
    
    -- Zone pour jeter le corps (gardez les coordonnées 0.0 pour l'instant)
    exports['qb-target']:AddBoxZone("dispose_body", vector3(0.0, 0.0, 0.0), 1.5, 1.5, {
        name = "dispose_body",
        heading = 0,
        debugPoly = false,
    }, {
        options = {
            {
                type = "client",
                event = "illegal:disposeBody",
                icon = "fas fa-dumpster",
                label = "Jeter le corps",
            },
        },
        distance = 2.5
    })
end)

-- Modifier l'event client pour endormir le PNJ
RegisterNetEvent('illegal:sleepPedClient', function()
    if targetPed then
        sleepPed(targetPed)
        -- Ajouter une notification pour confirmer l'action
        QBCore.Functions.Notify('Vous avez endormi le PNJ', 'success')
    end
end)

RegisterNetEvent('illegal:harvestOrgansClient', function()
    if targetPed then
        harvestOrgans()
    end
end)

RegisterNetEvent('illegal:disposeBodyClient', function()
    if targetPed then
        DeleteEntity(targetPed)
        targetPed = nil
        carryingPed = false
    end
end)

-- Modifier la partie AddGlobalPed pour ajouter l'option de porter
CreateThread(function()
    exports['qb-target']:AddGlobalPed({
        options = {
            {
                type = "client",
                event = "qb-organe:client:useChloroform",
                icon = "fas fa-skull",
                label = "Utiliser Chloroforme",
                item = 'chloroform',
                canInteract = function(entity)
                    return IsValidPed(entity) and HasRequiredItems()
                end,
            },
            {
                type = "client",
                event = "qb-organe:client:carryPed",
                icon = "fas fa-people-carry",
                label = "Porter le corps",
                canInteract = function(entity)
                    return entity == targetPed and not carryingPed
                end,
            }
        },
        distance = 2.0
    })
end)

-- Remplacer la partie AddGlobalVehicle par ceci
CreateThread(function()
    exports['qb-target']:AddTargetBone('boot', {
        options = {
            {
                type = "client",
                event = "qb-organe:client:putInTrunk",
                icon = "fas fa-car",
                label = "Mettre dans le coffre",
                canInteract = function(entity)
                    return carryingPed and targetPed
                end,
            }
        },
        distance = 2.5
    })
end)

-- Modifier la fonction PutInTrunk
local function PutInTrunk()
    if not targetPed or not carryingPed then 
        QBCore.Functions.Notify('Vous ne portez pas de corps', 'error')
        return 
    end

    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    local closestVehicle = QBCore.Functions.GetClosestVehicle(coords)
    
    if closestVehicle then
        local trunkcoords = GetEntityBoneIndexByName(closestVehicle, 'boot')
        if trunkcoords ~= -1 then
            -- Ouvrir le coffre
            SetVehicleDoorOpen(closestVehicle, 5, false, false)
            
            -- Détacher le PNJ du joueur
            DetachEntity(targetPed, true, true)
            
            -- Arrêter l'animation du joueur
            ClearPedTasks(player)
            
            -- Supprimer le PNJ et ajouter l'item "corps" dans le coffre
            DeleteEntity(targetPed)
            targetPed = nil
            carryingPed = false
            
            -- Ajouter l'item "corps" dans le coffre du véhicule
            local plate = GetVehicleNumberPlateText(closestVehicle)
            TriggerServerEvent('qb-organe:server:addBodyToTrunk', plate)
            
            -- Fermer le coffre après quelques secondes
            Wait(2000)
            SetVehicleDoorShut(closestVehicle, 5, false)
            QBCore.Functions.Notify('Corps mis dans le coffre', 'success')
        end
    else
        QBCore.Functions.Notify('Aucun véhicule à proximité', 'error')
    end
end

-- Ajouter l'event pour mettre dans le coffre
RegisterNetEvent('qb-organe:client:putInTrunk', function()
    PutInTrunk()
end)

-- Modifier l'animation de découpe
RegisterNetEvent('qb-organe:client:cutBody', function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    
    QBCore.Functions.Progressbar("cutting_body", "Découpe du corps...", 15000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "amb@prop_human_parking_meter@male@idle_a",
        anim = "idle_a",
        flags = 49,
    }, {}, {}, function() -- Done
        TriggerServerEvent('qb-organe:server:giveRandomOrgans')
        ClearPedTasks(playerPed)
        QBCore.Functions.Notify('Vous avez découpé le corps', 'success')
    end, function() -- Cancel
        ClearPedTasks(playerPed)
        QBCore.Functions.Notify('Vous avez arrêté de découper', 'error')
    end)
end)

-- Fonction pour créer le PNJ vendeur
local function CreateDealer()
    -- Charger le modèle
    local model = GetHashKey(Config.Dealer.model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    
    -- Créer le PNJ
    dealerPed = CreatePed(4, model, Config.Dealer.coords.x, Config.Dealer.coords.y, Config.Dealer.coords.z - 1, Config.Dealer.coords.w, false, true)
    SetEntityHeading(dealerPed, Config.Dealer.coords.w)
    FreezeEntityPosition(dealerPed, true)
    SetEntityInvincible(dealerPed, true)
    SetBlockingOfNonTemporaryEvents(dealerPed, true)
    
    -- Ajouter l'option d'interaction
    exports['qb-target']:AddTargetEntity(dealerPed, {
        options = {
            {
                type = "client",
                event = "qb-organe:client:openDealerShop",
                icon = "fas fa-shop",
                label = "Parler au vendeur",
            }
        },
        distance = 2.0
    })
end

-- Modifier l'event pour ouvrir le menu du vendeur
RegisterNetEvent('qb-organe:client:openDealerShop', function()
    local ShopItems = {}
    for k, v in pairs(Config.Dealer.items) do
        ShopItems[#ShopItems+1] = {
            text = v.label .. ' - $' .. v.price, -- Affiche le label et le prix
            value = v.name -- Garde le nom de l'item pour l'achat
        }
    end
    
    local dialog = exports['qb-input']:ShowInput({
        header = "Vendeur d'équipement",
        submitText = "Acheter",
        inputs = {
            {
                text = "Choisir un item",
                name = "item",
                type = "select",
                options = ShopItems,
                isRequired = true
            },
            {
                type = 'number',
                name = 'amount',
                text = 'Quantité',
                isRequired = true,
                default = 1,
            }
        }
    })

    if dialog then
        if not dialog.item or not dialog.amount then return end
        TriggerServerEvent('qb-organe:server:buyItem', dialog.item, dialog.amount)
    end
end)

-- Ajouter après la fonction CreateDealer
local function CreateOrganBuyer()
    -- Charger le modèle
    local model = GetHashKey(Config.OrganBuyer.model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    
    -- Créer le PNJ
    organBuyerPed = CreatePed(4, model, Config.OrganBuyer.coords.x, Config.OrganBuyer.coords.y, Config.OrganBuyer.coords.z - 1, Config.OrganBuyer.coords.w, false, true)
    SetEntityHeading(organBuyerPed, Config.OrganBuyer.coords.w)
    FreezeEntityPosition(organBuyerPed, true)
    SetEntityInvincible(organBuyerPed, true)
    SetBlockingOfNonTemporaryEvents(organBuyerPed, true)
    
    -- Ajouter l'option d'interaction
    exports['qb-target']:AddTargetEntity(organBuyerPed, {
        options = {
            {
                type = "client",
                event = "qb-organe:client:openOrganBuyerMenu",
                icon = "fas fa-briefcase-medical",
                label = "Vendre des organes",
            }
        },
        distance = 2.0
    })
end

-- Modifier l'event pour ouvrir le menu de vente d'organes
RegisterNetEvent('qb-organe:client:openOrganBuyerMenu', function()
    local playerItems = QBCore.Functions.GetPlayerData().items
    local sellableItems = {}
    local allOrgans = {}
    
    -- Vérifier les organes que le joueur possède
    for itemName, itemInfo in pairs(Config.OrganBuyer.items) do
        for _, item in pairs(playerItems) do
            if item.name == itemName then
                sellableItems[#sellableItems+1] = {
                    text = QBCore.Shared.Items[itemName].label .. ' - $' .. itemInfo.price .. ' (sale) / $' .. math.floor(itemInfo.price * 0.35) .. ' (propre)',
                    value = itemName
                }
                -- Stocker l'information pour l'option "Tout vendre"
                allOrgans[#allOrgans+1] = {
                    name = itemName,
                    amount = item.amount
                }
                break
            end
        end
    end
    
    if #sellableItems == 0 then
        QBCore.Functions.Notify('Vous n\'avez aucun organe à vendre', 'error')
        return
    end
    
    -- Ajouter l'option "Tout vendre" au début de la liste
    table.insert(sellableItems, 1, {
        text = "TOUT VENDRE",
        value = "all"
    })
    
    local dialog = exports['qb-input']:ShowInput({
        header = "Vente d'organes",
        submitText = "Vendre",
        inputs = {
            {
                text = "Choisir un organe",
                name = "item",
                type = "select",
                options = sellableItems,
                isRequired = true
            },
            {
                type = 'number',
                name = 'amount',
                text = 'Quantité',
                isRequired = true,
                default = 1,
            },
            {
                text = "Type de paiement",
                name = "paymentType",
                type = "select",
                options = {
                    { text = "Argent sale (100%)", value = "black" },
                    { text = "Argent propre (35%)", value = "cash" }
                },
                isRequired = true
            }
        }
    })

    if dialog then
        if not dialog.item or not dialog.paymentType then return end
        
        if dialog.item == "all" then
            -- Vendre tous les organes
            TriggerServerEvent('qb-organe:server:sellAllOrgans', allOrgans, dialog.paymentType)
        else
            -- Vendre un organe spécifique
            if not dialog.amount then return end
            TriggerServerEvent('qb-organe:server:sellOrgan', dialog.item, dialog.amount, dialog.paymentType)
        end
    end
end)

-- Remplacer le dernier CreateThread par celui-ci
CreateThread(function()
    -- Attendre que le framework soit chargé
    while not QBCore do Wait(100) end
    while not QBCore.Functions.GetPlayerData() do Wait(100) end
    
    -- Attendre que tout soit bien chargé
    Wait(2000)
    
    -- Créer les PNJs une seule fois
    if not DoesEntityExist(dealerPed) then
        CreateDealer()
    end
    
    if not DoesEntityExist(organBuyerPed) then
        CreateOrganBuyer()
    end
end) 