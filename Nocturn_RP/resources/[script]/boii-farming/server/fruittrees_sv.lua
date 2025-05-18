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

--<!>-- PICK FRUIT TREE --<!>--
RegisterServerEvent('boii-farming:sv:PickFruitTree', function(tree)
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    local FarmingXP = pData.PlayerData.metadata[MetaDataName]
    local amount = math.ceil(math.random(1,3))
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
    if tree == 'apple' then
        local chance = Config.Farming.Trees.Apple.Chance
        if chance >= math.random(1, 100) then
            pData.Functions.AddItem(Config.Farming.Trees.Apple.Return.name, reward)
            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[Config.Farming.Trees.Apple.Return.name], 'add', reward)
            if Config.XP.Use then
                pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(2,4))) -- Edit xp reward here
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Trees['pickapplexp'], 'success')
            else
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Trees['pickapplenoxp'], 'success')
            end
        else
            TriggerEvent(AddStressEvent, Config.Farming.Trees.Apple.Stress)
            if Config.XP.Use then
                pData.Functions.SetMetaData(MetaDataName, (FarmingXP - math.random(1,3))) -- Edit xp reduction here
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Trees['picktreefailxp'], 'error')
            else
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Trees['picktreefailnoxp'], 'error')
            end
        end
        return
    end
    if tree == 'orange' then
        local chance = Config.Farming.Trees.Orange.Chance
        if chance >= math.random(1, 100) then
            pData.Functions.AddItem(Config.Farming.Trees.Orange.Return.name, reward)
            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[Config.Farming.Trees.Orange.Return.name], 'add', reward)
            if Config.XP.Use then
                pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(2,4))) -- Edit xp reward here
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Trees['pickorangexp'], 'success')
            else
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Trees['pickorangenoxp'], 'success')
            end
        else
            TriggerEvent(AddStressEvent, Config.Farming.Trees.Orange.Stress)
            if Config.XP.Use then
                pData.Functions.SetMetaData(MetaDataName, (FarmingXP - math.random(1,3))) -- Edit xp reduction here
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Trees['picktreefailxp'], 'error')
            else
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Trees['picktreefailnoxp'], 'error')
            end
        end
        return 
    end
    if tree == 'lemon' then
        local chance = Config.Farming.Trees.Lemon.Chance
        if chance >= math.random(1, 100) then
            pData.Functions.AddItem(Config.Farming.Trees.Lemon.Return.name, reward)
            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[Config.Farming.Trees.Lemon.Return.name], 'add', reward)
            if Config.XP.Use then
                pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(2,4))) -- Edit xp reward here
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Trees['picklemonxp'], 'success')
            else
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Trees['picklemonnoxp'], 'success')
            end
        else
            TriggerEvent(AddStressEvent, Config.Farming.Trees.Lemon.Stress)
            if Config.XP.Use then
                pData.Functions.SetMetaData(MetaDataName, (FarmingXP - math.random(1,3))) -- Edit xp reduction here
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Trees['picktreefailxp'], 'error')
            else
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Trees['picktreefailnoxp'], 'error')
            end
        end
        return 
    end
    if tree == 'lime' then
        local chance = Config.Farming.Trees.Lime.Chance
        if chance >= math.random(1, 100) then
            pData.Functions.AddItem(Config.Farming.Trees.Lime.Return.name, reward)
            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[Config.Farming.Trees.Lime.Return.name], 'add', reward)
            if Config.XP.Use then
                pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(2,4))) -- Edit xp reward here
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Trees['picklimexp'], 'success')
            else
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Trees['picklimenoxp'], 'success')
            end
        else
            TriggerEvent(AddStressEvent, Config.Farming.Trees.Lime.Stress)
            if Config.XP.Use then
                pData.Functions.SetMetaData(MetaDataName, (FarmingXP - math.random(1,3))) -- Edit xp reduction here
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Trees['picktreefailxp'], 'error')
            else
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Trees['picktreefailnoxp'], 'error')
            end
        end
        return 
    end
end)
--<!>-- PICK FRUIT TREE --<!>--

