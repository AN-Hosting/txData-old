----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local MetaDataName = Config.XP.MetaDataName
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

--<!>-- PACKING --<!>--
RegisterServerEvent('boii-farming:sv:PackageCrops', function(timer, packing, req, reqamount, returnitem)
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    local FarmingXP = pData.PlayerData.metadata[MetaDataName]
    if pData.Functions.GetItemByName(packing) ~= nil then
        if pData.Functions.GetItemByName(req) ~= nil then
            if pData.Functions.GetItemByName(req).amount >= reqamount then
                pData.Functions.RemoveItem(packing, 1)
                pData.Functions.RemoveItem(req, reqamount)
                TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[packing], 'remove', 1)
                TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[req], 'remove', reqamount)
                TriggerClientEvent('boii-farming:cl:PackCrops', src, timer, returnitem)
                if Config.XP.Use then
                    if Config.XP.Use then
                        pData.Functions.SetMetaData(MetaDataName, (FarmingXP + math.random(1,3))) -- Edit xp reward here
                    end
                end
            else
                TriggerClientEvent('boii-farming:notify', src, Language.Farming.Packing['enoughitems'], 'error')
            end
        else
            TriggerClientEvent('boii-farming:notify', src, Language.Farming.Packing['anyitems'], 'error')
        end
    else
        TriggerClientEvent('boii-farming:notify', src, Language.Farming.Packing['nopacking'], 'error')
    end
end)
--<!>-- PACKING --<!>--