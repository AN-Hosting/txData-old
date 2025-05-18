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

-- Still menu
local Still = {
    {
        header = Language.Farming.Brewing['stillheader'],
        txt = Language.Farming.Brewing['stillheadertext'],
        icon = Language.Farming.Brewing['stillheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Farming.Brewing['mashheader'],
        txt = Language.Farming.Brewing['mashheadertext'],
        icon = Language.Farming.Brewing['mashheadericon'],
        params = {
            event = 'boii-farming:cl:StillMenus',
            args = {
                menu = 'mash'
            }
        }
    },
    {
        header = Language.Farming.Brewing['distillheader'],
        txt = Language.Farming.Brewing['distillheadertext'],
        icon = Language.Farming.Brewing['distillheadericon'],
        params = {
            event = 'boii-farming:cl:StillMenus',
            args = {
                menu = 'distill'
            }
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

-- Mash menu
local Mash = {
    {
        header = Language.Farming.Brewing['mashheader'],
        txt = Language.Farming.Brewing['mashheadertext'],
        icon = Language.Farming.Brewing['mashheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Farming.Brewing['moonshinemashheader'],
        txt = Language.Farming.Brewing['moonshinemashheadertext'],
        icon = Language.Farming.Brewing['moonshinemashheadericon'],
        params = {
            event = 'boii-farming:cl:PrepareMash',
            args = {
                timer = Config.Brewing.Moonshine.Mash.Time,
                timer2 = Config.Brewing.Moonshine.Mash.Wait,
                req = Config.Brewing.Moonshine.Mash.Required['1'].name,
                req2 = Config.Brewing.Moonshine.Mash.Required['2'].name,
                req3 = Config.Brewing.Moonshine.Mash.Required['3'].name,
                req4 = Config.Brewing.Moonshine.Mash.Required['4'].name,
                reqamount2 = Config.Brewing.Moonshine.Mash.Required['2'].amount,
                reqamount3 = Config.Brewing.Moonshine.Mash.Required['3'].amount,
                reqamount4 = Config.Brewing.Moonshine.Mash.Required['4'].amount,
                returnitem = Config.Brewing.Moonshine.Mash.Return.name
            }
        }
    },
    {
        header = Language.Farming.Brewing['vodkamashheader'],
        txt = Language.Farming.Brewing['vodkamashheadertext'],
        icon = Language.Farming.Brewing['vodkamashheadericon'],
        params = {
            event = 'boii-farming:cl:PrepareMash',
            args = {
                timer = Config.Brewing.Vodka.Mash.Time,
                timer2 = Config.Brewing.Vodka.Mash.Wait,
                req = Config.Brewing.Vodka.Mash.Required['1'].name,
                req2 = Config.Brewing.Vodka.Mash.Required['2'].name,
                req3 = Config.Brewing.Vodka.Mash.Required['3'].name,
                req4 = Config.Brewing.Vodka.Mash.Required['4'].name,
                reqamount2 = Config.Brewing.Vodka.Mash.Required['2'].amount,
                reqamount3 = Config.Brewing.Vodka.Mash.Required['3'].amount,
                reqamount4 = Config.Brewing.Vodka.Mash.Required['4'].amount,
                returnitem = Config.Brewing.Vodka.Mash.Return.name
            }
        }
    },
    {
        header = Language.Shared['returnmenu'],
        icon = Language.Shared['returnmenuicon'],
        params = {
            event = 'boii-farming:cl:StillMenu'
        }
    },
}

-- Distill menu
local Distill = {
    {
        header = Language.Farming.Brewing['distillheader'],
        txt = Language.Farming.Brewing['distillheadertext'],
        icon = Language.Farming.Brewing['distillheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Farming.Brewing['moonshinedistheader'],
        txt = Language.Farming.Brewing['moonshinedistheadertext'],
        icon = Language.Farming.Brewing['moonshinedistheadericon'],
        params = {
            event = 'boii-farming:cl:DistillAlcohol',
            args = {
                timer = Config.Brewing.Moonshine.Distill.Time,
                req = Config.Brewing.Moonshine.Distill.Required['1'].name,
                req2 = Config.Brewing.Moonshine.Distill.Required['2'].name,
                reqamount2 = Config.Brewing.Moonshine.Distill.Required['2'].amount,
                returnitem = Config.Brewing.Moonshine.Distill.Return.name
            }
        }
    },
    {
        header = Language.Farming.Brewing['vodkadistheader'],
        txt = Language.Farming.Brewing['vodkadistheadertext'],
        icon = Language.Farming.Brewing['vodkadistheadericon'],
        params = {
            event = 'boii-farming:cl:DistillAlcohol',
            args = {
                timer = Config.Brewing.Vodka.Distill.Time,
                req = Config.Brewing.Vodka.Distill.Required['1'].name,
                req2 = Config.Brewing.Vodka.Distill.Required['2'].name,
                reqamount2 = Config.Brewing.Vodka.Distill.Required['2'].amount,
                returnitem = Config.Brewing.Vodka.Distill.Return.name
            }
        }
    },
    {
        header = Language.Shared['returnmenu'],
        icon = Language.Shared['returnmenuicon'],
        params = {
            event = 'boii-farming:cl:StillMenu'
        }
    },
}

-- Ferment menu
local Ferment = {
    {
        header = Language.Farming.Brewing['fermentheader'],
        txt = Language.Farming.Brewing['fermentheadertext'],
        icon = Language.Farming.Brewing['fermentheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Farming.Brewing['moonshinefermheader'],
        txt = Language.Farming.Brewing['moonshinefermheadertext'],
        icon = Language.Farming.Brewing['moonshinefermheadericon'],
        params = {
            event = 'boii-farming:cl:FermentAlcohol',
            args = {
                timer = Config.Brewing.Moonshine.Ferment.Time,
                timer2 = Config.Brewing.Moonshine.Ferment.Wait,
                req = Config.Brewing.Moonshine.Ferment.Required['1'].name,
                req2 = Config.Brewing.Moonshine.Ferment.Required['2'].name,
                reqamount = Config.Brewing.Moonshine.Ferment.Required['1'].amount,
                reqamount2 = Config.Brewing.Moonshine.Ferment.Required['2'].amount,
                returnitem = Config.Brewing.Moonshine.Ferment.Return.name
            }
        }
    },
    {
        header = Language.Farming.Brewing['vodkafermheader'],
        txt = Language.Farming.Brewing['vodkafermheadertext'],
        icon = Language.Farming.Brewing['vodkafermheadericon'],
        params = {
            event = 'boii-farming:cl:FermentAlcohol',
            args = {
                timer = Config.Brewing.Vodka.Ferment.Time,
                timer2 = Config.Brewing.Vodka.Ferment.Wait,
                req = Config.Brewing.Vodka.Ferment.Required['1'].name,
                req2 = Config.Brewing.Vodka.Ferment.Required['2'].name,
                reqamount = Config.Brewing.Vodka.Ferment.Required['1'].amount,
                reqamount2 = Config.Brewing.Vodka.Ferment.Required['2'].amount,
                returnitem = Config.Brewing.Vodka.Ferment.Return.name
            }
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

-- Still menu event
RegisterNetEvent('boii-farming:cl:StillMenu', function()
    local pData = Core.Functions.GetPlayerData()
    local FarmingXP = pData.metadata[MetaDataName]
    if Config.XP.Use then
        if FarmingXP >= 5960 then
            exports[MenuName]:openMenu(Still)
        else
            TriggerEvent('boii-farming:notify', Language.Farming.Brewing['level'], 'error')
        end
    else
        exports[MenuName]:openMenu(Still)
    end
end)

-- Still menus
RegisterNetEvent('boii-farming:cl:StillMenus', function(args)
    if args.menu == 'mash' then
        exports[MenuName]:openMenu(Mash)
    elseif args.menu == 'distill' then
        exports[MenuName]:openMenu(Distill)
    end
end)

-- Ferment menu event
RegisterNetEvent('boii-farming:cl:BarrelMenu', function()
    local pData = Core.Functions.GetPlayerData()
    local FarmingXP = pData.metadata[MetaDataName]
    if Config.XP.Use then
        if FarmingXP >= 5960 then
            exports[MenuName]:openMenu(Ferment)
        else
            TriggerEvent('boii-farming:notify', Language.Farming.Brewing['level'], 'error')
        end
    else
        exports[MenuName]:openMenu(Ferment)
    end
end)