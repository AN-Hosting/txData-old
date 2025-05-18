----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local MetaDataName = Config.XP.MetaDataName
local AddStressEvent = Config.CoreSettings.AddStressEvent
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

--<!>-- COLLECT ANIMALS --<!>--
RegisterServerEvent('boii-farming:sv:CollectAnimal', function(animal)
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    local FarmingXP = pData.PlayerData.metadata[MetaDataName]
    local amount = math.ceil(math.random(1,4))
    if Config.XP.Use then
        if FarmingXP < 1000 then
            reward = math.ceil(amount*1.1)
        elseif FarmingXP >= 1000 then
            reward = math.ceil(amount*1.2)
        elseif FarmingXP >= 1250 then
            reward = math.ceil(amount*1.3)
        elseif FarmingXP >= 1562 then
            reward = math.ceil(amount*1.4)
        elseif FarmingXP >= 1953 then
            reward = math.ceil(amount*1.5)
        elseif FarmingXP >= 2441 then
            reward = math.ceil(amount*1.6) 
        elseif FarmingXP >= 3051 then
            reward = math.ceil(amount*1.7) 
        elseif FarmingXP >= 3814 then
            reward = math.ceil(amount*1.8)
        elseif FarmingXP >= 4768 then
            reward = math.ceil(amount*1.9)
        elseif FarmingXP >= 5960 then
            reward = math.ceil(amount*2.0)
        end
    else
        reward = amount
    end
    if animal == 'chicken' then
        local chance = Config.Farming.Animals.Chicken.Chance
        if chance >= math.random(1, 100) then
            pData.Functions.AddItem(Config.Farming.Animals.Chicken.Return.name, reward)
            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[Config.Farming.Animals.Chicken.Return.name], 'add', reward)
            if Config.XP.Use then
                pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(2,4))) -- Edit xp reward here
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Animals['collecteggxp'], 'success')
            else
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Animals['collecteggnoxp'], 'success')
            end
        else
            TriggerEvent(AddStressEvent, Config.Farming.Animals.Chicken.Stress)
            if Config.XP.Use then
                pData.Functions.SetMetaData(MetaDataName, (FarmingXP - math.random(1,3))) -- Edit xp reduction here
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Animals['collectanimalfailxp'], 'error')
            else
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Animals['collectanimalfailnoxp'], 'error')
            end
        end
    elseif animal == 'cow' then
        local chance = Config.Farming.Animals.Cow.Chance
        if chance >= math.random(1, 100) then
            pData.Functions.RemoveItem(Config.Farming.Animals.Cow.Required.name, 1)
            pData.Functions.AddItem(Config.Farming.Animals.Cow.Return.name, 1)
            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[Config.Farming.Animals.Cow.Return.name], 'add', 1)
            if Config.XP.Use then
                pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(2,4))) -- Edit xp reward here
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Animals['collectmilkxp'], 'success')
            else
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Animals['collectmilknoxp'], 'success')
            end
        else
            TriggerEvent(AddStressEvent, Config.Farming.Animals.Cow.Stress)
            if Config.XP.Use then
                pData.Functions.SetMetaData(MetaDataName, (FarmingXP - math.random(1,3))) -- Edit xp reduction here
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Animals['collectanimalfailxp'], 'error')
            else
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Animals['collectanimalfailnoxp'], 'error')
            end
        end
    end
end)
--<!>-- COLLECT ANIMALS --<!>--

--<!>-- REFILL TROUGHS --<!>--
RegisterServerEvent('boii-farming:sv:RefillTrough', function(trough)
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    local FarmingXP = pData.PlayerData.metadata[MetaDataName]
    if trough == 'pig' then
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-farming:notify', src, Language.Farming.Troughs['refillxp'], 'success')
        else
            TriggerClientEvent('boii-farming:notify', src, Language.Farming.Troughs['refillnoxp'], 'success')
        end
    elseif trough == 'cow' then
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-farming:notify', src, Language.Farming.Troughs['refillxp'], 'success')
        else
            TriggerClientEvent('boii-farming:notify', src, Language.Farming.Troughs['refillnoxp'], 'success')
        end
    end
end)
--<!>-- REFILL TROUGHS --<!>--