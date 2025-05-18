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
        header = Language.Farming.Warehouse['warehouseheader'],
        txt = Language.Farming.Warehouse['warehouseheadertext'],
        icon = Language.Farming.Warehouse['warehouseheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Farming.Warehouse['buyheader'],
        txt = Language.Farming.Warehouse['buyheadertext'],
        icon = Language.Farming.Warehouse['buyheadericon'],
        params = {
            event = 'boii-farming:cl:WarehouseMenus',
            args = {
                menu = 'buy'
            }
        }
    },
    {
        header = Language.Farming.Warehouse['sellheader'],
        txt = Language.Farming.Warehouse['sellheadertext'],
        icon = Language.Farming.Warehouse['sellheadericon'],
        params = {
            event = 'boii-farming:cl:WarehouseMenus',
            args = {
                menu = 'sell'
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

-- Buying menu
local BuyMenu = {
    {
        header = Language.Farming.Warehouse['buyheader'],
        txt = Language.Farming.Warehouse['buyheadertext'],
        icon = Language.Farming.Warehouse['buyheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Farming.Warehouse['barleybuyheader'],
        txt = Language.Farming.Warehouse['barleybuyheadertext'],
        icon = Language.Farming.Warehouse['barleyheadericon'],
        params = {
            event = 'boii-farming:cl:BuyCrops',
            args = {
                crop = Config.Packing.Sack.Barley.Required.label,
                returnitem = Config.Packing.Sack.Barley.Required.name,
                price = Config.Stores.Warehouse.Prices.Buy.Barley
            }
        }
    },
    {
        header = Language.Farming.Warehouse['maizebuyheader'],
        txt = Language.Farming.Warehouse['maizebuyheadertext'],
        icon = Language.Farming.Warehouse['maizeheadericon'],
        params = {
            event = 'boii-farming:cl:BuyCrops',
            args = {
                crop = Config.Packing.Sack.Maize.Required.label,
                returnitem = Config.Packing.Sack.Maize.Required.name,
                price = Config.Stores.Warehouse.Prices.Buy.Maize
            }
        }
    },
    {
        header = Language.Farming.Warehouse['potatobuyheader'],
        txt = Language.Farming.Warehouse['potatobuyheadertext'],
        icon = Language.Farming.Warehouse['potatoheadericon'],
        params = {
            event = 'boii-farming:cl:BuyCrops',
            args = {
                crop = Config.Packing.Sack.Potato.Required.label,
                returnitem = Config.Packing.Sack.Potato.Required.name,
                price = Config.Stores.Warehouse.Prices.Buy.Potato
            }
        }
    },
    {
        header = Language.Farming.Warehouse['mushroombuyheader'],
        txt = Language.Farming.Warehouse['mushroombuyheadertext'],
        icon = Language.Farming.Warehouse['mushroomheadericon'],
        params = {
            event = 'boii-farming:cl:BuyCrops',
            args = {
                crop = Config.Packing.Sack.Mushroom.Required.label,
                returnitem = Config.Packing.Sack.Mushroom.Required.name,
                price = Config.Stores.Warehouse.Prices.Buy.Mushroom
            }
        }
    },
    {
        header = Language.Farming.Warehouse['applebuyheader'],
        txt = Language.Farming.Warehouse['applebuyheadertext'],
        icon = Language.Farming.Warehouse['appleheadericon'],
        params = {
            event = 'boii-farming:cl:BuyCrops',
            args = {
                crop = Config.Packing.Crate.Apple.Required.label,
                returnitem = Config.Packing.Crate.Apple.Required.name,
                price = Config.Stores.Warehouse.Prices.Buy.Apple
            }
        }
    },
    {
        header = Language.Farming.Warehouse['orangebuyheader'],
        txt = Language.Farming.Warehouse['orangebuyheadertext'],
        icon = Language.Farming.Warehouse['orangeheadericon'],
        params = {
            event = 'boii-farming:cl:BuyCrops',
            args = {
                crop = Config.Packing.Crate.Orange.Required.label,
                returnitem = Config.Packing.Crate.Orange.Required.name,
                price = Config.Stores.Warehouse.Prices.Buy.Orange
            }
        }
    },
    {
        header = Language.Farming.Warehouse['lemonbuyheader'],
        txt = Language.Farming.Warehouse['lemonbuyheadertext'],
        icon = Language.Farming.Warehouse['lemonheadericon'],
        params = {
            event = 'boii-farming:cl:BuyCrops',
            args = {
                crop = Config.Packing.Crate.Lemon.Required.label,
                returnitem = Config.Packing.Crate.Lemon.Required.name,
                price = Config.Stores.Warehouse.Prices.Buy.Lemon
            }
        }
    },
    {
        header = Language.Farming.Warehouse['limebuyheader'],
        txt = Language.Farming.Warehouse['limebuyheadertext'],
        icon = Language.Farming.Warehouse['limeheadericon'],
        params = {
            event = 'boii-farming:cl:BuyCrops',
            args = {
                crop = Config.Packing.Crate.Lime.Required.label,
                returnitem = Config.Packing.Crate.Lime.Required.name,
                price = Config.Stores.Warehouse.Prices.Buy.Lime
            }
        }
    },
    {
        header = Language.Farming.Warehouse['lettucebuyheader'],
        txt = Language.Farming.Warehouse['lettucebuyheadertext'],
        icon = Language.Farming.Warehouse['lettuceheadericon'],
        params = {
            event = 'boii-farming:cl:BuyCrops',
            args = {
                crop = Config.Packing.Crate.Lettuce.Required.label,
                returnitem = Config.Packing.Crate.Lettuce.Required.name,
                price = Config.Stores.Warehouse.Prices.Buy.Lettuce
            }
        }
    },
    {
        header = Language.Farming.Warehouse['cactusfruitbuyheader'],
        txt = Language.Farming.Warehouse['cactusfruitbuyheadertext'],
        icon = Language.Farming.Warehouse['cactusfruitheadericon'],
        params = {
            event = 'boii-farming:cl:BuyCrops',
            args = {
                crop = Config.Packing.Crate.CactusFruit.Required.label,
                returnitem = Config.Packing.Crate.CactusFruit.Required.name,
                price = Config.Stores.Warehouse.Prices.Buy.CactusFruit
            }
        }
    },
    {
        header = Language.Farming.Warehouse['tomatobuyheader'],
        txt = Language.Farming.Warehouse['tomatobuyheadertext'],
        icon = Language.Farming.Warehouse['tomatoheadericon'],
        params = {
            event = 'boii-farming:cl:BuyCrops',
            args = {
                crop = Config.Packing.Crate.Tomato.Required.label,
                returnitem = Config.Packing.Crate.Tomato.Required.name,
                price = Config.Stores.Warehouse.Prices.Buy.Tomato
            }
        }
    },
    {
        header = Language.Farming.Warehouse['strawberrybuyheader'],
        txt = Language.Farming.Warehouse['strawberrybuyheadertext'],
        icon = Language.Farming.Warehouse['strawberryheadericon'],
        params = {
            event = 'boii-farming:cl:BuyCrops',
            args = {
                crop = Config.Packing.Crate.Strawberry.Required.label,
                returnitem = Config.Packing.Crate.Strawberry.Required.name,
                price = Config.Stores.Warehouse.Prices.Buy.Strawberry
            }
        }
    },
    {
        header = Language.Farming.Warehouse['blueberrybuyheader'],
        txt = Language.Farming.Warehouse['blueberrybuyheadertext'],
        icon = Language.Farming.Warehouse['blueberryheadericon'],
        params = {
            event = 'boii-farming:cl:BuyCrops',
            args = {
                crop = Config.Packing.Crate.Blueberry.Required.label,
                returnitem = Config.Packing.Crate.Blueberry.Required.name,
                price = Config.Stores.Warehouse.Prices.Buy.Blueberry
            }
        }
    },
    {
        header = Language.Farming.Warehouse['pineapplebuyheader'],
        txt = Language.Farming.Warehouse['pineapplebuyheadertext'],
        icon = Language.Farming.Warehouse['pineappleheadericon'],
        params = {
            event = 'boii-farming:cl:BuyCrops',
            args = {
                crop = Config.Packing.Crate.Pineapple.Required.label,
                returnitem = Config.Packing.Crate.Pineapple.Required.name,
                price = Config.Stores.Warehouse.Prices.Buy.Pineapple
            }
        }
    },
    {
        header = Language.Farming.Warehouse['milkbuyheader'],
        txt = Language.Farming.Warehouse['milkbuyheadertext'],
        icon = Language.Farming.Warehouse['milkheadericon'],
        params = {
            event = 'boii-farming:cl:BuyCrops',
            args = {
                crop = Config.Packing.Crate.Milk.Required.label,
                returnitem = Config.Packing.Crate.Milk.Required.name,
                price = Config.Stores.Warehouse.Prices.Buy.Milk
            }
        }
    },
    {
        header = Language.Farming.Warehouse['eggbuyheader'],
        txt = Language.Farming.Warehouse['eggbuyheadertext'],
        icon = Language.Farming.Warehouse['eggheadericon'],
        params = {
            event = 'boii-farming:cl:BuyCrops',
            args = {
                crop = Config.Packing.Crate.Egg.Required.label,
                returnitem = Config.Packing.Crate.Egg.Required.name,
                price = Config.Stores.Warehouse.Prices.Buy.Egg
            }
        }
    },
    {
        header = Language.Shared['returnmenu'],
        icon = Language.Shared['returnmenuicon'],
        params = {
            event = 'boii-farming:cl:WarehousePed'
        }
    },
}

-- Selling menu
local SellMenu = {
    {
        header = Language.Farming.Warehouse['warehouseheader'],
        txt = Language.Farming.Warehouse['warehouseheadertext'],
        icon = Language.Farming.Warehouse['warehouseheadericon'],
        isMenuHeader = true
    },
    {
        header = Language.Farming.Warehouse['barleyheader'],
        txt = Language.Farming.Warehouse['barleyheadertext'],
        icon = Language.Farming.Warehouse['barleyheadericon'],
        params = {
            event = 'boii-farming:sv:SellCrops',
            isServer = true,
            args = {
                req = Config.Packing.Sack.Barley.Return.name,
                crop = Config.Packing.Sack.Barley.Required.label,
                cropamount = Config.Packing.Sack.Barley.Required.amount,
                price = Config.Stores.Warehouse.Prices.Sell.Barley
            }
        }
    },
    {
        header = Language.Farming.Warehouse['maizeheader'],
        txt = Language.Farming.Warehouse['maizeheadertext'],
        icon = Language.Farming.Warehouse['maizeheadericon'],
        params = {
            event = 'boii-farming:sv:SellCrops',
            isServer = true,
            args = {
                req = Config.Packing.Sack.Maize.Return.name,
                crop = Config.Packing.Sack.Maize.Required.label,
                cropamount = Config.Packing.Sack.Maize.Required.amount,
                price = Config.Stores.Warehouse.Prices.Sell.Maize
            }
        }
    },
    {
        header = Language.Farming.Warehouse['potatoheader'],
        txt = Language.Farming.Warehouse['potatoheadertext'],
        icon = Language.Farming.Warehouse['potatoheadericon'],
        params = {
            event = 'boii-farming:sv:SellCrops',
            isServer = true,
            args = {
                req = Config.Packing.Sack.Potato.Return.name,
                crop = Config.Packing.Sack.Potato.Required.label,
                cropamount = Config.Packing.Sack.Potato.Required.amount,
                price = Config.Stores.Warehouse.Prices.Sell.Potato
            }
        }
    },
    {
        header = Language.Farming.Warehouse['mushroomheader'],
        txt = Language.Farming.Warehouse['mushroomheadertext'],
        icon = Language.Farming.Warehouse['mushroomheadericon'],
        params = {
            event = 'boii-farming:sv:SellCrops',
            isServer = true,
            args = {
                req = Config.Packing.Sack.Mushroom.Return.name,
                crop = Config.Packing.Sack.Mushroom.Required.label,
                cropamount = Config.Packing.Sack.Mushroom.Required.amount,
                price = Config.Stores.Warehouse.Prices.Sell.Mushroom
            }
        }
    },
    {
        header = Language.Farming.Warehouse['appleheader'],
        txt = Language.Farming.Warehouse['appleheadertext'],
        icon = Language.Farming.Warehouse['appleheadericon'],
        params = {
            event = 'boii-farming:sv:SellCrops',
            isServer = true,
            args = {
                req = Config.Packing.Crate.Apple.Return.name,
                crop = Config.Packing.Crate.Apple.Required.label,
                cropamount = Config.Packing.Crate.Apple.Required.amount,
                price = Config.Stores.Warehouse.Prices.Sell.Apple
            }
        }
    },
    {
        header = Language.Farming.Warehouse['orangeheader'],
        txt = Language.Farming.Warehouse['orangeheadertext'],
        icon = Language.Farming.Warehouse['orangeheadericon'],
        params = {
            event = 'boii-farming:sv:SellCrops',
            isServer = true,
            args = {
                req = Config.Packing.Crate.Orange.Return.name,
                crop = Config.Packing.Crate.Orange.Required.label,
                cropamount = Config.Packing.Crate.Orange.Required.amount,
                price = Config.Stores.Warehouse.Prices.Sell.Orange
            }
        }
    },
    {
        header = Language.Farming.Warehouse['lemonheader'],
        txt = Language.Farming.Warehouse['lemonheadertext'],
        icon = Language.Farming.Warehouse['lemonheadericon'],
        params = {
            event = 'boii-farming:sv:SellCrops',
            isServer = true,
            args = {
                req = Config.Packing.Crate.Lemon.Return.name,
                crop = Config.Packing.Crate.Lemon.Required.label,
                cropamount = Config.Packing.Crate.Lemon.Required.amount,
                price = Config.Stores.Warehouse.Prices.Sell.Lemon
            }
        }
    },
    {
        header = Language.Farming.Warehouse['limeheader'],
        txt = Language.Farming.Warehouse['limeheadertext'],
        icon = Language.Farming.Warehouse['limeheadericon'],
        params = {
            event = 'boii-farming:sv:SellCrops',
            isServer = true,
            args = {
                req = Config.Packing.Crate.Lime.Return.name,
                crop = Config.Packing.Crate.Lime.Required.label,
                cropamount = Config.Packing.Crate.Lime.Required.amount,
                price = Config.Stores.Warehouse.Prices.Sell.Lime
            }
        }
    },
    {
        header = Language.Farming.Warehouse['lettuceheader'],
        txt = Language.Farming.Warehouse['lettuceheadertext'],
        icon = Language.Farming.Warehouse['lettuceheadericon'],
        params = {
            event = 'boii-farming:sv:SellCrops',
            isServer = true,
            args = {
                req = Config.Packing.Crate.Lettuce.Return.name,
                crop = Config.Packing.Crate.Lettuce.Required.label,
                cropamount = Config.Packing.Crate.Lettuce.Required.amount,
                price = Config.Stores.Warehouse.Prices.Sell.Lettuce
            }
        }
    },
    {
        header = Language.Farming.Warehouse['cactusfruitheader'],
        txt = Language.Farming.Warehouse['cactusfruitheadertext'],
        icon = Language.Farming.Warehouse['cactusfruitheadericon'],
        params = {
            event = 'boii-farming:sv:SellCrops',
            isServer = true,
            args = {
                req = Config.Packing.Crate.CactusFruit.Return.name,
                crop = Config.Packing.Crate.CactusFruit.Required.label,
                cropamount = Config.Packing.Crate.CactusFruit.Required.amount,
                price = Config.Stores.Warehouse.Prices.Sell.CactusFruit
            }
        }
    },
    {
        header = Language.Farming.Warehouse['tomatoheader'],
        txt = Language.Farming.Warehouse['tomatoheadertext'],
        icon = Language.Farming.Warehouse['tomatoheadericon'],
        params = {
            event = 'boii-farming:sv:SellCrops',
            isServer = true,
            args = {
                req = Config.Packing.Crate.Tomato.Return.name,
                crop = Config.Packing.Crate.Tomato.Required.label,
                cropamount = Config.Packing.Crate.Tomato.Required.amount,
                price = Config.Stores.Warehouse.Prices.Sell.Tomato
            }
        }
    },
    {
        header = Language.Farming.Warehouse['strawberryheader'],
        txt = Language.Farming.Warehouse['strawberryheadertext'],
        icon = Language.Farming.Warehouse['strawberryheadericon'],
        params = {
            event = 'boii-farming:sv:SellCrops',
            isServer = true,
            args = {
                req = Config.Packing.Crate.Strawberry.Return.name,
                crop = Config.Packing.Crate.Strawberry.Required.label,
                cropamount = Config.Packing.Crate.Strawberry.Required.amount,
                price = Config.Stores.Warehouse.Prices.Sell.Strawberry
            }
        }
    },
    {
        header = Language.Farming.Warehouse['blueberryheader'],
        txt = Language.Farming.Warehouse['blueberryheadertext'],
        icon = Language.Farming.Warehouse['blueberryheadericon'],
        params = {
            event = 'boii-farming:sv:SellCrops',
            isServer = true,
            args = {
                req = Config.Packing.Crate.Blueberry.Return.name,
                crop = Config.Packing.Crate.Blueberry.Required.label,
                cropamount = Config.Packing.Crate.Blueberry.Required.amount,
                price = Config.Stores.Warehouse.Prices.Sell.Blueberry
            }
        }
    },
    {
        header = Language.Farming.Warehouse['pineappleheader'],
        txt = Language.Farming.Warehouse['pineappleheadertext'],
        icon = Language.Farming.Warehouse['pineappleheadericon'],
        params = {
            event = 'boii-farming:sv:SellCrops',
            isServer = true,
            args = {
                req = Config.Packing.Crate.Pineapple.Return.name,
                crop = Config.Packing.Crate.Pineapple.Required.label,
                cropamount = Config.Packing.Crate.Pineapple.Required.amount,
                price = Config.Stores.Warehouse.Prices.Sell.Pineapple
            }
        }
    },
    {
        header = Language.Farming.Warehouse['milkheader'],
        txt = Language.Farming.Warehouse['milkheadertext'],
        icon = Language.Farming.Warehouse['milkheadericon'],
        params = {
            event = 'boii-farming:sv:SellCrops',
            isServer = true,
            args = {
                req = Config.Packing.Crate.Milk.Return.name,
                crop = Config.Packing.Crate.Milk.Required.label,
                cropamount = Config.Packing.Crate.Milk.Required.amount,
                price = Config.Stores.Warehouse.Prices.Sell.Milk
            }
        }
    },
    {
        header = Language.Farming.Warehouse['eggheader'],
        txt = Language.Farming.Warehouse['eggheadertext'],
        icon = Language.Farming.Warehouse['eggheadericon'],
        params = {
            event = 'boii-farming:sv:SellCrops',
            isServer = true,
            args = {
                req = Config.Packing.Crate.Egg.Return.name,
                crop = Config.Packing.Crate.Egg.Required.label,
                cropamount = Config.Packing.Crate.Egg.Required.amount,
                price = Config.Stores.Warehouse.Prices.Sell.Egg
            }
        }
    },
    {
        header = Language.Shared['returnmenu'],
        icon = Language.Shared['returnmenuicon'],
        params = {
            event = 'boii-farming:cl:WarehousePed'
        }
    },
}

-- Events
RegisterNetEvent('boii-farming:cl:WarehousePed', function()
    if Config.Stores.Warehouse.UseTimes then
        if GetClockHours() >= Config.Stores.Warehouse.Open and GetClockHours() <= Config.Stores.Warehouse.Close then 
            exports[MenuName]:openMenu(MainMenu)
        else 
            TriggerEvent('boii-farming:notify', Language.Farming.Warehouse['timer'], 'error')
        end
    else
        exports[MenuName]:openMenu(MainMenu)
    end 
end)

RegisterNetEvent('boii-farming:cl:WarehouseMenus', function(args)
    if args.menu == 'buy' then
        exports[MenuName]:openMenu(BuyMenu)
    elseif args.menu == 'sell' then
        exports[MenuName]:openMenu(SellMenu)
    end
end)
