local QBCore = exports['qb-core']:GetCoreObject()
local isDealing = false
local usedPeds = {}
local menuOpen = false

-- Liste des drogues vendables avec leur prix
local sellableDrugs = {
    ['meth_baggy'] = {
        min = 250,  -- Prix minimum (divisé par 2)
        max = 400,  -- Prix maximum (divisé par 2)
        name = "Sachet de Meth"
    },
    ['weed_skunk'] = {
        min = 150,  -- Prix minimum (divisé par 2)
        max = 250,  -- Prix maximum (divisé par 2)
        name = "Pochon de Weed"
    },
    ['cocainebaggy'] = {
        min = 400,  -- Prix minimum (divisé par 2)
        max = 600,  -- Prix maximum (divisé par 2)
        name = "Sachet de Cocaine"
    },
    ['heroin'] = {
        min = 500,  -- Prix minimum (divisé par 2)
        max = 750,  -- Prix maximum (divisé par 2)
        name = "Dose d'Héroïne"
    }
}

-- Fonction pour vérifier si le joueur a des drogues à vendre
local function HasDrugsToSell()
    local Player = QBCore.Functions.GetPlayerData()
    if not Player then return false end
    
    for drugType, _ in pairs(sellableDrugs) do
        if QBCore.Functions.HasItem(drugType) then 
            return true 
        end
    end
    return false
end

-- Fonction pour vérifier si le PNJ est valide pour la vente
local function IsPedValidForSale(ped)
    if not DoesEntityExist(ped) then return false end
    if IsPedAPlayer(ped) then return false end
    if IsPedDeadOrDying(ped, 1) then return false end
    -- Vérifier si c'est un PNJ civil
    local pedType = GetPedType(ped)
    if pedType == 28 then return false end -- Animal
    if pedType == 6 then return false end -- Cop
    if pedType == 27 then return false end -- SWAT
    if pedType == 29 then return false end -- Army
    return true
end

-- Fonction pour obtenir la liste des drogues que le joueur possède
local function GetPlayerDrugs()
    local availableDrugs = {}
    local Player = QBCore.Functions.GetPlayerData()
    if not Player then return availableDrugs end

    for drugType, drugData in pairs(sellableDrugs) do
        -- Vérifier si le joueur a l'item et obtenir sa quantité
        local hasItem = QBCore.Functions.HasItem(drugType)
        if hasItem then
            -- Obtenir la quantité de l'item dans l'inventaire
            local amount = 0
            for _, item in pairs(Player.items) do
                if item and item.name == drugType then
                    amount = item.amount
                    break
                end
            end

            availableDrugs[drugType] = {
                label = drugData.name,
                amount = amount,
                price = drugData
            }
        end
    end
    return availableDrugs
end

-- Fonction pour ouvrir le menu de vente
local function OpenDrugSaleMenu(ped)
    if menuOpen then return end
    
    local availableDrugs = GetPlayerDrugs()
    if not next(availableDrugs) then 
        QBCore.Functions.Notify("Vous n'avez pas de drogue à vendre", "error")
        return 
    end

    menuOpen = true
    local menuItems = {}
    
    for drugType, drugData in pairs(availableDrugs) do
        table.insert(menuItems, {
            header = drugData.label,
            txt = ("Prix: $%d-%d | Quantité: %d"):format(
                drugData.price.min,
                drugData.price.max,
                drugData.amount
            ),
            params = {
                event = "ps-drugprocessing:client:confirmSale",
                args = {
                    ped = ped,
                    drugType = drugType,
                    maxAmount = drugData.amount,
                    price = drugData.price
                }
            }
        })
    end

    table.insert(menuItems, {
        header = "❌ Fermer",
        txt = "",
        params = {
            event = "qb-menu:client:closeMenu"
        }
    })

    exports['qb-menu']:openMenu(menuItems)
    SetTimeout(1000, function()
        menuOpen = false
    end)
end

-- Event handler pour la confirmation de vente
RegisterNetEvent('ps-drugprocessing:client:confirmSale', function(data)
    if not data.ped or not data.drugType then return end
    if isDealing then return end

    local wantedAmount = math.random(1, 3)
    local drugAmount = math.min(wantedAmount, data.maxAmount)
    local price = math.random(data.price.min, data.price.max) * drugAmount

    isDealing = true
    local playerPed = PlayerPedId()
    
    TaskTurnPedToFaceEntity(data.ped, playerPed, 2000)
    TaskStandStill(data.ped, 3000)
    
    RequestAnimDict("mp_common")
    while not HasAnimDictLoaded("mp_common") do Wait(0) end
    TaskPlayAnim(playerPed, "mp_common", "givetake1_a", 8.0, -8.0, -1, 0, 0, false, false, false)

    QBCore.Functions.Progressbar("selling_drugs", "Transaction en cours...", 3000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('ps-drugprocessing:server:sellDrugs', data.drugType, drugAmount, price)
        isDealing = false
        usedPeds[NetworkGetNetworkIdFromEntity(data.ped)] = true
        QBCore.Functions.Notify("Le client a acheté " .. drugAmount .. " " .. sellableDrugs[data.drugType].name, "success")
    end)
end)

-- Modifier la fonction SellDrugs
local function SellDrugs(ped)
    if isDealing then 
        QBCore.Functions.Notify("Transaction déjà en cours", "error")
        return 
    end

    if not IsPedValidForSale(ped) then return end

    local pedNetId = NetworkGetNetworkIdFromEntity(ped)
    if usedPeds[pedNetId] then
        QBCore.Functions.Notify("Ce client n'est plus intéressé", "error")
        return
    end

    -- Chance de refus
    if math.random(1, 100) <= 30 then
        local refusalMessages = {
            "Non merci, je ne suis pas intéressé...",
            "Laisse-moi tranquille !",
            "Va-t'en d'ici !"
        }
        QBCore.Functions.Notify(refusalMessages[math.random(#refusalMessages)], "error")
        
        -- Chance d'appeler la police (de 20% à 10%)
        if math.random(1, 100) <= 50 then
            -- Obtenir la position et le nom de la rue
            local coords = GetEntityCoords(PlayerPedId())
            local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
            
            -- Envoyer l'alerte via ps-dispatch
            -- exports['ps-dispatch']:CustomAlert({
            --     coords = coords,
            --     message = "Vente de stupéfiants suspectée",
            --     dispatchCode = "10-31",
            --     description = "Vente de drogue signalée à " .. streetName,
            --     radius = 50.0,
            --     sprite = 51,
            --     color = 1,
            --     scale = 1.0,
            --     length = 3,
            -- })
            exports['ps-dispatch']:DrugSale()
            
            -- Notification au joueur
            QBCore.Functions.Notify("Quelqu'un a prévenu les forces de l'ordre!", "error")
        end
        
        usedPeds[pedNetId] = true
        return
    end

    OpenDrugSaleMenu(ped)
end

-- Configuration de qb-target pour tous les PNJ
CreateThread(function()
    -- Ajouter l'option pour tous les PNJ
    exports['qb-target']:AddGlobalPed({
        options = {
            {
                num = 1,
                type = "client",
                event = "ps-drugprocessing:client:tryToSell",
                icon = 'fas fa-hand-holding-dollar',
                label = 'Proposer des marchandises',
                canInteract = function(entity)
                    local hasDrugs = HasDrugsToSell()
                    local isValidPed = IsPedValidForSale(entity)
                    local pedNetId = NetworkGetNetworkIdFromEntity(entity)
                    local isUsed = usedPeds[pedNetId]
                    
                    print("Debug vente drogue:")
                    print("Has drugs:", hasDrugs)
                    print("Valid ped:", isValidPed)
                    print("Ped used:", isUsed)
                    
                    return hasDrugs and isValidPed and not isUsed
                end
            }
        },
        distance = 3.0  -- Augmenté la distance d'interaction
    })
end)

-- Event handler pour la tentative de vente
RegisterNetEvent('ps-drugprocessing:client:tryToSell', function(data)
    if data and data.entity then
        SellDrugs(data.entity)
    end
end)

-- Reset des PNJs utilisés toutes les 2 heures réelles
CreateThread(function()
    while true do
        Wait(2 * 60 * 60 * 1000) -- 2 heures
        usedPeds = {}
        QBCore.Functions.Notify("De nouveaux clients sont disponibles", "success")
    end
end) 