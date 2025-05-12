--[[
    Configuring the Crafting System

    Le système de crafting a été désactivé car nous utilisons maintenant n-crafting.
    Tous les crafts ont été déplacés vers le système n-crafting pour une meilleure organisation.
]]

Config.Crafting = false -- Système de crafting désactivé car remplacé par n-crafting
Config.CraftingReputation = false
Config.ThresholdItems = false

-- Les recettes ont été déplacées vers n-crafting/jobs/

--[[
    Reputation System (Exclusive to QBCore Framework)

    The reputation system restricts certain crafting items until a player reaches a required level.
    This can be configured per item in the crafting recipes. For example, a higher-level item
    may require a specific amount of reputation points to unlock.

    Built-in Reputation Types for QBCore:
    - 'craftingrep' and 'attachmentcraftingrep'

    Set thresholds to only show items that match or exceed a player's reputation level.
]]

--[[
    Crafting Recipes Configuration

    Below is an example of how to define crafting items. Each entry contains:
    - Item name and amount crafted
    - Resource costs required for crafting
    - Slot position, item type, and crafting time
    - Reputation requirements and chance of successful crafting

    Customize each field to suit your server, and remember to set 'chance' carefully.
    Higher chance values reduce the likelihood of item breakage.
]]

-- Example Item Entry Structure
--[[
    [1] = {
        name = "weapon_pistol",    -- The name of the item being crafted
        amount = 50,               -- Quantity available for crafting
        info = {},                 -- Information field for metadata (ignore if unsure)
        costs = {                  -- List of required materials to craft this item
            ["iron"] = 80,
            ["metalscrap"] = 120,
            ["rubber"] = 8,
            ["steel"] = 133,
            ["lockpick"] = 5,
        },
        type = "weapon",           -- Specify if 'item' or 'weapon'
        slot = 1,                  -- Position slot in the crafting menu
        rep = 'attachmentcraftingrep', -- Required reputation type (QBCore only)
        points = 1,                -- Reputation points awarded on crafting (QBCore only)
        threshold = 0,             -- Required reputation level for visibility (QBCore only)
        time = 5500,               -- Crafting time in milliseconds
        chance = 100               -- Success chance percentage (1-100)
    },
]]

--[[
    Custom Event for Crafting
    External scripts can call the crafting system using the following sample structure.
    Set up custom crafting recipes and triggers based on your server events.
]]

-- Sample External Crafting Event
-- function OpenCrafting()
--     local CustomCrafting = {
--         [1] = {
--             name = "bubbletea",
--             label = "Bubble Tea",
--             amount = 10,
--             info = {},
--             costs = {
--                 ["burger_milk"] = 1,
--                 ["sugar"] = 1,
--                 ["boba"] = 1
--             },
--             type = "item",
--             slot = 1,
--             threshold = 0,
--             points = 1,
--             time = 5000,
--             chance = 100
--         },
--         [2] = {
--             name = "bubbleteablue",
--             label = "Bubble Tea Bleu",
--             amount = 10,
--             info = {},
--             costs = {
--                 ["burger_milk"] = 1,
--                 ["blueberry"] = 1,
--                 ["boba"] = 1
--             },
--             type = "item",
--             slot = 2,
--             threshold = 0,
--             points = 1,
--             time = 5500,
--             chance = 100
--         },
--         [3] = {
--             name = "matcha",
--             label = "Matcha Latte",
--             amount = 10,
--             info = {},
--             costs = {
--                 ["matcha"] = 1,
--                 ["burger_milk"] = 1,
--                 ["sugar"] = 1
--             },
--             type = "item",
--             slot = 3,
--             threshold = 0,
--             points = 1,
--             time = 4500,
--             chance = 100
--         },
--         [4] = {
--             name = "mochipink",
--             label = "Mochi Rose",
--             amount = 8,
--             info = {},
--             costs = {
--                 ["flour"] = 1,
--                 ["sugar"] = 1,
--                 ["strawberry"] = 1
--             },
--             type = "item",
--             slot = 4,
--             threshold = 0,
--             points = 1,
--             time = 6000,
--             chance = 100
--         },
--         [5] = {
--             name = "mochiblue",
--             label = "Mochi Bleu",
--             amount = 8,
--             info = {},
--             costs = {
--                 ["flour"] = 1,
--                 ["sugar"] = 1,
--                 ["blueberry"] = 1
--             },
--             type = "item",
--             slot = 5,
--             threshold = 0,
--             points = 1,
--             time = 6000,
--             chance = 100
--         }
--     }

--     local crafting = {
--         label = "Cat Café Kitchen",
--         slots = 20,
--         items = CustomCrafting
--     }

--     TriggerServerEvent("inventory:server:OpenInventory", "crafting", "Crafting_" .. math.random(1, 99999), crafting)
-- end

-- RegisterNetEvent("catcafe:client:OpenCrafting")
-- AddEventHandler("catcafe:client:OpenCrafting", function()
--     local PlayerData = QBCore.Functions.GetPlayerData()
--     if PlayerData.job.name == "catcafe" then
--         OpenCrafting()
--     end
-- end)

--[[ Crafting Tables Definition

    Define specific crafting tables for different jobs or locations:
    - Each table can have unique items and requirements.
    - You can control access based on job roles, grades, or specific blip visibility on the map.
]]

Config.CraftingTables = {
    [1] = {
        name = 'Police Crafting',
        isjob = 'lspd',
        grades = 'all',
        text = '[E] - Police Craft',
        blip = {
            enabled = true,
            title = 'Police Crafting',
            scale = 1.0,
            display = 4,
            colour = 0,
            id = 365
        },
        location = vec3(452.11, -988.87, 23.95),
        items = {
            [1] = {
                name = 'weapon_pistol',
                amount = 50,
                info = {},
                costs = {
                    ['iron'] = 1,
                    --[[ ['metalscrap'] = 70,
                    ['rubber'] = 8,
                    ['steel'] = 60,
                    ['lockpick'] = 5, ]]
                },
                type = 'weapon',
                slot = 1,
                rep = 'attachmentcraftingrep',
                points = 1,
                threshold = 0,
                time = 5500,
                chance = 100
            },
            --[[ [2] = {
                name = 'weapon_smg',
                amount = 1,
                info = {},
                costs = {
                    ['iron'] = 80,
                    ['metalscrap'] = 120,
                    ['rubber'] = 10,
                    ['steel'] = 65,
                    ['lockpick'] = 10,
                },
                type = 'weapon',
                slot = 2,
                rep = 'attachmentcraftingrep',
                points = 1,
                threshold = 0,
                time = 8500,
                chance = 100
            },
            [3] = {
                name = 'weapon_carbinerifle',
                amount = 1,
                info = {},
                costs = {
                    ['iron'] = 120,
                    ['metalscrap'] = 120,
                    ['rubber'] = 20,
                    ['steel'] = 90,
                    ['lockpick'] = 14,
                },
                type = 'weapon',
                slot = 3,
                rep = 'craftingrep',
                points = 2,
                threshold = 0,
                time = 12000,
                chance = 100
            } ]]
        }
    },
    [2] = {
        name = 'Attachment Crafting',
        isjob = false,
        grades = 'all',
        text = '[E] - Craft Attachment',
        blip = {
            enabled = true,
            title = 'Attachment Crafting',
            scale = 1.0,
            display = 4,
            colour = 0,
            id = 365
        },
        location = vec3(90.303299, 3745.503418, 39.771484),
        items = {
            [1] = {
                name = 'pistol_extendedclip',
                amount = 50,
                info = {},
                costs = {
                    ['metalscrap'] = 140,
                    ['steel'] = 250,
                    ['rubber'] = 60,
                },
                type = 'item',
                slot = 1,
                rep = 'attachmentcraftingrep',
                points = 1,
                threshold = 0,
                time = 8000,
                chance = 90
            },
            [2] = {
                name = 'pistol_suppressor',
                amount = 50,
                info = {},
                costs = {
                    ['metalscrap'] = 165,
                    ['steel'] = 285,
                    ['rubber'] = 75,
                },
                type = 'item',
                slot = 2,
                rep = 'attachmentcraftingrep',
                points = 1,
                threshold = 0,
                time = 8000,
                chance = 90
            },
        }
    },
    [3] = {
        name = 'Cat Café Crafting',
        isjob = 'catcafe',
        grades = 'all',
        text = '[E] - Cat Café Crafting',
        blip = {
            enabled = true,
            title = 'Cat Café Kitchen',
            scale = 0.8,
            display = 4,
            colour = 9,
            id = 89
        },
        location = vector3(-290.69, -83.71, 49.5),
        items = {
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
    },
    [4] = {
        name = 'Burgershot Kitchen',
        isjob = 'burgershot',
        grades = 'all',
        text = '[E] - Burgershot Cuisine',
        blip = {
            enabled = true,
            title = 'Burgershot Kitchen',
            scale = 0.8,
            display = 4,
            colour = 1,
            id = 106
        },
        location = vector3(1449.75, 3569.02, 36.9),
        items = {
            [1] = {
                name = "bsbleeder",
                label = "Bleeder Burger",
                amount = 10,
                info = {},
                costs = {
                    ["bread"] = 1,
                    ["meat"] = 1,
                    ["bslettuce"] = 1,
                    ["bscheese"] = 1
                },
                type = "item",
                slot = 1,
                threshold = 0,
                points = 1,
                time = 5000,
                chance = 100
            },
            [2] = {
                name = "bsmoneyshot",
                label = "Moneyshot Burger",
                amount = 10,
                info = {},
                costs = {
                    ["bread"] = 1,
                    ["meat"] = 2,
                    ["bslettuce"] = 1,
                    ["bscheese"] = 2
                },
                type = "item",
                slot = 2,
                threshold = 0,
                points = 1,
                time = 6000,
                chance = 100
            },
            [3] = {
                name = "bstorpedo",
                label = "Torpedo Burger",
                amount = 10,
                info = {},
                costs = {
                    ["bread"] = 1,
                    ["meat"] = 1,
                    ["bscheese"] = 1
                },
                type = "item",
                slot = 3,
                threshold = 0,
                points = 1,
                time = 4000,
                chance = 100
            },
            [4] = {
                name = "bsheartstopper",
                label = "Heartstopper Burger",
                amount = 10,
                info = {},
                costs = {
                    ["bread"] = 1,
                    ["meat"] = 3,
                    ["bscheese"] = 3,
                    ["bslettuce"] = 1
                },
                type = "item",
                slot = 4,
                threshold = 0,
                points = 1,
                time = 7000,
                chance = 100
            }
        }
    }
}
