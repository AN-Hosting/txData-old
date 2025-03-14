local FW = config.Core.framework 

local Notify = config.Core.notify

local Targ = config.Core.target

local inZone = false

local Viewing = false

local dict = 'missfam4'
local clip = 'base'
local clipboard = 'p_amb_clipboard_01'
local bone = 36029
local offset = vector3(0.16, 0.08, 0.1)
local rot = vector3(-170.0, 50.0, 20.0)

Citizen.CreateThread(function()
    if string.find(Targ, 'ox') then 
        exports.ox_target:addGlobalVehicle({
            label = 'Regarder le numéro VIN',
            icon = 'fa-solid fa-hashtag',
            distance = 2.5,
            onSelect = function(data)
                local vehicle = data.entity 
                if not Entity(vehicle).state.vin then 
                    local plate = GetVehicleNumberPlateText(vehicle)
                    local Gen = GenerateVin()
                    while true do 
                        Citizen.Wait(0)
                        if type(Gen) == 'string' then 
                            if string.len(Gen) == 10 then 
                                break 
                            end
                        end
                    end
                    local replace = plate .. Gen

                    local VIN = lib.callback.await('reg:server:GetVin', false, plate, replace)

                    Entity(vehicle).state:set('vin', VIN, true)

                    ShowVin(VIN)
                else
                    ShowVin(Entity(vehicle).state.vin)
                end
            end
        })
    else
        exports[Targ]:AddGlobalVehicle({
            options = { 
                { 
                    icon = 'fa-solid fa-hashtag', 
                    label = 'Regardez le VIN', 
                    job = 'police',
                    action = function(entity) 
                        local vehicle = entity
                        if not Entity(vehicle).state.vin then 
                            local plate = GetVehicleNumberPlateText(vehicle)
                            local Gen = GenerateVin()
                            while true do 
                                Citizen.Wait(0)
                                if type(Gen) == 'string' then 
                                    if string.len(Gen) == 10 then 
                                        break 
                                    end
                                end
                            end
                            local replace = plate .. Gen
        
                            local VIN = lib.callback.await('reg:server:GetVin', false, plate, replace)
        
                            Entity(vehicle).state:set('vin', VIN)
        
                            ShowVin(VIN)
                        else
                            ShowVin(Entity(vehicle).state.vin)
                        end
                    end,
                    
                }
            },
            distance = 2.5,
        })
    end
end)

function ShowVin(vin)
    lib.alertDialog({
        header = 'Numéro VIN:',
        content = vin,
        centered = true,
        cancel = false,
        labels = {
            confirm = 'Ok'
        }
    })
end

Citizen.CreateThread(function()
    Wait(2000) -- Attendre que les PEDs soient créés
    
    -- Zone pour le bureau des immatriculations
    exports['qb-target']:AddCircleZone("registration_zone", vector3(config.locations.registration[1], config.locations.registration[2], config.locations.registration[3]), 2.0, {
        name = "registration_zone",
        debugPoly = false,
    }, {
        options = {
            {
                type = "client",
                event = "browns:registration:openMenu",
                icon = "fas fa-id-card",
                label = "Bureau des cartes grises",
            },
        },
        distance = 2.5
    })

    -- Zone pour le bureau des assurances
    exports['qb-target']:AddCircleZone("insurance_zone", vector3(config.locations.insurance[1], config.locations.insurance[2], config.locations.insurance[3]), 2.0, {
        name = "insurance_zone",
        debugPoly = false,
    }, {
        options = {
            {
                type = "client",
                event = "browns:insurance:openMenu",
                icon = "fas fa-car-crash",
                label = "Bureau des assurances",
            },
        },
        distance = 2.5
    })
end)

RegisterNetEvent('browns:registration:openMenu')
AddEventHandler('browns:registration:openMenu', function()
    OpenMenu()
end)

RegisterNetEvent('browns:insurance:openMenu')
AddEventHandler('browns:insurance:openMenu', function()
    OpenMenu_2()
end)

function OpenMenu()
    local plates = {}

    local vehicles, playerName = lib.callback.await('reg:server:GetVehicles', false)

    if FW == 'esx' then 
        local pdata = CORE.GetPlayerData() 
        
        if pdata and pdata.firstName and pdata.lastName then 
            playerName = pdata.firstName .. " " .. pdata.lastName
        else
            playerName = lib.callback.await('reg:server:esxdataName', false)
        end
        
    end

    if vehicles[1] then 
        for i = 1, #vehicles do 
            local data = vehicles[i]
            table.insert(plates, {
                title = data.plate,
                description = 'Cliquez pour acheter la carte grise du véhicule immatriculé: ' .. data.plate,
                onSelect = function()
                    local bool = lib.callback.await('reg:server:AddRegistration', false, data.plate, playerName)
                    
                    if not bool then 
                        Notify('Bureau des cartes grises', 'Vous n\'avez pas assez d\'argent', 'error', 5000)
                    end
                end
            })
        end

        lib.registerContext({
            id = 'browns_registration',
            title = 'Bureau des cartes grises',
            options = plates
        })

        lib.showContext('browns_registration')

    else

        Notify('Bureau des cartes grises', 'Vous ne possédez aucun véhicule', 'error', 5000)

    end

end

function OpenMenu_2()
    local plates = {}
    local vehicles, playerName = lib.callback.await('reg:server:GetVehicles', false)

    if FW == 'esx' then 
        local pdata = CORE.GetPlayerData() 
        if pdata and pdata.firstName and pdata.lastName then 
            playerName = pdata.firstName .. " " .. pdata.lastName
        else
            playerName = lib.callback.await('reg:server:esxdataName', false)
        end
    end

    if vehicles[1] then 
        for i = 1, #vehicles do
            local data = vehicles[i]
            table.insert(plates, {
                label = 'Plate:' .. " " .. data.plate,
                value = data.plate
            })
        end

        local input = lib.inputDialog('Acheter une assurance - ($' .. tostring(config.costs.insurance) .. " par mois)", {
            {type = 'select', label = 'Choisir un véhicule', options = plates, description = 'Sélectionnez un véhicule par sa plaque'},
            {type = 'select', label = 'Choisir un forfait', options = {
                {label = '1 Mois', value = '30'},
                {label = '2 Mois', value = '60'},
                {label = '3 Mois', value = '90'},
                {label = '4 Mois', value = '120'},
                {label = '5 Mois', value = '150'},
                {label = '6 Mois', value = '180'},
                {label = '7 Mois', value = '210'},
                {label = '8 Mois', value = '240'},
                {label = '9 Mois', value = '270'},
                {label = '10 Mois', value = '300'},
                {label = '11 Mois', value = '330'},
                {label = '12 Mois', value = '360'},
            }},
        })
    
        if input then 
            local _, playerName = lib.callback.await('reg:server:GetVehicles', false)
    
            if FW == 'esx' then 
                local pdata = CORE.GetPlayerData()
                if pdata and pdata.firstName and pdata.lastName then 
                    playerName = pdata.firstName .. " " .. pdata.lastName
                else
                    playerName = lib.callback.await('reg:server:esxdataName', false)
                end
            end
    
            local bool = lib.callback.await('reg:server:AddInsurance', false, input[1], input[2], playerName)
    
            if not bool then 
                Notify('Assurance automobile', 'Vous n\'avez pas assez d\'argent', 'error', 5000)
            end
        end

    else
        Notify('Assurance automobile', 'Vous ne possédez aucun véhicule', 'error', 5000)

    end

end

function CreateRegistrationPed()
    -- Define the model name properly
    local pedModel = "a_m_y_business_03"
    local hash = GetHashKey(pedModel)
    
    -- Request and wait for model
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(10)
    end
    
    -- Get coordinates from config
    local x, y, z = table.unpack(config.locations.registration)
    local heading = 223.04 -- Face west, adjust as needed
    
    -- Create the ped
    local ped = CreatePed(1, hash, x, y, z - 1.0, heading, false, true)
    
    -- Set ped properties
    SetEntityAsMissionEntity(ped, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedDiesWhenInjured(ped, false)
    SetPedCanPlayAmbientAnims(ped, true)
    SetPedCanRagdollFromPlayerImpact(ped, false)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    
    -- Add scenario instead of animation for more reliability
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
    
    -- Add QB-Target interaction for this specific ped
    exports['qb-target']:AddTargetEntity(ped, {
        options = {
            {
                type = "client",
                event = "browns:registration:openMenu",
                icon = "fas fa-id-card",
                label = "Bureau des cartes grises",
            }
        },
        distance = 2.5
    })
    
    SetModelAsNoLongerNeeded(hash)
    return ped
end

Citizen.CreateThread(function()
    Wait(1000) -- Wait for resources to load
    if config.blip.registration.enable then 
        local blipsettings = config.blip.registration

        local x, y, z = table.unpack(config.locations.registration)
        local blip = AddBlipForCoord(x, y, z)
        SetBlipSprite(blip, blipsettings.sprite)
        SetBlipColour(blip, blipsettings.color)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, 250)
        SetBlipScale(blip, blipsettings.scale)
        SetBlipAsShortRange(blip, true)
        PulseBlip(blip)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(blipsettings.label)
        EndTextCommandSetBlipName(blip)

    end
    CreateRegistrationPed()
end)

function CreateInsurancesPed()
    -- Define the model name properly
    local pedModel = "a_m_y_business_03"
    local hash = GetHashKey(pedModel)
    
    -- Request and wait for model
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(10)
    end
    
    -- Get coordinates from config
    local x, y, z = table.unpack(config.locations.insurance)
    local heading = 223.04 -- Face west, adjust as needed
    
    -- Create the ped
    local ped = CreatePed(1, hash, x, y, z - 1.0, heading, false, true)
    
    -- Set ped properties
    SetEntityAsMissionEntity(ped, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedDiesWhenInjured(ped, false)
    SetPedCanPlayAmbientAnims(ped, true)
    SetPedCanRagdollFromPlayerImpact(ped, false)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    
    -- Add scenario instead of animation for more reliability
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
    
    -- Add QB-Target interaction for this specific ped
    exports['qb-target']:AddTargetEntity(ped, {
        options = {
            {
                type = "client",
                event = "browns:insurance:openMenu",
                icon = "fas fa-car-crash",
                label = "Bureau des assurances",
            }
        },
        distance = 2.5
    })
    
    SetModelAsNoLongerNeeded(hash)
    return ped
end

Citizen.CreateThread(function()
    Wait(1000)
    if config.blip.insurance.enable then 

        local blipsettings = config.blip.insurance

        local x, y, z = table.unpack(config.locations.insurance)
        local blip = AddBlipForCoord(x, y, z)
        SetBlipSprite(blip, blipsettings.sprite)
        SetBlipColour(blip, blipsettings.color)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, 250)
        SetBlipScale(blip, blipsettings.scale)
        SetBlipAsShortRange(blip, true)
        PulseBlip(blip)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(blipsettings.label)
        EndTextCommandSetBlipName(blip)

    end
    CreateInsurancesPed()
end)

RegisterNetEvent('reg:client:ShowRegistration', function(plate, name, date)

    if not Viewing then 

        Viewing = true

        local Gen = GenerateVin()

        while true do 
            Citizen.Wait(0)
            if type(Gen) == 'string' then 
                if string.len(Gen) == 10 then 
                    break 
                end
            end
        end
    
        local comb = plate .. Gen 
    
        local VIN, netId = lib.callback.await('reg:server:GetVINVEH', false, plate, comb)
    
        if netId ~= false then 
            local Vehicle = NetToVeh(netId)
    
            if Entity(Vehicle).state.vin ~= nil and string.len(Entity(Vehicle).state.vin) >= 10 then 
    
                VIN = Entity(Vehicle).state.vin
    
            else
    
                Entity(Vehicle).state:set('vin', VIN, true)
    
            end
    
        end
    
        SendNUIMessage({
            show = 'reg',
            plate = 'Plaque: ' .. plate, 
            name = 'Propriétaire: ' .. name,
            vin = 'Numéro VIN: ' .. VIN,
            date = 'DATE D\'IMMATRICULATION: ' .. date,
            msg = 'LA CARTE GRISE EXPIRE ' .. tostring(config.expire) .. ' JOURS APRÈS LA DATE CI-DESSUS'
        })

        DoAnimation()
    
        Citizen.CreateThread(function()
            while true do 
                Citizen.Wait(0)
                if IsControlJustPressed(0, 202) then 
                    SendNUIMessage({
                        show = 'hide'
                    })  
                    Viewing = false
                    break 
                end
            end
        end)
    else
        Notify('Notification', 'Impossible, vous consultez déjà des documents', 'error', 5000)
    end
    
end)

RegisterNetEvent('reg:client:ShowInsurance', function(plate, name, date, expire)

    if not Viewing then 

        Viewing = true

        local Gen = GenerateVin()

        while true do 
            Citizen.Wait(0)
            if type(Gen) == 'string' then 
                if string.len(Gen) == 10 then 
                    break 
                end
            end
        end
    
        local comb = plate .. Gen 
    
        local VIN, netId = lib.callback.await('reg:server:GetVINVEH', false, plate, comb)
    
        if netId ~= false then 
            local Vehicle = NetToVeh(netId)
    
            if Entity(Vehicle).state.vin ~= nil and string.len(Entity(Vehicle).state.vin) >= 10 then 
    
                VIN = Entity(Vehicle).state.vin
    
            else
    
                Entity(Vehicle).state:set('vin', VIN, true)
    
            end
    
        end
    
    
        SendNUIMessage({
            show = 'ins',
            plate = 'Plaque: ' .. plate, 
            name = 'Propriétaire: ' .. name,
            vin = 'Numéro VIN: ' .. VIN,
            date = 'DATE DE PAIEMENT: ' .. date,
            msg = 'L\'ASSURANCE EXPIRE ' .. expire .. ' JOURS APRÈS LA DATE CI-DESSUS'
        })

        DoAnimation()
    
        Citizen.CreateThread(function()
            while true do 
                Citizen.Wait(0)
                if IsControlJustPressed(0, 202) then 
                    SendNUIMessage({
                        show = 'hide'
                    })  
                    Viewing = false
                    break 
                end
            end
        end)
    else
        Notify('Notification', 'Impossible, vous consultez déjà des documents', 'error', 5000)
    end

end)

function DoAnimation()
    Citizen.CreateThread(function()

        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do 
            Citizen.Wait(0)
        end

        local model = GetHashKey(clipboard)
        RequestModel(model)
        while not HasModelLoaded(model) do 
            Citizen.Wait(0)
        end

        local prop = CreateObject(model, 0.0, 0.0, 0.0, true, true, false)
        local boneIndex = GetPedBoneIndex(PlayerPedId(), bone)
        AttachEntityToEntity(prop, PlayerPedId(), boneIndex, offset.x, offset.y, offset.z, rot.x, rot.y, rot.z, true, false, false, false, 2, true)
        SetModelAsNoLongerNeeded(prop)
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(0)
                if Viewing then 
                    if not IsEntityPlayingAnim(PlayerPedId(), dict, clip, 3) then
                        TaskPlayAnim(PlayerPedId(), dict, clip, 3.0, 3.0, -1, 49, 0, 0, 0, 0)
                    end
                else
                    ClearPedSecondaryTask(PlayerPedId())
                    DetatchAnim(prop)
                    break 
                end
            end
        end)
    end)
end

function DetatchAnim(entity)
    Citizen.CreateThread(function()
        Citizen.Wait(250)
        DetachEntity(entity, true, false)
        DeleteEntity(entity)
        while DoesEntityExist(entity) do 
            Citizen.Wait(0)
            DetachEntity(entity, true, false)
            DeleteEntity(entity)
        end
    end)
end

function GenerateVin()
    local string = ''

    local chars = {
        'A',
        'B',
        'C',
        'D',
        'E',
        'F',
        'G',
        'H',
        'I', 
        'J',
        'K',
        'L',
        'M',
        'N',
        'O',
        'P',
        'Q',
        'R',
        'S',
        'T',
        'U',
        'V',
        'W',
        'X',
        'Y',
        'Z',
        '1',
        '2',
        '3',
        '4',
        '5',
        '6',
        '7',
        '8',
        '9',
        '0'
    }

    while true do 
        Citizen.Wait(0)
        if string.len(string) ~= 10 then 
            local char = chars[math.random(1, #chars)]
            string = string .. char
        else
            break 
        end
    end

    return string

end
