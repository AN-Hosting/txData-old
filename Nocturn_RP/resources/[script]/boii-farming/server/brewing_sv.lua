----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local MetaDataName = Config.XP.MetaDataName
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

--<!>-- PREP MASH --<!>--
RegisterServerEvent('boii-farming:sv:PrepareMash', function(timer, timer2, req, req2, req3, req4, reqamount2, reqamount3, reqamount4, returnitem)
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    local FarmingXP = pData.PlayerData.metadata[MetaDataName]
    if pData.Functions.GetItemByName(req) ~= nil then
        if pData.Functions.GetItemByName(req2) ~= nil then
            if pData.Functions.GetItemByName(req2).amount >= reqamount2 then
                if pData.Functions.GetItemByName(req3) ~= nil then
                    if pData.Functions.GetItemByName(req3).amount >= reqamount3 then
                        if pData.Functions.GetItemByName(req4) ~= nil then
                            if pData.Functions.GetItemByName(req4).amount >= reqamount4 then
                                pData.Functions.RemoveItem(req, 1)
                                pData.Functions.RemoveItem(req2, reqamount2)
                                pData.Functions.RemoveItem(req3, reqamount3)
                                pData.Functions.RemoveItem(req4, reqamount4)
                                TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[req], 'remove', 1)
                                TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[req2], 'remove', reqamount2)
                                TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[req3], 'remove', reqamount3)
                                TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[req4], 'remove', reqamount4)
                                TriggerClientEvent('boii-farming:cl:PrepMash', src, timer, timer2, returnitem)
                                if Config.XP.Use then
                                    pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(1,3))) -- Edit xp reward here
                                end
                            else
                                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Brewing['wrongitems'], 'error')
                            end
                        else
                            TriggerClientEvent('boii-farming:notify', src, Language.Farming.Brewing['wrongitems'], 'error')
                        end
                    else
                        TriggerClientEvent('boii-farming:notify', src, Language.Farming.Brewing['wrongitems'], 'error')
                    end
                else
                    TriggerClientEvent('boii-farming:notify', src, Language.Farming.Brewing['wrongitems'], 'error')
                end
            else
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Brewing['wrongitems'], 'error')
            end
        else
            TriggerClientEvent('boii-farming:notify', src, Language.Farming.Brewing['wrongitems'], 'error')
        end
    else
        TriggerClientEvent('boii-farming:notify', src, Language.Farming.Brewing['nobucket'], 'error')
    end
end)
--<!>-- PREP MASH --<!>--

--<!>-- FERMENT --<!>--
RegisterServerEvent('boii-farming:sv:FermentAlcohol', function(timer, timer2, req, req2, reqamount, reqamount2, returnitem)
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    local FarmingXP = pData.PlayerData.metadata[MetaDataName]
    if pData.Functions.GetItemByName(req) ~= nil then
        print('req')
        if pData.Functions.GetItemByName(req).amount >= reqamount then
            print('reqamount')
            if pData.Functions.GetItemByName(req2) ~= nil then
                print('req2')
                if pData.Functions.GetItemByName(req2).amount >= reqamount2 then
                    print('reqamount2')
                    pData.Functions.RemoveItem(req, reqamount)
                    pData.Functions.RemoveItem(req2, reqamount2)
                    TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[req], 'remove', reqamount)
                    TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[req2], 'remove', reqamount2)
                    TriggerClientEvent('boii-farming:cl:FermAlcohol', src, timer, timer2, returnitem)
                    if Config.XP.Use then
                        pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(1,3))) -- Edit xp reward here
                    end
                else
                    TriggerClientEvent('boii-farming:notify', src, Language.Farming.Brewing['wrongitems'], 'error')
                end
            else
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Brewing['wrongitems'], 'error')
            end
        else
            TriggerClientEvent('boii-farming:notify', src, Language.Farming.Brewing['wrongitems'], 'error')
        end
    else
        TriggerClientEvent('boii-farming:notify', src, Language.Farming.Brewing['wrongitems'], 'error')
    end
end)
--<!>-- FERMENT --<!>--

--<!>-- DISTILL --<!>--
RegisterServerEvent('boii-farming:sv:DistillAlcohol', function(timer, req, req2, reqamount2, returnitem)
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    local FarmingXP = pData.PlayerData.metadata[MetaDataName]
    if pData.Functions.GetItemByName(req) ~= nil then
        if pData.Functions.GetItemByName(req2) ~= nil then
            if pData.Functions.GetItemByName(req2).amount >= reqamount2 then
                pData.Functions.RemoveItem(req, 1)
                pData.Functions.RemoveItem(req2, reqamount2)
                TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[req], 'remove', 1)
                TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[req2], 'remove', reqamount2)
                TriggerClientEvent('boii-farming:cl:DistAlcohol', src, timer, returnitem)
                if Config.XP.Use then
                    pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(1,3))) -- Edit xp reward here
                end
            else
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Brewing['wrongitems'], 'error')
            end
        else
            TriggerClientEvent('boii-farming:notify', src, Language.Farming.Brewing['wrongitems'], 'error')
        end
    else
        TriggerClientEvent('boii-farming:notify', src, Language.Farming.Brewing['nobucket'], 'error')
    end
end)
--<!>-- DISTILL --<!>--