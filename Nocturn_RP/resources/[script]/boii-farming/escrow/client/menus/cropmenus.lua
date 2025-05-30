----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local MenuName = Config.CoreSettings.MenuName
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

-- Crop menu
RegisterNetEvent('boii-farming:cl:CropMenus', function(closestcrop, cropdata)
    local player = PlayerPedId()
    local Alive = {
        { 
            header = ''..cropdata.crop,
            txt = 'ID: '..closestcrop..'</p>Hunger: '..math.floor(cropdata.hunger)..'%</p>Thirst: '..math.floor(cropdata.thirst)..'%</p>Quality: '..math.floor(cropdata.quality)..'%</p>Growth: '..math.floor(cropdata.growth)..'%',
            icon = 'fa-solid fa-wheat-awn',
            isMenuHeader = true
        },
        {
            header = Language.Farming.Planting['harvestheader'],
            icon = Language.Farming.Planting['harvestheadericon'],
            params = {
                event = 'boii-farming:cl:Harvest',
            }
        },
        {
            header = Language.Farming.Planting['feedheader'],
            icon = Language.Farming.Planting['feedheadericon'],
            params = {
                event = 'boii-farming:cl:Feed'
            }
        },
        {
            header = Language.Farming.Planting['waterheader'],
            icon = Language.Farming.Planting['waterheadericon'],
            params = {
                event = 'boii-farming:cl:Water'
            }
        },
        {
            header = Language.Farming.Planting['destroyheader'],
            icon = Language.Farming.Planting['destroyheadericon'],
            params = {
                event = 'boii-farming:cl:Destroy',
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
    local Harvest = {
        { 
            header = ''..cropdata.crop,
            txt = 'ID: '..closestcrop..'</p>Hunger: '..math.floor(cropdata.hunger)..'%</p>Thirst: '..math.floor(cropdata.thirst)..'%</p>Quality: '..math.floor(cropdata.quality)..'%</p>Growth: '..math.floor(cropdata.growth)..'%',
            icon = 'fa-solid fa-wheat-awn',
            isMenuHeader = true
        },
        {
            header = Language.Farming.Planting['harvestheader'],
            icon = Language.Farming.Planting['harvestheadericon'],
            params = {
                event = 'boii-farming:cl:Harvest',
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
    local Destroy = {
        { 
            header = ''..cropdata.crop,
            txt = 'ID: '..closestcrop..'</p>Hunger: '..math.floor(cropdata.hunger)..'%</p>Thirst: '..math.floor(cropdata.thirst)..'%</p>Quality: '..math.floor(cropdata.quality)..'%</p>Growth: '..math.floor(cropdata.growth)..'%',
            icon = Language.Farming.Planting['cropheadericon'],
            isMenuHeader = true
        },
        {
            header = Language.Farming.Planting['destroyheader'],
            icon = Language.Farming.Planting['destroyheadericon'],
            params = {
                event = 'boii-farming:cl:Destroy',
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
    local Cop = {
        { 
            header = ''..cropdata.crop,
            txt = 'ID: '..closestcrop..'</p>Hunger: '..math.floor(cropdata.hunger)..'%</p>Thirst: '..math.floor(cropdata.thirst)..'%</p>Quality: '..math.floor(cropdata.quality)..'%</p>Growth: '..math.floor(cropdata.growth)..'%',
            icon = 'fa-solid fa-wheat-awn',
            isMenuHeader = true
        },
        {
            header = Language.Farming.Planting['destroyheader'],
            icon = Language.Farming.Planting['destroyheadericon'],
            params = {
                event = 'boii-farming:cl:Destroy',
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
    if ServiceJob(player) then
        if cropdata.crop == 'Psilocybin' or cropdata.crop == 'Peyote' then
            exports[MenuName]:openMenu(Cop)
            return
        end
    end
    if cropdata.growth >= 95 then -- If plant growth is above amount shown then harvest menu will open
        exports[MenuName]:openMenu(Harvest)
        return
    end
    if cropdata.hunger < 2 or cropdata.thirst < 2 or cropdata.quality < 2 then -- If plant hunger/water/quality is below amount shown then dead menu will open
        exports[MenuName]:openMenu(Destroy)
    else
        exports[MenuName]:openMenu(Alive)
    end
end)