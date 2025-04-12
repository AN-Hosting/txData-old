return {
    {
        name = "Table d'Armurier",
        type = "weapons_table",
        coords = vector4(1188.36, 2658.73, 37.82, 309.67),
        useProps = true,
        prop = `prop_toolchest_05`,
        jobs = {
            ['lspd'] = 0,
            ['bcso'] = 0,
            ['police'] = 0
        },
        xpType = 'weaponcrafting',
        recipes = {
            {
                item = 'weapon_pistol',
                label = 'Pistolet',
                xpRequired = 0,
                xpGain = 10,
                requiredItems = {
                    { item = 'iron', amount = 1 },
                }
            },
            {
                item = 'armor',
                label = 'Gilet Pare-balles',
                xpRequired = 0,
                xpGain = 5,
                requiredItems = {
                    { item = 'iron', amount = 1 },
                }
            }
        }
    }
} 