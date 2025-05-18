----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local MenuName = Config.CoreSettings.MenuName
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

-- Main menu
local MainMenu = {
    {
        header = Language.Farming.Packing['packingheader'],
        txt = Language.Farming.Packing['packingheadertext'],
        icon = Language.Farming.Packing['packingheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Farming.Packing['barleyheader'],
        txt = Language.Farming.Packing['barleyheadertext'],
        icon = Language.Farming.Packing['barleyheadericon'],
        params = {
            event = 'boii-farming:cl:PackageCrops',
            args = {
                packing = Config.Packing.Sack.Required.name,
                timer = Config.Packing.Sack.Barley.Time,
                req = Config.Packing.Sack.Barley.Required.name,
                reqamount = Config.Packing.Sack.Barley.Required.amount,
                returnitem = Config.Packing.Sack.Barley.Return.name
            }
        }
    },
    {
        header = Language.Farming.Packing['maizeheader'],
        txt = Language.Farming.Packing['maizeheadertext'],
        icon = Language.Farming.Packing['maizeheadericon'],
        params = {
            event = 'boii-farming:cl:PackageCrops',
            args = {
                packing = Config.Packing.Sack.Required.name,
                timer = Config.Packing.Sack.Maize.Time,
                req = Config.Packing.Sack.Maize.Required.name,
                reqamount = Config.Packing.Sack.Maize.Required.amount,
                returnitem = Config.Packing.Sack.Maize.Return.name
            }
        }
    },
    {
        header = Language.Farming.Packing['potatoheader'],
        txt = Language.Farming.Packing['potatoheadertext'],
        icon = Language.Farming.Packing['potatoheadericon'],
        params = {
            event = 'boii-farming:cl:PackageCrops',
            args = {
                packing = Config.Packing.Sack.Required.name,
                timer = Config.Packing.Sack.Potato.Time,
                req = Config.Packing.Sack.Potato.Required.name,
                reqamount = Config.Packing.Sack.Potato.Required.amount,
                returnitem = Config.Packing.Sack.Potato.Return.name
            }
        }
    },
    {
        header = Language.Farming.Packing['mushroomheader'],
        txt = Language.Farming.Packing['mushroomheadertext'],
        icon = Language.Farming.Packing['mushroomheadericon'],
        params = {
            event = 'boii-farming:cl:PackageCrops',
            args = {
                packing = Config.Packing.Sack.Required.name,
                timer = Config.Packing.Sack.Mushroom.Time,
                req = Config.Packing.Sack.Mushroom.Required.name,
                reqamount = Config.Packing.Sack.Mushroom.Required.amount,
                returnitem = Config.Packing.Sack.Mushroom.Return.name
            }
        }
    },
    {
        header = Language.Farming.Packing['appleheader'],
        txt = Language.Farming.Packing['appleheadertext'],
        icon = Language.Farming.Packing['appleheadericon'],
        params = {
            event = 'boii-farming:cl:PackageCrops',
            args = {
                packing = Config.Packing.Crate.Required.name,
                timer = Config.Packing.Crate.Apple.Time,
                req = Config.Packing.Crate.Apple.Required.name,
                reqamount = Config.Packing.Crate.Apple.Required.amount,
                returnitem = Config.Packing.Crate.Apple.Return.name
            }
        }
    },
    {
        header = Language.Farming.Packing['orangeheader'],
        txt = Language.Farming.Packing['orangeheadertext'],
        icon = Language.Farming.Packing['orangeheadericon'],
        params = {
            event = 'boii-farming:cl:PackageCrops',
            args = {
                packing = Config.Packing.Crate.Required.name,
                timer = Config.Packing.Crate.Orange.Time,
                req = Config.Packing.Crate.Orange.Required.name,
                reqamount = Config.Packing.Crate.Orange.Required.amount,
                returnitem = Config.Packing.Crate.Orange.Return.name
            }
        }
    },
    {
        header = Language.Farming.Packing['lemonheader'],
        txt = Language.Farming.Packing['lemonheadertext'],
        icon = Language.Farming.Packing['lemonheadericon'],
        params = {
            event = 'boii-farming:cl:PackageCrops',
            args = {
                packing = Config.Packing.Crate.Required.name,
                timer = Config.Packing.Crate.Lemon.Time,
                req = Config.Packing.Crate.Lemon.Required.name,
                reqamount = Config.Packing.Crate.Lemon.Required.amount,
                returnitem = Config.Packing.Crate.Lemon.Return.name
            }
        }
    },
    {
        header = Language.Farming.Packing['limeheader'],
        txt = Language.Farming.Packing['limeheadertext'],
        icon = Language.Farming.Packing['limeheadericon'],
        params = {
            event = 'boii-farming:cl:PackageCrops',
            args = {
                packing = Config.Packing.Crate.Required.name,
                timer = Config.Packing.Crate.Lime.Time,
                req = Config.Packing.Crate.Lime.Required.name,
                reqamount = Config.Packing.Crate.Lime.Required.amount,
                returnitem = Config.Packing.Crate.Lime.Return.name
            }
        }
    },
    {
        header = Language.Farming.Packing['lettuceheader'],
        txt = Language.Farming.Packing['lettuceheadertext'],
        icon = Language.Farming.Packing['lettuceheadericon'],
        params = {
            event = 'boii-farming:cl:PackageCrops',
            args = {
                packing = Config.Packing.Crate.Required.name,
                timer = Config.Packing.Crate.Lettuce.Time,
                req = Config.Packing.Crate.Lettuce.Required.name,
                reqamount = Config.Packing.Crate.Lettuce.Required.amount,
                returnitem = Config.Packing.Crate.Lettuce.Return.name
            }
        }
    },
    {
        header = Language.Farming.Packing['cactusfruitheader'],
        txt = Language.Farming.Packing['cactusfruitheadertext'],
        icon = Language.Farming.Packing['cactusfruitheadericon'],
        params = {
            event = 'boii-farming:cl:PackageCrops',
            args = {
                packing = Config.Packing.Crate.Required.name,
                timer = Config.Packing.Crate.CactusFruit.Time,
                req = Config.Packing.Crate.CactusFruit.Required.name,
                reqamount = Config.Packing.Crate.CactusFruit.Required.amount,
                returnitem = Config.Packing.Crate.CactusFruit.Return.name
            }
        }
    },
    {
        header = Language.Farming.Packing['tomatoheader'],
        txt = Language.Farming.Packing['tomatoheadertext'],
        icon = Language.Farming.Packing['tomatoheadericon'],
        params = {
            event = 'boii-farming:cl:PackageCrops',
            args = {
                packing = Config.Packing.Crate.Required.name,
                timer = Config.Packing.Crate.CactusFruit.Time,
                req = Config.Packing.Crate.CactusFruit.Required.name,
                reqamount = Config.Packing.Crate.CactusFruit.Required.amount,
                returnitem = Config.Packing.Crate.CactusFruit.Return.name
            }
        }
    },
    {
        header = Language.Farming.Packing['strawberryheader'],
        txt = Language.Farming.Packing['strawberryheadertext'],
        icon = Language.Farming.Packing['strawberryheadericon'],
        params = {
            event = 'boii-farming:cl:PackageCrops',
            args = {
                packing = Config.Packing.Crate.Required.name,
                timer = Config.Packing.Crate.Strawberry.Time,
                req = Config.Packing.Crate.Strawberry.Required.name,
                reqamount = Config.Packing.Crate.Strawberry.Required.amount,
                returnitem = Config.Packing.Crate.Strawberry.Return.name
            }
        }
    },
    {
        header = Language.Farming.Packing['blueberryheader'],
        txt = Language.Farming.Packing['blueberryheadertext'],
        icon = Language.Farming.Packing['blueberryheadericon'],
        params = {
            event = 'boii-farming:cl:PackageCrops',
            args = {
                packing = Config.Packing.Crate.Required.name,
                timer = Config.Packing.Crate.Blueberry.Time,
                req = Config.Packing.Crate.Blueberry.Required.name,
                reqamount = Config.Packing.Crate.Blueberry.Required.amount,
                returnitem = Config.Packing.Crate.Blueberry.Return.name
            }
        }
    },
    {
        header = Language.Farming.Packing['pineappleheader'],
        txt = Language.Farming.Packing['pineappleheadertext'],
        icon = Language.Farming.Packing['pineappleheadericon'],
        params = {
            event = 'boii-farming:cl:PackageCrops',
            args = {
                packing = Config.Packing.Crate.Required.name,
                timer = Config.Packing.Crate.Pineapple.Time,
                req = Config.Packing.Crate.Pineapple.Required.name,
                reqamount = Config.Packing.Crate.Pineapple.Required.amount,
                returnitem = Config.Packing.Crate.Pineapple.Return.name
            }
        }
    },
    {
        header = Language.Farming.Packing['milkheader'],
        txt = Language.Farming.Packing['milkheadertext'],
        icon = Language.Farming.Packing['milkheadericon'],
        params = {
            event = 'boii-farming:cl:PackageCrops',
            args = {
                packing = Config.Packing.Crate.Required.name,
                timer = Config.Packing.Crate.Milk.Time,
                req = Config.Packing.Crate.Milk.Required.name,
                reqamount = Config.Packing.Crate.Milk.Required.amount,
                returnitem = Config.Packing.Crate.Milk.Return.name
            }
        }
    },
    {
        header = Language.Farming.Packing['eggheader'],
        txt = Language.Farming.Packing['eggheadertext'],
        icon = Language.Farming.Packing['eggheadericon'],
        params = {
            event = 'boii-farming:cl:PackageCrops',
            args = {
                packing = Config.Packing.Crate.Required.name,
                timer = Config.Packing.Crate.Egg.Time,
                req = Config.Packing.Crate.Egg.Required.name,
                reqamount = Config.Packing.Crate.Egg.Required.amount,
                returnitem = Config.Packing.Crate.Egg.Return.name
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

-- Menu event
RegisterNetEvent('boii-farming:cl:PackingMenu', function()
    exports[MenuName]:openMenu(MainMenu)
end)