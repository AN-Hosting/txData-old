--[[
    Configuring the Crafting System

    The qs-inventory's crafting system is entirely independent, meaning it operates without
    needing additional DLC. This crafting system is designed to be intuitive and adaptable
    to your server needs, allowing you to create complex recipes and control crafting outcomes
    with ease.

    Noteworthy features:
    - Customizable success rates per item (1-100%), which sets the probability of successful crafting.
    - Reputation-based access to crafting recipes (specific to QBCore) that allows items to unlock
      based on a player's reputation points.

    Read through each section to understand the structure of the system, and check examples below
    for reference on crafting items.

    **Important:** If you use the Reputation system, be sure to configure the 'rep' fields and thresholds
    based on your server's design.
]]

Config.Crafting = true -- Toggle the crafting system on or off

--[[
    Reputation System (Exclusive to QBCore Framework)

    The reputation system restricts certain crafting items until a player reaches a required level.
    This can be configured per item in the crafting recipes. For example, a higher-level item
    may require a specific amount of reputation points to unlock.

    Built-in Reputation Types for QBCore:
    - 'craftingrep' and 'attachmentcraftingrep'

    Set thresholds to only show items that match or exceed a player's reputation level.
]]

Config.CraftingReputation = false -- Enable to activate reputation gating for crafting items (QBCore only)
Config.ThresholdItems = false     -- Items only visible if rep >= threshold; QBCore-only feature

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
--[[function OpenCrafting()
    local CustomCrafting = {
        [1] = {
            name = 'weapon_pistol',
            amount = 50,
            info = {},
            costs = { ['tosti'] = 1 },
            type = 'weapon',
            slot = 1,
            rep = 'attachmentcraftingrep',
            points = 1,
            threshold = 0,
            time = 5500,
            chance = 100
        },
        [2] = {
            name = 'water_bottle',
            amount = 1,
            info = {},
            costs = { ['tosti'] = 1 },
            type = 'item',
            slot = 2,
            rep = 'attachmentcraftingrep',
            points = 1,
            threshold = 0,
            time = 8500,
            chance = 100
        },
    }

    local crafting = {
        label = 'Craft',
        items = exports['qs-inventory']:SetUpCrafing(CustomCrafting)
    }
    TriggerServerEvent('inventory:server:SetInventoryItems', CustomCrafting)
    TriggerServerEvent('inventory:server:OpenInventory', 'customcrafting', crafting.label, crafting)
end]]

--[[ Crafting Tables Definition

    Define specific crafting tables for different jobs or locations:
    - Each table can have unique items and requirements.
    - You can control access based on job roles, grades, or specific blip visibility on the map.
]]

Config.CraftingTables = {
    [1] = {
        name = 'Cat Café Crafting',
        isjob = 'catcafe',
        grades = 'all',
        text = '[E] - Cat Café Crafting',
        blip = {
            enabled = true,
            title = 'Cat Café Crafting',
            scale = 1.0,
            display = 4,
            colour = 0,
            id = 365
        },
        location = vec3(-287.16, -78.21, 49.5), -- À ajuster selon tes besoinsvector3(-287.16, -78.21, 49.5)
        items = {
            -- Mochis
            [1] = {
                name = 'bmochi',
                amount = 1,
                info = {},
                costs = {
                    ['flour'] = 2,
                    ['sugar'] = 1,
                    ['blueberry'] = 2,
                },
                type = 'item',
                slot = 1,
                time = 5000,
                chance = 100
            },
            [2] = {
                name = 'pmochi',
                amount = 1,
                info = {},
                costs = {
                    ['flour'] = 2,
                    ['sugar'] = 1,
                    ['strawberry'] = 2,
                },
                type = 'item',
                slot = 2,
                time = 5000,
                chance = 100
            },
            [3] = {
                name = 'gmochi',
                amount = 1,
                info = {},
                costs = {
                    ['flour'] = 2,
                    ['sugar'] = 1,
                    ['mint'] = 2,
                },
                type = 'item',
                slot = 3,
                time = 5000,
                chance = 100
            },
            [4] = {
                name = 'omochi',
                amount = 1,
                info = {},
                costs = {
                    ['flour'] = 2,
                    ['sugar'] = 1,
                    ['orange'] = 2,
                },
                type = 'item',
                slot = 4,
                time = 5000,
                chance = 100
            },
            -- Boba Teas
            [5] = {
                name = 'bobatea',
                amount = 1,
                info = {},
                costs = {
                    ['milk'] = 1,
                    ['sugar'] = 1,
                    ['boba'] = 2,
                },
                type = 'item',
                slot = 5,
                time = 4000,
                chance = 100
            },
            [6] = {
                name = 'bbobatea',
                amount = 1,
                info = {},
                costs = {
                    ['milk'] = 1,
                    ['sugar'] = 1,
                    ['boba'] = 2,
                    ['blueberry'] = 1,
                },
                type = 'item',
                slot = 6,
                time = 4000,
                chance = 100
            },
            [7] = {
                name = 'gbobatea',
                amount = 1,
                info = {},
                costs = {
                    ['milk'] = 1,
                    ['sugar'] = 1,
                    ['boba'] = 2,
                    ['mint'] = 1,
                },
                type = 'item',
                slot = 7,
                time = 4000,
                chance = 100
            },
            [8] = {
                name = 'pbobatea',
                amount = 1,
                info = {},
                costs = {
                    ['milk'] = 1,
                    ['sugar'] = 1,
                    ['boba'] = 2,
                    ['strawberry'] = 1,
                },
                type = 'item',
                slot = 8,
                time = 4000,
                chance = 100
            },
            [9] = {
                name = 'obobatea',
                amount = 1,
                info = {},
                costs = {
                    ['milk'] = 1,
                    ['sugar'] = 1,
                    ['boba'] = 2,
                    ['orange'] = 1,
                },
                type = 'item',
                slot = 9,
                time = 4000,
                chance = 100
            },
            -- Autres boissons
            [10] = {
                name = 'nekolatte',
                amount = 1,
                info = {},
                costs = {
                    ['milk'] = 1,
                    ['sugar'] = 1,
                },
                type = 'item',
                slot = 10,
                time = 4000,
                chance = 100
            },
            [11] = {
                name = 'sake',
                amount = 1,
                info = {},
                costs = {
                    ['rice'] = 2,
                    ['sugar'] = 1,
                },
                type = 'item',
                slot = 11,
                time = 6000,
                chance = 100
            },
            -- Plats
            [12] = {
                name = 'miso',
                amount = 1,
                info = {},
                costs = {
                    ['tofu'] = 1,
                    ['nori'] = 1,
                },
                type = 'item',
                slot = 12,
                time = 5000,
                chance = 100
            },
            [13] = {
                name = 'cake',
                amount = 1,
                info = {},
                costs = {
                    ['flour'] = 2,
                    ['sugar'] = 2,
                    ['strawberry'] = 3,
                    ['milk'] = 1,
                },
                type = 'item',
                slot = 13,
                time = 8000,
                chance = 100
            },
            [14] = {
                name = 'bento',
                amount = 1,
                info = {},
                costs = {
                    ['rice'] = 2,
                    ['tofu'] = 1,
                    ['nori'] = 1,
                },
                type = 'item',
                slot = 14,
                time = 7000,
                chance = 100
            },
            [15] = {
                name = 'riceball',
                amount = 1,
                info = {},
                costs = {
                    ['rice'] = 1,
                    ['nori'] = 1,
                },
                type = 'item',
                slot = 15,
                time = 4000,
                chance = 100
            },
            [16] = {
                name = 'nekocookie',
                amount = 1,
                info = {},
                costs = {
                    ['flour'] = 1,
                    ['sugar'] = 1,
                    ['milk'] = 1,
                },
                type = 'item',
                slot = 16,
                time = 4000,
                chance = 100
            },
            [17] = {
                name = 'nekodonut',
                amount = 1,
                info = {},
                costs = {
                    ['flour'] = 1,
                    ['sugar'] = 1,
                    ['milk'] = 1,
                },
                type = 'item',
                slot = 17,
                time = 4000,
                chance = 100
            },
            [18] = {
                name = 'mocha',
                amount = 1,
                info = {},
                costs = {
                    ['milk'] = 1,
                    ['sugar'] = 1,
                },
                type = 'item',
                slot = 18,
                time = 4000,
                chance = 100
            },
            [19] = {
                name = 'cakepop',
                amount = 1,
                info = {},
                costs = {
                    ['flour'] = 1,
                    ['sugar'] = 1,
                    ['milk'] = 1,
                },
                type = 'item',
                slot = 19,
                time = 4000,
                chance = 100
            },
            [20] = {
                name = 'pancake',
                amount = 1,
                info = {},
                costs = {
                    ['flour'] = 2,
                    ['sugar'] = 1,
                    ['milk'] = 1,
                },
                type = 'item',
                slot = 20,
                time = 5000,
                chance = 100
            },
            [21] = {
                name = 'pizza',
                amount = 1,
                info = {},
                costs = {
                    ['flour'] = 2,
                    ['tofu'] = 1,
                },
                type = 'item',
                slot = 21,
                time = 7000,
                chance = 100
            },
            [22] = {
                name = 'purrito',
                amount = 1,
                info = {},
                costs = {
                    ['flour'] = 2,
                    ['tofu'] = 1,
                    ['nori'] = 1,
                },
                type = 'item',
                slot = 22,
                time = 6000,
                chance = 100
            },
            [23] = {
                name = 'noodlebowl',
                amount = 1,
                info = {},
                costs = {
                    ['noodles'] = 1,
                    ['tofu'] = 1,
                },
                type = 'item',
                slot = 23,
                time = 5000,
                chance = 100
            },
            [24] = {
                name = 'ramen',
                amount = 1,
                info = {},
                costs = {
                    ['noodles'] = 1,
                    ['tofu'] = 1,
                    ['nori'] = 1,
                },
                type = 'item',
                slot = 24,
                time = 6000,
                chance = 100
            }
        }
    }
}
