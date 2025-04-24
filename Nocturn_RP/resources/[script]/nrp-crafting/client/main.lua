local QBCore = exports['qb-core']:GetCoreObject()

-- Table pour stocker les props spawned
local spawnedProps = {}

-- Function to open crafting menu
local function OpenCrafting(craftingType)
    print("Opening crafting menu for type:", craftingType) -- Debug
    local craftingData = Config.Recipes[craftingType]
    if not craftingData then 
        print("No crafting data found for type:", craftingType) -- Debug
        return 
    end

    local CustomCrafting = {}
    for k, v in pairs(craftingData.items) do
        CustomCrafting[k] = {
            name = v.item,
            amount = v.amount,
            info = {},
            costs = v.ingredients,
            type = v.item:find('weapon_') and 'weapon' or 'item',
            slot = k,
            threshold = v.threshold or 0,
            points = v.points or 1,
            time = v.time or 5500,
            chance = v.chance or 100,
            rep = 'attachmentcraftingrep'
        }
    end

    local crafting = {
        label = craftingData.label,
        items = exports['qs-inventory']:SetUpCrafing(CustomCrafting)
    }
    
    TriggerServerEvent('inventory:server:SetInventoryItems', CustomCrafting)
    TriggerServerEvent('inventory:server:OpenInventory', 'customcrafting', crafting.label, crafting)
end

-- Function to spawn props
local function SpawnCraftingProp(data)
    local model = GetHashKey(data.model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
    
    local prop = CreateObject(model, data.coords.x, data.coords.y, data.coords.z - 1.0, false, false, false)
    SetEntityHeading(prop, data.heading or 0.0)
    FreezeEntityPosition(prop, true)
    SetEntityAsMissionEntity(prop)
    
    return prop
end

-- Function to setup crafting locations
local function SetupCraftingLocations()
    for locationId, data in pairs(Config.CraftingLocations) do
        -- Spawn prop if needed
        if data.spawnProp then
            spawnedProps[locationId] = SpawnCraftingProp(data)
        end
        
        -- Add target
        exports['qb-target']:AddBoxZone(locationId, data.coords, 1.5, 1.5, {
            name = locationId,
            heading = data.heading or 0.0,
            debugPoly = true, -- Temporairement activé pour debug
            minZ = data.coords.z - 1.0,
            maxZ = data.coords.z + 1.0
        }, {
            options = {
                {
                    type = "client",
                    event = "nrp-crafting:client:TriggerCrafting",
                    icon = "fas fa-hammer",
                    label = data.label,
                    craftingType = data.type
                },
            },
            distance = 2.5
        })

        -- Add target for the ped model
        exports['qb-target']:AddTargetModel(data.model, {
            options = {
                {
                    type = "client",
                    event = "nrp-crafting:client:TriggerCrafting",
                    icon = "fas fa-hammer",
                    label = data.label,
                    craftingType = data.type
                },
            },
            distance = 2.0
        })
    end
end

-- Event handler for triggering crafting
RegisterNetEvent('nrp-crafting:client:TriggerCrafting')
AddEventHandler('nrp-crafting:client:TriggerCrafting', function(data)
    print("Triggered crafting with data:", json.encode(data)) -- Debug
    if data.craftingType then
        OpenCrafting(data.craftingType)
    end
end)

-- Commands to open crafting tables (for testing)
RegisterCommand('craft_weapon', function()
    OpenCrafting('weapon')
end)

RegisterCommand('craft_drugs', function()
    OpenCrafting('drugs')
end)

-- Cleanup on resource stop
AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        for _, prop in pairs(spawnedProps) do
            if prop and DoesEntityExist(prop) then
                DeleteEntity(prop)
            end
        end
    end
end)

-- Initialize crafting locations when resource starts
CreateThread(function()
    Wait(1000) -- Attendre que tout soit chargé
    SetupCraftingLocations()
end)

-- Initialisation des tables de craft avec qb-target
CreateThread(function()
    for k, v in pairs(Config.CraftingLocations) do
        exports['qb-target']:AddTargetModel(v.model, {
            options = {
                {
                    type = "client",
                    event = "nrp-crafting:client:OpenCraftingMenu",
                    icon = "fas fa-hammer",
                    label = "Utiliser la table de craft",
                    craftingType = v.type
                },
            },
            distance = 2.0
        })
    end
end)

-- Ouvrir le menu de craft
RegisterNetEvent('nrp-crafting:client:OpenCraftingMenu')
AddEventHandler('nrp-crafting:client:OpenCraftingMenu', function(data)
    local craftingType = data.craftingType
    local craftingData = Config.Recipes[craftingType]
    
    if not craftingData then return end

    local menu = {
        {
            header = craftingData.label,
            isMenuHeader = true
        }
    }

    for i, item in ipairs(craftingData.items) do
        local ingredientText = "Ingrédients requis:"
        for material, amount in pairs(item.ingredients) do
            local itemLabel = QBCore.Shared.Items[material].label
            ingredientText = ingredientText .. "\\n- " .. itemLabel .. " x" .. amount
        end

        menu[#menu + 1] = {
            header = item.label,
            txt = ingredientText,
            params = {
                event = "nrp-crafting:client:CraftItem",
                args = {
                    craftingType = craftingType,
                    itemIndex = i
                }
            }
        }
    end

    menu[#menu + 1] = {
        header = "⬅ Fermer",
        txt = "",
        params = {
            event = "qb-menu:client:closeMenu"
        }
    }

    exports['qb-menu']:openMenu(menu)
end)

-- Event pour crafter un item
RegisterNetEvent('nrp-crafting:client:CraftItem')
AddEventHandler('nrp-crafting:client:CraftItem', function(data)
    QBCore.Functions.TriggerCallback('nrp-crafting:server:CanCraft', function(canCraft)
        if canCraft then
            local craftingData = Config.Recipes[data.craftingType].items[data.itemIndex]
            QBCore.Functions.Progressbar("crafting_item", "Fabrication en cours...", craftingData.time, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "mini@repair",
                anim = "fixing_a_ped",
                flags = 16,
            }, {}, {}, function() -- Done
                TriggerServerEvent('nrp-crafting:server:CraftItem', data.craftingType, data.itemIndex)
            end, function() -- Cancel
                QBCore.Functions.Notify("Fabrication annulée", "error")
            end)
        else
            QBCore.Functions.Notify("Vous n'avez pas les ingrédients nécessaires", "error")
        end
    end, data.craftingType, data.itemIndex)
end) 