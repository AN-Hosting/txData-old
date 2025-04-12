local QBCore = exports['qb-core']:GetCoreObject()

-- Table pour stocker les props créés
local CreatedProps = {}

-- Fonction pour calculer l'offset en fonction du heading
local function CalculateOffsetFromHeading(heading)
    local headingRad = math.rad((heading + 90) % 360)
    return {
        x = math.cos(headingRad) * 1.0,
        y = math.sin(headingRad) * 1.0
    }
end

-- Fonction pour nettoyer tous les props
local function CleanupProps()
    for _, prop in pairs(CreatedProps) do
        if DoesEntityExist(prop) then
            DeleteEntity(prop)
        end
    end
    CreatedProps = {}
end

-- Fonction de progression du craft
local function CraftProgress(craftedItem, requiredItems, amountToCraft, xpGain, xpType)
    QBCore.Functions.Progressbar('crafting_item', 'Fabrication en cours...', (math.random(2000, 5000) * amountToCraft), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'mini@repair',
        anim = 'fixing_a_player',
        flags = 16,
    }, {}, {}, function()
        TriggerServerEvent('qb-crafting:server:receiveItem', craftedItem, requiredItems, amountToCraft, xpGain, xpType)
    end)
end

-- Fonction de craft
local function CraftItem(craftedItem, requiredItems, amountToCraft, xpGain, xpType)
    QBCore.Functions.TriggerCallback('crafting:getPlayerInventory', function(inventory)
        local hasAllMaterials = true
        -- Multiplier les quantités requises par le nombre d'items à crafter
        local multipliedItems = {}
        for _, reqItem in pairs(requiredItems) do
            multipliedItems[#multipliedItems + 1] = {
                item = reqItem.item,
                amount = reqItem.amount * amountToCraft
            }
        end

        for _, reqItem in pairs(multipliedItems) do
            local itemAmount = 0
            for _, invItem in pairs(inventory) do
                if invItem.name == reqItem.item then
                    itemAmount = invItem.amount
                    break
                end
            end
            if itemAmount < reqItem.amount then
                hasAllMaterials = false
                QBCore.Functions.Notify(string.format(Lang:t('notifications.notenoughMaterials')), 'error')
                break
            end
        end

        if hasAllMaterials then
            if Config.EnableSkillCheck then
                local success = exports['qb-minigames']:Skillbar('easy', '12345')
                if success then
                    CraftProgress(craftedItem, multipliedItems, amountToCraft, xpGain, xpType)
                else
                    local randomItem = multipliedItems[math.random(#multipliedItems)]
                    local randomAmount = math.random(1, randomItem.amount)
                    TriggerServerEvent('qb-crafting:server:removeMaterials', randomItem.item, randomAmount)
                    QBCore.Functions.Notify('Craft raté, certains matériaux ont été perdus!', 'error')
                end
            else
                CraftProgress(craftedItem, multipliedItems, amountToCraft, xpGain, xpType)
            end
        end
    end)
end

-- Fonction pour demander la quantité
local function ShowCraftingAmount(craftedItem, requiredItems, xpGain, xpType)
    local input = exports['qb-input']:ShowInput({
        header = "Quantité à fabriquer",
        submitText = "Confirmer",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = 'Quantité'
            }
        }
    })
    if input then
        if not input.amount then return end
        local amount = tonumber(input.amount)
        if amount > 0 then
            CraftItem(craftedItem, requiredItems, amount, xpGain, xpType)
        else
            QBCore.Functions.Notify('Quantité invalide', 'error')
        end
    end
end

-- Fonction pour ouvrir le menu de craft
local function OpenCraftingMenu(craftingTable)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local currentXP = craftingTable.xpType and PlayerData.metadata[craftingTable.xpType] or 0

    QBCore.Functions.TriggerCallback('crafting:getPlayerInventory', function(inventory)
        local craftableItems = {}
        local nonCraftableItems = {}

        for _, recipe in pairs(craftingTable.recipes) do
            if currentXP >= (recipe.xpRequired or 0) then
                local canCraft = true
                local itemsText = ''
                
                for _, reqItem in pairs(recipe.requiredItems) do
                    local hasItem = false
                    for _, invItem in pairs(inventory) do
                        if invItem.name == reqItem.item and invItem.amount >= reqItem.amount then
                            hasItem = true
                            break
                        end
                    end
                    local itemLabel = QBCore.Shared.Items[reqItem.item]
                    if not itemLabel then
                        print("^1[QB-Crafting] Item non trouvé dans QBCore.Shared.Items: " .. reqItem.item .. "^7")
                        itemLabel = { label = reqItem.item }
                    end
                    itemsText = itemsText .. ' x' .. tostring(reqItem.amount) .. ' ' .. itemLabel.label .. '<br>'
                    if not hasItem then
                        canCraft = false
                    end
                end

                local menuItem = {
                    header = recipe.label or (QBCore.Shared.Items[recipe.item] and QBCore.Shared.Items[recipe.item].label or recipe.item),
                    txt = itemsText,
                    icon = QBCore.Shared.Items[recipe.item] and (Config.ImageBasePath .. QBCore.Shared.Items[recipe.item].image) or 'fas fa-question',
                    disabled = not canCraft,
                    params = {
                        event = 'qb-crafting:client:showAmount',
                        args = {
                            item = recipe.item,
                            requiredItems = recipe.requiredItems,
                            xpGain = recipe.xpGain or 0,
                            xpType = craftingTable.xpType
                        }
                    }
                }

                if canCraft then
                    craftableItems[#craftableItems + 1] = menuItem
                else
                    nonCraftableItems[#nonCraftableItems + 1] = menuItem
                end
            end
        end

        local menuItems = {
            {
                header = craftingTable.name,
                icon = 'fas fa-drafting-compass',
                isMenuHeader = true
            }
        }

        for _, item in ipairs(craftableItems) do
            menuItems[#menuItems + 1] = item
        end
        for _, item in ipairs(nonCraftableItems) do
            menuItems[#menuItems + 1] = item
        end

        exports['qb-menu']:openMenu(menuItems)
    end)
end

-- Event pour gérer la sélection de quantité
RegisterNetEvent('qb-crafting:client:showAmount', function(data)
    ShowCraftingAmount(data.item, data.requiredItems, data.xpGain, data.xpType)
end)

-- Fonction pour vérifier si le joueur a le job requis
local function HasRequiredJob(jobs)
    -- Si pas de jobs définis, autoriser tout le monde
    if not jobs then return true end
    if not next(jobs) then return true end

    local PlayerData = QBCore.Functions.GetPlayerData()
    if not PlayerData.job then return false end

    -- Vérification stricte du nom du job
    if jobs[PlayerData.job.name] ~= nil then
        local requiredGrade = jobs[PlayerData.job.name]
        -- Si grade requis est 0, accepter tous les grades de ce job
        if requiredGrade == 0 then
            return true
        -- Sinon vérifier si le grade du joueur est suffisant
        else
            return PlayerData.job.grade.level >= requiredGrade
        end
    end

    -- Si le job du joueur n'est pas dans la liste des jobs autorisés
    return false
end

-- Fonction pour créer les props et configurer qb-target
local function SetupCraftingLocations()
    CleanupProps()
    
    if not Config.CraftingTables then
        print("^1Erreur: Config.CraftingTables n'existe pas^7")
        return
    end
    
    for i, craftingTable in pairs(Config.CraftingTables) do
        if craftingTable.useProps then
            -- Calcul de l'offset basé sur le heading (uniquement pour les props)
            local offset = CalculateOffsetFromHeading(craftingTable.coords.w)
            local finalPos = {
                x = craftingTable.coords.x + offset.x,
                y = craftingTable.coords.y + offset.y,
                z = craftingTable.coords.z
            }

            -- Vérification du hash du prop
            local modelHash = craftingTable.prop
            if type(modelHash) == 'string' then
                modelHash = GetHashKey(modelHash)
            end
            
            -- Chargement du modèle
            if not HasModelLoaded(modelHash) then
                RequestModel(modelHash)
                while not HasModelLoaded(modelHash) do
                    Wait(10)
                end
            end
            
            -- Création du prop avec offset ajusté
            local craftProp = CreateObject(modelHash, 
                finalPos.x,
                finalPos.y,
                finalPos.z - 0.2,
                false, false, false)
                
            if DoesEntityExist(craftProp) then
                SetEntityHeading(craftProp, craftingTable.coords.w)
                PlaceObjectOnGroundProperly(craftProp)
                FreezeEntityPosition(craftProp, true)
                table.insert(CreatedProps, craftProp)
                
                exports['qb-target']:AddTargetEntity(craftProp, {
                    options = {
                        {
                            type = "client",
                            icon = "fas fa-hammer",
                            label = craftingTable.name,
                            action = function()
                                if HasRequiredJob(craftingTable.jobs) then
                                    OpenCraftingMenu(craftingTable)
                                else
                                    QBCore.Functions.Notify('Vous n\'avez pas le métier requis', 'error')
                                end
                            end,
                            canInteract = function()
                                return HasRequiredJob(craftingTable.jobs)
                            end
                        }
                    },
                    distance = Config.Zones.interaction.distance
                })
            end
            
            SetModelAsNoLongerNeeded(modelHash)
        else
            -- Création d'une boxzone pour les tables sans prop (sans offset)
            exports['qb-target']:AddBoxZone(
                craftingTable.type .. "_" .. i,
                vector3(craftingTable.coords.x, craftingTable.coords.y, craftingTable.coords.z),
                Config.Zones.size.length,
                Config.Zones.size.width,
                {
                    name = craftingTable.type .. "_" .. i,
                    heading = craftingTable.coords.w,
                    debugPoly = Config.Zones.debugPoly,
                    minZ = craftingTable.coords.z - Config.Zones.size.verticalOffset,
                    maxZ = craftingTable.coords.z + Config.Zones.size.verticalOffset
                },
                {
                    options = {
                        {
                            type = "client",
                            icon = "fas fa-hammer",
                            label = craftingTable.name,
                            action = function()
                                if HasRequiredJob(craftingTable.jobs) then
                                    OpenCraftingMenu(craftingTable)
                                else
                                    QBCore.Functions.Notify('Vous n\'avez pas le métier requis', 'error')
                                end
                            end,
                            canInteract = function()
                                return HasRequiredJob(craftingTable.jobs)
                            end
                        }
                    },
                    distance = Config.Zones.interaction.distance
                }
            )
        end
    end
end

-- Event handler pour la création des props au démarrage
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    SetupCraftingLocations()
end)

-- Créer les props au redémarrage de la ressource
AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        SetupCraftingLocations()
    end
end)

-- Nettoyer les props quand la ressource s'arrête
AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        CleanupProps()
    end
end)
