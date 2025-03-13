-- Ajoutez ces items si vous ne les avez pas déjà
empty_weed_bag              = { name = 'empty_weed_bag', label = 'Pochon Vide', weight = 0, type = 'item', image = 'empty_weed_bag.png', unique = false, useable = true, shouldClose = true, description = 'Un petit sac vide' },
weed_skunk                 = { name = 'weed_skunk', label = 'Pochon de Weed', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, description = 'Un pochon contenant 2g de weed' },
cocainebaggy              = { name = 'cocainebaggy',                 label = 'Sachet de cocaine',        weight = 100,   type = 'item',      image = 'cocainebaggy.png',                unique = false,     useable = true,     description = 'Un petit sachet de poudre blanche' },
meth_tray                   = { name = 'meth_tray', label = 'Plateau de Meth', weight = 200, type = 'item', image = 'meth_tray.png', unique = false, useable = false, description = 'Un plateau pour la production' },
chemicalvapor             = { name = 'chemicalvapor',                label = 'Vapeurs chimiques',        weight = 1500,  type = 'item',      image = 'chemicalvapor.png',               unique = false,     useable = false,    description = 'Des vapeurs toxiques concentrées' },
meth_baggy = { name = 'meth_baggy', label = 'Sachet de Meth', weight = 100, type = 'item',  image = 'meth_baggy.png',  unique = false, useable = true, description = 'Un petit sachet de cristaux bleus'}

QBShared.Items = {
    -- Items existants...

    -- Drogues en sachets
    ['meth_baggy'] = {
        name = 'meth_baggy',
        label = 'Sachet de Meth',
        weight = 100,
        type = 'item',
        image = 'meth_baggy.png',
        unique = false,
        useable = false,
        shouldClose = false,
        combinable = nil,
        description = 'Un sachet de méthamphétamine'
    },
    ['weed_skunk'] = {
        name = 'weed_skunk',
        label = 'Pochon de Weed',
        weight = 100,
        type = 'item',
        image = 'weed_baggy.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'Un pochon de weed'
    },
    ['cocainebaggy'] = {
        name = 'cocainebaggy',
        label = 'Sachet de Cocaine',
        weight = 100,
        type = 'item',
        image = 'cocaine_baggy.png',
        unique = false,
        useable = false,
        shouldClose = false,
        combinable = nil,
        description = 'Un sachet de cocaine'
    },
    ['heroin'] = {
        name = 'heroin',
        label = "Dose d'Héroïne",
        weight = 100,
        type = 'item',
        image = 'heroin.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'Une dose d\'héroïne pure'
    }
} 