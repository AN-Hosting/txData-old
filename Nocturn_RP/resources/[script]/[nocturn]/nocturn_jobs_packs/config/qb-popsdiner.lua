PopConfig = {}

PopConfig.Debug = false -- false to remove green boxes
PopConfig.link = "qs-inventory/html/images/" --Set this to the image directory of your inventory script

-- PopConfiguration des recettes
PopConfig.Recipes = {
    burger_classic = {
        label = "Burger Classique",
		type = "plat",
        ingredients = {
            raw_patty = 1,
            burger_bun = 1,
            lettuce = 1,
            tomato_slice = 1
        },
        time = 9000,
        anim = {
            dict = "amb@prop_human_bbq@male@base",
            name = "base"
        },
        effects = {
            hunger = 60
        }
    },
    burger_cheese = {
        label = "Cheeseburger",
		type = "plat",
        ingredients = {
            raw_patty = 1,
            burger_bun = 1,
            tomato_slice = 1,
            cheddar_slice = 1
        },
        time = 9000,
        anim = {
            dict = "amb@prop_human_bbq@male@base",
            name = "base"
        },
        effects = {
            hunger = 60
        }
    },
    burger_double = {
        label = "Double Burger",
		type = "plat",
        ingredients = {
            raw_patty = 2,
            burger_bun = 2,
            lettuce = 1,
            tomato_slice = 1,
            cheddar_slice = 1
        },
        time = 9000,
        anim = {
            dict = "amb@prop_human_bbq@male@base",
            name = "base"
        },
        effects = {
            hunger = 60
        }
    },
    fries = {
        label = "Frites",
		type = "plat",
        ingredients = {
            fries_raw = 1
        },
        time = 7000,
        anim = {
            dict = "amb@prop_human_bbq@male@base",
            name = "base"
        },
        effects = {
            hunger = 30
        }
    },
    cola = {
        label = "Cola",
		type = "boisson",
        ingredients = {
            soda_syrup = 1,
            cup = 1,
            ice_cubes = 1
        },
        time = 5000,
        anim = {
            dict = "mp_ped_interaction",
            name = "handshake_guy_a"
        },
        effects = {
            thirst = 40
        }
    },
    sprite = {
        label = "Sprite",
		type = "boisson",
        ingredients = {
            soda_syrup = 1,
            cup = 1,
            ice_cubes = 1
        },
        time = 5000,
        anim = {
            dict = "mp_ped_interaction",
            name = "handshake_guy_a"
        },
        effects = {
            thirst = 40
        }
    },
    milkshake = {
        label = "Milkshake",
		type = "plat",
        ingredients = {
            milk = 1,
            icecream_mix = 1,
            cup = 1
        },
        time = 6000,
        anim = {
            dict = "mp_ped_interaction",
            name = "handshake_guy_a"
        },
        effects = {
            thirst = 35,
            stress = -10
        }
    },
    nuggets = {
        label = "Nuggets",
		type = "plat",
        ingredients = {
            nuggets_raw = 1
        },
        time = 8000,
        anim = {
            dict = "amb@prop_human_bbq@male@base",
            name = "base"
        },
        effects = {
            hunger = 35
        }
    },

    -- Boissons simples
    water_bottle = {
        label = "Eau",
        type = "boisson",
        ingredients = {
            cup = 1,
            ice_cubes = 1
        },
        time = 3000,
        anim = {
            dict = "mp_ped_interaction",
            name = "handshake_guy_a"
        },
        effects = {
            thirst = 25
        }
    },   
    ice_cubes = {
        label = "Glaçons",
        type = "boisson",
        ingredients = {},
        time = 1000,
        anim = {
            dict = "mp_ped_interaction",
            name = "handshake_guy_a"
        },
        effects = {
            thirst = 25
        }
    }, 
    icecream_mix = {
        label = "Mix glacé",
        type = "boisson",
        ingredients = {
            ice_cubes = 1
        },
        time = 2000,
        anim = {
            dict = "mp_ped_interaction",
            name = "handshake_guy_a"
        },
        effects = {
            thirst = 25
        }
    }, 
	coffee = {
        label = "Café",
        type = "coffee",
        ingredients = {},
        time = 5000,
        anim = {
            dict = "mp_ped_interaction",
            name = "handshake_guy_a"
        },
        effects = {
            thirst = 25,
            stress = -15
        }
    }
}

PopConfig.Locations = {
    [1] = {
        zoneEnable = true,
        label = "popsdiner",
        zones = {
            vector2(1558.0170898438, 6442.4106445312),
            vector2(1601.52734375, 6424.2348632812),
            vector2(1610.9509277344, 6449.2001953125),
            vector2(1613.7552490234, 6464.6137695312),
            vector2(1575.8428955078, 6482.0229492188)
        },
        blip = vector3(1583.98, 6449.49, 25.18),
        blipcolor = 48,
    },
}
