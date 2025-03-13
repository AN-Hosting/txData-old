Config = {}
Config.RequireJob = true                       -- do you need a mech job to use parts?
Config.FuelResource = 'LegacyFuel'             -- supports any that has a GetFuel() and SetFuel() export

Config.PaintTime = 5                           -- how long it takes to paint a vehicle in seconds
Config.ColorFavorites = false                  -- add your own colors to the favorites menu (see bottom of const.lua)

Config.NitrousBoost = 1.8                      -- how much boost nitrous gives (want this above 1.0)
Config.NitrousUsage = 0.1                      -- how much nitrous is used per frame while holding key

Config.UseDistance = false                      -- enable/disable saving vehicle distance
Config.UseDistanceDamage = false                -- damage vehicle engine health based on vehicle distance
Config.UseWearableParts = false                 -- enable/disable wearable parts
Config.WearablePartsChance = 1                 -- chance of wearable parts being damaged while driving if enabled
Config.WearablePartsDamage = math.random(1, 2) -- how much wearable parts are damaged when damaged if enabled
Config.DamageThreshold = 25                    -- how worn a part needs to be or below to apply an effect if enabled
Config.WarningThreshold = 50                   -- how worn a part needs to be to show a warning color in toolbox if enabled

Config.MinimalMetersForDamage = {              -- unused if Config.UseDistanceDamage is false
    { min = 5000,  max = 10000, damage = 10 },
    { min = 15000, max = 20000, damage = 20 },
    { min = 25000, max = 30000, damage = 30 },
}

Config.WearableParts = { -- unused if Config.UseWearableParts is false (feel free to add/remove parts)
    radiator = { label = Lang:t('menu.radiator_repair'), maxValue = 100, repair = { steel = 2 } },
    axle = { label = Lang:t('menu.axle_repair'), maxValue = 100, repair = { aluminum = 2 } },
    brakes = { label = Lang:t('menu.brakes_repair'), maxValue = 100, repair = { copper = 2 } },
    clutch = { label = Lang:t('menu.clutch_repair'), maxValue = 100, repair = { copper = 2 } },
    fuel = { label = Lang:t('menu.fuel_repair'), maxValue = 100, repair = { plastic = 2 } },
}

Config.Shops = {
    norauto = { -- City location
        managed = true,
        shopLabel = 'Norauto',
        showBlip = true,
        blipSprite = 72,
        blipColor = 0,
        blipCoords = vector3(807.66, -882.89, 25.25),
        duty = vector3(806.59, -886.0, 26.00),
        stash = vector3(840.05, -905.04, 25.25),
        paint = vector3(823.18, -885.28, 25.60),
        vehicles = {
            withdraw = vector3(0, 0, 0),
            spawn = vector4(0, 0, 0, 0),
            list = { 'flatbed' }
        },
    },
    midas = { -- Harmony Location
        managed = true,
        shopLabel = 'Midas',
        showBlip = true,
        blipSprite = 446,
        blipColor = 0,
        blipCoords = vector3(-918.78, -2035.89, 9.5),
        duty = vector3(-923.49, -2033.41, 10.4),
        stash = vector3(-929.25, -2054.41, 9.06),
        paint = vector3(-944.9, -2062.1, 9.53),
        vehicles = {
            withdraw = vector3(0, 0, 0),
            spawn = vector4(0, 0, 0, 0),
            list = { 'flatbed' }
        },
    },
    -- mechanic3 = { -- Airport Location
    --     managed = true,
    --     shopLabel = 'LS Customs',
    --     showBlip = true,
    --     blipSprite = 72,
    --     blipColor = 46,
    --     blipCoords = vector3(-1154.92, -2006.41, 13.18),
    --     duty = vector3(-1149.17, -1998.27, 13.91),
    --     stash = vector3(-1146.40, -2002.05, 13.19),
    --     paint = vector3(-1170.60, -2014.90, 13.23),
    --     vehicles = {
    --         withdraw = vector3(-1142.04, -1994.58, 13.26),
    --         spawn = vector4(-1137.42, -1993.26, 13.14, 226.07),
    --         list = { 'flatbed', 'towtruck', 'minivan', 'blista' }
    --     },
    -- },
    -- bennys = { -- Default Bennys Location
    --     managed = true,
    --     shopLabel = 'Benny\'s Motorworks',
    --     showBlip = true,
    --     blipSprite = 72,
    --     blipColor = 46,
    --     blipCoords = vector3(-211.73, -1325.28, 30.89),
    --     duty = vector3(-202.92, -1313.74, 31.70),
    --     stash = vector3(-199.58, -1314.65, 31.08),
    --     paint = vector3(-202.42, -1322.16, 31.29),
    --     vehicles = {
    --         withdraw = vector3(0, 0, 0),
    --         spawn = vector4(-370.51, -107.88, 38.35, 72.56),
    --         list = { 'flatbed', 'towtruck', 'minivan', 'blista' }
    --     },
    -- },
    -- beeker = { -- Paleto Location
    --     managed = true,
    --     shopLabel = 'Beeker\'s Garage',
    --     showBlip = true,
    --     blipSprite = 72,
    --     blipColor = 46,
    --     blipCoords = vector3(109.95, 6627.34, 31.79),
    --     duty = vector3(101.74, 6620.04, 32.95),
    --     stash = vector3(107.00, 6629.88, 31.81),
    --     paint = vector3(102.17, 6626.08, 31.79),
    --     vehicles = {
    --         withdraw = vector3(107.08, 6614.90, 31.96),
    --         spawn = vector4(110.91, 6609.32, 31.81, 315.11),
    --         list = { 'flatbed', 'towtruck', 'minivan', 'blista' }
    --     },
    -- },
}
