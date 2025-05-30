BGSConfig = {}

BGSConfig.Debug = false -- false to remove green boxes
BGSConfig.link = "qs-inventory/html/images/" --Set this to the image directory of your inventory script

-- BGSConfiguration des recettes
BGSConfig.Recipes = {
    heartstopper = {
        label = "HeartStopper",
        type = "plat",
        ingredients = {
            raw_patty = 2,
            burger_bun = 1,
            cheddar_slice = 2,
            lettuce = 1,
            tomato_slice = 1
        },
        time = 10000,
        anim = {
            dict = "amb@prop_human_bbq@male@base",
            name = "base"
        },
        effects = {
            hunger = 60
        }
    },

    bleeder = {
        label = "Le Bleeder",
        type = "plat",
        ingredients = {
            raw_patty = 1,
            burger_bun = 1,
            tomato_slice = 1,
            lettuce = 1,
            cheddar_slice = 1
        },
        time = 9000,
        anim = {
            dict = "amb@prop_human_bbq@male@base",
            name = "base"
        },
        effects = {
            hunger = 55
        }
    },

    torpedo = {
        label = "Torpedo",
        type = "plat",
        ingredients = {
            raw_patty = 1,
            burger_bun = 1,
            cheddar_slice = 1
        },
        time = 8500,
        anim = {
            dict = "amb@prop_human_bbq@male@base",
            name = "base"
        },
        effects = {
            hunger = 50
        }
    },

    shotnuggets = {
        label = "Nuggets BurgerShot",
        type = "plat",
        ingredients = {
            nuggets_raw = 1
        },
        time = 7000,
        anim = {
            dict = "amb@prop_human_bbq@male@base",
            name = "base"
        },
        effects = {
            hunger = 45
        }
    },

    shotrings = {
        label = "Onion Rings BurgerShot",
        type = "plat",
        ingredients = {
            slicedonion = 1
        },
        time = 7000,
        anim = {
            dict = "amb@prop_human_bbq@male@base",
            name = "base"
        },
        effects = {
            hunger = 45
        }
    },

    shotfries = {
        label = "Frites BurgerShot",
        type = "plat",
        ingredients = {
            slicedpotato = 1
        },
        time = 6000,
        anim = {
            dict = "amb@prop_human_bbq@male@base",
            name = "base"
        },
        effects = {
            hunger = 40
        }
    },

    icecream = {
        label = "Glace",
        type = "plat",
        ingredients = {
            icecream_mix = 1
        },
        time = 5000,
        anim = {
            dict = "amb@prop_human_bbq@male@base",
            name = "base"
        },
        effects = {
            hunger = 30
        }
    },

    rimjob = {
        label = "Donut BurgerShot",
        type = "plat",
        ingredients = {
            icecream_mix = 1,
            sugar = 1
        },
        time = 6000,
        anim = {
            dict = "amb@prop_human_bbq@male@base",
            name = "base"
        },
        effects = {
            hunger = 35
        }
    },

    creampie = {
        label = "Tarte aux pommes BurgerShot",
        type = "dessert",
        ingredients = {
            apple = 2,
            dough = 1
        },
        time = 8000,
        anim = {
            dict = "amb@prop_human_bbq@male@base",
            name = "base"
        },
        effects = {
            hunger = 45
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

BGSConfig.Locations = {
    [1] = {
        zoneEnable = true,
        label = "burgershot",
        zones = {
            vector2(-1171.75, -866.16),
            vector2(-1155.28, -893.27),
            vector2(-1198.18, -914.38),
            vector2(-1216.34, -892.49)
        },
        blip = vector3(-1182.68, -883.92, 13.76),
        blipcolor = 48,
    },
}
