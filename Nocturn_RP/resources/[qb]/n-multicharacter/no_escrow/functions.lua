-- | # For help with this script: https://discord.gg/thugstudios
-- | # For more free scripts: https://discord.gg/thugstudios
-- | # For the best quality scripts: https://discord.gg/thugstudios

-- | # This section allows you to fetch the model when your character spawns.
Load_Model = function(model_name)
    local model = GetHashKey(model_name)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(100)
    end
    SetPlayerModel(PlayerId(), model)
    Citizen.Wait(100)
    local new_ped = PlayerPedId()
    SetPedComponentVariation(new_ped, 0, 0, 0, 2)
end

-- | # This function loads the pads in the menu. You can adapt it to your own clothing script.
Load_Menu_Ped_Appearance = function(ped, skin)
    if Config.Settings['Clothing_Script'] == 'illenium-appearance' then
        exports['illenium-appearance']:setPedAppearance(ped, json.decode(skin))
    elseif Config.Settings['Clothing_Script'] == 'qb-clothing' then
        TriggerEvent('qb-clothing:client:loadPlayerClothing', skin, ped)
    end
end

-- | # This function is used after a player creates a character for the first time.
First_Character_Spawn = function(gender)
    local ply_ped = PlayerPedId()
    local default_model = "mp_m_freemode_01"
    if gender == 1 then
        default_model = "mp_f_freemode_01"
    end
    Load_Model(default_model)
    Wait(500)
    if Config.Settings['Clothing_Script'] == 'illenium-appearance' then
        if Config.Settings['Framework'] == "qb" or Config.Settings['Framework'] == "old-qb" then
            TriggerEvent('qb-clothes:client:CreateFirstCharacter')
        else
            TriggerEvent('esx_skin:openSaveableMenu', function()
                finished = true
            end, function()
                finished = true
            end)
        end
    elseif Config.Settings['Clothing_Script'] == 'qb-clothing' then
        TriggerEvent('qb-clothes:client:CreateFirstCharacter')
    end
    -- | # If you have something to add, you can add it here.
    -- | # If you are using apartments you can add the spawn event here.
end

-- | # This function is used after a player spawns.
Default_Spawn = function(data)
    Load_Model(data.model)
    Wait(1000)
    if Config.Settings['Clothing_Script'] == 'illenium-appearance' then
        exports['illenium-appearance']:setPedAppearance(PlayerPedId(), json.decode(data.skin))
    elseif Config.Settings['Clothing_Script'] == 'qb-clothing' then
        TriggerEvent('qb-clothing:client:loadPlayerClothing', data.skin, PlayerPedId())
    end
    -- | # If you have something to add, you can add it here.
end

-- | #  This function is used before opening the Multicharacter menu.
Before_The_Menu = function()
    ShutdownLoadingScreen()
    ShutdownLoadingScreenNui(true)
    if Config.Settings['Framework'] == 'esx' then
        TriggerEvent("esx:loadingScreenOff")
    end
    -- | # If you have something to add, you can add it here.
end

-- | #  This function is used after closing the Multicharacter menu.
After_The_Menu = function(firstspawn)
    if Config.Settings['N_Spawn_Selector'] and not firstspawn then
        TriggerEvent('n-spawn-selector-v2:client:open', firstspawn)
    end
    if Config.Settings['QB_Weathersync'] then
        TriggerEvent('qb-weathersync:client:EnableSync')
    end
    -- | # If you have something to add, you can add it here.
    -- | # If you are using spawnselector you can add the spawn event here.
end

