return {
    {
        name = "Table Médicale",
        type = "medical_table",
        coords = vector4(1181.89, 2650.28, 37.83, 349.28),
        useProps = true,
        prop = `prop_toolchest_05`,
        jobs = {
            ['ambulance'] = 0,
            ['doctor'] = 0
        },
        recipes = {
            {
                item = 'bandage',
                label = 'Bandages',
                xpRequired = 0,
                requiredItems = {
                    { item = 'fabric', amount = 2 },
                    { item = 'cotton', amount = 1 }
                }
            },
            {
                item = 'firstaid',
                label = 'Kit de Premier Secours',
                xpRequired = 10,
                requiredItems = {
                    { item = 'bandage', amount = 2 },
                    { item = 'painkillers', amount = 1 }
                }
            }
        }
    }
} 