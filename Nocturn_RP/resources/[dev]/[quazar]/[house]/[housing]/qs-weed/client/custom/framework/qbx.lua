if Config.Framework ~= 'qbx' then
    return
end

QBCore = exports['qb-core']:GetCoreObject()

PlayerJob = false
CreateThread(function()
    while not GetPlayerData() or not GetPlayerData().job do
        Wait(100)
    end
    PlayerJob = GetPlayerData().job.name
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
    PlayerJob = job.name
end)

function TriggerServerCallback(name, cb, ...)
    QBCore.Functions.TriggerCallback(name, cb, ...)
end

function GetPlayerData()
    return exports.qbx_core:GetPlayerData()
end

function GetJobName()
    return GetPlayerData()?.job?.name
end

local texts = {}
if GetResourceState('qs-textui') == 'started' then
    function DrawText3D(x, y, z, text, id, key)
        local _id = id
        if not texts[_id] then
            CreateThread(function()
                texts[_id] = 5
                while texts[_id] > 0 do
                    texts[_id] = texts[_id] - 1
                    Wait(0)
                end
                texts[_id] = nil
                exports['qs-textui']:DeleteDrawText3D(id)
                Debug('Deleted text', id)
            end)
            TriggerEvent('textui:DrawText3D', x, y, z, text, id, key)
        end
        texts[_id] = 5
    end
else
    function DrawText3D(x, y, z, text)
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry('STRING')
        SetTextCentre(true)
        AddTextComponentString(text)
        SetDrawOrigin(x, y, z, 0)
        DrawText(0.0, 0.0)
        local factor = text:len() / 370
        DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
        ClearDrawOrigin()
    end
end

function DrawText3Ds(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry('STRING')
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function ProgressBar(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
    if GetResourceState('qs-interface') == 'started' then
        local success = exports['qs-interface']:ProgressBar({
            duration = duration,
            label = label,
            position = 'bottom',
            useWhileDead = useWhileDead,
            canCancel = canCancel,
            disable = disableControls,
            anim = {
                dict = animation.animDict,
                clip = animation.anim,
                flag = animation?.flags
            },
            prop = prop
        })
        if success then
            onFinish()
        else
            onCancel()
        end
        return
    end
    if lib.progressCircle({
            duration = duration,
            label = label,
            position = 'bottom',
            useWhileDead = useWhileDead,
            canCancel = canCancel,
            disable = disableControls,
            anim = {
                dict = animation.animDict,
                clip = animation.anim,
                flag = animation?.flags
            },
            prop = prop
        }) then
        onFinish()
    else
        onCancel()
    end
end

function SendTextMessage(msg, type)
    if GetResourceState('qs-interface') == 'started' then
        if type == 'inform' then
            exports['qs-interface']:AddNotify(msg, 'Inform', 2500, 'fas fa-file')
        elseif type == 'error' then
            exports['qs-interface']:AddNotify(msg, 'Error', 2500, 'fas fa-bug')
        elseif type == 'success' then
            exports['qs-interface']:AddNotify(msg, 'Success', 2500, 'fas fa-thumbs-up')
        end
        return
    end

    if type == 'inform' then
        lib.notify({
            title = 'Weed',
            description = msg,
            type = 'inform'
        })
    elseif type == 'error' then
        lib.notify({
            title = 'Weed',
            description = msg,
            type = 'error'
        })
    elseif type == 'success' then
        lib.notify({
            title = 'Weed',
            description = msg,
            type = 'success'
        })
    end
end
