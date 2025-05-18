----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local hasrefilledpig1 = false
local hasrefilledpig2 = false
local hasrefilledcow1 = false
local hasrefilledcow2 = false
local hasrefilledcow3 = false
local hasrefilledcow4 = false
local hasrefilledchicken1 = false
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

--<!>-- BALES --<!>--
-- Carry bale
function CarryBale(player)
    ReqAnim('anim@heists@box_carry@')
    ReqModel('prop_haybale_01')
    baleprop = CreateObject('prop_haybale_01', GetEntityCoords(player), true, true, true)
    TaskPlayAnim(player, 'anim@heists@box_carry@', 'idle', 8.0, 8.0, -1, 49, 0, false, false, false)
    AttachEntityToEntity(baleprop, player, GetPedBoneIndex(player, 24816), 0.09, 0.61, 0.07, 6.0, 89.0, 99.0, true, true, false, false, 1, true)
end
-- Collect bale
RegisterNetEvent('boii-farming:cl:CollectBale', function()
    local player = PlayerPedId()
    if hasrefilledpig1 and hasrefilledpig2 and hasrefilledcow1 and hasrefilledcow2 and hasrefilledcow3 and hasrefilledcow4 and hasrefilledchicken1 then
        TriggerEvent('boii-farming:notify', Language.Farming.Objects['norefill'], 'error')
        return
    end
    if hasbale and not isbusy then
        TriggerEvent('boii-farming:notify', Language.Shared['isbusy'], 'error')
        return
    end
    hasbale = true
    Core.Functions.Progressbar('farming_collectbale', Language.Farming.Objects['collectbale'], Config.Farming.Objects.Bale.Time*1000, false, true,{
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    }, {
        animDict = Config.Animations.Objects.Bale.Dict,
        anim = Config.Animations.Objects.Bale.Anim,
        flags = Config.Animations.Objects.Bale.Flags
    }, {}, {}, function()
        TriggerEvent('boii-farming:notify', Language.Farming.Objects['collectedbale'], 'success') 
        ClearPedTasks(player)
        CarryBale(player)
    end, function()
        TriggerEvent('inventory:client:busy:status', false)
        TriggerEvent('boii-farming:notify', Language.Shared['cancelled'], 'primary')
        hasbale = false
    end)
end)
-- Return bale
RegisterNetEvent('boii-farming:cl:ReturnBale', function()
    local player = PlayerPedId()
    if hasbale and not isbusy then
        TriggerEvent('boii-farming:notify', Language.Farming.Objects['nobale'], 'error')
        return
    end
    Core.Functions.Progressbar('farming_returnbale', Language.Farming.Objects['returnbale'], Config.Farming.Objects.Bale.Time*1000, false, true,{
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    }, {
        animDict = Config.Animations.Objects.Bale.Dict,
        anim = Config.Animations.Objects.Bale.Anim,
        flags = Config.Animations.Objects.Bale.Flags
    }, {}, {}, function()
        TriggerEvent('boii-farming:notify', Language.Farming.Objects['returnedbale'], 'success') 
        ClearPedTasks(player)
        DelProp(baleprop)
        hasbale = false
    end, function()
        TriggerEvent('inventory:client:busy:status', false)
        TriggerEvent('boii-farming:notify', Language.Shared['cancelled'], 'primary')
        hasbale = false
    end)
end)
--<!>-- BALES --<!>--

--<!>-- TROUGHS --<!>--
RegisterNetEvent('boii-farming:cl:RefillTrough', function(data) 
    local player = PlayerPedId()
    if data.trough == 'farm_pigtrough1' then
        if hasrefilledpig1 then
            TriggerEvent('boii-farming:notify', Language.Farming.Troughs['alreadyrefilledpig'], 'error')
            return
        end
        timer = Config.Farming.Troughs.Pig.Time
        trough = 'pig'
    elseif data.trough == 'farm_pigtrough2' then
        if hasrefilledpig2 then
            TriggerEvent('boii-farming:notify', Language.Farming.Troughs['alreadyrefilledpig'], 'error')
            return
        end
        timer = Config.Farming.Troughs.Pig.Time
        trough = 'pig'
    elseif data.trough == 'farm_cowtrough1' then
        if hasrefilledcow1 then
            TriggerEvent('boii-farming:notify', Language.Farming.Troughs['alreadyrefilledcow'], 'error')
            return
        end
        timer = Config.Farming.Troughs.Cow.Time
        trough = 'cow'
    elseif data.trough == 'farm_cowtrough2' then
        if hasrefilledcow2 then
            TriggerEvent('boii-farming:notify', Language.Farming.Troughs['alreadyrefilledcow'], 'error')
            return
        end
        timer = Config.Farming.Troughs.Cow.Time
        trough = 'cow'
    elseif data.trough == 'farm_cowtrough3' then
        if hasrefilledcow2 then
            TriggerEvent('boii-farming:notify', Language.Farming.Troughs['alreadyrefilledcow'], 'error')
            return
        end
        timer = Config.Farming.Troughs.Cow.Time
        trough = 'cow'
    elseif data.trough == 'farm_cowtrough4' then
        if hasrefilledcow2 then
            TriggerEvent('boii-farming:notify', Language.Farming.Troughs['alreadyrefilledcow'], 'error')
            return
        end
        timer = Config.Farming.Troughs.Cow.Time
        trough = 'cow'
    elseif data.trough == 'farm_chickentrough1' then
        if hasrefilledchicken1 then
            TriggerEvent('boii-farming:notify', Language.Farming.Troughs['alreadyrefilledchicken'], 'error')
            return
        end
        timer = Config.Farming.Troughs.Chicken.Time
        trough = 'chicken'
    end
    if hasbale and not isbusy then
        Core.Functions.Progressbar('farming_filltrough', Language.Farming.Troughs['filltrough'], timer*1000, false, true,{
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = false,
        }, {
            animDict = Config.Animations.Troughs.Dict,
            anim = Config.Animations.Troughs.Anim,
            flags = Config.Animations.Troughs.Flags
        }, {}, {}, function()
            TriggerServerEvent('boii-farming:sv:RefillTrough', trough)
            ClearPedTasks(player)
            DelProp(baleprop)
            hasbale = false
            if data.trough == 'farm_pigtrough1' then
                hasrefilledpig1 = true
            elseif data.trough == 'farm_pigtrough2' then
                hasrefilledpig2 = true
            elseif data.trough == 'farm_cowtrough1' then
                hasrefilledcow1 = true
            elseif data.trough == 'farm_cowtrough2' then
                hasrefilledcow2 = true
            elseif data.trough == 'farm_cowtrough3' then
                hasrefilledcow3 = true
            elseif data.trough == 'farm_cowtrough4' then
                hasrefilledcow4 = true
            elseif data.trough == 'farm_chickentrough1' then
                hasrefilledchicken1 = true
            end
        end, function()
            TriggerEvent('inventory:client:busy:status', false)
            TriggerEvent('boii-farming:notify', Language.Shared['cancelled'], 'primary')
        end)
    else
        TriggerEvent('boii-farming:notify', Language.Farming.Troughs['nobale'], 'error')
    end
    if data.trough == 'farm_pigtrough1' then
        Wait(Config.Farming.Troughs.Pig.Cooldown*60000)
        hasrefilledpig1 = false
    elseif data.trough == 'farm_pigtrough2' then
        Wait(Config.Farming.Troughs.Pig.Cooldown*60000)
        hasrefilledpig2 = false
    elseif data.trough == 'farm_cowtrough1' then
        Wait(Config.Farming.Troughs.Cow.Cooldown*60000)
        hasrefilledcow1 = false
    elseif data.trough == 'farm_cowtrough2' then
        Wait(Config.Farming.Troughs.Cow.Cooldown*60000)
        hasrefilledcow2 = false
    elseif data.trough == 'farm_cowtrough3' then
        Wait(Config.Farming.Troughs.Cow.Cooldown*60000)
        hasrefilledcow3 = false
    elseif data.trough == 'farm_cowtrough4' then
        Wait(Config.Farming.Troughs.Cow.Cooldown*60000)
        hasrefilledcow4 = false
    elseif data.trough == 'farm_chickentrough1' then
        Wait(Config.Farming.Troughs.Chicken.Cooldown*60000)
        hasrefilledchicken1 = false
    end
end)
--<!>-- TROUGHS --<!>--