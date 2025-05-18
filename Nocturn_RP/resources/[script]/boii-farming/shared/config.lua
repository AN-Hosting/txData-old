----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

Config = {}

Config.Debug = false -- Enables/disables debug messages

-- Core settings for renamed cores
Config.CoreSettings = {
    Core = 'QBCore', -- The name of your core. Default; QBCore
    CoreFolder = 'qb-core', -- The name of your core folder. Default; qb-core
    TargetName = 'qb-target', -- The name of your third eye targeting. Default; qb-target
    MenuName = 'qb-menu', -- The name of your menu. Default; qb-menu
    InputName = 'qb-input', -- The name of your input menu for billing. Default; qb-input
    MetaDataEvent = 'QBCore:Server:SetMetaData', -- The name of your set metadata event. Default; 'QBCore:Server:SetMetaData'
    AddStressEvent = 'hud:server:GainStress', -- Event to remove stress from player. Default; 'hud:server:GainStress'
    RemoveStressEvent = 'hud:server:RelieveStress', -- Event to remove stress from player. Default; 'hud:server:RelieveStress'
    PlayerLoaded = 'QBCore:Client:OnPlayerLoaded', -- Name of player load event
    PlayerUnload = 'QBCore:Client:OnPlayerUnload', -- Name of player unload event. default; 'QBCore:Client:OnPlayerUnload'
    EvidenceEvent = 'evidence:client:SetStatus' -- Name of your evidence event. default; 'evidence:client:SetStatus'
}

-- XP settings
Config.XP = {
    Use = true, -- Toggles xp system on or off; true = on, false = off
    Command = true, -- Toggles xp command on or off; true = on, false = off
    MetaDataName = 'farmingxp', -- The name of your xp if you edit this make sure to also edit the line included in readme this is also your /farmingxp command
    Levels = { -- Change your xp requirements here to suit your server set these as high as you want preset xp increase = (xp / 0.8)
        1000, -- level 2 
        1250, -- level 3 
        1562, -- level 4
        1953, -- level 5
        2441, -- level 6 
        3051, -- level 7
        3814, -- level 8
        4768, -- level 9
        5960, -- level 10
        7450, -- level 11
        9312, -- level 12
        11640, -- level 13
    }
}

-- Blip settings
Config.Blips = {
    -- Ped
    {title = 'Farmer', colour = 16, id = 211, coords = vector3(2308.71, 4886.94, 41.81), scale = 0.6, useblip = true},
    {title = 'Fridgit', colour = 16, id = 211, coords = vector3(881.53, -1670.08, 31.78), scale = 0.6, useblip = true},
    -- Farming
    {title = 'Apple/Orange Trees', colour = 2, id = 478, coords = vector3(2347.16, 5000.91, 42.69), scale = 0.6, useblip = true},
    {title = 'Lemon/Lime Trees', colour = 2, id = 478, coords = vector3(2354.81, 4744.09, 34.36), scale = 0.6, useblip = true},
    -- Animals
    {title = 'Chicken Pen', colour = 21, id = 141, coords = vector3(2124.19, 5011.41, 41.33), scale = 0.6, useblip = true},
    {title = 'Pig Pen', colour = 41, id = 141, coords = vector3(2310.47, 4936.71, 41.7), scale = 0.6, useblip = true},
    {title = 'Dairy Cows', colour = 10, id = 141, coords = vector3(2223.08, 4915.89, 40.7), scale = 0.6, useblip = true},
    -- Water tower
    {title = 'Water Tower', colour = 3, id = 728, coords = vector3(2484.49, 4813.31, 34.8), scale = 0.6, useblip = true},
    {title = 'Water Tower', colour = 3, id = 728, coords = vector3(2148.92, 5110.06, 46.5), scale = 0.6, useblip = true},
    {title = 'Water Tower', colour = 3, id = 728, coords = vector3(2099.45, 4909.76, 41.06), scale = 0.6, useblip = true},
    {title = 'Water Tower', colour = 3, id = 728, coords = vector3(2532.79, 4435.78, 37.67), scale = 0.6, useblip = true},
    -- Moonshine
    {title = 'Brewing', colour = 16, id = 106, coords = vector3(3616.04, 5024.06, 11.45), scale = 0.6, useblip = true},
}

-- Service jobs
Config.Services = {
    --[[
        NOTES:

        - NAME = YOUR JOB NAME IN SHARED
        - GRADE = GRADE ABLE TO DESTROY DRUG PLANTS
    ]]
    {name = 'police', grade = 1}

    -- You can add as many jobs here as required. Example below;
    -- {name = 'police', grade = 1},
    -- {name = 'dea', grade = 1},
    -- {name = 'fib', grade = 1}
}

-- Ped settings
Config.Peds = {
    -- Farmer
    {name = 'Farmer', coords = vector4(2310.73, 4885.45, 41.81, 47.0), model = 'a_m_m_farmer_01', scenario = 'WORLD_HUMAN_SMOKING', label = 'Speak to Farmer', icon = 'fa-solid fa-wheat-awn', event = 'boii-farming:cl:FarmPed', distance = 2.0, useped = true},
    {name = 'Warehouse', coords = vector4(881.53, -1670.08, 31.78, 86.88), model = 's_m_y_dockwork_01', scenario = 'WORLD_HUMAN_CLIPBOARD', label = 'Speak to Warehouse Worker', icon = 'fa-solid fa-wheat-awn', event = 'boii-farming:cl:WarehousePed', distance = 2.0, useped = true},
}

-- Animal settings
Config.Animals = {
    -- Dog
    {name = 'Dog1', coords = vector4(2310.21, 4884.97, 41.81, 22.59), model = 'a_c_retriever', animdict = 'creatures@retriever@amb@world_dog_sitting@base', anim = 'base', label = 'Pet The Dog', icon = 'fa-solid fa-dog', event = 'boii-farming:cl:PetDog', distance = 2.0, useanimation = true, useped = true}, 
    -- Chicken
    {name = 'Chicken1', coords = vector4(2118.82, 4997.72, 41.19, 324.46), model = 'a_c_hen', animdict = 'creatures@hen@amb@world_hen_pecking@idle_a', anim = 'idle_a', label = 'Check For Eggs', icon = 'fa-solid fa-egg', event = 'boii-farming:cl:CollectEggs', distance = 2.0, useanimation = true, useped = true}, 
    {name = 'Chicken2', coords = vector4(2116.23, 5002.58, 41.25, 303.06), model = 'a_c_hen', animdict = 'creatures@hen@amb@world_hen_pecking@idle_a', anim = 'idle_a', label = 'Check For Eggs', icon = 'fa-solid fa-egg', event = 'boii-farming:cl:CollectEggs', distance = 2.0, useanimation = true, useped = true},
    {name = 'Chicken3', coords = vector4(2124.83, 5005.73, 41.18, 105.12), model = 'a_c_hen', animdict = 'creatures@hen@amb@world_hen_pecking@idle_a', anim = 'idle_a', label = 'Check For Eggs', icon = 'fa-solid fa-egg', event = 'boii-farming:cl:CollectEggs', distance = 2.0, useanimation = true, useped = true}, 
    {name = 'Chicken4', coords = vector4(2129.53, 5008.4, 41.25, 142.37), model = 'a_c_hen', animdict = 'creatures@hen@amb@world_hen_pecking@idle_a', anim = 'idle_a', label = 'Check For Eggs', icon = 'fa-solid fa-egg', event = 'boii-farming:cl:CollectEggs', distance = 2.0, useanimation = false, useped = true},
    {name = 'Chicken5', coords = vector4(2134.84, 5013.76, 41.38, 313.66), model = 'a_c_hen', animdict = 'creatures@hen@amb@world_hen_pecking@idle_a', anim = 'idle_a', label = 'Check For Eggs', icon = 'fa-solid fa-egg', event = 'boii-farming:cl:CollectEggs', distance = 2.0, useanimation = true, useped = true},
    {name = 'Chicken6', coords = vector4(2130.5, 5017.33, 41.56, 236.78), model = 'a_c_hen', animdict = 'creatures@hen@amb@world_hen_pecking@idle_a', anim = 'idle_a', label = 'Check For Eggs', icon = 'fa-solid fa-egg', event = 'boii-farming:cl:CollectEggs', distance = 2.0, useanimation = true, useped = true}, 
    {name = 'Chicken7', coords = vector4(2123.78, 5017.9, 41.62, 167.84), model = 'a_c_hen', animdict = 'creatures@hen@amb@world_hen_pecking@idle_a', anim = 'idle_a', label = 'Check For Eggs', icon = 'fa-solid fa-egg', event = 'boii-farming:cl:CollectEggs', distance = 2.0, useanimation = false, useped = true},
    {name = 'Chicken8', coords = vector4(2130.38, 5021.28, 41.7, 146.66), model = 'a_c_hen', animdict = 'creatures@hen@amb@world_hen_pecking@idle_a', anim = 'idle_a', label = 'Check For Eggs', icon = 'fa-solid fa-egg', event = 'boii-farming:cl:CollectEggs', distance = 2.0, useanimation = true, useped = true},
    {name = 'Chicken9', coords = vector4(2135.25, 5022.57, 41.72, 195.75), model = 'a_c_hen', animdict = 'creatures@hen@amb@world_hen_pecking@idle_a', anim = 'idle_a', label = 'Check For Eggs', icon = 'fa-solid fa-egg', event = 'boii-farming:cl:CollectEggs', distance = 2.0, useanimation = true, useped = true}, 
    {name = 'Chicken10', coords = vector4(2118.8, 5011.26, 41.33, 290.99), model = 'a_c_hen', animdict = 'creatures@hen@amb@world_hen_pecking@idle_a', anim = 'idle_a', label = 'Check For Eggs', icon = 'fa-solid fa-egg', event = 'boii-farming:cl:CollectEggs', distance = 2.0, useanimation = true, useped = true},
    -- Cows
    {name = 'Cow1', coords = vector4(2200.17, 4915.85, 40.67, 42.77), model = 'a_c_cow', animdict = 'creatures@cow@amb@world_cow_grazing@idle_a', anim = 'idle_b', label = 'Milk The Cow', icon = 'fa-solid fa-cow', event = 'boii-farming:cl:MilkCow', distance = 2.0, useanimation = true, useped = true},
    {name = 'Cow2', coords = vector4(2202.24, 4918.01, 40.67, 43.24), model = 'a_c_cow', animdict = 'creatures@cow@amb@world_cow_grazing@idle_a', anim = 'idle_b', label = 'Milk The Cow', icon = 'fa-solid fa-cow', event = 'boii-farming:cl:MilkCow', distance = 2.0, useanimation = true, useped = true},
    {name = 'Cow3', coords = vector4(2222.22, 4937.16, 40.93, 52.65), model = 'a_c_cow', animdict = 'creatures@cow@amb@world_cow_grazing@idle_a', anim = 'idle_b', label = 'Milk The Cow', icon = 'fa-solid fa-cow', event = 'boii-farming:cl:MilkCow', distance = 2.0, useanimation = true, useped = true},
    {name = 'Cow4', coords = vector4(2224.22, 4939.44, 40.97, 48.04), model = 'a_c_cow', animdict = 'creatures@cow@amb@world_cow_grazing@idle_a', anim = 'idle_b', label = 'Milk The Cow', icon = 'fa-solid fa-cow', event = 'boii-farming:cl:MilkCow', distance = 2.0, useanimation = true, useped = true},
    {name = 'Cow5', coords = vector4(2244.29, 4917.11, 40.7, 230.74), model = 'a_c_cow', animdict = 'creatures@cow@amb@world_cow_grazing@idle_a', anim = 'idle_b', label = 'Milk The Cow', icon = 'fa-solid fa-cow', event = 'boii-farming:cl:MilkCow', distance = 2.0, useanimation = true, useped = true},
    {name = 'Cow6', coords = vector4(2242.69, 4915.51, 40.68, 229.06), model = 'a_c_cow', animdict = 'creatures@cow@amb@world_cow_grazing@idle_a', anim = 'idle_b', label = 'Milk The Cow', icon = 'fa-solid fa-cow', event = 'boii-farming:cl:MilkCow', distance = 2.0, useanimation = true, useped = true},
    {name = 'Cow7', coords = vector4(2225.82, 4893.36, 40.65, 48.83), model = 'a_c_cow', animdict = 'creatures@cow@amb@world_cow_grazing@idle_a', anim = 'idle_b', label = 'Milk The Cow', icon = 'fa-solid fa-cow', event = 'boii-farming:cl:MilkCow', distance = 2.0, useanimation = true, useped = true},
    -- Pigs
    {name = 'Pig1', coords = vector4(2310.9, 4935.51, 41.4, 309.56), model = 'a_c_pig', animdict = 'creatures@pig@amb@world_pig_grazing@idle_a', anim = 'idle_c', label = 'Pet The Pig', icon = 'fa-solid fa-piggy-bank', event = 'boii-farming:cl:PetPig', distance = 2.0, useanimation = true, useped = true},
    {name = 'Pig2', coords = vector4(2309.38, 4937.31, 41.41, 308.15), model = 'a_c_pig', animdict = 'creatures@pig@amb@world_pig_grazing@idle_a', anim = 'idle_c', label = 'Pet The Pig', icon = 'fa-solid fa-piggy-bank', event = 'boii-farming:cl:PetPig', distance = 2.0, useanimation = true, useped = true},
    {name = 'Pig3', coords = vector4(2297.8, 4944.12, 41.44, 43.45), model = 'a_c_pig', animdict = 'creatures@pig@amb@world_pig_grazing@idle_a', anim = 'idle_c', label = 'Pet The Pig', icon = 'fa-solid fa-piggy-bank', event = 'boii-farming:cl:PetPig', distance = 2.0, useanimation = true, useped = true},
    {name = 'Pig4', coords = vector4(2300.03, 4946.16, 41.44, 45.62), model = 'a_c_pig', animdict = 'creatures@pig@amb@world_pig_grazing@idle_a', anim = 'idle_c', label = 'Pet The Pig', icon = 'fa-solid fa-piggy-bank', event = 'boii-farming:cl:PetPig', distance = 2.0, useanimation = true, useped = true},
    {name = 'Pig5', coords = vector4(2306.89, 4933.58, 41.41, 222.33), model = 'a_c_pig', animdict = 'creatures@pig@amb@world_pig_grazing@idle_a', anim = 'idle_c', label = 'Pet The Pig', icon = 'fa-solid fa-piggy-bank', event = 'boii-farming:cl:PetPig', distance = 2.0, useanimation = false, useped = true},
    {name = 'Pig6', coords = vector4(2302.17, 4940.81, 41.41, 110.24), model = 'a_c_pig', animdict = 'creatures@pig@amb@world_pig_grazing@idle_a', anim = 'idle_c', label = 'Pet The Pig', icon = 'fa-solid fa-piggy-bank', event = 'boii-farming:cl:PetPig', distance = 2.0, useanimation = false, useped = true},
 
}

-- Spawnerd objects settings
Config.Objects = {
    -- Milk pails 
    {name = 'milk_pail1', coords = vector4(2308.37, 4883.18, 41.81, 49.77), model = 'prop_old_churn_01', label = 'Collect Milk Pail', icon = 'fa-solid fa-cow', event = 'boii-farming:cl:CollectPail', distance = 2.0, dualevent = false},
    {name = 'milk_pail2', coords = vector4(2308.11, 4882.8, 41.81, 44.47), model = 'prop_old_churn_01', label = 'Collect Milk Pail', icon = 'fa-solid fa-cow', event = 'boii-farming:cl:CollectPail', distance = 2.0, dualevent = false},
    {name = 'milk_pail3', coords = vector4(2307.99, 4883.3, 41.81, 67.28), model = 'prop_old_churn_01', label = 'Collect Milk Pail', icon = 'fa-solid fa-cow', event = 'boii-farming:cl:CollectPail', distance = 2.0, dualevent = false},
    -- Sacks
    {name = 'sack1', coords = vector4(2306.9, 4881.72, 41.81, 225.15), model = 'prop_conc_sacks_02a', label = 'Collect Sacks', icon = 'fa-solid fa-wheat-awn', event = 'boii-farming:cl:CollectSack', distance = 2.0, dualevent = false},
    -- Crates
    {name = 'fruit_crates1', coords = vector4(2305.57, 4880.26, 41.81, 227.4), model = 'prop_cratepile_03a', label = 'Collect Crate', icon = 'fa-solid fa-wheat-awn', event = 'boii-farming:cl:CollectCrate', distance = 2.0, dualevent = false},

    -- Packing tables
    {name = 'packing_table1', coords = vector4(2314.86, 4889.72, 41.81, 44.74), model = 'prop_protest_table_01', label = 'Package Crops', icon = 'fas fa-box-open', event = 'boii-farming:cl:PackingMenu', distance = 2.0, dualevent = false},
    {name = 'packing_table2', coords = vector4(2313.59, 4888.4, 41.81, 44.99), model = 'prop_protest_table_01', label = 'Package Crops', icon = 'fas fa-box-open', event = 'boii-farming:cl:PackingMenu', distance = 2.0, dualevent = false},
    {name = 'packing_table3', coords = vector4(2312.34, 4887.05, 41.81, 47.01), model = 'prop_protest_table_01', label = 'Package Crops', icon = 'fas fa-box-open', event = 'boii-farming:cl:PackingMenu', distance = 2.0, dualevent = false},
    
    -- Hay bales
    {name = 'hay_bale1', coords = vector4(2280.25, 4892.51, 40.95, 227.56), model = 'prop_haybale_01', label = 'Collect Hay Bale', label2  = 'Return Hay Bale', icon = 'fa-solid fa-wheat-awn', icon2 = 'fa-solid fa-wheat-awn', event = 'boii-farming:cl:CollectBale', event2 = 'boii-farming:cl:ReturnBale', distance = 2.0, dualevent = true},
    -- Water tower
    {name = 'water_tower1', coords = vector4(2484.49, 4813.31, 34.8, 312.37), model = 'prop_watertower03', label = 'Collect Water', icon = 'fa-solid fa-glass-water', event = 'boii-farming:cl:WaterTower', distance = 2.0, dualevent = false},
    {name = 'water_tower2', coords = vector4(2148.92, 5110.06, 46.5, 309.46), model = 'prop_watertower03', label = 'Collect Water', icon = 'fa-solid fa-glass-water', event = 'boii-farming:cl:WaterTower', distance = 2.0, dualevent = false},
    {name = 'water_tower3', coords = vector4(2099.45, 4909.76, 41.06, 315.11), model = 'prop_watertower03', label = 'Collect Water', icon = 'fa-solid fa-glass-water', event = 'boii-farming:cl:WaterTower', distance = 2.0, dualevent = false},
    {name = 'water_tower4', coords = vector4(2532.79, 4435.78, 37.67, 129.75), model = 'prop_watertower03', label = 'Collect Water', icon = 'fa-solid fa-glass-water', event = 'boii-farming:cl:WaterTower', distance = 2.0, dualevent = false},
    -- Moonshine
    {name = 'moonshine_barrel1', coords = vector4(3620.26, 5021.44, 11.24, 219.64), model = 'h4_prop_h4_barrel_pile_01a', label = 'Use Fermentation Barrel', icon = 'fa-solid fa-beer-mug-empty', event = 'boii-farming:cl:BarrelMenu', distance = 2.0, dualevent = false},
    {name = 'moonshine_barrel2', coords = vector4(3619.18, 5024.57, 11.25, 291.85), model = 'h4_prop_h4_barrel_pile_01a', label = 'Use Fermentation Barrel', icon = 'fa-solid fa-beer-mug-empty', event = 'boii-farming:cl:BarrelMenu', distance = 2.0, dualevent = false},
    {name = 'moonshine_still1', coords = vector4(3619.1, 5020.83, 11.34, 200.81), model = 'prop_still', label = 'Use Still', icon = 'fa-solid fa-beer-mug-empty', event = 'boii-farming:cl:StillMenu', distance = 2.0, dualevent = false},
    {name = 'moonshine_still2', coords = vector4(3619.81, 5023.34, 11.34, 290.0), model = 'prop_still', label = 'Use Still', icon = 'fa-solid fa-beer-mug-empty', event = 'boii-farming:cl:StillMenu', distance = 2.0, dualevent = false},
}

-- Location settings
Config.Locations = {
    Trees = {
        -- Apple
        {name = 'farm_apple1', coords = vector3(2304.5, 4996.71, 43.33), label = 'Pick Apples', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickApple', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_apple2', coords = vector3(2317.15, 4984.01, 42.79), label = 'Pick Apples', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickApple', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_apple3', coords = vector3(2316.75, 4993.91, 43.06), label = 'Pick Apples', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickApple', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_apple4', coords = vector3(2316.8, 5008.53, 43.52), label = 'Pick Apples', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickApple', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_apple5', coords = vector3(2331.38, 4996.23, 43.13), label = 'Pick Apples', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickApple', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_apple6', coords = vector3(2331.15, 5007.3, 43.35), label = 'Pick Apples', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickApple', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_apple7', coords = vector3(2316.09, 5023.45, 44.36), label = 'Pick Apples', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickApple', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_apple8', coords = vector3(2330.23, 5021.41, 43.88), label = 'Pick Apples', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickApple', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_apple9', coords = vector3(2343.99, 5008.01, 43.72), label = 'Pick Apples', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickApple', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_apple10', coords = vector3(2328.9, 5036.7, 45.41), label = 'Pick Apples', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickApple', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_apple11', coords = vector3(2341.34, 5034.97, 45.31), label = 'Pick Apples', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickApple', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_apple12', coords = vector3(2343.53, 5023.04, 44.54), label = 'Pick Apples', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickApple', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_apple13', coords = vector3(2356.87, 5020.84, 44.89), label = 'Pick Apples', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickApple', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        -- Orange
        {name = 'farm_orange1', coords = vector3(2335.87, 4975.85, 43.61), label = 'Pick Oranges', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickOrange', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_orange2', coords = vector3(2349.06, 4975.34, 43.76), label = 'Pick Oranges', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickOrange', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_orange3', coords = vector3(2361.35, 4976.0, 44.22), label = 'Pick Oranges', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickOrange', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_orange4', coords = vector3(2349.03, 4989.31, 44.04), label = 'Pick Oranges', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickOrange', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_orange5', coords = vector3(2361.02, 4988.56, 43.3), label = 'Pick Oranges', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickOrange', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_orange6', coords = vector3(2373.9, 4988.38, 44.99), label = 'Pick Oranges', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickOrange', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_orange7', coords = vector3(2360.45, 5002.29, 44.4), label = 'Pick Oranges', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickOrange', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_orange8', coords = vector3(2369.01, 5010.57, 45.28), label = 'Pick Oranges', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickOrange', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_orange9', coords = vector3(2377.04, 5003.73, 45.54), label = 'Pick Oranges', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickOrange', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_orange10', coords = vector3(2389.79, 4992.04, 46.17), label = 'Pick Oranges', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickOrange', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_orange11', coords = vector3(2389.49, 5004.07, 46.69), label = 'Pick Oranges', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickOrange', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_orange12', coords = vector3(2376.32, 5017.23, 46.45), label = 'Pick Oranges', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickOrange', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5}, 
        -- Lemon
        {name = 'farm_lemon1', coords = vector3(2327.17, 4770.84, 37.1), label = 'Pick Lemons', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLemon', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lemon2', coords = vector3(2325.33, 4761.87, 37.04), label = 'Pick Lemons', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLemon', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lemon3', coords = vector3(2338.73, 4767.64, 36.23), label = 'Pick Lemons', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLemon', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lemon4', coords = vector3(2343.16, 4755.92, 35.83), label = 'Pick Lemons', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLemon', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lemon5', coords = vector3(2353.34, 4760.82, 35.36), label = 'Pick Lemons', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLemon', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lemon6', coords = vector3(2366.77, 4751.7, 34.86), label = 'Pick Lemons', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLemon', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lemon7', coords = vector3(2374.32, 4735.51, 34.73), label = 'Pick Lemons', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLemon', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lemon8', coords = vector3(2386.47, 4736.45, 34.26), label = 'Pick Lemons', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLemon', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lemon9', coords = vector3(2386.52, 4724.71, 34.63), label = 'Pick Lemons', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLemon', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lemon10', coords = vector3(2401.94, 4717.53, 34.17), label = 'Pick Lemons', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLemon', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lemon11', coords = vector3(2404.09, 4704.14, 34.39), label = 'Pick Lemons', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLemon', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lemon12', coords = vector3(2412.56, 4707.7, 34.0), label = 'Pick Lemons', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLemon', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lemon13', coords = vector3(2423.54, 4697.91, 34.06), label = 'Pick Lemons', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLemon', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lemon14', coords = vector3(2422.17, 4687.18, 34.67), label = 'Pick Lemons', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLemon', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lemon15', coords = vector3(2434.08, 4679.1, 34.39), label = 'Pick Lemons', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLemon', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lemon16', coords = vector3(2443.06, 4672.06, 34.33), label = 'Pick Lemons', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLemon', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        -- Lime
        {name = 'farm_lime1', coords = vector3(2324.1, 4746.97, 37.07), label = 'Pick Limes', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLime', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lime2', coords = vector3(2339.06, 4741.42, 36.12), label = 'Pick Limes', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLime', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lime3', coords = vector3(2350.06, 4734.26, 35.82), label = 'Pick Limes', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLime', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lime4', coords = vector3(2364.57, 4729.94, 35.19), label = 'Pick Limes', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLime', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lime5', coords = vector3(2358.89, 4724.17, 35.57), label = 'Pick Limes', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLime', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lime6', coords = vector3(2366.72, 4716.41, 35.31), label = 'Pick Limes', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLime', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lime7', coords = vector3(2382.75, 4713.4, 34.69), label = 'Pick Limes', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLime', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lime8', coords = vector3(2381.9, 4701.02, 34.94), label = 'Pick Limes', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLime', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lime9', coords = vector3(2389.74, 4691.59, 34.91), label = 'Pick Limes', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLime', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lime10', coords = vector3(2401.39, 4688.59, 34.68), label = 'Pick Limes', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLime', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lime11', coords = vector3(2407.26, 4677.25, 34.96), label = 'Pick Limes', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLime', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lime12', coords = vector3(2419.24, 4674.47, 34.85), label = 'Pick Limes', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLime', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
        {name = 'farm_lime13', coords = vector3(2423.79, 4659.21, 34.49), label = 'Pick Limes', icon = 'fa-solid fa-apple-whole', event = 'boii-farming:cl:PickLime', radius = 0.8, debugPoly = false, useZ = true, distance = 1.5},
    },
    Troughs = {
        -- Pigs
        {name = 'farm_pigtrough1', coords = vector3(2310.47, 4936.71, 41.7), label = 'Refill Pig Trough', icon = 'fa-solid fa-wheat-awn', event = 'boii-farming:cl:RefillTrough', length = 1.0, width = 5.5, heading = 310.0, debugPoly = false, minZ = 40.50, maxZ = 41.90, distance = 1.5},
        {name = 'farm_pigtrough2', coords = vector3(2298.74, 4945.71, 41.7), label = 'Refill Pig Trough', icon = 'fa-solid fa-wheat-awn', event = 'boii-farming:cl:RefillTrough',length = 1.0, width = 5.5, heading = 44.04, debugPoly = false, minZ = 40.50, maxZ = 41.90, distance = 1.5},
        -- Cows
        {name = 'farm_cowtrough1', coords = vector3(2222.85, 4938.83, 41.34), label = 'Refill Cow Trough', icon = 'fa-solid fa-wheat-awn', event = 'boii-farming:cl:RefillTrough', length = 1.0, width = 5.5, heading = 48.37, debugPoly = false, minZ = 40.10, maxZ = 41.90, distance = 1.5},
        {name = 'farm_cowtrough2', coords = vector3(2200.59, 4917.52, 41.07), label = 'Refill Cow Trough', icon = 'fa-solid fa-wheat-awn', event = 'boii-farming:cl:RefillTrough', length = 1.0, width = 5.5, heading = 43.39, debugPoly = false, minZ = 39.90, maxZ = 41.90, distance = 1.5},
        {name = 'farm_cowtrough3', coords = vector3(2244.05, 4915.9, 41.18), label = 'Refill Cow Trough', icon = 'fa-solid fa-wheat-awn', event = 'boii-farming:cl:RefillTrough', length = 1.0, width = 5.5, heading = 228.46, debugPoly = false, minZ = 39.90, maxZ = 41.90, distance = 1.5},
        {name = 'farm_cowtrough4', coords = vector3(2224.43, 4893.02, 41.18), label = 'Refill Cow Trough', icon = 'fa-solid fa-wheat-awn', event = 'boii-farming:cl:RefillTrough', length = 1.0, width = 5.5, heading = 51.73, debugPoly = false, minZ = 39.90, maxZ = 41.90, distance = 1.5},
        -- Chickens
        {name = 'farm_chickentrough1', coords = vector3(2141.96, 5019.14, 41.52), label = 'Refill Chicken Trough', icon = 'fa-solid fa-wheat-awn', event = 'boii-farming:cl:RefillTrough',length = 2.0, width = 2.0, heading = 311.63, debugPoly = false, minZ = 39.90, maxZ = 41.90, distance = 1.5},
    }
}

-- Farming settings
Config.Farming = {
    Trees = {
        Apple = {
            Time = math.random(5, 9), -- Time in seconds to pick tree
            Chance = 75, -- Chance in % to pick fruit successfully 100 = 100
            Stress = math.random(1, 2), -- Amount of stress gained on failiure
            Return = {name = 'apple', label = 'Apple'}, -- Item rewarded on successful pick
        },
        Orange = {
            Time = math.random(5, 9), -- Time in seconds to pick tree
            Chance = 75, -- Chance in % to pick fruit successfully 100 = 100%
            Stress = math.random(1, 2), -- Amount of stress gained on failiure
            Return = {name = 'orange', label = 'Orange'}, -- Item rewarded on successful pick
        },
        Lemon = {
            Time = math.random(5, 9), -- Time in seconds to pick tree
            Chance = 75, -- Chance in % to pick fruit successfully 100 = 100%
            Stress = math.random(1, 2), -- Amount of stress gained on failiure
            Return = {name = 'lemon', label = 'Lemon'}, -- Item rewarded on successful pick
        },
        Lime = {
            Time = math.random(5, 9), -- Time in seconds to pick tree
            Chance = 75, -- Chance in % to pick fruit successfully 100 = 100%
            Stress = math.random(1, 2), -- Amount of stress gained on failiure
            Return = {name = 'lime', label = 'Lime'}, -- Item rewarded on successful pick
        }
    },
    Animals = {
        Dog = {
            Time = math.random(5, 9), -- Time in seconds to pet
            Cooldown = 10, -- Time in mins to be able to pet again
            Stress = math.random(20, 30) -- Amount of stress to be removed on pet
        },
        Chicken = {
            Time = math.random(5, 9), -- Time in seconds to collect
            Chance = 75, -- Chance in % to collect successfully 100 = 100%
            Stress = math.random(1, 2), -- Amount of stress gained on failiure
            Return = {name = 'egg', label = 'Egg'}, -- Item rewarded on successful collect
        },
        Cow = {
            Time = math.random(5, 9), -- Time in seconds to collect
            Chance = 75, -- Chance in % to collect successfully 100 = 100%
            Stress = math.random(1, 2), -- Amount of stress gained on failiure
            Required = {name = 'milking_pail', label = 'Milking Pail'}, -- Item required to collect
            Return = {name = 'milk_pail', label = 'Milk Pail'}, -- Item rewarded on successful collect
            Bottle = {
                Time = math.random(5, 9), -- Time in seconds to bottle
                Required = {name = 'emptymilkbottle', label = 'Empty Milk Bottle', amount = 10}, -- Item required to bottle
                Return = {name = 'milk', label = 'Milk'} -- Item returned after bottling
            }
        },
        Pig = {
            Time = math.random(5, 9), -- Time in seconds to pet
            Cooldown = 10, -- Time in mins to be able to pet again
            Stress = math.random(20, 30) -- Amount of stress to be removed on pet
        },
    },
    Troughs = {
        Pig = {
            Time = math.random(5, 9), -- Time in seconds to refill
            Cooldown = 60, -- Time in mins to be able to refill again
        },
        Cow = {
            Time = math.random(5, 9), -- Time in seconds to refill
            Cooldown = 90, -- Time in mins to be able to refill again
        },
        Chicken = {
            Time = math.random(5, 9), -- Time in seconds to refill
            Cooldown = 45, -- Time in mins to be able to refill again
        }
    },
    Planting = {
        Crops = {
            Defaults = {
                Hunger = math.random(15,32), -- Amount of hunger crops will start with by default
                Thirst = math.random(15,32), -- Amount of thirst crops will start with by default
                Quality = math.random(15,32) -- Amount of quality crops will start with by default
            },
            Update = 1, -- Time in minutes to update crops
            Delete = true, -- Enables auto deletion of plants when hunger/thirst/quality is below 1 if false plants have to be destroyed manually through menu
            Range = 1.5, -- Range check to plant seeds
            Required = {name = 'trowel', label = 'Trowel'} -- Item required to plant seeds
        },
        Harvest = {
            Time = math.random(3,8), -- Time in (s) to harvest crops
            Required = {name = 'trowel', label = 'Trowel'} -- Item required to harvest crops
        },
        Destroy = {
            Time = math.random(3,8), -- Time in (s) to destroy crops
            Required = {name = 'trowel', label = 'Trowel'} -- Item required to destroy crops
        },
        Feed = {
            Time = math.random(3,8), -- Time in (s) to feed crops
            Increase = math.random(10,20), -- Amount to increase hunger on feeding
            Quality = 0.5, -- Amount of quality to increase on watering 0.5 = 50% "Increase" amount
            Required = {name = 'farm_fertilizer', label = 'Fertilizer'} -- Item required to feed crops
        },
        Water = {
            Time = math.random(3,8), -- Time in (s) to water crops
            Increase = math.random(10,20), -- Amount to increase thirst on watering
            Quality = 0.5, -- Amount of quality to increase on watering 0.5 = 50% "Increase" amount
            Return = {name = 'watering_can', label = 'Watering Can'}, -- Item returned when watering
            Required = {name = 'watering_can_full', label = 'Full Watering Can'} -- Item required to water crops
        }
    },
    Objects = {
        Pail = {
            Time = math.random(5, 9), -- Time in seconds to collect
        },
        Bale = {
            Time = math.random(5, 9), -- Time in seconds to collect
        },
        Water = {
            Time = math.random(5, 9), -- Time in seconds to collect
            Height = 0.5, -- Adjust the height for getwaterweight check
            Required = {name = 'watering_can', label = 'Watering Can'}, -- Item required to collect
            Return = {name = 'watering_can_full', label = 'Full Watering Can'} -- Item returned from collecting
        },
        Sack = {
            Time = math.random(5, 9), -- Time in seconds to collect
            Return = {name = 'emptysack', label = 'Sack', amount = 5} -- Item returned from collecting
        },
        Crate = {
            Time = math.random(5, 9), -- Time in seconds to collect
            Return = {name = 'emptycrate', label = 'Crate', amount = 3} -- Item returned from collecting
        }
    }
}

-- Packing settings
Config.Packing = {
    Sack = {
        Required = {name = 'emptysack', label = 'Sack'}, -- Item required to pack
        Barley = {
            Time = math.random(5, 9), -- Time in seconds to pack
            Required = {name = 'barley', label = 'Barley', amount = 80}, -- Item required to pack
            Return = {name = 'barley_sack', label = 'Barley Sack'} -- Item returned from packing 
        },
        Maize = {
            Time = math.random(5, 9), -- Time in seconds to pack
            Required = {name = 'maize', label = 'Maize', amount = 80}, -- Item required to pack
            Return = {name = 'maize_sack', label = 'Maize Sack'} -- Item returned from packing 
        },
        Potato = {
            Time = math.random(5, 9), -- Time in seconds to pack
            Required = {name = 'potato', label = 'Potato', amount = 50}, -- Item required to pack
            Return = {name = 'potato_sack', label = 'Potato Sack'} -- Item returned from packing 
        },
        Mushroom = {
            Time = math.random(5, 9), -- Time in seconds to pack
            Required = {name = 'mushroom', label = 'Mushroom', amount = 30}, -- Item required to pack
            Return = {name = 'mushroom_sack', label = 'Mushroom Sack'} -- Item returned from packing 
        }
    },
    Crate = {
        Required = {name = 'emptycrate', label = 'Crate'}, -- Item required to pack
        Apple = {
            Time = math.random(5, 9), -- Time in seconds to pack
            Required = {name = 'apple', label = 'Apple', amount = 50}, -- Item required to pack
            Return = {name = 'apple_crate', label = 'Apple Crate'} -- Item returned from packing 
        },
        Orange = {
            Time = math.random(5, 9), -- Time in seconds to pack
            Required = {name = 'orange', label = 'Orange', amount = 60}, -- Item required to pack
            Return = {name = 'orange_crate', label = 'Orange Crate'} -- Item returned from packing 
        },
        Lemon = {
            Time = math.random(5, 9), -- Time in seconds to pack
            Required = {name = 'lemon', label = 'Lemon', amount = 50}, -- Item required to pack
            Return = {name = 'lemon_crate', label = 'Lemon Crate'} -- Item returned from packing 
        },
        Lime = {
            Time = math.random(5, 9), -- Time in seconds to pack
            Required = {name = 'lime', label = 'Lime', amount = 55}, -- Item required to pack
            Return = {name = 'lime_crate', label = 'Lime Crate'} -- Item returned from packing 
        },
        Lettuce = {
            Time = math.random(5, 9), -- Time in seconds to pack
            Required = {name = 'lettuce', label = 'Lettuce', amount = 35}, -- Item required to pack
            Return = {name = 'lettuce_crate', label = 'Lettuce Crate'} -- Item returned from packing 
        },
        CactusFruit = {
            Time = math.random(5, 9), -- Time in seconds to pack
            Required = {name = 'cactusfruit', label = 'Cactus Fruit', amount = 30}, -- Item required to pack
            Return = {name = 'cactusfruit_crate', label = 'Cactus Crate'} -- Item returned from packing 
        },
        Tomato = {
            Time = math.random(5, 9), -- Time in seconds to pack
            Required = {name = 'tomato', label = 'Tomato', amount = 40}, -- Item required to pack
            Return = {name = 'tomato_crate', label = 'Tomato Crate'} -- Item returned from packing 
        },
        Strawberry = {
            Time = math.random(5, 9), -- Time in seconds to pack
            Required = {name = 'strawberry', label = 'Strawberry', amount = 50}, -- Item required to pack
            Return = {name = 'strawberry_crate', label = 'Strawberry Crate'} -- Item returned from packing 
        },
        Blueberry = {
            Time = math.random(5, 9), -- Time in seconds to pack
            Required = {name = 'blueberry', label = 'Blueberry', amount = 65}, -- Item required to pack
            Return = {name = 'blueberry_crate', label = 'Blueberry Crate'} -- Item returned from packing 
        },
        Milk = {
            Time = math.random(5, 9), -- Time in seconds to pack
            Required = {name = 'milk', label = 'Milk', amount = 25}, -- Item required to pack
            Return = {name = 'milk_crate', label = 'Milk Crate'} -- Item returned from packing 
        },
        Egg = {
            Time = math.random(5, 9), -- Time in seconds to pack
            Required = {name = 'egg', label = 'Egg', amount = 50}, -- Item required to pack
            Return = {name = 'egg_crate', label = 'Egg Crate'} -- Item returned from packing 
        },
        Pineapple = {
            Time = math.random(5, 9), -- Time in seconds to pack
            Required = {name = 'pineapple', label = 'Pineapple', amount = 25}, -- Item required to pack
            Return = {name = 'pineapple_crate', label = 'Pineapple Crate'} -- Item returned from packing 
        }
    }
}

-- Brewing settings
Config.Brewing = {
    Moonshine = {
        Mash = {
            Time = math.random(15, 30), -- Time in seconds to prepare mash
            Wait = math.random(15, 30), -- Time in seconds to wait for mash
            Required = {
                ['1'] = {name = 'bucket', label = 'Empty Bucket'},
                ['2'] = {name = 'watering_can_full', label = 'Full Watering Can', amount = 6},
                ['3'] = {name = 'barley', label = 'Barley', amount = 24},
                ['4'] = {name = 'maize', label = 'Maize', amount = 17}
            },
            Return = {name = 'moonshine_mash', label = 'Moonshine Mash'}
        },
        Ferment = {
            Time = math.random(5, 8), -- Time in seconds to pour into barrel
            Wait = math.random(15, 30), -- Time in seconds to ferment
            Required = {
                ['1'] = {name = 'moonshine_mash', label = 'Moonshine Mash', amount = 3},
                ['2'] = {name = 'yeast', label = 'Yeast', amount = 5}
            },
            Return = {name = 'moonshine_ferm', label = 'Fermented Moonshine'}
        },
        Distill = {
            Time = math.random(15, 30), -- Time in seconds to distill
            Required = {
                ['1'] = {name = 'moonshine_ferm', label = 'Fermented Moonshine'},
                ['2'] = {name = 'watering_can_full', label = 'Full Watering Can', amount = 3}
            },
            Return = {name = 'moonshine_distill', label = 'Distilled Moonshine'}
        },
        Bottle = {
            Time = math.random(15, 30), -- Time in seconds to bottle
            Required = {name = 'growler', label = 'Empty Growler', amount = 10},
            Return = {name = 'moonshine', label = 'Moonshine'}
        }
    },
    Vodka = {
        Mash = {
            Time = math.random(15, 30), -- Time in seconds to prepare mash
            Wait = math.random(15, 30), -- Time in seconds to wait for mash
            Required = {
                ['1'] = {name = 'bucket', label = 'Empty Bucket'},
                ['2'] = {name = 'watering_can_full', label = 'Full Watering Can', amount = 6},
                ['3'] = {name = 'potato', label = 'Potato', amount = 22},
                ['4'] = {name = 'maize', label = 'Maize', amount = 11}
            },
            Return = {name = 'vodka_mash', label = 'Vodka Mash'}
        },
        Ferment = {
            Time = math.random(5, 8), -- Time in seconds to pour into barrel
            Wait = math.random(15, 30), -- Time in seconds to ferment
            Required = {
                ['1'] = {name = 'vodka_mash', label = 'Vodka Mash', amount = 3},
                ['2'] = {name = 'yeast', label = 'Yeast', amount = 5}
            },
            Return = {name = 'vodka_distill', label = 'Distilled Vodka'}
        },
        Distill = {
            Time = math.random(15, 30), -- Time in seconds to distill
            Required = {
                ['1'] = {name = 'vodka_ferm', label = 'Fermented Vodka'},
                ['2'] = {name = 'watering_can_full', label = 'Full Watering Can', amount = 3},
            },
            Return = {name = 'vodka_distill', label = 'Distilled Vodka'}
        },
        Bottle = {
            Time = math.random(15, 30), -- Time in seconds to bottle
            Required = {name = 'growler', label = 'Empty Growler', amount = 10},
            Return = {name = 'bootlegvodka', label = 'Bootleg Vodka'}
        }
    },
}

-- Store settings
Config.Stores = {
    Farmer = {
        UseTimes = true, -- Toggle time locks for store
        Open = 6, -- Open time for store
        Close = 20, -- Close time for store
        Items = {
            [1] = {name = 'farmguide', price = 10, amount = 1000, info = {}, type = 'item', slot = 1},
            [2] = {name = 'watering_can', price = 5, amount = 1000, info = {}, type = 'item', slot = 2},
            [3] = {name = 'farm_fertilizer', price = 10, amount = 1000, info = {}, type = 'item', slot = 3},
            [4] = {name = 'trowel', price = 25, amount = 1000, info = {}, type = 'item', slot = 4},
            [5] = {name = 'emptymilkbottle', price = 1, amount = 1000, info = {}, type = 'item', slot = 5},
            [6] = {name = 'growler', price = 3, amount = 1000, info = {}, type = 'item', slot = 6},
            [7] = {name = 'bucket', price = 5, amount = 1000, info = {}, type = 'item', slot = 7},
            [8] = {name = 'barley_seed', price = 15, amount = 1000, info = {}, type = 'item', slot = 8},
            [9] = {name = 'maize_seed', price = 18, amount = 1000, info = {}, type = 'item', slot = 9},
            [10] = {name = 'lettuce_seed', price = 13, amount = 1000, info = {}, type = 'item', slot = 10},
            [11] = {name = 'potato_seed', price = 18, amount = 1000, info = {}, type = 'item', slot = 11},
            [12] = {name = 'blueberry_seed', price = 12, amount = 1000, info = {}, type = 'item', slot = 12},
            [13] = {name = 'strawberry_seed', price = 14, amount = 1000, info = {}, type = 'item', slot = 13},
            [14] = {name = 'pineapple_seed', price = 18, amount = 1000, info = {}, type = 'item', slot = 14},
            [15] = {name = 'tomato_seed', price = 11, amount = 1000, info = {}, type = 'item', slot = 15},
            [16] = {name = 'mushroom_seed', price = 15, amount = 1000, info = {}, type = 'item', slot = 16},
            [17] = {name = 'cactus_seed', price = 21, amount = 1000, info = {}, type = 'item', slot = 17}
        }
    },
    Warehouse = {
        UseTimes = true, -- Toggle time locks for store
        Open = 6, -- Open time for store
        Close = 20, -- Close time for store
        Money = {
            Buy = 'cash', -- Money type for payments; 'cash', 'bank', 'crypto'
            Sell = 'cash' -- Money type for payments; 'cash', 'bank', 'crypto'
        },
        Prices = {
            Buy = {
                Barley = 1.5,
                Maize = 1.5,
                Potato = 2,
                Mushroom = 2.5,
                Apple = 1,
                Orange = 1,
                Lemon = 1.2,
                Lime = 1.2,
                Lettuce = 1,
                CactusFruit = 3,
                Tomato = 2,
                Strawberry = 1.1,
                Blueberry = 1.2,
                Milk = 1.5,
                Egg = 1,
                Pineapple = 2
                
            },
            Sell = {
                Barley = 90,
                Maize = 90,
                Potato = 80,
                Mushroom = 75,
                Apple = 50,
                Orange = 50,
                Lemon = 55,
                Lime = 55,
                Lettuce = 40,
                CactusFruit = 80,
                Tomato = 50,
                Strawberry = 60,
                Blueberry = 65,
                Milk = 75,
                Egg = 45,
                Pineapple = 40
                
            }
        }
    }
}

-- Animation settings
Config.Animations = {
    Trees = {
        Dict = 'amb@prop_human_movie_bulb@base',
        Anim = 'base',
        Flags = 49,
    },
    Animals = {
        Dog = {
            Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
            Anim = 'weed_spraybottle_crouch_base_inspector',
            Flags = 9,
        },
        Chicken = {
            Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
            Anim = 'weed_spraybottle_crouch_base_inspector',
            Flags = 9,
        },
        Cow = {
            Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
            Anim = 'weed_spraybottle_crouch_base_inspector',
            Flags = 9,
        },
        Pig = {
            Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
            Anim = 'weed_spraybottle_crouch_base_inspector',
            Flags = 9,
        },
    },
    Troughs = {
        Dict = 'mini@repair',
        Anim = 'fixing_a_ped',
        Flags = 49
    },
    Crops = {
        Planting = {
            Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
            Anim = 'weed_spraybottle_crouch_base_inspector',
            Flags = 9, 
        },
        Harvest = {
            Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
            Anim = 'weed_spraybottle_crouch_base_inspector',
            Flags = 9,
        },
        Destroy = {
            Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
            Anim = 'weed_spraybottle_crouch_base_inspector',
            Flags = 9,
        },
        Feed = {
            Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
            Anim = 'weed_spraybottle_crouch_base_inspector',
            Flags = 9,
        },
        Water = {
            Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
            Anim = 'weed_spraybottle_crouch_base_inspector',
            Flags = 9,
        },
    },
    Packing = {
        Dict = 'anim@scripted@player@mission@tun_table_grab@cash@heeled@',
        Anim = 'grab',
        Flags = 49
    },
    Brewing = {
        Still = {
            Prep = {
                Dict = 'timetable@gardener@filling_can',
                Anim = 'gar_ig_5_filling_can',
                Flags = 9
            },
            Wait = {
                Dict = 'anim@amb@board_room@supervising@',
                Anim = 'think_01_hi_amy_skater_01',
                Flags = 49
            }
        },
        Barrel = {
            Prep = {
                Dict = 'timetable@gardener@filling_can',
                Anim = 'gar_ig_5_filling_can',
                Flags = 9
            },
            Wait = {
                Dict = 'anim@amb@board_room@supervising@',
                Anim = 'think_01_hi_amy_skater_01',
                Flags = 49
            }
        },
        Bottle = {
            Dict = 'amb@prop_human_parking_meter@female@base',
            Anim = 'base_female',
            Flags = 49, 
        }
    },
    Milk = {
        Bottle = {
            Dict = 'amb@prop_human_parking_meter@female@base',
            Anim = 'base_female',
            Flags = 49, 
        }
    },
    Drugs = {
        Dict = 'mp_suicide',
        Anim = 'pill',
        Flags = 49, 
    },
    Objects = {
        Pail = {
            Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
            Anim = 'weed_spraybottle_crouch_base_inspector',
            Flags = 9,  
        },
        Bale = {
            Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
            Anim = 'weed_spraybottle_crouch_base_inspector',
            Flags = 9,  
        },
        Water = {
            Dict = 'timetable@gardener@filling_can',
            Anim = 'gar_ig_5_filling_can',
            Flags = 9
        },
        Sack = {
            Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
            Anim = 'weed_spraybottle_crouch_base_inspector',
            Flags = 9, 
        },
        Crate = {
            Dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
            Anim = 'weed_spraybottle_crouch_base_inspector',
            Flags = 9, 
        }
    }
}