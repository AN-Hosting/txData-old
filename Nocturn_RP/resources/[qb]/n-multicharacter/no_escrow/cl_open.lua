-- | # For help with this script: https://discord.gg/thugstudios
-- | # For more free scripts: https://discord.gg/thugstudios
-- | # For the best quality scripts: https://discord.gg/thugstudios

-- | # Opening Loop ------------------------------------------------------------------------------------

Citizen.CreateThreadNow(function()
    DoScreenFadeOut(0)
    Wait(1500)
    while true do
        Wait(100)
        if NetworkIsSessionActive() or NetworkIsPlayerActive(PlayerId()) then
            exports['spawnmanager']:setAutoSpawn(false)
            Wait(1000)
            if Config.Settings['Framework'] == 'esx' then
                TriggerServerEvent('n-multicharacter:server:esx-logout')
            end
            Before_The_Menu()
            Wait(500)
            TriggerEvent('n-multicharacter:client:open')
            SetEntityVisible(PlayerPedId(), false)
            break
        end
    end
end)