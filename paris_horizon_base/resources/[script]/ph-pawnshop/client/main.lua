local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local isMenuOpen = false
local pawnshopPed = nil

-- Initialisation
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    print("Player Data Loaded:", json.encode(PlayerData)) -- Debug
    CreatePawnshopBlip()
    InitializePawnshopTarget()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
    print("Job Updated:", json.encode(JobInfo)) -- Debug
end)

-- Création du blip
function CreatePawnshopBlip()
    local coords = vector3(Config.PawnshopLocation.x, Config.PawnshopLocation.y, Config.PawnshopLocation.z)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, Config.PawnshopBlip.sprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, Config.PawnshopBlip.scale)
    SetBlipColour(blip, Config.PawnshopBlip.color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.PawnshopBlip.label)
    EndTextCommandSetBlipName(blip)
end

-- Initialisation de QB-Target
function InitializePawnshopTarget()
    if pawnshopPed ~= nil then
        DeletePed(pawnshopPed)
        pawnshopPed = nil
    end

    local model = `a_m_m_business_01`
    
    if not HasModelLoaded(model) then
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(10)
        end
    end

    local coords = Config.PawnshopLocation
    pawnshopPed = CreatePed(4, model, coords.x, coords.y, coords.z - 1.0, coords.w, false, true)
    
    if not DoesEntityExist(pawnshopPed) then
        print("Erreur: Le PED n'a pas pu être créé")
        return
    end

    FreezeEntityPosition(pawnshopPed, true)
    SetEntityInvincible(pawnshopPed, true)
    SetBlockingOfNonTemporaryEvents(pawnshopPed, true)
    SetEntityHeading(pawnshopPed, coords.w)

    -- Configuration de QB-Target pour le PED uniquement
    exports['qb-target']:AddTargetEntity(pawnshopPed, {
        options = {
            {
                num = 1,
                type = "client",
                event = "ph-pawnshop:client:openMenu",
                icon = "fas fa-store",
                label = "Parler au vendeur",
                job = Config.RequiredJob
            }
        },
        distance = 3.0
    })
end

-- Création du menu
function OpenPawnshopMenu()
    -- Vérifier si le job est chargé
    if not PlayerData.job then
        PlayerData = QBCore.Functions.GetPlayerData()
        if not PlayerData.job then
            QBCore.Functions.Notify('Erreur: Impossible de charger votre job', 'error')
            return
        end
    end

    print("Job actuel:", PlayerData.job.name) -- Debug message
    print("Job requis:", Config.RequiredJob) -- Debug message

    if PlayerData.job.name ~= Config.RequiredJob then
        QBCore.Functions.Notify('Vous devez être employé du Rachat occasion pour utiliser ce menu', 'error')
        return
    end

    local elements = {}
    
    -- Afficher tous les items configurés comme disponibles à l'achat
    for k, v in pairs(Config.Items) do
        table.insert(elements, {
            label = v.label,
            description = v.description,
            value = k,
            basePrice = v.buyPrice,
            sellPrice = v.sellPrice
        })
    end

    -- Récupérer l'inventaire du pawnshop
    local inventory = {}
    for k, v in pairs(PlayerData.items) do
        if Config.Items[k] then
            table.insert(inventory, {
                name = k,
                label = Config.Items[k].label,
                amount = v.amount,
                sellPrice = Config.Items[k].sellPrice
            })
        end
    end

    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "show",
        items = elements,
        inventory = inventory
    })
    isMenuOpen = true
end

-- Event handler pour QB-Target
RegisterNetEvent('ph-pawnshop:client:openMenu')
AddEventHandler('ph-pawnshop:client:openMenu', function()
    OpenPawnshopMenu()
end)

-- Callbacks NUI
RegisterNUICallback('closeMenu', function(data, cb)
    SetNuiFocus(false, false)
    isMenuOpen = false
    cb('ok')
end)

RegisterNUICallback('buyItem', function(data, cb)
    local item = data.item
    local amount = data.amount
    local price = data.price
    
    -- Ajouter l'item au panier avec le prix négocié
    TriggerServerEvent('ph-pawnshop:server:addToQuote', item, amount, price)
    cb('ok')
end)

RegisterNUICallback('checkout', function(data, cb)
    if data.items and #data.items > 0 then
        -- Créer le devis avec les items sélectionnés
        TriggerServerEvent('ph-pawnshop:server:createQuote', data.items)
    end
    cb('ok')
end)

-- Commande de réinitialisation
RegisterCommand('resetpawnshop', function()
    InitializePawnshopTarget()
    QBCore.Functions.Notify('PED du pawnshop réinitialisé', 'success')
end)

-- Initialisation au démarrage
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    Wait(2000)
    InitializePawnshopTarget()
end)

-- Nettoyage à l'arrêt
AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    if pawnshopPed ~= nil then
        DeletePed(pawnshopPed)
        pawnshopPed = nil
    end
end) 