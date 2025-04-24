Config = {}

-- Emplacements des tables de craft
Config.CraftingLocations = {
    {
        coords = vector3(-1146.77, -1513.32, 10.63),
        heading = 180.0,
        type = "weapon",
        model = "a_m_m_hillbilly_01",
        label = "Fabricant d'armes"
    },
    {
        coords = vector3(1020.16, -2404.96, 30.12),
        heading = 90.0,
        type = "drugs",
        model = "a_m_m_eastsa_02",
        label = "Laboratoire"
    }
}

-- Recettes de craft
Config.Recipes = {
    weapon = {
        label = "Fabrication d'armes",
        items = {
            [1] = {
                item = "weapon_pistol",
                label = "Pistolet",
                amount = 1,
                ingredients = {
                    ["metalscrap"] = 50,
                    ["steel"] = 30,
                    ["rubber"] = 20
                },
                time = 20000, -- temps en ms
                threshold = 0, -- niveau minimum requis
                points = 1, -- points gagnés après craft
                chance = 100 -- pourcentage de réussite
            }
        }
    },
    drugs = {
        label = "Laboratoire",
        items = {
            [1] = {
                item = "weed_brick",
                label = "Paquet de weed",
                amount = 1,
                ingredients = {
                    ["weed"] = 10,
                    ["plastic"] = 5
                },
                time = 15000,
                threshold = 0,
                points = 1,
                chance = 100
            }
        }
    }
} 