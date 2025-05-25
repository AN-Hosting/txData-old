
Config = {}
Config.Debug = false

-- ██╗░░░██╗████████╗██╗██╗░░░░░██╗████████╗██╗░░░██╗
-- ██║░░░██║╚══██╔══╝██║██║░░░░░██║╚══██╔══╝╚██╗░██╔╝
-- ██║░░░██║░░░██║░░░██║██║░░░░░██║░░░██║░░░░╚████╔╝░
-- ██║░░░██║░░░██║░░░██║██║░░░░░██║░░░██║░░░░░╚██╔╝░░
-- ╚██████╔╝░░░██║░░░██║███████╗██║░░░██║░░░░░░██║░░░
-- ░╚═════╝░░░░╚═╝░░░╚═╝╚══════╝╚═╝░░░╚═╝░░░░░░╚═╝░░░

Config.CoreName = "qb-core" -- Core name
Config.Job = "unicorn" -- Job
Config.JimPayments = false -- Using jim-payments?
Config.Target = "qb-target" -- Name of your resource qb-target
Config.Input = "qb-input" -- Name of your resource qb-input
Config.InvLink = "qb-inventory/html/images/" -- Your directory images inventory
Config.Bossmenu = "qb-bossmenu:client:OpenMenu" -- Your trigger to open boss menu

-- ██████╗░██╗░░░░░██╗██████╗░
-- ██╔══██╗██║░░░░░██║██╔══██╗
-- ██████╦╝██║░░░░░██║██████╔╝
-- ██╔══██╗██║░░░░░██║██╔═══╝░
-- ██████╦╝███████╗██║██║░░░░░
-- ╚═════╝░╚══════╝╚═╝╚═╝░░░░░

Config.Blip = {
	Enable = true,
	Location = vector3(126.85, -1296.29, 29.27),
	Sprite = 93,
	Display = 2,
	Scale = 0.7,
	Colour = 27,
	Name = "Vanilla Unicorn",
}


-- ░██████╗████████╗░█████╗░░██████╗██╗░░██╗
-- ██╔════╝╚══██╔══╝██╔══██╗██╔════╝██║░░██║
-- ╚█████╗░░░░██║░░░███████║╚█████╗░███████║
-- ░╚═══██╗░░░██║░░░██╔══██║░╚═══██╗██╔══██║
-- ██████╔╝░░░██║░░░██║░░██║██████╔╝██║░░██║
-- ╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝

Config.Stash = {
	StashInvTrigger = "inventory:client:SetCurrentStash",
	OpenInvTrigger = "inventory:server:OpenInventory",
	NameOfStash = "Unicorn_Storage",
	MaxWeighStash = 1000000,
	MaxSlotsStash = 50,
}


-- ██████╗░██╗██╗░░░░░██╗░░░░░██╗███╗░░██╗░██████╗░
-- ██╔══██╗██║██║░░░░░██║░░░░░██║████╗░██║██╔════╝░
-- ██████╦╝██║██║░░░░░██║░░░░░██║██╔██╗██║██║░░██╗░
-- ██╔══██╗██║██║░░░░░██║░░░░░██║██║╚████║██║░░╚██╗
-- ██████╦╝██║███████╗███████╗██║██║░╚███║╚██████╔╝
-- ╚═════╝░╚═╝╚══════╝╚══════╝╚═╝╚═╝░░╚══╝░╚═════╝░

Config.Billing = {
	EnableCommand = false,
	Command = "billunicorn",
}


-- ░██████╗██╗░░██╗░█████╗░██████╗░
-- ██╔════╝██║░░██║██╔══██╗██╔══██╗
-- ╚█████╗░███████║██║░░██║██████╔╝
-- ░╚═══██╗██╔══██║██║░░██║██╔═══╝░
-- ██████╔ ██║░░██║╚█████╔╝██║░░░░░
-- ╚═════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░░░░

Config.Items = {
    -- [1] = { name = "banana", price = 0, amount = 10, info = {}, type = "item", slot = 1 },
    -- [2] = { name = "caramel", price = 0, amount = 10, info = {}, type = "item", slot = 2, },
    -- [3] = { name = "coconut", price = 0, amount = 10, info = {}, type = "item", slot = 3, },
    -- [4] = { name = "orange", price = 0, amount = 10, info = {}, type = "item", slot = 4, },
    -- [5] = { name = "kiwi", price = 0, amount = 10, info = {}, type = "item", slot = 5, },
    -- [6] = { name = "sugar", price = 0, amount = 10, info = {}, type = "item", slot = 6, },
    -- [7] = { name = "strawberry", price = 0, amount = 10, info = {}, type = "item", slot = 7, },
    -- [8] = { name = "watermelon", price = 0, amount = 10, info = {}, type = "item", slot = 8, },
    -- [9] = { name = "water", price = 0, amount = 10, info = {}, type = "item", slot = 9, }, --
    -- [10] = { name = "daquiri", price = 0, amount = 10, info = {}, type = "item", slot = 10, },
    -- [11] = { name = "tequila", price = 0, amount = 10, info = {}, type = "item", slot = 11, }
}

-- ░█████╗░██████╗░░█████╗░███████╗████████╗░██████╗
-- ██╔══██╗██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝
-- ██║░░╚═╝██████╔╝███████║█████╗░░░░░██║░░░╚█████╗░
-- ██║░░██╗██╔══██╗██╔══██║██╔══╝░░░░░██║░░░░╚═══██╗
-- ╚█████╔╝██║░░██║██║░░██║██║░░░░░░░░██║░░░██████╔╝
-- ░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░░░░╚═╝░░░╚═════╝░

-- Craft non-alcoholic drinks
Config.NonAlcoholic = {
    ["berry_hydrating"] = { 
        hash = "berry_hydrating", 
        label = "Hydrating",
        materials = {
            [1] = { item = "water",      amount = 1 },
            [2] = { item = "strawberry", amount = 1 },
            [3] = { item = "sugar",      amount = 1 },
        }
    },
    ["caramel"] = { 
        hash = "caramel", 
        label = "Caramel",
        materials = {
            [1] = { item = "water",      amount = 1 },
            [2] = { item = "sugar", amount = 1 },
        }
    },
    ["island_breeze"] = { 
        hash = "island_breeze", 
        label = "Island Breeze",
        materials = {
            [1] = { item = "strawberry",  amount = 2 },
            [2] = { item = "sugar",       amount = 1 },
            [3] = { item = "water",       amount = 2 },
        }
    },
    ["just_peachy"] = { 
        hash = "just_peachy", 
        label = "Just Peachy",
        materials = {
            [1] = { item = "water",       amount = 1 },
            [2] = { item = "caramel",     amount = 1 },
            [3] = { item = "sugar",       amount = 1 },
        }
    },
    ["orange_juice"] = { 
        hash = "orange_juice", 
        label = "Orange Juice",
        materials = {
            [1] = { item = "orange",    amount = 1 },
        }
    },
    ["strawberry_juice"] = { 
        hash = "strawberry_juice", 
        label = "Strawberry Juice",
        materials = {
            [1] = { item = "strawberry",    amount = 1 },
        }
    },
    ["banana_juice"] = { 
        hash = "banana_juice", 
        label = "Banana Juice",
        materials = {
            [1] = { item = "banana",    amount = 1 },
        }
    },
}


-- Craft alcoholic drinks

Config.Alcoholic = {
    ["cocktail"] = { 
        hash = "cocktail", 
        label = "Cocktail",
        materials = {
            [1] = { item = "whiskey",      amount = 1 },
            [2] = { item = "strawberry", amount = 1 },
            [3] = { item = "sugar",      amount = 1 },
            [4] = { item = "vodka",     amount = 1 },
        }
    },
    ["coconut_drink"] = { 
        hash = "coconut_drink", 
        label = "Coconut Drink",
        materials = {
            [1] = { item = "water",       amount = 1 },
            [2] = { item = "coconut",     amount = 1 },
            [3] = { item = "sugar",       amount = 1 },
            [4] = { item = "tequila",     amount = 1 },
        }
    },
    ["island_fantasy"] = { 
        hash = "island_fantasy", 
        label = "Island Fantasy",
        materials = {
            [1] = { item = "orange",      amount = 1 },
            [2] = { item = "sugar",       amount = 1 },
            [3] = { item = "water",       amount = 1 },
            [4] = { item = "tequila",     amount = 1 },
        }
    },
    ["kamikaze"] = { 
        hash = "kamikaze", 
        label = "Kamikaze",
        materials = {
            [1] = { item = "water",       amount = 1 },
            [2] = { item = "sugar",       amount = 1 },
            [3] = { item = "tequila",     amount = 1 },
        }
    },
    -- ["redhot_daquiri"] = { 
    --     hash = "redhot_daquiri", 
    --     label = "Red Hot Daquiri",
    --     materials = {
    --         [1] = { item = "water",           amount = 1 },
    --         [2] = { item = "sugar",           amount = 1 },
    --         [3] = { item = "watermelon",      amount = 1 },
    --         [4] = { item = "daquiri",         amount = 1 },
    --     }
    -- },
}

