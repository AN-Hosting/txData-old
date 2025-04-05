local bussy = false
local lang = langs[config.lang]

tgiCore.Progressbar = function(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
    if GetResourceState("tgiann-lumihud") == "started" then
        local success = exports['tgiann-lumihud']:Progress({
            name = name:lower(),
            duration = duration,
            label = label,
            useWhileDead = useWhileDead,
            canCancel = canCancel,
            controlDisables = disableControls,
            animation = animation and animation or {},
            prop = prop and prop or {},
            propTwo = propTwo and propTwo or {},
        })
        if success then
            if onFinish then onFinish() end
        else
            if onCancel then onCancel() end
        end
        return success
    elseif not bussy then
        bussy = true
        if config.framework == "qb" and not config.qbx then -- QB Framework
            local p = promise.new()
            -- QBCore.Functions.Progressbar(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
            tgiCore.core.Functions.Progressbar(
                name:lower(),
                label,
                duration,
                useWhileDead,
                canCancel,
                disableControls,
                animation or {},
                prop or {},
                propTwo or {},
                function()
                    p:resolve(true)
                end,
                function()
                    p:resolve(false)
                end)

            local success = Citizen.Await(p)
            if success then
                if onFinish then onFinish() end
            else
                if onCancel then onCancel() end
            end
            bussy = false
            return success
        elseif config.framework == "esx" or config.qbx then -- ESX Framework or QBX Framework
            if config.oxlib then                            -- OxLib
                local success = lib.progressBar({
                    duration = duration,
                    label = label,
                    useWhileDead = useWhileDead,
                    canCancel = canCancel,
                    disable = {
                        car = disableControls.disableCarMovement,
                        move = disableControls.disableMovement,
                        combat = disableControls.disableCombat,
                        mouse = disableControls.disableMouse,
                    },
                    anim = animation and {
                        dict = animation.animDict,
                        clip = animation.anim,
                        flag = animation.flags
                    },
                    prop = prop and {
                        model = prop.model,
                        pos = prop.coords,
                        rot = prop.rotation,
                        bone = prop.bone
                    },
                })
                if success then
                    if onFinish then onFinish() end
                    bussy = false
                else
                    if onCancel then onCancel() end
                    bussy = false
                end
                return success
            else -- Default ESX
                if GetResourceState('tgiann-progressbar') ~= 'started' then
                    print('tgiann-progressbar needs to be started in order for tgiCore.Progressbar to work')
                    if onCancel then onCancel() end
                    bussy = false
                    return false
                end
                local p = promise.new()

                exports['tgiann-progressbar']:Progress({
                    name = name:lower(),
                    duration = duration,
                    label = label,
                    useWhileDead = useWhileDead,
                    canCancel = canCancel,
                    controlDisables = disableControls,
                    animation = animation and animation or {},
                    prop = prop and prop or {},
                    propTwo = propTwo and propTwo or {},
                }, function(cancelled)
                    if not cancelled then
                        p:resolve(true)
                    else
                        p:resolve(false)
                    end
                end)
                local success = Citizen.Await(p)
                if success then
                    if onFinish then onFinish() end
                else
                    if onCancel then onCancel() end
                end
                bussy = false
                return success
            end
        end
    else
        tgiCore.notif(lang.alreadyError, "error")
        if onCancel then onCancel() end
        return false
    end
end
