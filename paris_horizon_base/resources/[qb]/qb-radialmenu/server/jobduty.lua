local QBCore = exports['qb-core']:GetCoreObject()

-- Event to toggle duty status
RegisterNetEvent('qb-radialmenu:server:ToggleDuty', function(onDuty)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    -- Update player's duty status
    Player.Functions.SetJobDuty(onDuty)
    
    -- Get job information
    local job = Player.PlayerData.job.name
    local grade = Player.PlayerData.job.grade.level
    
    -- Get job-specific configuration
    local jobConfig = Config.JobDuty.Jobs[job]
    local phoneNumber = jobConfig and jobConfig.phoneNumber or "N/A"
    
    -- Log duty change to server console
    TriggerEvent('qb-log:server:CreateLog', 'duty', 'Mise à jour du service', onDuty and 'green' or 'red', 
        string.format('**%s** (CitizenID: %s | ID: %s) a changé son statut de service à %s pour le métier: %s (Grade: %s, Téléphone: %s)', 
        GetPlayerName(src), Player.PlayerData.citizenid, src, onDuty and 'EN SERVICE' or 'HORS SERVICE', job, grade, phoneNumber))
    
    -- Broadcast to all players with the same job (optional)
    local players = QBCore.Functions.GetQBPlayers()
    for _, v in pairs(players) do
        if v.PlayerData.job.name == job then
            TriggerClientEvent('QBCore:Notify', v.PlayerData.source, GetPlayerName(src) .. ' est maintenant ' .. (onDuty and 'en' or 'hors') .. ' service!', 'primary', 5000)
        end
    end
end)
