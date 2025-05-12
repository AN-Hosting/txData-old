Config = {}

-- Paramètres généraux
Config.DebugMesaPoly = false  -- Affiche les zones de polygones pour le débogage

-- Configuration des jobs de bar
Config.BarJobs = {
    -- Premier job (unicorn)
    ["unicorn"] = {
        label = "unicorn",
        blip = {
            enabled = true,
            coords = vector3(-1392.73, -588.94, 30.26),
            sprite = 136,
            display = 4,
            scale = 0.7,
            color = 27,
            name = "unicorn"
        },
        -- Points d'interaction
        locations = {
            -- Point de prise de service
            duty = {
                coords = vector3(-1390.04, -592.48, 30.32),
                label = "Prise/Fin de service",
                event = "bar-jobs:DutyM",
                job = "unicorn"
            },
            -- Points de stockage
            storage = {
                {
                    coords = vector3(-1391.71, -606.47, 30.32),
                    label = "Réfrigérateur Principal",
                    event = "bar-jobs:BottleFridgeLarge",
                    stashName = "Bottle Fridge Large",
                    maxWeight = 200000,
                    slots = 40
                },
                {
                    coords = vector3(-1390.67, -601.03, 30.32),
                    label = "Réfrigérateur 1",
                    event = "bar-jobs:MesaFridge1",
                    stashName = "Mesa Fridge 1",
                    maxWeight = 100000,
                    slots = 20
                },
                {
                    coords = vector3(-1392.82, -601.04, 30.32),
                    label = "Réfrigérateur 2",
                    event = "bar-jobs:MesaFridge2",
                    stashName = "Mesa Fridge 2",
                    maxWeight = 100000,
                    slots = 20
                }
            },
            -- Points de craft
            crafting = {
                -- Station de boissons chaudes
                coffee = {
                    coords = vector3(-1389.99, -605.62, 30.32),
                    label = "Machine à café",
                    recipes = {
                        ["beer"] = {
                            label = "Café",
                            time = 4000,
                            animation = {
                                dict = "anim@amb@machinery@speed_drill@",
                                anim = "reachout_amy_skater_01",
                                flags = 8,
                                prop = {
                                    model = "v_res_mcofcup",
                                    bone = 28422,
                                    coords = { x = -0.005, y = 0.00, z = 0.00 },
                                    rotation = { x = 360.0, y = 320.0, z = 0.0 }
                                }
                            },
                            ingredients = {
                                ["vodka"] = 1,
                                ["whiskey"] = 1
                            }
                        }
                    }
                },
                -- Station de cocktails
                cocktails = {
                    coords = vector3(-1389.43, -603.32, 30.32),
                    label = "Bar à cocktails",
                    recipes = {
                        ["beach-cocktail"] = {
                            label = "Cocktail de plage",
                            time = 2000,
                            animation = {
                                dict = "anim@amb@casino@mini@drinking@champagne_drinking@heels@base",
                                anim = "spray_centre_mid",
                                flags = 8,
                                prop = {
                                    model = "prop_bar_cockshaker",
                                    bone = 28422,
                                    coords = { x = -0.005, y = 0.00, z = 0.00 },
                                    rotation = { x = 360.0, y = 320.0, z = 0.0 }
                                }
                            },
                            ingredients = {
                                ["cocktail-mix"] = 1,
                                ["cocktail-glass"] = 1
                            }
                        },
                        ["bloody-mary"] = {
                            label = "Bloody Mary",
                            time = 2000,
                            animation = {
                                dict = "anim@amb@casino@mini@drinking@champagne_drinking@heels@base",
                                anim = "spray_centre_mid",
                                flags = 8,
                                prop = {
                                    model = "prop_bar_cockshaker",
                                    bone = 28422,
                                    coords = { x = -0.005, y = 0.00, z = 0.00 },
                                    rotation = { x = 360.0, y = 320.0, z = 0.0 }
                                }
                            },
                            ingredients = {
                                ["cocktail-mix"] = 1,
                                ["cocktail-glass"] = 1
                            }
                        },
                        ["cherry-bomb"] = {
                            label = "Cherry Bomb",
                            time = 2000,
                            animation = {
                                dict = "anim@amb@casino@mini@drinking@champagne_drinking@heels@base",
                                anim = "spray_centre_mid",
                                flags = 8,
                                prop = {
                                    model = "prop_bar_cockshaker",
                                    bone = 28422,
                                    coords = { x = -0.005, y = 0.00, z = 0.00 },
                                    rotation = { x = 360.0, y = 320.0, z = 0.0 }
                                }
                            },
                            ingredients = {
                                ["cocktail-mix"] = 1,
                                ["cocktail-glass"] = 1
                            }
                        },
                        ["orange-blast"] = {
                            label = "Orange Blast",
                            time = 2000,
                            animation = {
                                dict = "anim@amb@casino@mini@drinking@champagne_drinking@heels@base",
                                anim = "spray_centre_mid",
                                flags = 8,
                                prop = {
                                    model = "prop_bar_cockshaker",
                                    bone = 28422,
                                    coords = { x = -0.005, y = 0.00, z = 0.00 },
                                    rotation = { x = 360.0, y = 320.0, z = 0.0 }
                                }
                            },
                            ingredients = {
                                ["cocktail-mix"] = 1,
                                ["cocktail-glass"] = 1
                            }
                        }
                    }
                },
                -- Station de shots
                shots = {
                    coords = vector3(-1387.52, -606.59, 30.32),
                    label = "Bar à shots",
                    recipes = {
                        ["blue-shot"] = {
                            label = "Shot bleu",
                            time = 2000,
                            animation = {
                                dict = "anim@amb@casino@mini@drinking@champagne_drinking@heels@base",
                                anim = "spray_centre_mid",
                                flags = 8,
                                prop = {
                                    model = "prop_shot_glass",
                                    bone = 28422,
                                    coords = { x = -0.005, y = 0.00, z = 0.00 },
                                    rotation = { x = 360.0, y = 320.0, z = 0.0 }
                                }
                            },
                            ingredients = {
                                ["shots-mix"] = 1,
                                ["shot-glass"] = 1
                            }
                        },
                        ["green-shot"] = {
                            label = "Shot vert",
                            time = 2000,
                            animation = {
                                dict = "anim@amb@casino@mini@drinking@champagne_drinking@heels@base",
                                anim = "spray_centre_mid",
                                flags = 8,
                                prop = {
                                    model = "prop_shot_glass",
                                    bone = 28422,
                                    coords = { x = -0.005, y = 0.00, z = 0.00 },
                                    rotation = { x = 360.0, y = 320.0, z = 0.0 }
                                }
                            },
                            ingredients = {
                                ["shots-mix"] = 1,
                                ["shot-glass"] = 1
                            }
                        }
                    }
                },
                -- Station d'accessoires
                accessories = {
                    coords = vector3(-1391.55, -599.2, 30.32),
                    label = "Accessoires de bar",
                    recipes = {
                        ["shot-glass"] = {
                            label = "Verre à shot",
                            time = 1000,
                            animation = {
                                dict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@",
                                anim = "weed_crouch_checkingleaves_idle_01_inspector",
                                flags = 8
                            },
                            ingredients = {}  -- Pas d'ingrédients nécessaires
                        },
                        ["cocktail-glass"] = {
                            label = "Verre à cocktail",
                            time = 1000,
                            animation = {
                                dict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@",
                                anim = "weed_crouch_checkingleaves_idle_01_inspector",
                                flags = 8
                            },
                            ingredients = {}  -- Pas d'ingrédients nécessaires
                        }
                    }
                }
            }
        }
    },
    
    -- Deuxième job (exemple)
    ["vanilla"] = {
        label = "Vanilla Unicorn",
        blip = {
            enabled = true,
            coords = vector3(132.17, -1306.40, 29.35),
            sprite = 121,
            display = 4,
            scale = 0.7,
            color = 27,
            name = "Vanilla Unicorn"
        },
        -- Points d'interaction
        locations = {
            -- Point de prise de service
            duty = {
                coords = vector3(129.54, -1299.02, 29.23),
                label = "Prise/Fin de service",
                event = "bar-jobs:DutyV",
                job = "vanilla"
            },
            -- Points de stockage
            storage = {
                {
                    coords = vector3(129.0, -1280.92, 29.27),
                    label = "Réfrigérateur Principal",
                    event = "bar-jobs:VanillaFridgeLarge",
                    stashName = "Vanilla Fridge Large",
                    maxWeight = 200000,
                    slots = 40
                },
                {
                    coords = vector3(132.28, -1285.91, 29.27),
                    label = "Réfrigérateur 1",
                    event = "bar-jobs:VanillaFridge1",
                    stashName = "Vanilla Fridge 1",
                    maxWeight = 100000,
                    slots = 20
                }
            },
            -- Points de craft
            crafting = {
                -- Station de cocktails
                cocktails = {
                    coords = vector3(130.4, -1282.47, 29.27),
                    label = "Bar à cocktails",
                    recipes = {
                        ["beach-cocktail"] = {
                            label = "Cocktail de plage",
                            time = 2000,
                            animation = {
                                dict = "anim@amb@casino@mini@drinking@champagne_drinking@heels@base",
                                anim = "spray_centre_mid",
                                flags = 8,
                                prop = {
                                    model = "prop_bar_cockshaker",
                                    bone = 28422,
                                    coords = { x = -0.005, y = 0.00, z = 0.00 },
                                    rotation = { x = 360.0, y = 320.0, z = 0.0 }
                                }
                            },
                            ingredients = {
                                ["cocktail-mix"] = 1,
                                ["cocktail-glass"] = 1
                            }
                        },
                        ["vanilla-special"] = {
                            label = "Spécial Vanilla",
                            time = 3000,
                            animation = {
                                dict = "anim@amb@casino@mini@drinking@champagne_drinking@heels@base",
                                anim = "spray_centre_mid",
                                flags = 8,
                                prop = {
                                    model = "prop_bar_cockshaker",
                                    bone = 28422,
                                    coords = { x = -0.005, y = 0.00, z = 0.00 },
                                    rotation = { x = 360.0, y = 320.0, z = 0.0 }
                                }
                            },
                            ingredients = {
                                ["cocktail-mix"] = 2,
                                ["cocktail-glass"] = 1,
                                ["cherry"] = 1
                            }
                        }
                    }
                },
                -- Station d'accessoires
                accessories = {
                    coords = vector3(133.13, -1286.19, 29.27),
                    label = "Accessoires de bar",
                    recipes = {
                        ["shot-glass"] = {
                            label = "Verre à shot",
                            time = 1000,
                            animation = {
                                dict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@",
                                anim = "weed_crouch_checkingleaves_idle_01_inspector",
                                flags = 8
                            },
                            ingredients = {}
                        },
                        ["cocktail-glass"] = {
                            label = "Verre à cocktail",
                            time = 1000,
                            animation = {
                                dict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@",
                                anim = "weed_crouch_checkingleaves_idle_01_inspector",
                                flags = 8
                            },
                            ingredients = {}
                        }
                    }
                }
            }
        }
    }
    
    -- Vous pouvez ajouter d'autres jobs en suivant le même format
}

-- Effets des boissons (utilisés dans useables.lua)
Config.DrinkEffects = {
    ["mesa-coffee"] = {
        stress = -5,  -- Réduit le stress de 5%
        thirst = 15,  -- Augmente la soif de 15%
        effect = "caffeine", -- Type d'effet
        duration = 10000     -- Durée en ms
    },
    ["beach-cocktail"] = {
        stress = -10,
        thirst = 20,
        effect = "alcohol",
        duration = 15000
    },
    ["bloody-mary"] = {
        stress = -15,
        thirst = 25,
        effect = "alcohol",
        duration = 20000
    },
    ["cherry-bomb"] = {
        stress = -12,
        thirst = 22,
        effect = "alcohol",
        duration = 18000
    },
    ["orange-blast"] = {
        stress = -8,
        thirst = 18,
        effect = "alcohol",
        duration = 12000
    },
    ["blue-shot"] = {
        stress = -20,
        thirst = 10,
        effect = "alcohol_strong",
        duration = 25000
    },
    ["green-shot"] = {
        stress = -18,
        thirst = 8,
        effect = "alcohol_strong",
        duration = 22000
    },
    ["vanilla-special"] = {
        stress = -25,
        thirst = 30,
        effect = "alcohol_special",
        duration = 30000
    }
}