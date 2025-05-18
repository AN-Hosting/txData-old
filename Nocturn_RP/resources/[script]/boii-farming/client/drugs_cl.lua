----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local RemoveStressEvent = Config.CoreSettings.RemoveStressEvent
local istakingdrugs = false
--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

RegisterNetEvent('boii-farming:cl:TakeDrugs', function(itemname, drugtype, lang, timer, timer2, stress, armour)
    local player = PlayerPedId()
    if istakingdrugs then
        TriggerEvent('boii-farming:notify', Language.Shared['isbusy'], 'error')
        return
    end
    istakingdrugs = true
    Core.Functions.Progressbar('farming_takedrugs', lang, timer*1000, false, true, {
        disableMovement = false, 
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    }, {
        animDict = Config.Animations.Drugs.Dict,
        anim = Config.Animations.Drugs.Anim,
        flags = Config.Animations.Drugs.Flags,
    }, {}, {}, function()
        TriggerServerEvent('boii-farming:sv:RemoveItem', itemname, 1)
        AddArmourToPed(player, armour)
        TriggerServerEvent(RemoveStressEvent, stress) 
        istakingdrugs = false
        if drugtype == 'shrooms' then
            ShroomsEffect(player, timer2)
        elseif drugtype == 'peyote' then
            PeyoteEffect(player, timer2)
        end
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerClientEvent('boii-drugs:notify', Language.Shared['cancelled'], 'primary')
        ClearPedTasks(player)
        istakingdrugs = false
    end)
end)

function ShroomsEffect(player, timer2)
    Wait(3000)
    DoScreenFadeOut(1000)
    Wait(1000)
    SetTimecycleModifier('spectator5')
    SetPedMotionBlur(player, true)
    SetPedMovementClipset(player, 'MOVE_M@DRUNK@SLIGHTLYDRUNK', true)
    SetPedIsDrunk(player, true)
    SetPedAccuracy(player, 0)
    DoScreenFadeIn(1000)
    if IsPedRunning(player) then
        SetPedToRagdoll(player, math.random(1000, 2000), math.random(1000, 2000), 3, 0, 0, 0)
    end
    Wait(2000)
    if (60 >= math.random(1,100)) and IsPedRunning(player) then
        SetPedToRagdollWithFall(ped, 2500, 4000, 1, GetEntityForwardVector(ped), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    end            
    Wait(timer2*60000)
    if IsPedRunning(player) then
        SetPedToRagdoll(player, math.random(1000, 2000), math.random(1000, 2000), 3, 0, 0, 0)
    end
    Wait(2000)
    if (30 >= math.random(1,100)) and IsPedRunning(player) then
        SetPedToRagdollWithFall(ped, 1500, 3000, 1, GetEntityForwardVector(ped), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    end
    DoScreenFadeOut(1000)
    Wait(1000)
    DoScreenFadeIn(1000)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(player, 0)
    SetPedIsDrunk(player, false)
    SetPedMotionBlur(player, false)
end

function PeyoteEffect(player, timer2)
    Wait(3000)
    DoScreenFadeOut(1000)
    Wait(1000)
    SetTimecycleModifier('spectator5')
    SetPedMotionBlur(player, true)
    SetPedMovementClipset(player, 'MOVE_M@DRUNK@SLIGHTLYDRUNK', true)
    SetPedIsDrunk(player, true)
    SetPedAccuracy(player, 0)
    DoScreenFadeIn(1000)           
    Wait(timer2*60000)
    DoScreenFadeOut(1000)
    Wait(1000)
    DoScreenFadeIn(1000)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(player, 0)
    SetPedIsDrunk(player, false)
    SetPedMotionBlur(player, false)
end