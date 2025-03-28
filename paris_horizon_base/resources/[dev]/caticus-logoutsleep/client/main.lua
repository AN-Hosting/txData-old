local QBCore = exports['qb-core']:GetCoreObject()
local isLoggedIn = false
local sleepingPlayers = {}
local isCarrying = false
local carriedPed = nil


local function Debug(...)
    if Config.Debug then
        print('[caticus-logoutsleep:DEBUG]', ...)
    end
end


local function CarryPed(ped)
    local player = PlayerPedId()
    isCarrying = true
    carriedPed = ped
    

    RequestAnimDict("nm")
    RequestAnimDict("missfinale_c2mcs_1")
    
    while not HasAnimDictLoaded("nm") or not HasAnimDictLoaded("missfinale_c2mcs_1") do
        Wait(10)
    end
    
    TaskPlayAnim(ped, "nm", "firemans_carry", 8.0, -8.0, -1, 33, 0, false, false, false)
    AttachEntityToEntity(ped, player, 0, 0.27, 0.15, 0.63, 0.5, 0.5, 0.0, false, false, false, false, 2, true)
    TaskPlayAnim(player, "missfinale_c2mcs_1", "fin_c2_mcs_1_camman", 8.0, -8.0, 100000, 49, 0, false, false, false)
end


local function ReleasePed()
    local player = PlayerPedId()
    isCarrying = false
    local coords = GetEntityCoords(player)
    local ground, zPos = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z, false)
    DetachEntity(carriedPed, true, true)
    ClearPedTasksImmediately(carriedPed)
    local heading = GetEntityHeading(player)
    local forward = GetEntityForwardVector(player)
    local x = coords.x + (forward.x * 1.0)
    local y = coords.y + (forward.y * 1.0)
    
    -- Get the citizenid of the carried ped
    local citizenid = GetEntityData(carriedPed, 'citizenid')
    
    SetEntityCoords(carriedPed, x, y, zPos, false, false, false, false)
    SetEntityHeading(carriedPed, heading)
    ClearPedTasks(player)
    LoadAnimDict(Config.SleepingAnimation)
    while not HasAnimDictLoaded(Config.SleepingAnimation) do
        Wait(10)
    end

    TaskPlayAnim(carriedPed, Config.SleepingAnimation, Config.SleepingAnimationScene, 8.0, -8.0, -1, 1, 0, false, false, false)
    SetEntityCollision(carriedPed, true, true)
    FreezeEntityPosition(carriedPed, true)
    SetEntityInvincible(carriedPed, true) -- Always invincible, no config check needed
    
    -- Update the server with new position
    if citizenid then
        TriggerServerEvent('caticus-logoutsleep:server:UpdateSleepingPedPosition', citizenid, vector4(x, y, zPos, heading))
    end
    
    carriedPed = nil
end


local function CreateSleepingPed(playerData)
    local model = playerData.model
    if type(model) == 'string' then 
        model = tonumber(model)
    end
    
    local coords = playerData.coords
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(10)
    end


    local ped = CreatePed(4, model, coords.x, coords.y, coords.z - Config.ZOffset, coords.w, false, true)
    
    SetEntityData(ped, 'citizenid', playerData.citizenid)
    
    if playerData.appearance then
        local skinData = json.decode(playerData.appearance)
        SetPedComponentVariation(ped, 0, 0, 0, 0)
        for k, v in pairs(skinData) do
            if v.item then
                if k == "pants" then
                    SetPedComponentVariation(ped, 4, v.item, v.texture or 0, 0)
                elseif k == "arms" then
                    SetPedComponentVariation(ped, 3, v.item, v.texture or 0, 0)
                elseif k == "t-shirt" then
                    SetPedComponentVariation(ped, 8, v.item, v.texture or 0, 0)
                elseif k == "vest" then
                    SetPedComponentVariation(ped, 9, v.item, v.texture or 0, 0)
                elseif k == "torso2" then
                    SetPedComponentVariation(ped, 11, v.item, v.texture or 0, 0)
                elseif k == "shoes" then
                    SetPedComponentVariation(ped, 6, v.item, v.texture or 0, 0)
                elseif k == "mask" then
                    SetPedComponentVariation(ped, 1, v.item, v.texture or 0, 0)
                elseif k == "hat" then
                    if v.item ~= -1 and v.item ~= 0 then
                        SetPedPropIndex(ped, 0, v.item, v.texture or 0, true)
                    end
                elseif k == "glass" then
                    if v.item ~= -1 and v.item ~= 0 then
                        SetPedPropIndex(ped, 1, v.item, v.texture or 0, true)
                    end
                end
            end
        end
    end
    

    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true) -- Always invincible
    SetBlockingOfNonTemporaryEvents(ped, true)

    RequestAnimDict("timetable@tracy@sleep@")
    while not HasAnimDictLoaded("timetable@tracy@sleep@") do
        Wait(10)
    end

    TaskPlayAnim(ped, "timetable@tracy@sleep@", "idle_c", 8.0, 1.0, -1, 1, 0, false, false, false)

    local options = {
        {
            icon = "fas fa-hand",
            label = "Carry Player",
            action = function()
                if not isCarrying then
                    Debug('Target option selected - Carry Player')
                    CarryPed(ped)
                end
            end
        }
    }

    -- Only add rob option if enabled in config
    if Config.AllowRobbing then
        table.insert(options, {
            icon = "fas fa-mask",
            label = "Rob Player",
            action = function()
                Debug('Target option selected - Rob Player')
                local targetCitizenId = GetEntityData(ped, 'citizenid')
                if targetCitizenId then
                    Debug('Found citizenid for ped:', targetCitizenId)
                    RobSleepingPlayer(ped, targetCitizenId)
                else
                    Debug('Failed to get citizenid from ped')
                    QBCore.Functions.Notify('Cannot identify target', 'error')
                end
            end
        })
    end

    exports['qb-target']:AddTargetEntity(ped, {
        options = options,
        distance = 2.5
    })
    
    return ped
end


RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    print('[caticus-logoutsleep] Événement OnPlayerLoaded déclenché')
    isLoggedIn = true
    print('[caticus-logoutsleep] isLoggedIn défini à:', isLoggedIn)
    local PlayerData = QBCore.Functions.GetPlayerData()
    print('[caticus-logoutsleep] CitizenID du joueur:', PlayerData.citizenid)
    TriggerServerEvent('caticus-logoutsleep:server:CheckSleepingPed', PlayerData.citizenid)
end)


RegisterNetEvent('caticus-logoutsleep:client:RemoveSleepingPed', function(citizenid)
    if sleepingPlayers[citizenid] then
        if DoesEntityExist(sleepingPlayers[citizenid]) then
            DeleteEntity(sleepingPlayers[citizenid])
        end
        sleepingPlayers[citizenid] = nil
    end
end)


RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    print('[caticus-logoutsleep] Événement OnPlayerUnload déclenché')
    print('[caticus-logoutsleep] État actuel de isLoggedIn:', isLoggedIn)
    
    if not isLoggedIn then 
        print('[caticus-logoutsleep] Le joueur n\'est pas connecté, annulation')
        return 
    end
    
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local model = GetEntityModel(ped)
    local Player = QBCore.Functions.GetPlayerData()
    
    print('[caticus-logoutsleep] Données du joueur récupérées:')
    print('Coords:', coords.x, coords.y, coords.z)
    print('Heading:', heading)
    print('Model:', model)
    print('CitizenID:', Player.citizenid)
    
    TriggerServerEvent('caticus-logoutsleep:server:CreateSleepingPed', {
        coords = vector4(coords.x, coords.y, coords.z, heading),
        model = model,
        citizenid = Player.citizenid
    })
    
    print('[caticus-logoutsleep] Événement CreateSleepingPed envoyé au serveur')
    isLoggedIn = false
end)


RegisterNetEvent('caticus-logoutsleep:client:CreateSleepingPed', function(data)
    local ped = CreateSleepingPed({
        coords = data.coords,
        model = data.model,
        appearance = data.appearance,
        citizenid = data.citizenid
    })
    sleepingPlayers[data.citizenid] = ped
end)


AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        for _, ped in pairs(sleepingPlayers) do
            if DoesEntityExist(ped) then
                DeleteEntity(ped)
            end
        end
    end
end)


CreateThread(function()
    while true do
        Wait(0)
        if isCarrying then
            if IsControlJustPressed(0, 38) then
                ReleasePed()
            end
            
 
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 257, true)
            DisableControlAction(0, 25, true) 
            DisableControlAction(0, 263, true) 
        else
            Wait(500)
        end
    end
end)


function RobSleepingPlayer(ped, citizenid)
    if not citizenid then 
        QBCore.Functions.Notify('Cannot identify target', 'error')
        return 
    end

    local player = PlayerPedId()

    LoadAnimDict(Config.RobAnimDict)
    TaskPlayAnim(player, Config.RobAnimDict, Config.RobAnimName, 1.0, -1.0, -1, 49, 0, false, false, false)
    
 
    QBCore.Functions.Progressbar("robbing_sleeping", "Searching pockets...", Config.RobDuration, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        ClearPedTasks(player)
  
        TriggerServerEvent("caticus-logoutsleep:server:GetPlayerItems", citizenid)
    end)
end


RegisterNetEvent('caticus-logoutsleep:client:ShowRobMenu', function(data)
    local items = {}
    
    for _, item in pairs(data.inventory) do
        local itemData = QBCore.Shared.Items[item.name]
        if itemData then
            table.insert(items, {
                header = itemData.label,
                txt = "Amount: " .. item.count,
                params = {
                    event = "caticus-logoutsleep:client:StealItem",
                    args = {
                        citizenid = data.citizenid,
                        item = item
                    }
                }
            })
        end
    end
    
    exports['qb-menu']:openMenu({
        {
            header = "Robbing " .. data.name,
            txt = "Select an item to steal",
            isMenuHeader = true
        },
        table.unpack(items)
    })
end)


RegisterNetEvent('caticus-logoutsleep:client:StealItem', function(data)
    TriggerServerEvent("caticus-logoutsleep:server:StealItem", data)
end)

function LoadAnimDict(dict)
    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Wait(1)
        end
    end
end


function SetEntityData(entity, key, value)
    if not entity or not DoesEntityExist(entity) then 
        Debug('SetEntityData failed - Invalid entity')
        return 
    end
    if not Entity(entity).state then 
        Debug('SetEntityData failed - No state')
        return 
    end
    Entity(entity).state:set(key, value, true)
    Debug('Set entity data', key, value)
end

function GetEntityData(entity, key)
    if not entity or not DoesEntityExist(entity) then 
        Debug('GetEntityData failed - Invalid entity')
        return nil 
    end
    if not Entity(entity).state then 
        Debug('GetEntityData failed - No state')
        return nil 
    end
    local value = Entity(entity).state[key]
    Debug('Get entity data', key, value)
    return value
end 