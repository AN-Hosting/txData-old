local QBCore = exports['qb-core']:GetCoreObject()

-- Point d'accès via qb-target
CreateThread(function()
    exports['qb-target']:AddBoxZone("burgershotcraft", vector3(1449.75, 3569.02, 36.9), 1.5, 1.5, {
        name = "burgershotcraft",
        heading = 0,
        debugPoly = false,
        minZ = 35.9,
        maxZ = 37.9,
    }, {
        options = {
            {
                type = "client",
                event = "burgershot:client:OpenCraft",
                icon = "fas fa-hamburger",
                label = "Menu de Cuisine",
                job = "burgershot",
            }
        },
        distance = 2.5
    })
end)

-- Event pour ouvrir le menu de crafting
RegisterNetEvent('burgershot:client:OpenCraft')
AddEventHandler('burgershot:client:OpenCraft', function()
    local crafting = {
        label = "Cuisine Burgershot",
        slots = 15,
        items = {
            [1] = {
                name = "bsbleeder",
                amount = 50,
                info = {},
                costs = {
                    ["bread"] = 1,
                    ["bslettuce"] = 1,
                    ["bscheese"] = 1,
                    ["meat"] = 1
                },
                type = "item",
                slot = 1,
                threshold = 0,
                points = 1,
                time = 5000,
                label = "Burger Bleeder"
            },
            [2] = {
                name = "bsmoneyshot",
                amount = 50,
                info = {},
                costs = {
                    ["bread"] = 1,
                    ["bslettuce"] = 1,
                    ["bscheese"] = 2,
                    ["meat"] = 2
                },
                type = "item",
                slot = 2,
                threshold = 0,
                points = 1,
                time = 6000,
                label = "Moneyshot"
            },
            [3] = {
                name = "bstorpedo",
                amount = 50,
                info = {},
                costs = {
                    ["bread"] = 1,
                    ["bscheese"] = 1,
                    ["meat"] = 1
                },
                type = "item",
                slot = 3,
                threshold = 0,
                points = 1,
                time = 4000,
                label = "Torpedo"
            },
            [4] = {
                name = "bsheartstopper",
                amount = 50,
                info = {},
                costs = {
                    ["bread"] = 1,
                    ["bslettuce"] = 1,
                    ["bscheese"] = 3,
                    ["meat"] = 3
                },
                type = "item",
                slot = 4,
                threshold = 0,
                points = 1,
                time = 7000,
                label = "Heartstopper"
            },
            [5] = {
                name = "bsfries",
                amount = 50,
                info = {},
                costs = {
                    ["bscarrot"] = 1
                },
                type = "item",
                slot = 5,
                threshold = 0,
                points = 1,
                time = 4000,
                label = "Frites"
            },
            [6] = {
                name = "bsicecream",
                amount = 50,
                info = {},
                costs = {
                    ["milk"] = 1,
                    ["sugar"] = 1
                },
                type = "item",
                slot = 6,
                threshold = 0,
                points = 1,
                time = 4000,
                label = "Glace"
            },
            [7] = {
                name = "bsmilkshake",
                amount = 50,
                info = {},
                costs = {
                    ["milk"] = 2,
                    ["sugar"] = 1
                },
                type = "item",
                slot = 7,
                threshold = 0,
                points = 1,
                time = 4000,
                label = "Milkshake"
            },
            [8] = {
                name = "bscreampie",
                amount = 50,
                info = {},
                costs = {
                    ["milk"] = 1,
                    ["sugar"] = 1,
                    ["flour"] = 1
                },
                type = "item",
                slot = 8,
                threshold = 0,
                points = 1,
                time = 5000,
                label = "Tarte à la crème"
            },
            [9] = {
                name = "bsmysteryburger",
                amount = 50,
                info = {},
                costs = {
                    ["bread"] = 1,
                    ["bslettuce"] = 1,
                    ["bscheese"] = 1,
                    ["meat"] = 1,
                    ["bsmushroom"] = 1
                },
                type = "item",
                slot = 9,
                threshold = 0,
                points = 1,
                time = 6000,
                label = "Burger Mystère"
            },
            [10] = {
                name = "bsnamuh",
                amount = 50,
                info = {},
                costs = {
                    ["bread"] = 1,
                    ["bslettuce"] = 1,
                    ["bscheese"] = 1,
                    ["meat"] = 2
                },
                type = "item",
                slot = 10,
                threshold = 0,
                points = 1,
                time = 5500,
                label = "Namuh"
            },
            [11] = {
                name = "bsdonut",
                amount = 50,
                info = {},
                costs = {
                    ["flour"] = 1,
                    ["sugar"] = 1
                },
                type = "item",
                slot = 11,
                threshold = 0,
                points = 1,
                time = 4000,
                label = "Donut"
            },
            [12] = {
                name = "bscoffee",
                amount = 50,
                info = {},
                costs = {
                    ["bscoffeebeans"] = 1,
                    ["cup"] = 1,
                    ["water"] = 1
                },
                type = "item",
                slot = 12,
                threshold = 0,
                points = 1,
                time = 3000,
                label = "Café"
            },
            [13] = {
                name = "bssoda",
                amount = 50,
                info = {},
                costs = {
                    ["cup"] = 1,
                    ["water"] = 1,
                    ["sugar"] = 1
                },
                type = "item",
                slot = 13,
                threshold = 0,
                points = 1,
                time = 3000,
                label = "Soda"
            },
            [14] = {
                name = "bsweiner",
                amount = 50,
                info = {},
                costs = {
                    ["bread"] = 1,
                    ["meat"] = 1
                },
                type = "item",
                slot = 14,
                threshold = 0,
                points = 1,
                time = 4000,
                label = "Hot-dog"
            },
            [15] = {
                name = "chickensalad",
                amount = 50,
                info = {},
                costs = {
                    ["bslettuce"] = 2,
                    ["chicken"] = 1
                },
                type = "item",
                slot = 15,
                threshold = 0,
                points = 1,
                time = 4000,
                label = "Salade de poulet"
            }
        }
    }
    
    TriggerServerEvent("inventory:server:OpenInventory", "crafting", math.random(1, 99999), crafting)
end) 