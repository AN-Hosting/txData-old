config = {}

config.Core = {
    framework = 'qb-core', -- 'esx' or 'qb-core'
    inventory = 'qb-inventory', -- 'ox_inventory', 'qb-inventory', 'qs-inventory', 'ps-inventory', or 'lj-inventory'
    target = 'qb-target', -- 'qb-target', 'ox_target', or 'qtarget'
    notify = function(title, message, types, duration) 

        -- you can add your own notification exports/events here (client sided) 

        lib.notify({ -- uses ox_lib by default.
            title = title, 
            description = message,
            type = types, 
            duration = duration,
        })
    end
}

config.locations = {
    registration = vector3(1129.31, 2629.28, 38.95), -- coords to get vehicle registration vector4(-196.77, -1167.6, 23.88, 264.41)
    insurance = vector3(1143.97, 2629.25, 38.95) -- coords to get vehicle insurance vector4(-196.83, -1170.81, 23.88, 264.03)
}

config.costs = {
    registration = 100, -- price per registration
    insurance = 500 -- price per month (billed all at once, not once per month)
}

config.expire = 30 -- how many days should registration expire after registration date

config.blip = {
    registration = {
        enable = false, -- enable or disable the blip
        sprite = 326, -- the blip icon/sprite (see ref: https://docs.fivem.net/docs/game-references/blips/#blips)
        color = 2, -- the blip color (see ref: https://docs.fivem.net/docs/game-references/blips/#blip-colors)
        scale = 0.8, -- the blip scale/size (0.1 - 1.0)
        label = 'Carte Grise Véhicule', -- the name of the blip
    },
    insurance = {
        enable = false, -- enable or disable the blip
        sprite = 408, -- the blip icon/sprite (see ref: https://docs.fivem.net/docs/game-references/blips/#blips)
        color = 5, -- the blip color (see ref: https://docs.fivem.net/docs/game-references/blips/#blip-colors)
        scale = 0.8, -- the blip scale/size (0.1 - 1.0)
        label = 'Assurance Véhicule', -- the name of the blip
    },
}