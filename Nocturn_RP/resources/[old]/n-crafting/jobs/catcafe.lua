local QBCore = exports['qb-core']:GetCoreObject()

-- Point d'accès via qb-target
CreateThread(function()
    exports['qb-target']:AddBoxZone("catcafecraft", vector3(-290.74, -84.33, 49.26), 1.5, 1.5, {
        name = "catcafecraft",
        heading = 0,
        debugPoly = false,
        minZ = 48.26,
        maxZ = 50.26,
    }, {
        options = {
            {
                type = "client",
                event = "catcafe:client:OpenCraft",
                icon = "fas fa-mug-hot",
                label = "Menu de Préparation",
                job = "catcafe",
            }
        },
        distance = 2.5
    })
end)

-- Event pour ouvrir le menu de crafting
RegisterNetEvent('catcafe:client:OpenCraft')
AddEventHandler('catcafe:client:OpenCraft', function()
    OpencatCrafting()
end)

-- Fonction pour ouvrir le menu de crafting
function OpencatCrafting()
    local CustomCrafting = {
        [1] = {
            name = 'bubbletea',
            amount = 10,
            info = {},
            costs = {
                ["burger_milk"] = 1,
                ["sugar"] = 1,
                ["boba"] = 1
            },
            type = "item",
            slot = 1,
            rep = 'attachmentcraftingrep',
            points = 1,
            threshold = 0,
            time = 5000,
            chance = 100
        },
        [2] = {
            name = 'bubbleteablue',
            amount = 10,
            info = {},
            costs = {
                ["burger_milk"] = 1,
                ["blueberry"] = 1,
                ["boba"] = 1
            },
            type = "item",
            slot = 2,
            threshold = 0,
            time = 5500,
            chance = 100
        },
        [3] = {
            name = 'bubbleteagreen',
            amount = 10,
            info = {},
            costs = {
                ["matcha"] = 1,
                ["burger_milk"] = 1,
                ["boba"] = 1
            },
            type = "item",
            slot = 3,
            threshold = 0,
            time = 4500,
            chance = 100
        },
        [4] = {
            name = 'bubbleteaorange',
            amount = 10,
            info = {},
            costs = {
                ["orange"] = 1,
                ["burger_milk"] = 1,
                ["boba"] = 1
            },
            type = "item",
            slot = 4,
            threshold = 0,
            time = 4500,
            chance = 100
        },
        [5] = {
            name = 'bubbleteapink',
            amount = 10,
            info = {},
            costs = {
                ["strawberry"] = 1,
                ["burger_milk"] = 1,
                ["boba"] = 1
            },
            type = "item",
            slot = 5,
            threshold = 0,
            time = 4500,
            chance = 100
        },
        [6] = {
            name = 'mochiblue',
            amount = 8,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 1,
                ["blueberry"] = 1
            },
            type = "item",
            slot = 6,
            threshold = 0,
            time = 6000,
            chance = 100
        },
        [7] = {
            name = 'mochigreen',
            amount = 8,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 1,
                ["matcha"] = 1
            },
            type = "item",
            slot = 7,
            threshold = 0,
            time = 6000,
            chance = 100
        },
        [8] = {
            name = 'mochiorange',
            amount = 8,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 1,
                ["orange"] = 1
            },
            type = "item",
            slot = 8,
            threshold = 0,
            time = 6000,
            chance = 100
        },
        [9] = {
            name = 'mochipink',
            amount = 8,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 1,
                ["strawberry"] = 1
            },
            type = "item",
            slot = 9,
            threshold = 0,
            time = 6000,
            chance = 100
        },
        [10] = {
            name = 'pawcakes',
            amount = 5,
            info = {},
            costs = {
                ["flour"] = 2,
                ["sugar"] = 1,
                ["burger_milk"] = 1
            },
            type = "item",
            slot = 10,
            threshold = 0,
            time = 7000,
            chance = 100
        },
        [11] = {
            name = 'catcookie',
            amount = 8,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 1,
                ["burger_milk"] = 1
            },
            type = "item",
            slot = 11,
            threshold = 0,
            time = 5000,
            chance = 100
        },
        [12] = {
            name = 'catdonut',
            amount = 6,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 2,
                ["burger_milk"] = 1
            },
            type = "item",
            slot = 12,
            threshold = 0,
            time = 6000,
            chance = 100
        },
        [13] = {
            name = 'catpizza',
            amount = 4,
            info = {},
            costs = {
                ["flour"] = 2,
                ["nori"] = 1,
                ["tofu"] = 1
            },
            type = "item",
            slot = 13,
            threshold = 0,
            time = 8000,
            chance = 100
        },
        [14] = {
            name = 'catrice',
            amount = 5,
            info = {},
            costs = {
                ["rice"] = 1,
                ["nori"] = 1
            },
            type = "item",
            slot = 14,
            threshold = 0,
            time = 4000,
            chance = 100
        },
        [15] = {
            name = 'mochameow',
            amount = 6,
            info = {},
            costs = {
                ["flour"] = 1,
                ["sugar"] = 1,
                ["coffee"] = 1
            },
            type = "item",
            slot = 15,
            threshold = 0,
            time = 6000,
            chance = 100
        },
        [16] = {
            name = 'purrito',
            amount = 4,
            info = {},
            costs = {
                ["flour"] = 1,
                ["rice"] = 1,
                ["tofu"] = 1
            },
            type = "item",
            slot = 16,
            threshold = 0,
            time = 7000,
            chance = 100
        },
        [17] = {
            name = 'ramen',
            amount = 3,
            info = {},
            costs = {
                ["noodles"] = 1,
                ["tofu"] = 1,
                ["nori"] = 1
            },
            type = "item",
            slot = 17,
            threshold = 0,
            time = 8000,
            chance = 100
        },
        [18] = {
            name = 'bento',
            amount = 3,
            info = {},
            costs = {
                ["rice"] = 1,
                ["tofu"] = 1,
                ["nori"] = 1
            },
            type = "item",
            slot = 18,
            threshold = 0,
            time = 8000,
            chance = 100
        },
        [19] = {
            name = 'miso',
            amount = 5,
            info = {},
            costs = {
                ["tofu"] = 1,
                ["nori"] = 1
            },
            type = "item",
            slot = 19,
            threshold = 0,
            time = 5000,
            chance = 100
        },
        [20] = {
            name = 'latte',
            amount = 6,
            info = {},
            costs = {
                ["coffee"] = 1,
                ["burger_milk"] = 1
            },
            type = "item",
            slot = 20,
            threshold = 0,
            time = 4000,
            chance = 100
        }
    }

    local crafting = {
        label = 'Craft',
        items = CustomCrafting
    }
    TriggerServerEvent('inventory:server:SetInventoryItems', CustomCrafting)
    TriggerServerEvent('inventory:server:OpenInventory', 'customcrafting', crafting.label, crafting)
end

-- -- Exemple d'export pour obtenir l'image d'un item
function GetItemImage(itemName) 
return "resources/[script]/[qs]/qs-inventory/html/images/" .. itemName .. ".png"
end

-- -- Enregistrement de l'export
-- exports('GetItemImage', GetItemImage) 