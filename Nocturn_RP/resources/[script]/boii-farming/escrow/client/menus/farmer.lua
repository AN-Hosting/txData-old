----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local MenuName = Config.CoreSettings.MenuName
local MetaDataName = Config.XP.MetaDataName
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

-- Low xp menu
local LowXP = {
    {
        header = Language.Farming.Farmer['farmerheader'],
        txt = Language.Farming.Farmer['farmerheadertext'],
        icon = Language.Farming.Farmer['farmerheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Farming.Farmer['storeheader'],
        txt = Language.Farming.Farmer['storeheadertext'],
        icon = Language.Farming.Farmer['storeheadericon'],
        params = {
            event = 'boii-farming:cl:OpenShop',
        }
    },
    {
        header = Language.Shared['exitmenu'],
        icon = Language.Shared['exitmenuicon'],
        params = {
            event = 'boii-farming:cl:StopMenu'
        }
    },
}

-- High xp menu
local HighXP = {
    {
        header = Language.Farming.Farmer['farmerheader'],
        txt = Language.Farming.Farmer['farmerheadertext'],
        icon = Language.Farming.Farmer['farmerheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Farming.Farmer['storeheader'],
        txt = Language.Farming.Farmer['storeheadertext'],
        icon = Language.Farming.Farmer['storeheadericon'],
        params = {
            event = 'boii-farming:cl:OpenShop',
        }
    },
    {
        header = Language.Farming.Farmer['infoheader'],
        txt = Language.Farming.Farmer['infoheadertext'],
        icon = Language.Farming.Farmer['infoheadericon'],
        params = {
            event = 'boii-farming:cl:RequestInfo',
        }
    },
    {
        header = Language.Shared['exitmenu'],
        icon = Language.Shared['exitmenuicon'],
        params = {
            event = 'boii-farming:cl:StopMenu'
        }
    },
}

-- No xp menu used if xp is disabled
local NoXP = {
    {
        header = Language.Farming.Farmer['farmerheader'],
        txt = Language.Farming.Farmer['farmerheadertext'],
        icon = Language.Farming.Farmer['farmerheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Farming.Farmer['storeheader'],
        txt = Language.Farming.Farmer['storeheadertext'],
        icon = Language.Farming.Farmer['storeheadericon'],
        params = {
            event = 'boii-farming:cl:OpenShop',
        }
    },
    {
        header = Language.Farming.Farmer['infoheader'],
        txt = Language.Farming.Farmer['infoheadertext'],
        icon = Language.Farming.Farmer['infoheadericon'],
        params = {
            event = 'boii-farming:cl:RequestInfo',
        }
    },
    {
        header = Language.Shared['exitmenu'],
        icon = Language.Shared['exitmenuicon'],
        params = {
            event = 'boii-farming:cl:StopMenu'
        }
    },
}

-- Events
RegisterNetEvent('boii-farming:cl:FarmPed', function()
    local pData = Core.Functions.GetPlayerData()
    local FarmingXP = pData.metadata[MetaDataName]
    if Config.Stores.Farmer.UseTimes then
        if GetClockHours() >= Config.Stores.Farmer.Open and GetClockHours() <= Config.Stores.Farmer.Close then
            if Config.XP.Use then
                if FarmingXP >= 5960 then
                    exports[MenuName]:openMenu(HighXP)
                else
                    exports[MenuName]:openMenu(LowXP)
                end
            else
                exports[MenuName]:openMenu(NoXP)
            end
        else 
            TriggerEvent('boii-farming:notify', Language.Farming.Farmer['timer'], 'error')
        end
    else
        if Config.XP.Use then
            if FarmingXP >= 5960 then
                exports[MenuName]:openMenu(HighXP)
            else
                exports[MenuName]:openMenu(LowXP)
            end
        else
            exports[MenuName]:openMenu(NoXP)
        end
    end 
end)