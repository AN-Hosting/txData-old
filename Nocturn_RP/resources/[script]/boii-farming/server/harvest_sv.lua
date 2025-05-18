----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local MetaDataName = Config.XP.MetaDataName
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

--<!>-- HARVEST CROPS --<!>--
RegisterNetEvent('boii-farming:sv:Harvest',function(croptype, cropdata)
    local pData = Core.Functions.GetPlayer(source)
    local FarmingXP = pData.PlayerData.metadata[MetaDataName]
    local amount = math.random(2,6)
    if Config.XP.Use then
        if FarmingXP <= 1000 then
            if cropdata.quality > 95 then
                addamount = math.ceil(amount*0.7)
            else
                addamount = math.ceil(amount*0.5)
            end
        elseif FarmingXP >= 1000 then
            if cropdata.quality > 95 then
                addamount = math.ceil(amount*0.7)
            else
                addamount = math.ceil(amount*0.5)
            end
        elseif FarmingXP >= 1250 then
            if cropdata.quality > 95 then
                addamount = math.ceil(amount*0.8)
            else
                addamount = math.ceil(amount*0.6)
            end
        elseif FarmingXP >= 1562 then
            if cropdata.quality > 95 then
                addamount = math.ceil(amount*0.9)
            else
                addamount = math.ceil(amount*0.7)
            end
        elseif FarmingXP >= 1953 then
            if cropdata.quality > 95 then
                addamount = math.ceil(amount*1.1)
            else
                addamount = math.ceil(amount*0.9)
            end
        elseif FarmingXP >= 2441 then
            if cropdata.quality > 95 then
                addamount = math.ceil(amount*1.3)
            else
                addamount = math.ceil(amount*1.1)
            end
        elseif FarmingXP >= 3051 then
            if cropdata.quality > 95 then
                addamount = math.ceil(amount*1.5)
            else
                addamount = math.ceil(amount*1.3)
            end
        elseif FarmingXP >= 3814 then
            if cropdata.quality > 95 then
                addamount = math.ceil(amount*1.7)
            else
                addamount = math.ceil(amount*1.5)
            end
        elseif FarmingXP >= 4768 then
            if cropdata.quality > 95 then
                addamount = math.ceil(amount*1.9)
            else
                addamount = math.ceil(amount*1.7)
            end
        elseif FarmingXP >= 5960 then
            if cropdata.quality > 95 then
                addamount = math.ceil(amount*2.1)
            else
                addamount = math.ceil(amount*1.9)
            end
        end
    else
        if cropdata.quality > 95 then
            addamount = math.ceil(amount*2.5)
        else
			addamount = amount
        end
    end
    -- Barley
    if croptype == 'Barley' then
        pData.Functions.AddItem('barley', addamount) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['barley'], 'add', addamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestnoxp'], 'success')
        end
        return
    end
    -- Maize
    if croptype == 'Maize' then
        pData.Functions.AddItem('maize', addamount) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['maize'], 'add', addamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestnoxp'], 'success')
        end
        return
    end
    -- Potato
    if croptype == 'Potato' then
        pData.Functions.AddItem('potato', addamount) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['potato'], 'add', addamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestnoxp'], 'success')
        end
        return
    end
    -- Lettuce
    if croptype == 'Lettuce' then
        pData.Functions.AddItem('lettuce', addamount) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['lettuce'], 'add', addamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestnoxp'], 'success')
        end
        return
    end
    -- Strawberry
    if croptype == 'Strawberry' then
        pData.Functions.AddItem('strawberry', addamount) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['strawberry'], 'add', addamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestnoxp'], 'success')
        end
        return
    end
    -- Blueberry
    if croptype == 'Blueberry' then
        pData.Functions.AddItem('blueberry', addamount) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['blueberry'], 'add', addamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestnoxp'], 'success')
        end
        return
    end
    -- Pineapple
    if croptype == 'Pineapple' then
        pData.Functions.AddItem('pineapple', addamount) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['pineapple'], 'add', addamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestnoxp'], 'success')
        end
        return
    end
    -- Tomato
    if croptype == 'Tomato' then
        pData.Functions.AddItem('tomato', addamount) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['tomato'], 'add', addamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestnoxp'], 'success')
        end
        return
    end
    -- Mushroom
    if croptype == 'Mushroom' then
        if 100 >= math.random(1, 100) then
            pData.Functions.AddItem('psilocybin_seed', math.floor(addamount/2)) -- Change return item here
            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['psilocybin_seed'], 'add', math.floor(addamount/2))
        end
        pData.Functions.AddItem('mushroom', addamount) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['mushroom'], 'add', addamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestnoxp'], 'success')
        end
        return
    end
    -- Cactus
    if croptype == 'Cactus' then
        if 100 >= math.random(1, 100) then
            pData.Functions.AddItem('peyote_seed', math.floor(addamount/2)) -- Change return item here
            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['peyote_seed'], 'add', math.floor(addamount/2))
        end
        pData.Functions.AddItem('cactusfruit', addamount) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['cactusfruit'], 'add', addamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestnoxp'], 'success')
        end
        return
    end
    -- Psilocybin
    if croptype == 'Psilocybin' then
        pData.Functions.AddItem('magic_mushroom', addamount) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['magic_mushroom'], 'add', addamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestnoxp'], 'success')
        end
        return
    end
    -- Psilocybin
    if croptype == 'Peyote' then
        pData.Functions.AddItem('peyote_button', addamount) -- Change return item here
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items['peyote_button'], 'add', addamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestxp'], 'success')
        else
            TriggerClientEvent('boii-farming:notify', source, Language.Farming.Planting['harvestnoxp'], 'success')
        end
        return
    end
end)
--<!>-- HARVEST PLANTS --<!>--