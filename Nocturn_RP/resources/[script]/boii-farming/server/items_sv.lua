----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local MetaDataName = Config.XP.MetaDataName
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

--<!>-- TOOLS --<!>--
Core.Functions.CreateUseableItem('farmguide', function(source, item)
    TriggerClientEvent('boii-farming:cl:OpenGuide', source)
end)

Core.Functions.CreateUseableItem('watering_can', function(source, item)
    TriggerClientEvent('boii-farming:cl:CollectWater', source, item.name)
end)
--<!>-- TOOLS --<!>--

--<!>-- SEEDS --<!>--
--[[
    NOTES;
    - "EVENT", "SOURCE", "ITEM NAME", "PROP", "PROP HEIGHT", "PLANTING TIME", "GROWTH RATE", "DEGRADE RATE", "XP GAIN", "ICON", "LABEL" -- EVENT STRUCTURE
    
    - "ITEM NAME" -- CARRIES ITEM.NAME THROUGH TO BE REMOVED
    - "CROP" -- CROP TYPE
    - "PROP" -- PROP TYPE TO SPAWN ON PLANTING
    - "PROP HEIGHT" -- -Z HEIGHT REDUCTION FOR PROPS IF NEEDED
    - "PLANTING TIME" -- TIME TAKEN TO PLANT SEED IN SECONDS
    - "GROWTH RATE" -- HOW MUCH PLANTS GROW PER UPDATE TICK; 100 = 1% EVERY 1MIN
    - "DEGRADE RATE" -- HOW MUCH PLANTS FOOD/WATER SHOULD DEGRADE PER UPDATE TICK; 100 = 1% EVERY 1MIN
    - "XP GAIN" -- AMOUNT OF XP GAINED WHEN PLANTING

]]

Core.Functions.CreateUseableItem('barley_seed', function(source, item)
    TriggerClientEvent('boii-farming:cl:PlantSeed', source, item.name, 'Barley', 'prop_veg_crop_05', 1.2, math.random(1,3), 100, 100, math.random(2,4))
end)

Core.Functions.CreateUseableItem('maize_seed', function(source, item)
    TriggerClientEvent('boii-farming:cl:PlantSeed', source, item.name, 'Maize', 'prop_plant_01a', 1.1, math.random(1,3), 100, 100, math.random(2,4))
end)

Core.Functions.CreateUseableItem('potato_seed', function(source, item)
    TriggerClientEvent('boii-farming:cl:PlantSeed', source, item.name, 'Potato', 'prop_plant_fern_02a', 1.3, math.random(1,3), 100, 100, math.random(2,4))
end)

Core.Functions.CreateUseableItem('lettuce_seed', function(source, item)
    TriggerClientEvent('boii-farming:cl:PlantSeed', source, item.name, 'Lettuce', 'prop_veg_crop_03_cab', 1, math.random(1,3), 100, 100, math.random(2,4))
end)

Core.Functions.CreateUseableItem('strawberry_seed', function(source, item)
    TriggerClientEvent('boii-farming:cl:PlantSeed', source, item.name, 'Strawberry', 'prop_veg_crop_02', 1.3, math.random(1,3), 100, 100, math.random(2,4))
end)

Core.Functions.CreateUseableItem('blueberry_seed', function(source, item)
    TriggerClientEvent('boii-farming:cl:PlantSeed', source, item.name, 'Blueberry', 'prop_creosote_b_01', 1.2, math.random(1,3), 100, 100, math.random(2,4))
end)

Core.Functions.CreateUseableItem('pineapple_seed', function(source, item)
    TriggerClientEvent('boii-farming:cl:PlantSeed', source, item.name, 'Pineapple', 'v_res_tre_pineapple', 1.1, math.random(1,3), 100, 100, math.random(2,4))
end)

Core.Functions.CreateUseableItem('tomato_seed', function(source, item)
    TriggerClientEvent('boii-farming:cl:PlantSeed', source, item.name, 'Tomato', 'prop_veg_crop_04_leaf', 1, math.random(1,3), 100, 100, math.random(2,4))
end)

Core.Functions.CreateUseableItem('mushroom_seed', function(source, item)
    TriggerClientEvent('boii-farming:cl:PlantSeed', source, item.name, 'Mushroom', 'prop_stoneshroom1', 1, math.random(1,3), 100, 100, math.random(2,4))
end)

Core.Functions.CreateUseableItem('cactus_seed', function(source, item)
    TriggerClientEvent('boii-farming:cl:PlantSeed', source, item.name, 'Cactus', 'prop_cactus_03', 1, math.random(1,3), 100, 100, math.random(2,4))
end)

-- Illegal

Core.Functions.CreateUseableItem('psilocybin_seed', function(source, item)
    TriggerClientEvent('boii-farming:cl:PlantSeed', source, item.name, 'Psilocybin', 'prop_stoneshroom2', 1, math.random(1,3), 100, 100, math.random(2,4))
end)

Core.Functions.CreateUseableItem('peyote_seed', function(source, item)
    TriggerClientEvent('boii-farming:cl:PlantSeed', source, item.name, 'Peyote', 'prop_peyote_highland_01', 0.98, math.random(1,3), 100, 100, math.random(2,4))
end)
--<!>-- SEEDS --<!>--

--<!>-- BOTTLE MILK --<!>--
--[[
    NOTES:
    "EVENT", "TIMER", "RETURN ITEM", "BOTTLE AMOUNT"

    "TIMER" -- PROGRESS BAR TIMER IN SECONDS
    "RETURN ITEM" -- ITEM TO BE RETURNED
    "BOTTLE AMOUNT" -- AMOUNT OF BOTTLES REQUIRED AND RETURNED

]]

Core.Functions.CreateUseableItem('milk_pail', function(source, item)
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    local FarmingXP = pData.PlayerData.metadata[MetaDataName]
    local bottle = Config.Farming.Animals.Cow.Bottle.Required.name
    local bottleamount = Config.Farming.Animals.Cow.Bottle.Required.amount
    local returnitem = Config.Farming.Animals.Cow.Bottle.Return.name
    local timer = Config.Farming.Animals.Cow.Bottle.Time
    if pData.Functions.GetItemByName(bottle) ~= nil then
        if pData.Functions.GetItemByName(bottle).amount >= bottleamount then
            pData.Functions.RemoveItem(item.name, 1)
            pData.Functions.RemoveItem(bottle, bottleamount)
            TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[item.name], 'remove', 1)
            TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[bottle], 'remove', bottleamount)
            TriggerClientEvent('boii-farming:cl:BottleMilk', src, timer, returnitem, bottleamount)
            if Config.XP.Use then
                pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(1,3))) -- Edit xp reward here
            end
        else
            TriggerClientEvent('boii-farming:notify', src, Language.Farming.Animals['enoughbottle'], 'error')
        end
    else
        TriggerClientEvent('boii-farming:notify', src, Language.Farming.Animals['nobottle'], 'error')
    end
end)
--<!>-- BOTTLE MILK --<!>--

--<!>-- DISTILL --<!>--
--[[
    NOTES:
    "EVENT", "TIMER", "RETURN ITEM", "BOTTLE AMOUNT"

    "TIMER" -- PROGRESS BAR TIMER IN SECONDS
    "RETURN ITEM" -- ITEM TO BE RETURNED
    "BOTTLE AMOUNT" -- AMOUNT OF BOTTLES REQUIRED AND RETURNED

]]

Core.Functions.CreateUseableItem('moonshine_distill', function(source, item)
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    local FarmingXP = pData.PlayerData.metadata[MetaDataName]
    local bottle = Config.Brewing.Moonshine.Bottle.Required.name
    local bottleamount = Config.Brewing.Moonshine.Bottle.Required.amount
    local returnitem = Config.Brewing.Moonshine.Bottle.Return.name
    local timer = Config.Brewing.Moonshine.Bottle.Time
    if pData.Functions.GetItemByName(bottle) ~= nil then
        if pData.Functions.GetItemByName(bottle).amount >= bottleamount then
            pData.Functions.RemoveItem(item.name, 1)
            pData.Functions.RemoveItem(bottle, bottleamount)
            TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[item.name], 'remove', 1)
            TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[bottle], 'remove', bottleamount)
            TriggerClientEvent('boii-farming:cl:BottleAlcohol', src, timer, returnitem, bottleamount)
            if Config.XP.Use then
                pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(1,3))) -- Edit xp reward here
            end
        else
            TriggerClientEvent('boii-farming:notify', src, Language.Farming.Brewing['enoughbottle'], 'error')
        end
    else
        TriggerClientEvent('boii-farming:notify', src, Language.Farming.Brewing['nobottle'], 'error')
    end
end)

Core.Functions.CreateUseableItem('vodka_distill', function(source, item)
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    local FarmingXP = pData.PlayerData.metadata[MetaDataName]
    local bottle = Config.Brewing.Vodka.Bottle.Required.name
    local bottleamount = Config.Brewing.Vodka.Bottle.Required.amount
    local returnitem = Config.Brewing.Vodka.Bottle.Return.name
    local timer = Config.Brewing.Vodka.Bottle.Time
    if pData.Functions.GetItemByName(bottle) ~= nil then
        if pData.Functions.GetItemByName(bottle).amount >= bottleamount then
            pData.Functions.RemoveItem(item.name, 1)
            pData.Functions.RemoveItem(bottle, bottleamount)
            TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[item.name], 'remove', 1)
            TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[bottle], 'remove', bottleamount)
            TriggerClientEvent('boii-farming:cl:BottleAlcohol', src, timer, returnitem, bottleamount)
            if Config.XP.Use then
                pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(1,3))) -- Edit xp reward here
            end
        else
            TriggerClientEvent('boii-farming:notify', src, Language.Farming.Brewing['enoughbottle'], 'error')
        end
    else
        TriggerClientEvent('boii-farming:notify', src, Language.Farming.Brewing['nobottle'], 'error')
    end
end)
--<!>-- DISTILL --<!>--

--<!>-- ALCOHOL --<!>--
--[[
    NOTES:

    REQUIRED: BOII-CONSUMABLES https://tebex.boii.dev/package/5140964 / https://github.com/boiidevelopment/boii-consumables-qb
]]

Core.Functions.CreateUseableItem('moonshine', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'growler', 'thirst', math.random(10,40), math.random(5,10), 30, 'Drinking Moonshine..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_ceramic_jug_01', 57005, vector3(0.13, -0.02, -0.08), vector3(-91.0, -11.0, -3.0))
end)

Core.Functions.CreateUseableItem('bootlegvodka', function(source, item)
    TriggerClientEvent('boii-consumables:cl:ConsumablesAlcohol', source, item.name, 'growler', 'thirst', math.random(10,40), math.random(5,10), 50, 'Drinking Bootleg Vodka..', math.random(3,5), 'amb@code_human_wander_drinking@male@idle_a', 'idle_c', 49, 'prop_ceramic_jug_01', 57005, vector3(0.13, -0.02, -0.08), vector3(-91.0, -11.0, -3.0))
end)
--<!>-- ALCOHOL --<!>--

--<!>-- DRUGS --<!>--
--[[
    NOTES:
    "EVENT", "SOURCE", "ITEM NAME", "DRUG TYPE", "PROGRESS BAR TIMER", "DRUG EFFECTS TIMER", "STRESS REDUCTION", "ARMOUR GAIN"

    "ITEM NAME" -- ITEM NAME TO BE REMOVED
    "DRUG TYPE" -- TYPE OF DRUG TAKEN
    "PROGRESS BAR TIMER" -- TIMER FOR TAKING DRUGS IN SECONDS
    "DRUG EFFECTS TIMER" -- TIMER FOR DRUG EFFECTS TO LAST IN MINS
    "STRESS REDUCTION" -- AMOUNT OF STRESS TO BE REMOVED
    "ARMOUR GAIN" -- AMOUNT OF ARMOUR TO BE GAINED
]]
Core.Functions.CreateUseableItem('magic_mushroom', function(source, item)
    TriggerClientEvent('boii-farming:cl:TakeDrugs', source, item.name, 'shrooms', 'Eating Shrooms..', math.random(2,5), math.random(5,8), math.random(10, 30), math.random(5,15))
end)

Core.Functions.CreateUseableItem('peyote_button', function(source, item)
    TriggerClientEvent('boii-farming:cl:TakeDrugs', source, item.name, 'peyote', 'Eating Peyote..', math.random(2,5), math.random(5,8), math.random(10, 30), math.random(5,15))
end)
--<!>-- DRUGS --<!>--