return {
    {
        name = "Burgershot - Cuisine",
        type = "burgershot_kitchen",
        coords = vector4(1443.77, 3566.61, 36.95, 74.47),
        useProps = false,
        jobs = {
            ['burgershot'] = 0
        },
        recipes = {
            {
                item = 'bsbleeder',
                label = 'Burger Bleeder',
                xpRequired = 0,
                requiredItems = {
                    { item = 'bread', amount = 1 },
                    { item = 'bslettuce', amount = 1 },
                    { item = 'bscheese', amount = 1 },
                    { item = 'meat', amount = 1 }
                }
            },
            {
                item = 'bsmoneyshot',
                label = 'Moneyshot',
                xpRequired = 0,
                requiredItems = {
                    { item = 'bread', amount = 1 },
                    { item = 'bslettuce', amount = 1 },
                    { item = 'bscheese', amount = 2 },
                    { item = 'meat', amount = 2 }
                }
            },
            {
                item = 'bstorpedo',
                label = 'Torpedo',
                xpRequired = 0,
                requiredItems = {
                    { item = 'bread', amount = 1 },
                    { item = 'bscheese', amount = 1 },
                    { item = 'meat', amount = 1 }
                }
            },
            {
                item = 'bsheartstopper',
                label = 'Heartstopper',
                xpRequired = 0,
                requiredItems = {
                    { item = 'bread', amount = 1 },
                    { item = 'bslettuce', amount = 1 },
                    { item = 'bscheese', amount = 3 },
                    { item = 'meat', amount = 3 }
                }
            },
            {
                item = 'bsmysteryburger',
                label = 'Burger Mystère',
                xpRequired = 0,
                requiredItems = {
                    { item = 'bread', amount = 1 },
                    { item = 'bslettuce', amount = 1 },
                    { item = 'bscheese', amount = 1 },
                    { item = 'meat', amount = 1 },
                    { item = 'bsmushroom', amount = 1 }
                }
            },
            {
                item = 'bsnamuh',
                label = 'Namuh',
                xpRequired = 0,
                requiredItems = {
                    { item = 'bread', amount = 1 },
                    { item = 'bslettuce', amount = 1 },
                    { item = 'bscheese', amount = 1 },
                    { item = 'meat', amount = 2 }
                }
            },
            {
                item = 'bsweiner',
                label = 'Hot-dog',
                xpRequired = 0,
                requiredItems = {
                    { item = 'bread', amount = 1 },
                    { item = 'meat', amount = 1 }
                }
            },
            {
                item = 'chickensalad',
                label = 'Salade de poulet',
                xpRequired = 0,
                requiredItems = {
                    { item = 'bslettuce', amount = 2 },
                    { item = 'chicken', amount = 1 }
                }
            }
        }
    },
    {
        name = "Burgershot - Accompagnements",
        type = "burgershot_sides",
        coords = vector4(1448.75, 3568.02, 36.9, 0.0),
        useProps = false,
        jobs = {
            ['burgershot'] = 0
        },
        recipes = {
            {
                item = 'bsfries',
                label = 'Frites',
                xpRequired = 0,
                requiredItems = {
                    { item = 'bscarrot', amount = 1 }
                }
            },
            {
                item = 'bsicecream',
                label = 'Glace',
                xpRequired = 0,
                requiredItems = {
                    { item = 'milk', amount = 1 },
                    { item = 'sugar', amount = 1 }
                }
            },
            {
                item = 'bsmilkshake',
                label = 'Milkshake',
                xpRequired = 0,
                requiredItems = {
                    { item = 'milk', amount = 2 },
                    { item = 'sugar', amount = 1 }
                }
            },
            {
                item = 'bscreampie',
                label = 'Tarte à la crème',
                xpRequired = 0,
                requiredItems = {
                    { item = 'milk', amount = 1 },
                    { item = 'sugar', amount = 1 },
                    { item = 'flour', amount = 1 }
                }
            },
            {
                item = 'bsdonut',
                label = 'Donut',
                xpRequired = 0,
                requiredItems = {
                    { item = 'flour', amount = 1 },
                    { item = 'sugar', amount = 1 }
                }
            }
        }
    },
    {
        name = "Burgershot - Boissons",
        type = "burgershot_drinks",
        coords = vector4(1447.75, 3567.02, 36.9, 0.0),
        useProps = false,
        jobs = {
            ['burgershot'] = 0
        },
        recipes = {
            {
                item = 'bscoffee',
                label = 'Café',
                xpRequired = 0,
                requiredItems = {
                    { item = 'bscoffeebeans', amount = 1 },
                    { item = 'cup', amount = 1 },
                    { item = 'water', amount = 1 }
                }
            },
            {
                item = 'bssoda',
                label = 'Soda',
                xpRequired = 0,
                requiredItems = {
                    { item = 'cup', amount = 1 },
                    { item = 'water', amount = 1 },
                    { item = 'sugar', amount = 1 }
                }
            }
        }
    }
}
