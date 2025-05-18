----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local TargetName = Config.CoreSettings.TargetName
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

--<!>-- NOTIFICATIONS --<!>--
-- Notifications
RegisterNetEvent('boii-farming:notify', function(msg,type)
    Core.Functions.Notify(msg,type)
end)
--<!>-- NOTIFICATIONS --<!>--

--<!>-- BLIPS START --<!>--
CreateThread(function()
    for k, v in pairs(Config.Blips) do
        if v.useblip then
            v.blip = AddBlipForCoord(v['coords'].x, v['coords'].y, v['coords'].z)
            SetBlipSprite(v.blip, v.id)
            SetBlipDisplay(v.blip, 4)
            SetBlipScale(v.blip, v.scale)
            SetBlipColour(v.blip, v.colour)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(v.title)
            EndTextCommandSetBlipName(v.blip)
        end
    end
end)
--<!>-- BLIPS END --<!>--

--<!>-- PEDS START --<!>--
-- Spawn peds
CreateThread(function()
    for k, v in pairs(Config.Peds) do
        if v.useped then
            ReqModel(v.model)
            FarmPeds = CreatePed(0, v.model, v['coords'].x, v['coords'].y, v['coords'].z-1, v['coords'].w, false, false)
            FreezeEntityPosition(FarmPeds, true)
            SetEntityInvincible(FarmPeds, true)
            SetBlockingOfNonTemporaryEvents(FarmPeds, true)
            TaskStartScenarioInPlace(FarmPeds, v.scenario, 0, true)
            exports[TargetName]:AddEntityZone('farming_peds'..FarmPeds, FarmPeds, {
                name = 'farming_peds'..FarmPeds,
                heading = GetEntityHeading(FarmPeds),
                debugPoly = false,
            }, {
                options = {
                    {   
                        icon = v.icon,
                        label = v.label,
                        event = v.event,
                        canInteract = function(entity)
                            if IsPedDeadOrDying(entity, true) or IsPedAPlayer(entity) or IsPedInAnyVehicle(PlayerPedId()) then return false end
                            return true
                        end,    
                    },
                },
                distance = v.distance
            })
        end
    end
end)
-- Spawn animal peds
CreateThread(function()
    for k, v in pairs(Config.Animals) do
        if v.useped then
            ReqModel(v.model)
            SetEntityInvincible(FarmAnimals, true)
            SetBlockingOfNonTemporaryEvents(FarmAnimals, true)
            if v.useanimation then
                FarmAnimals = CreatePed(0, v.model, v['coords'].x, v['coords'].y, v['coords'].z-1, v['coords'].w, false, false)
                ReqAnim(v.animdict)
                TaskPlayAnim(FarmAnimals, v.animdict, v.anim, 8.0, -8, -1, 1, 0, false, false, false)
                FreezeEntityPosition(FarmAnimals, true)
            else
                FarmAnimals = CreatePed(0, v.model, v['coords'].x, v['coords'].y, v['coords'].z-1, v['coords'].w, false, false)
                TaskWanderStandard(FarmAnimals, 0, 0)
            end
            exports[TargetName]:AddEntityZone('farming_animals'..FarmAnimals, FarmAnimals, {
                name = 'farming_animals'..FarmAnimals,
                heading = GetEntityHeading(FarmAnimals),
                debugPoly = false,
            }, {
                options = {
                    {   
                        icon = v.icon,
                        label = v.label,
                        event = v.event,
                        canInteract = function(entity)
                            if IsPedDeadOrDying(entity, true) or IsPedAPlayer(entity) or IsPedInAnyVehicle(PlayerPedId()) then 
                                return false 
                            else
                                return true
                            end
                        end,    
                    },
                },
                distance = v.distance
            })
        end
    end
end)
--<!>-- PEDS END --<!>--

--<!>-- FARMING OBJECTS --<!>--
CreateThread(function()
    for k, v in pairs(Config.Objects) do
        ReqModel(v.model)
        local FarmObjects = CreateObject(v.model, v['coords'].x, v['coords'].y, v['coords'].z-1, true)
        SetEntityInvincible(FarmObjects, true)
        SetBlockingOfNonTemporaryEvents(FarmObjects, true)
        FreezeEntityPosition(FarmObjects, true)
        SetEntityHeading(FarmObjects, v['coords'].w)
        if v.dualevent then
            exports[TargetName]:AddTargetModel(v.model, {
                options = {
                    {
                        event = v.event,
                        icon = v.icon,
                        label = v.label,
                    },
                    {
                        event = v.event2,
                        icon = v.icon2,
                        label = v.label2,
                    },
                },
                distance = v.distance
            })
        else
            exports[TargetName]:AddTargetModel(v.model, {
                options = {
                    {
                        event = v.event,
                        icon = v.icon,
                        label = v.label,
                    }
                },
                distance = v.distance
            })
        end
    end
end)
--<!>-- FARMING OBJECTS --<!>--

--<!>-- TREE TARGETING --<!>--
for k, v in pairs(Config.Locations.Trees) do
    exports[TargetName]:AddCircleZone(v.name, v.coords, v.radius, { 
            name= v.name, 
            debugPoly= v.debugPoly, 
            useZ= v.useZ, 
        },{ 
        options = { 
            {
                icon = v.icon,
                label = v.label,
                event = v.event,
            }, 
        },
        distance = v.distance
    })
end
--<!>-- TREE TARGETING --<!>--

--<!>-- TROUGHS --<!>--
-- Pigs
for k, v in pairs(Config.Locations.Troughs) do
    exports[TargetName]:AddBoxZone(v.name, v.coords, v.length, v.width, {
            name = v.name,
            heading= v.heading,
            debugPoly= v.debugPoly,
            minZ = v.minZ,
            maxZ = v.maxZ,
        },{
        options = {
            {
                icon = v.icon,
                label = v.label,
                event = v.event,
                trough = v.name
            }
        },
        distance = v.distance,
    })
end
--<!>-- TROUGHS --<!>--

--<!>-- OPEN SHOP --<!>--
RegisterNetEvent('boii-farming:cl:OpenShop', function()
    items = {}
    items.label = 'Farmshop'
    items.items = Config.Stores.Farmer.Items
    items.slots = #Config.Stores.Farmer.Items
    TriggerServerEvent('inventory:server:OpenInventory', 'shop', 'Farmshop', items)
end)
--<!>-- OPEN SHOP --<!>--

--<!>-- REQUEST INFO --<!>--
local emailsent = false
RegisterNetEvent('boii-farming:cl:RequestInfo', function()
    local player = PlayerPedId()
    if emailsent then
        TriggerEvent('boii-farming:notify', Language.Farming.Farmer['cantemail'], 'error')
        return
    end
    emailsent = true
    TriggerEvent('boii-farming:notify', Language.Farming.Farmer['emailsent'], 'success')
    Wait(15*1000)
    TriggerServerEvent('boii-phone:server:sendNewMail', {
        sender = 'Unknown Sender',
        subject = 'I heard you need help..',
        message = 'So your looking to get into homebrewing?<br><br>Head over once you have collected your supplies.<br><br>Youll need:<br><br>Buckets<br>Watering cans<br>Growlers<br>Yeast<br>Crops<br><br>Dont forget anything..<br><br>Oh youll need a boat to!',
        button = {
            enabled = true,
            buttonEvent = 'boii-farming:cl:BrewingGPS'
        }
    })
    Wait(1*60000)
    emailsent = false
end)
RegisterNetEvent('boii-farming:cl:BrewingGPS', function()
    local player = PlayerPedId()
    SetNewWaypoint(3616.04, 5024.06)
    TriggerEvent('boii-farming:notify', Language.Farming.Farmer['gpsset'], 'primary')
end)
--<!>-- REQUEST INFO --<!>--