local QBCore = exports['qb-core']:GetCoreObject()
function GetItemImage(itemName)
    local item = exports['qb-core']:GetItemByName(itemName) -- Utilisez la fonction correcte ici
    if item then
        return "images/" .. itemName .. ".png"
    else
        print("Item not found: " .. itemName) -- Debugging
        return nil
    end
end

exports('GetItemImage', GetItemImage)
exports('GetItem', function(itemName)
    -- Logique pour récupérer l'item
    local item = QBCore.Items[itemName] -- Exemple d'accès à un item
    return item
end)
-- Point d'accès via qb-target
CreateThread(function()
    exports['qb-target']:AddBoxZone("catcafecraft", vector3(-290.74, -84.33, 49.26), 0.45, 0.35, {
        name = "catcafecraft",
gPoly = false,
        minZ = 48.26,
        maxZ = 50.26,
    }, {
        options = {
            {
                type = "client",
                icon = "fas fa-coffee",
                label = "Menu de Craft",
                action = function()
                    OpenCatCafeMenu()
                end,
                job = "catcafe",
            },
        },
        distance = 2.5
    })
end)

-- Fonction pour ouvrir le menu de crafting avec qb-menu qui fonctionne
function OpenCatCafeMenu()
    local menuItems = {}
    
    -- Ajouter un header
    table.insert(menuItems, {
        header = "Menu Crafting Cat Cafe",
        isMenuHeader = true
    })
    
    -- Définir les recettes
    local craftingRecipes = {
        {
            name = "bubbletea",
            label = "Bubble Tea",
            ingredients = {
                {item = "burger_milk", amount = 1, label = "Lait"},
                {item = "sugar", amount = 1, label = "Sucre"},
                {item = "boba", amount = 1, label = "Perles de Tapioca"}
            },
            time = 5000
        },
        {
            name = "bubbleteablue",
            label = "Bubble Tea Bleu",
            ingredients = {
                {item = "burger_milk", amount = 1, label = "Lait"},
                {item = "blueberry", amount = 1, label = "Myrtilles"},
                {item = "boba", amount = 1, label = "Perles de Tapioca"}
            },
            time = 5500
        },
        {
            name = "bubbleteagreen",
            label = "Bubble Tea Vert",
            ingredients = {
                {item = "matcha", amount = 1, label = "Matcha"},
                {item = "burger_milk", amount = 1, label = "Lait"},
                {item = "boba", amount = 1, label = "Perles de Tapioca"}
            },
            time = 5500
        },
        {
            name = "bubbleteaorange",
            label = "Bubble Tea Orange",
            ingredients = {
                {item = "burger_milk", amount = 1, label = "Lait"},
                {item = "orange", amount = 1, label = "Orange"},
                {item = "boba", amount = 1, label = "Perles de Tapioca"}
            },
            time = 5500
        },
        {
            name = "bubbleteapink",
            label = "Bubble Tea Rose",
            ingredients = {
                {item = "burger_milk", amount = 1, label = "Lait"},
                {item = "strawberry", amount = 1, label = "Fraise"},
                {item = "boba", amount = 1, label = "Perles de Tapioca"}
            },
            time = 5500
        },
        {
            name = "matcha",
            label = "Matcha",
            ingredients = {
                {item = "matcha", amount = 1, label = "Matcha"},
                {item = "burger_milk", amount = 1, label = "Lait"},
                {item = "sugar", amount = 1, label = "Sucre"}
            },
            time = 4500
        },
        {
            name = "ramen",
            label = "Ramen",
            ingredients = {
                {item = "noodles", amount = 1, label = "Nouilles"},
                {item = "miso", amount = 1, label = "Soupe Miso"},
                {item = "tofu", amount = 1, label = "Tofu"}
            },
            time = 8000
        },
        {
            name = "noodlebowl",
            label = "Bol de Nouilles",
            ingredients = {
                {item = "noodles", amount = 1, label = "Nouilles"},
                {item = "miso", amount = 1, label = "Soupe Miso"}
            },
            time = 6000
        },
        {
            name = "bento",
            label = "Bento",
            ingredients = {
                {item = "rice", amount = 1, label = "Riz"},
                {item = "tofu", amount = 1, label = "Tofu"}
            },
            time = 10000
        },
        {
            name = "mochipink",
            label = "Mochi Rose",
            ingredients = {
                {item = "flour", amount = 1, label = "Farine"},
                {item = "sugar", amount = 1, label = "Sucre"},
                {item = "strawberry", amount = 1, label = "Fraise"}
            },
            time = 6000
        },
        {
            name = "mochiblue",
            label = "Mochi Bleu",
            ingredients = {
                {item = "flour", amount = 1, label = "Farine"},
                {item = "sugar", amount = 1, label = "Sucre"},
                {item = "blueberry", amount = 1, label = "Myrtille"}
            },
            time = 6000
        },
        {
            name = "mochigreen",
            label = "Mochi Vert",
            ingredients = {
                {item = "flour", amount = 1, label = "Farine"},
                {item = "sugar", amount = 1, label = "Sucre"},
                {item = "matcha", amount = 1, label = "Matcha"}
            },
            time = 6000
        },
        {
            name = "mochiorange",
            label = "Mochi Orange",
            ingredients = {
                {item = "flour", amount = 1, label = "Farine"},
                {item = "sugar", amount = 1, label = "Sucre"},
                {item = "orange", amount = 1, label = "Orange"}
            },
            time = 6000
        },
        {
            name = "mochameow",
            label = "Mochi Chat Café",
            ingredients = {
                {item = "flour", amount = 1, label = "Farine"},
                {item = "sugar", amount = 1, label = "Sucre"},
                {item = "latte", amount = 1, label = "Latte"}
            },
            time = 6000
        },
        {
            name = "catdonut",
            label = "Donut Chat",
            ingredients = {
                {item = "flour", amount = 1, label = "Farine"},
                {item = "sugar", amount = 1, label = "Sucre"}
            },
            time = 7000
        },
        {
            name = "catcookie",
            label = "Cookie Chat",
            ingredients = {
                {item = "flour", amount = 1, label = "Farine"},
                {item = "sugar", amount = 1, label = "Sucre"}
            },
            time = 5000
        },
        {
            name = "catrice",
            label = "Riz Chat",
            ingredients = {
                {item = "rice", amount = 1, label = "Riz"},
                {item = "nori", amount = 1, label = "Nori"}
            },
            time = 5000
        },
        {
            name = "catpizza",
            label = "Pizza Chat",
            ingredients = {
                {item = "flour", amount = 2, label = "Farine"},
                {item = "tofu", amount = 1, label = "Tofu"}
            },
            time = 8000
        },
        {
            name = "cake",
            label = "Gâteau",
            ingredients = {
                {item = "flour", amount = 2, label = "Farine"},
                {item = "sugar", amount = 2, label = "Sucre"}
            },
            time = 9000
        },
        {
            name = "cakepop",
            label = "Cake Pop",
            ingredients = {
                {item = "flour", amount = 1, label = "Farine"},
                {item = "sugar", amount = 2, label = "Sucre"}
            },
            time = 7000
        },
        {
            name = "pawcakes",
            label = "Pancakes Patte",
            ingredients = {
                {item = "flour", amount = 1, label = "Farine"},
                {item = "sugar", amount = 1, label = "Sucre"}
            },
            time = 6000
        },
        {
            name = "purrito",
            label = "Purrito",
            ingredients = {
                {item = "flour", amount = 1, label = "Farine"},
                {item = "tofu", amount = 1, label = "Tofu"},
                {item = "rice", amount = 1, label = "Riz"}
            },
            time = 7000
        }
    }
    
    -- Ajouter chaque recette au menu
    for _, recipe in ipairs(craftingRecipes) do
        local hasIngredients = true
        local ingredientsText = ""
        
        -- Vérifier si le joueur a les ingrédients requis
        for _, ingredient in ipairs(recipe.ingredients) do
            if not QBCore.Functions.HasItem(ingredient.item, ingredient.amount) then
                hasIngredients = false
            end
            ingredientsText = ingredientsText .. ingredient.amount .. "x " .. ingredient.label .. ", "
        end
        
        -- Supprimer la dernière virgule
        ingredientsText = string.sub(ingredientsText, 1, -3)
        
        local color = hasIngredients and "green" or "red"
        
        table.insert(menuItems, {
            header = recipe.label,
            txt = "Ingrédients: " .. ingredientsText,
            params = {
                event = "n-crafting:client:craftItem",
                args = {
                    recipe = recipe
                }
            },
            disabled = not hasIngredients,
            color = color
        })
    end
    
    -- Option pour fermer le menu
    table.insert(menuItems, {
        header = "Fermer",
        params = {
            event = "qb-menu:client:closeMenu"
        }
    })
    
    -- Afficher le menu
    exports['qb-menu']:openMenu(menuItems)
end

-- Event pour crafter un item
RegisterNetEvent('n-crafting:client:craftItem', function(data)
    local recipe = data.recipe
    
    QBCore.Functions.Progressbar("crafting_item", "Préparation de " .. recipe.label .. "...", recipe.time, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 8,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_player", 1.0)
        
        -- Appeler l'événement serveur pour crafter
        TriggerServerEvent('n-crafting:server:craftItem', recipe)
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_player", 1.0)
        QBCore.Functions.Notify("Préparation annulée", "error")
    end)
end)

-- Fonction simplifiée pour ouvrir le menu de craft du Cat Cafe
function OpencatcafeCrafting()
    local CustomCrafting = {
        [1] = {
            name = "bubbletea",
            amount = 1,
            costs = {
                ["burger_milk"] = 1,
                ["sugar"] = 1,
                ["boba"] = 1,
            },
            time = 5000,
            icon = "bubbletea.png"
        },
        [2] = {
            name = "bubbleteablue",
            label = "Bubble Tea Bleu",
            amount = 50,
            info = {},
            costs = {
                ["burger_milk"] = 1,
                ["blueberry"] = 1,
                ["boba"] = 1,
            },
            type = "item",
            slot = 2,
            rep = 'catcafecrafting',
            points = 1,
            threshold = 0,
            time = 5500,
            chance = 100,
        },
        [3] = {
            name = "bubbleteagreen",
            label = "Bubble Tea Vert",
            amount = 50,
            info = {},
            costs = {
                ["matcha"] = 1,
                ["burger_milk"] = 1,
                ["boba"] = 1,
            },
            type = "item",
            slot = 3,
            rep = 'catcafecrafting',
            points = 1,
            threshold = 0,
            time = 5500,
            chance = 100,
        },
        [4] = {
            name = "bubbleteaorange",
            label = "Bubble Tea Orange",
            amount = 50,
            info = {},
            costs = {
                ["burger_milk"] = 1,
                ["orange"] = 1,
                ["boba"] = 1,
            },
            type = "item",
            slot = 4,
            rep = 'catcafecrafting',
            points = 1,
            threshold = 0,
            time = 5500,
            chance = 100,
        },
        [5] = {
            name = "bubbleteapink",
            label = "Bubble Tea Rose",
            amount = 50,
            info = {},
            costs = {
                ["burger_milk"] = 1,
                ["strawberry"] = 1,
                ["boba"] = 1,
            },
            type = "item",
            slot = 5,
            rep = 'catcafecrafting',
            points = 1,
            threshold = 0,
            time = 5500,
            chance = 100,
        },
        [6] = {
            name = "matcha",
            label = "Matcha",
            amount = 50,
            info = {},
            costs = {
                ["matcha"] = 1,
                ["burger_milk"] = 1,
                ["sugar"] = 1,
            },
            type = "item",
            slot = 6,
            rep = 'catcafecrafting',
            points = 1,
            threshold = 0,
            time = 4500,
            chance = 100,
        },
        [7] = {
            name = "ramen",
            label = "Ramen",
            amount = 50,
            info = {},
            costs = {
                ["noodles"] = 1,
                ["miso"] = 1,
                ["tofu"] = 1,
            },
            type = "item",
            slot = 7,
            rep = 'catcafecrafting',
            points = 1,
            threshold = 0,
            time = 8000,
            chance = 100,
        },
        [8] = {
            name = "noodlebowl",
            label = "Bol de Nouilles",
            amount = 50,
            info = {},
            costs = {
                ["noodles"] = 1,
                ["miso"] = 1,
            },
            type = "item",
            slot = 8,
            rep = 'catcafecrafting',
            points = 1,
            threshold = 0,
            time = 6000,
            chance = 100,
        },
        [9] = {
            name = "bento",
            label = "Bento",
            amount = 50,
            info = {},
            costs = {
                ["rice"] = 1,
                ["tofu"] = 1,
            },
            type = "item",
            slot = 9,
            rep = 'catcafecrafting',
            points = 1,
            threshold = 0,
            time = 10000,
            chance = 100,
        },
        [10] = {
            name = "mochipink",
            label = "Mochi Rose",
            amount = 50,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 1,
                ["strawberry"] = 1,
            },
            type = "item",
            slot = 10,
            rep = 'catcafecrafting',
            points = 1,
            threshold = 0,
            time = 6000,
            chance = 100,
        },
        [11] = {
            name = "mochiblue",
            label = "Mochi Bleu",
            amount = 50,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 1,
                ["blueberry"] = 1,
            },
            type = "item",
            slot = 11,
            rep = 'catcafecrafting',
            points = 1,
            threshold = 0,
            time = 6000,
            chance = 100,
        },
        [12] = {
            name = "mochigreen",
            label = "Mochi Vert",
            amount = 50,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 1,
                ["matcha"] = 1,
            },
            type = "item",
            slot = 12,
            rep = 'catcafecrafting',
            points = 1,
            threshold = 0,
            time = 6000,
            chance = 100,
        },
        [13] = {
            name = "mochiorange",
            label = "Mochi Orange",
            amount = 50,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 1,
                ["orange"] = 1,
            },
            type = "item",
            slot = 13,
            rep = 'catcafecrafting',
            points = 1,
            threshold = 0,
            time = 6000,
            chance = 100,
        },
        [14] = {
            name = "mochameow",
            label = "Mochi Chat Café",
            amount = 50,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 1,
                ["latte"] = 1,
            },
            type = "item",
            slot = 14,
            rep = 'catcafecrafting',
            points = 1,
            threshold = 0,
            time = 6000,
            chance = 100,
        },
        [15] = {
            name = "catdonut",
            label = "Donut Chat",
            amount = 50,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 1,
            },
            type = "item",
            slot = 15,
            rep = 'catcafecrafting',
            points = 1,
            threshold = 0,
            time = 7000,
            chance = 100,
        },
        [16] = {
            name = "catcookie",
            label = "Cookie Chat",
            amount = 50,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 1,
            },
            type = "item",
            slot = 16,
            rep = 'catcafecrafting',
            points = 1,
            threshold = 0,
            time = 5000,
            chance = 100,
        },
        [17] = {
            name = "catrice",
            label = "Riz Chat",
            amount = 50,
            info = {},
            costs = {
                ["rice"] = 1,
                ["nori"] = 1,
            },
            type = "item",
            slot = 17,
            rep = 'catcafecrafting',
            points = 1,
            threshold = 0,
            time = 5000,
            chance = 100,
        },
        [18] = {
            name = "catpizza",
            label = "Pizza Chat",
            amount = 50,
            info = {},
            costs = {
                ["flour"] = 2,
                ["tofu"] = 1,
            },
            type = "item",
            slot = 18,
            rep = 'catcafecrafting',
            points = 1,
            threshold = 0,
            time = 8000,
            chance = 100,
        },
        [19] = {
            name = "cake",
            label = "Gâteau",
            amount = 50,
            info = {},
            costs = {
                ["flour"] = 2,
                ["sugar"] = 2,
            },
            type = "item",
            slot = 19,
            rep = 'catcafecrafting',
            points = 1,
            threshold = 0,
            time = 9000,
            chance = 100,
        },
        [20] = {
            name = "cakepop",
            label = "Cake Pop",
            amount = 50,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 2,
            },
            type = "item",
            slot = 20,
            rep = 'catcafecrafting',
            points = 1,
            threshold = 0,
            time = 7000,
            chance = 100,
        },
        [21] = {
            name = "pawcakes",
            label = "Pancakes Patte",
            amount = 50,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 1,
            },
            type = "item",
            slot = 21,
            rep = 'catcafecrafting',
            points = 1,
            threshold = 0,
            time = 6000,
            chance = 100,
        },
        [22] = {
            name = "purrito",
            label = "Purrito",
            amount = 50,
            info = {},
            costs = {
                ["flour"] = 1,
                ["tofu"] = 1,
                ["rice"] = 1,
            },
            type = "item",
            slot = 22,
            rep = 'catcafecrafting',
            points = 1,
            threshold = 0,
            time = 7000,
            chance = 100,
        },
    }
    
    DisplayCraftingMenu(CustomCrafting)
end

-- Fonction de debug
function Debug(...)
    local args = {...}
    local text = ''
    for i = 1, #args do
        text = text .. ' ' .. tostring(args[i])
    end
    print('[DEBUG]' .. text)
end

-- Enregistrement des événements pour le click sur les items
RegisterNUICallback('UseSlot', function(data, cb)
    Debug('UseSlot triggered with data:', json.encode(data))
    if data.inventory == 'customcrafting' then
        Debug('Triggering craft for', data.slot)
        local craftingItemInfo = nil
        TriggerServerEvent('inventory:server:CraftItem', data.item, data.slot, 1)
    end
    cb('ok')
end)

RegisterNUICallback('TakeFromSlot', function(data, cb)
    Debug('TakeFromSlot triggered with data:', json.encode(data))
    if data.inventory == 'customcrafting' then
        Debug('Triggering craft for', data.slot)
        local craftingItemInfo = nil
        TriggerServerEvent('inventory:server:CraftItem', data.item, data.slot, 1)
    end
    cb('ok')
end)

-- Événement pour gérer directement le click sur un item dans le menu craft
RegisterNetEvent('inventory:client:CraftItem', function(itemData, amount)
    Debug('inventory:client:CraftItem triggered for', itemData.name, 'amount:', amount)
    TriggerEvent('qs-inventory:client:CraftItems', itemData.name, itemData.costs, itemData.points or 1, amount, nil, itemData.rep, itemData.time, itemData.chance)
end)

-- Ajout d'un événement pour le craft direct
RegisterNetEvent('inventory:client:CraftDirectly', function(item, slot, amount)
    Debug('inventory:client:CraftDirectly triggered for', item, 'slot:', slot, 'amount:', amount)
    TriggerServerEvent('inventory:server:GetCraftingItem', item, slot, amount)
end)

-- Fonction pour ouvrir le menu de craft suivant la doc de qs-inventory
function OpenCatCafeCraft()
    -- Configuration selon le format de qs-inventory
    local CustomCrafting = {
        [1] = {
            name = "bubbletea",
            amount = 10,
            info = {},
            costs = {
                ["burger_milk"] = 1,
                ["sugar"] = 1,
                ["boba"] = 1,
            },
            type = "item",
            slot = 1,
            threshold = 0,
            points = 1,
            time = 5000,
            chance = 100
        },
        [2] = {
            name = "bubbleteablue",
            amount = 10,
            info = {},
            costs = {
                ["burger_milk"] = 1,
                ["blueberry"] = 1,
                ["boba"] = 1,
            },
            type = "item",
            slot = 2,
            threshold = 0,
            points = 1,
            time = 5500,
            chance = 100
        },
        [3] = {
            name = "bubbleteagreen",
            amount = 10,
            info = {},
            costs = {
                ["matcha"] = 1,
                ["burger_milk"] = 1,
                ["boba"] = 1,
            },
            type = "item",
            slot = 3,
            threshold = 0,
            points = 1,
            time = 5500,
            chance = 100
        },
        [4] = {
            name = "bubbleteaorange",
            amount = 10,
            info = {},
            costs = {
                ["burger_milk"] = 1,
                ["orange"] = 1,
                ["boba"] = 1,
            },
            type = "item",
            slot = 4,
            threshold = 0,
            points = 1,
            time = 5500,
            chance = 100
        },
        [5] = {
            name = "bubbleteapink",
            amount = 10,
            info = {},
            costs = {
                ["burger_milk"] = 1,
                ["strawberry"] = 1,
                ["boba"] = 1,
            },
            type = "item",
            slot = 5,
            threshold = 0,
            points = 1,
            time = 5500,
            chance = 100
        },
        [6] = {
            name = "matcha",
            amount = 10,
            info = {},
            costs = {
                ["matcha"] = 1,
                ["burger_milk"] = 1,
                ["sugar"] = 1,
            },
            type = "item",
            slot = 6,
            threshold = 0,
            points = 1,
            time = 4500,
            chance = 100
        },
        [7] = {
            name = "ramen",
            amount = 10,
            info = {},
            costs = {
                ["noodles"] = 1,
                ["miso"] = 1,
                ["tofu"] = 1,
            },
            type = "item",
            slot = 7,
            threshold = 0,
            points = 1,
            time = 8000,
            chance = 100
        },
        [8] = {
            name = "noodlebowl",
            amount = 10,
            info = {},
            costs = {
                ["noodles"] = 1,
                ["miso"] = 1,
            },
            type = "item",
            slot = 8,
            threshold = 0,
            points = 1,
            time = 6000,
            chance = 100
        },
        [9] = {
            name = "bento",
            amount = 10,
            info = {},
            costs = {
                ["rice"] = 1,
                ["tofu"] = 1,
            },
            type = "item",
            slot = 9,
            threshold = 0,
            points = 1,
            time = 10000,
            chance = 100
        },
        [10] = {
            name = "mochipink",
            amount = 10,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 1,
                ["strawberry"] = 1,
            },
            type = "item",
            slot = 10,
            threshold = 0,
            points = 1,
            time = 6000,
            chance = 100
        },
        [11] = {
            name = "mochiblue",
            amount = 10,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 1,
                ["blueberry"] = 1,
            },
            type = "item",
            slot = 11,
            threshold = 0,
            points = 1,
            time = 6000,
            chance = 100
        },
        [12] = {
            name = "mochigreen",
            amount = 10,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 1,
                ["matcha"] = 1,
            },
            type = "item",
            slot = 12,
            threshold = 0,
            points = 1,
            time = 6000,
            chance = 100
        },
        [13] = {
            name = "mochiorange",
            amount = 10,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 1,
                ["orange"] = 1,
            },
            type = "item",
            slot = 13,
            threshold = 0,
            points = 1,
            time = 6000,
            chance = 100
        },
        [14] = {
            name = "mochameow",
            amount = 10,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 1,
                ["latte"] = 1,
            },
            type = "item",
            slot = 14,
            threshold = 0,
            points = 1,
            time = 6000,
            chance = 100
        },
        [15] = {
            name = "catdonut",
            amount = 10,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 1,
            },
            type = "item",
            slot = 15,
            threshold = 0,
            points = 1,
            time = 7000,
            chance = 100
        },
        [16] = {
            name = "catcookie",
            amount = 10,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 1,
            },
            type = "item",
            slot = 16,
            threshold = 0,
            points = 1,
            time = 5000,
            chance = 100
        },
        [17] = {
            name = "catrice",
            amount = 10,
            info = {},
            costs = {
                ["rice"] = 1,
                ["nori"] = 1,
            },
            type = "item",
            slot = 17,
            threshold = 0,
            points = 1,
            time = 5000,
            chance = 100
        },
        [18] = {
            name = "catpizza",
            amount = 10,
            info = {},
            costs = {
                ["flour"] = 2,
                ["tofu"] = 1,
            },
            type = "item",
            slot = 18,
            threshold = 0,
            points = 1,
            time = 8000,
            chance = 100
        },
        [19] = {
            name = "cake",
            amount = 10,
            info = {},
            costs = {
                ["flour"] = 2,
                ["sugar"] = 2,
            },
            type = "item",
            slot = 19,
            threshold = 0,
            points = 1,
            time = 9000,
            chance = 100
        },
        [20] = {
            name = "cakepop",
            amount = 10,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 2,
            },
            type = "item",
            slot = 20,
            threshold = 0,
            points = 1,
            time = 7000,
            chance = 100
        },
        [21] = {
            name = "pawcakes",
            amount = 10,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 1,
            },
            type = "item",
            slot = 21,
            threshold = 0,
            points = 1,
            time = 6000,
            chance = 100
        },
        [22] = {
            name = "purrito",
            amount = 10,
            info = {},
            costs = {
                ["flour"] = 1,
                ["tofu"] = 1,
                ["rice"] = 1,
            },
            type = "item",
            slot = 22,
            threshold = 0,
            points = 1,
            time = 7000,
            chance = 100
        },
    }

    -- Utiliser l'approche standard documentée dans qs-inventory
    local crafting = {
        label = 'Cat Café Craft',
        items = CustomCrafting 
    }
    
    TriggerServerEvent('inventory:server:SetInventoryData', CustomCrafting)
    TriggerServerEvent('inventory:server:OpenInventory', 'crafting', math.random(1, 999), crafting)
end

-- Fonction commune pour vérifier les ingrédients
function CheckIngredients(recipe)
    local hasItems = true
    local playerItems = QBCore.Functions.GetPlayerData().items
    
    for _, ingredient in ipairs(recipe.ingredients) do
        local hasItem = false
        for _, item in ipairs(playerItems) do
            if item.name == ingredient.item and item.amount >= ingredient.amount then
                hasItem = true
                break
            end
        end
        if not hasItem then
            hasItems = false
            break
        end
    end
    
    return hasItems
end

-- Fonction commune pour l'animation de craft
function PlayCraftingAnimation()
    local ped = PlayerPedId()
    TaskStartScenarioInPlace(ped, "PROP_HUMAN_BBQ", 0, true)
end

-- Fonction commune pour arrêter l'animation
function StopCraftingAnimation()
    local ped = PlayerPedId()
    ClearPedTasks(ped)
end

-- Event handler commun pour la tentative de craft
RegisterNetEvent('n-crafting:client:TryCraft')
AddEventHandler('n-crafting:client:TryCraft', function(data)
    local recipe = data.recipe
    if CheckIngredients(recipe) then
        PlayCraftingAnimation()
        QBCore.Functions.Progressbar("crafting_item", "Création en cours...", recipe.time, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            StopCraftingAnimation()
            TriggerServerEvent('n-crafting:server:FinishCraft', recipe)
        end, function() -- Cancel
            StopCraftingAnimation()
            QBCore.Functions.Notify("Création annulée", "error")
        end)
    else
        QBCore.Functions.Notify("Il vous manque des ingrédients!", "error")
    end
end)

-- Event handlers communs pour le succès/échec
RegisterNetEvent('n-crafting:client:CraftingSuccess')
AddEventHandler('n-crafting:client:CraftingSuccess', function(itemName)
    QBCore.Functions.Notify('Vous avez créé ' .. itemName, 'success')
end)

RegisterNetEvent('n-crafting:client:CraftingFailed')
AddEventHandler('n-crafting:client:CraftingFailed', function(message)
    QBCore.Functions.Notify(message, 'error')
end)

-- Event pour ouvrir l'inventaire
RegisterNetEvent('inventory:client:OpenInventory', function(name, id, other)
    if name == "crafting" then
        SetNuiFocus(true, true)
        -- Vous pouvez ajouter ici des animations de craft si nécessaire
    end
end)

-- Event pour fermer l'inventaire
RegisterNetEvent('inventory:client:CloseInventory', function()
    SetNuiFocus(false, false)
end)

-- Event pour la notification d'item
RegisterNetEvent('inventory:client:ItemBox', function(itemData, type)
    -- Vous pouvez personnaliser l'affichage des notifications ici si nécessaire
    if type == "add" then
        TriggerEvent('QBCore:Notify', "Vous avez reçu " .. itemData.label, "success")
    elseif type == "remove" then
        TriggerEvent('QBCore:Notify', "Vous avez utilisé " .. itemData.label, "error")
    end
end)