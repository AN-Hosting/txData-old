return {
    {
        name = "Cat Cafe - Boissons",
        type = "catcafe_drinks",
        coords = vector4(-291.13, -83.61, 49.5, 158.44),
        useProps = false,
        jobs = {
            ['catcafe'] = 0
        },
        recipes = {
            {
                item = 'bubbletea',
                label = 'Bubble Tea',
                xpRequired = 0,
                requiredItems = {
                    { item = 'burger_milk', amount = 1 },
                    { item = 'sugar', amount = 1 },
                    { item = 'boba', amount = 1 }
                }
            },
            {
                item = 'bubbleteablue',
                label = 'Bubble Tea Bleu',
                xpRequired = 0,
                requiredItems = {
                    { item = 'burger_milk', amount = 1 },
                    { item = 'blueberry', amount = 1 },
                    { item = 'boba', amount = 1 }
                }
            },
            {
                item = 'bubbleteagreen',
                label = 'Bubble Tea Matcha',
                xpRequired = 0,
                requiredItems = {
                    { item = 'matcha', amount = 1 },
                    { item = 'burger_milk', amount = 1 },
                    { item = 'boba', amount = 1 }
                }
            },
            {
                item = 'bubbleteaorange',
                label = 'Bubble Tea Orange',
                xpRequired = 0,
                requiredItems = {
                    { item = 'orange', amount = 1 },
                    { item = 'burger_milk', amount = 1 },
                    { item = 'boba', amount = 1 }
                }
            },
            {
                item = 'bubbleteapink',
                label = 'Bubble Tea Rose',
                xpRequired = 0,
                requiredItems = {
                    { item = 'strawberry', amount = 1 },
                    { item = 'burger_milk', amount = 1 },
                    { item = 'boba', amount = 1 }
                }
            },
            {
                item = 'latte',
                label = 'Latte',
                xpRequired = 0,
                requiredItems = {
                    { item = 'coffee', amount = 1 },
                    { item = 'burger_milk', amount = 1 }
                }
            }
        }
    },
    {
        name = "Cat Cafe - Desserts",
        type = "catcafe_desserts",
        coords = vector4(-293.37, -85.76, 49.5, 166.63),
        useProps = false,
        jobs = {
            ['catcafe'] = 0
        },
        recipes = {
            {
                item = 'mochiblue',
                label = 'Mochi Bleu',
                xpRequired = 0,
                requiredItems = {
                    { item = 'flour', amount = 1 },
                    { item = 'sugar', amount = 1 },
                    { item = 'blueberry', amount = 1 }
                }
            },
            {
                item = 'mochigreen',
                label = 'Mochi Matcha',
                xpRequired = 0,
                requiredItems = {
                    { item = 'flour', amount = 1 },
                    { item = 'sugar', amount = 1 },
                    { item = 'matcha', amount = 1 }
                }
            },
            {
                item = 'mochiorange',
                label = 'Mochi Orange',
                xpRequired = 0,
                requiredItems = {
                    { item = 'flour', amount = 1 },
                    { item = 'sugar', amount = 1 },
                    { item = 'orange', amount = 1 }
                }
            },
            {
                item = 'mochipink',
                label = 'Mochi Rose',
                xpRequired = 0,
                requiredItems = {
                    { item = 'flour', amount = 1 },
                    { item = 'sugar', amount = 1 },
                    { item = 'strawberry', amount = 1 }
                }
            },
            {
                item = 'pawcakes',
                label = 'Pawcakes',
                xpRequired = 0,
                requiredItems = {
                    { item = 'flour', amount = 2 },
                    { item = 'sugar', amount = 1 },
                    { item = 'burger_milk', amount = 1 }
                }
            },
            {
                item = 'catcookie',
                label = 'Cookie Chat',
                xpRequired = 0,
                requiredItems = {
                    { item = 'flour', amount = 1 },
                    { item = 'sugar', amount = 1 },
                    { item = 'burger_milk', amount = 1 }
                }
            },
            {
                item = 'catdonut',
                label = 'Donut Chat',
                xpRequired = 0,
                requiredItems = {
                    { item = 'flour', amount = 1 },
                    { item = 'sugar', amount = 2 },
                    { item = 'burger_milk', amount = 1 }
                }
            }
        }
    },
    {
        name = "Cat Cafe - Cuisine",
        type = "catcafe_food",
        coords = vector4(-291.31, -85.74, 49.5, 338.27),
        useProps = false,
        jobs = {
            ['catcafe'] = 0
        },
        recipes = {
            {
                item = 'catpizza',
                label = 'Pizza Chat',
                xpRequired = 0,
                requiredItems = {
                    { item = 'flour', amount = 2 },
                    { item = 'nori', amount = 1 },
                    { item = 'tofu', amount = 1 }
                }
            },
            {
                item = 'catrice',
                label = 'Riz Chat',
                xpRequired = 0,
                requiredItems = {
                    { item = 'rice', amount = 1 },
                    { item = 'nori', amount = 1 }
                }
            },
            {
                item = 'purrito',
                label = 'Purrito',
                xpRequired = 0,
                requiredItems = {
                    { item = 'flour', amount = 1 },
                    { item = 'rice', amount = 1 },
                    { item = 'tofu', amount = 1 }
                }
            },
            {
                item = 'ramen',
                label = 'Ramen',
                xpRequired = 0,
                requiredItems = {
                    { item = 'noodles', amount = 1 },
                    { item = 'tofu', amount = 1 },
                    { item = 'nori', amount = 1 }
                }
            },
            {
                item = 'bento',
                label = 'Bento',
                xpRequired = 0,
                requiredItems = {
                    { item = 'rice', amount = 1 },
                    { item = 'tofu', amount = 1 },
                    { item = 'nori', amount = 1 }
                }
            },
            {
                item = 'miso',
                label = 'Soupe Miso',
                xpRequired = 0,
                requiredItems = {
                    { item = 'tofu', amount = 1 },
                    { item = 'nori', amount = 1 }
                }
            }
        }
    }
}