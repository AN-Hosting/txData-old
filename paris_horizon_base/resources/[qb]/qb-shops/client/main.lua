local QBCore = exports['qb-core']:GetCoreObject()
local currentShop, playerData
local pedSpawned = false
local listen = false
local ShopPed = {}
local NewZones = {}
local vendingMachines = {}

-- Functions

local function createBlips()
    if pedSpawned then return end

    for store in pairs(Config.Locations) do
        if Config.Locations[store]['showblip'] then
            local StoreBlip = AddBlipForCoord(Config.Locations[store]['coords']['x'], Config.Locations[store]['coords']['y'], Config.Locations[store]['coords']['z'])
            SetBlipSprite(StoreBlip, Config.Locations[store]['blipsprite'])
            SetBlipScale(StoreBlip, Config.Locations[store]['blipscale'])
            SetBlipDisplay(StoreBlip, 4)
            SetBlipColour(StoreBlip, Config.Locations[store]['blipcolor'])
            SetBlipAsShortRange(StoreBlip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(Config.Locations[store]['label'])
            EndTextCommandSetBlipName(StoreBlip)
        end
    end
end

local function listenForControl()
    if listen then return end
    CreateThread(function()
        listen = true
        while listen do
            if IsControlJustPressed(0, 38) then -- E
                exports['qb-core']:KeyPressed()
                TriggerEvent('qb-shops:client:OpenShop', { shop = currentShop })
                listen = false
                break
            end
            Wait(0)
        end
    end)
end

local function createPeds()
    if pedSpawned then return end
    local defaultTargetIcon = 'fas fa-shopping-cart'
    local defaultTargetLabel = 'Ouvrir'

    for k, v in pairs(Config.Locations) do
        if not v.ped then
            exports['qb-target']:AddCircleZone(k, vector3(v.coords.x, v.coords.y, v.coords.z), 0.5, {
                name = k,
                debugPoly = false,
                useZ = true
            }, {
                options = {
                    {
                        label = v.targetLabel or defaultTargetLabel,
                        icon = v.targetIcon or defaultTargetIcon,
                        item = v.requiredItem,
                        type = 'server',
                        event = 'qb-shops:server:openShop',
                        shop = k,
                        job = v.requiredJob,
                        gang = v.requiredGang
                    }
                },
                distance = 2.0
            })
        else
            local current = type(v['ped']) == 'number' and v['ped'] or joaat(v['ped'])
            RequestModel(current)
            while not HasModelLoaded(current) do Wait(0) end
            ShopPed[k] = CreatePed(0, current, v['coords'].x, v['coords'].y, v['coords'].z - 1, v['coords'].w, false, false)
            TaskStartScenarioInPlace(ShopPed[k], v['scenario'], 0, true)
            FreezeEntityPosition(ShopPed[k], true)
            SetEntityInvincible(ShopPed[k], true)
            SetBlockingOfNonTemporaryEvents(ShopPed[k], true)
            if Config.UseTarget then
                exports['qb-target']:AddTargetEntity(ShopPed[k], {
                    options = {
                        {
                            label = v.targetLabel or defaultTargetLabel,
                            icon = v.targetIcon or defaultTargetIcon,
                            item = v.requiredItem,
                            type = 'client',
                            event = 'qb-shops:client:OpenShop',
                            shop = k,
                            job = v.requiredJob,
                            gang = v.requiredGang
                        }
                    },
                    distance = 2.0
                })
            end
        end
    end
    pedSpawned = true
end

local function deletePeds()
    if not pedSpawned then return end
    for _, v in pairs(ShopPed) do
        DeletePed(v)
    end
    pedSpawned = false
end

local function tableCheck(inputValue, requiredValue)
    local playerJob = inputValue.job.name
    local playerJobGrade = inputValue.job.grade.level
    local playerGang = inputValue.gang.name
    local playerGangGrade = inputValue.gang.grade.level
    local shopData = Config.Locations[requiredValue]

    local jobCheck = false
    local gangCheck = false
    local itemCheck = false

    if shopData.requiredJob then
        if type(shopData.requiredJob) == 'table' then
            for job, grade in pairs(shopData.requiredJob) do
                if playerJob == job and playerJobGrade >= grade then
                    jobCheck = true
                    break
                end
            end
        elseif playerJob == shopData.requiredJob then
            jobCheck = true
        end
    else
        jobCheck = true
    end

    if shopData.requiredGang then
        if type(shopData.requiredGang) == 'table' then
            for gang, grade in pairs(shopData.requiredGang) do
                if playerGang == gang and playerGangGrade >= grade then
                    gangCheck = true
                    break
                end
            end
        elseif playerGang == shopData.requiredGang then
            gangCheck = true
        end
    else
        gangCheck = true
    end

    if shopData.requiredItem then
        itemCheck = exports['qb-inventory']:HasItem(shopData.requiredItem)
    else
        itemCheck = true
    end

    return jobCheck and gangCheck and itemCheck
end

local function SetupVendingMachines()
    for _, prop in pairs(Config.Shops['distributeur'].props) do
        local model = joaat(prop)
        vendingMachines[model] = true
    end
end

local function IsVendingMachine(entity)
    local model = GetEntityModel(entity)
    return vendingMachines[model] ~= nil
end

local function CreateTargets()
    for shop in pairs(Config.Locations) do
        NewZones[#NewZones + 1] = CircleZone:Create(vector3(Config.Locations[shop]['coords']['x'], Config.Locations[shop]['coords']['y'], Config.Locations[shop]['coords']['z']), Config.Locations[shop]['radius'] or 1.5, {
            useZ = true,
            debugPoly = false,
            name = shop,
        })
    end

    local combo = ComboZone:Create(NewZones, { name = 'RandomZOneName', debugPoly = false })
    combo:onPlayerInOut(function(isPointInside, _, zone)
        if isPointInside then
            if tableCheck(playerData, zone.name) then
                currentShop = zone.name
                exports['qb-core']:DrawText(Lang:t('info.open_shop'))
                listenForControl()
            end
        else
            exports['qb-core']:HideText()
            listen = false
        end
    end)

    exports['qb-target']:AddTargetModel(Config.Shops['distributeur'].props, {
        options = {
            {
                icon = Config.Shops['distributeur'].targetIcon,
                label = Config.Shops['distributeur'].targetLabel,
                action = function()
                    local ShopItems = {}
                    ShopItems.items = Config.Shops['distributeur'].products
                    ShopItems.label = Config.Shops['distributeur'].label
                    TriggerServerEvent('qb-shops:server:SetupShopItems', 'distributeur')
                    TriggerServerEvent('qb-shops:server:UpdateShopItems', 'distributeur', ShopItems, false)
                    TriggerEvent('qb-shops:client:OpenShop', 'distributeur', ShopItems)
                end
            }
        },
        distance = 2.5
    })
end

-- Events

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    playerData = QBCore.Functions.GetPlayerData()
    SetupVendingMachines()
    createBlips()
    createPeds()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    playerData = {}
    deletePeds()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(jobInfo)
    playerData.job = jobInfo
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    playerData = QBCore.Functions.GetPlayerData()
    SetupVendingMachines()
    createBlips()
    createPeds()
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    deletePeds()
end)

-- Threads
if not Config.UseTarget then
    CreateThread(function()
        CreateTargets()
    end)
end

RegisterNUICallback('closeShop', function(_, cb)
    SetNuiFocus(false, false)
    cb({})
end)

RegisterNUICallback('purchaseItems', function(data, cb)
    SetNuiFocus(false, false)
    TriggerServerEvent('qb-shops:server:buyItem', data.items)
    cb({})
end)

RegisterNetEvent('qb-shops:client:OpenShop', function(data)
    local shopName = type(data) == 'table' and data.shop or data
    local shopData = Config.Locations[shopName] or Config.Shops[shopName]
    
    if not shopData then return end
    
    -- Préparer les données pour l'interface
    local shopItems = {}
    local maxStackSizes = {}
    local products = shopData.products
    
    for _, item in pairs(products) do
        local itemInfo = QBCore.Shared.Items[item.name]
        if itemInfo then
            table.insert(shopItems, {
                name = item.name,
                label = itemInfo.label,
                price = item.price,
                image = "nui://qb-inventory/html/images/" .. item.name .. ".png",
                amount = item.amount
            })
            maxStackSizes[item.name] = itemInfo.maxStack or 100
        end
    end

    -- Envoyer les données à l'interface
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "openShop",
        shopName = shopData.label,
        items = shopItems,
        playerMoney = QBCore.Functions.GetPlayerData().money['cash'],
        maxStackSizes = maxStackSizes
    })
end)

RegisterNetEvent('qb-shops:server:purchaseItems', function(items)
    TriggerServerEvent('qb-shops:server:buyItem', items)
end)

-- Vending Machine
CreateThread(function()
    for _, prop in pairs(Config.Shops['distributeur'].props) do
        exports['qb-target']:AddTargetModel(prop, {
            options = {
                {
                    type = 'client',
                    event = 'qb-shops:client:OpenShop',
                    icon = "fas fa-shopping-cart",
                    label = Config.Shops['distributeur'].targetLabel,
                    shop = 'distributeur'
                }
            },
            distance = 1.5
        })
    end
end)

RegisterNetEvent('qb-shops:openShop', function(data)
    local shopType = data.shops
    if Config.Shops[shopType] then
        TriggerClientEvent('qb-shops:client:OpenShop', shopType)
    end
end)
