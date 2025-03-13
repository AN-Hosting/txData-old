local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local onDuty = false

-- Initialize player data when resource starts
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    onDuty = PlayerData.job.onduty
end)

-- Update player data when job changes
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
    onDuty = JobInfo.onduty
end)

-- Main event for toggling job duty status
RegisterNetEvent('qb-radialmenu:client:Jobduty', function()
    -- Get updated player data
    PlayerData = QBCore.Functions.GetPlayerData()
    local jobName = PlayerData.job.name
    
    -- Toggle duty status
    onDuty = not onDuty
    
    -- Trigger server event to update duty status
    TriggerServerEvent('qb-radialmenu:server:ToggleDuty', onDuty)
    
    -- Handle job-specific commands
    if Config.JobDuty.Jobs[jobName] then
        HandleJobCommand(jobName, onDuty)
    end
    
    -- Show notification
    if onDuty then
        QBCore.Functions.Notify(Config.JobDuty.Notifications.OnDuty, 'success')
    else
        QBCore.Functions.Notify(Config.JobDuty.Notifications.OffDuty, 'error')
    end
end)

-- Function to handle job-specific commands
function HandleJobCommand(jobName, isOnDuty)
    local jobConfig = Config.JobDuty.Jobs[jobName]
    
    if not jobConfig then return end
    
    -- Execute the appropriate command based on duty status
    if isOnDuty then
        ExecuteCommand(jobConfig.onDutyCommand)
        QBCore.Functions.Notify(Config.JobDuty.Notifications.PhoneOnDuty, 'success')
    else
        ExecuteCommand(jobConfig.offDutyCommand)
        QBCore.Functions.Notify(Config.JobDuty.Notifications.PhoneOffDuty, 'error')
    end
end
