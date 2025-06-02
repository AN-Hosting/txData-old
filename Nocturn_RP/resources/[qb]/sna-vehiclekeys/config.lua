Config = {}

Config.NoLockVehicles = {
    
}
Config.LockpickNPCCars = false

Config.KeyMasterModel = 'cs_floyd'
Config.KeyMasterLocations = {
    vector4(-183.33, -1178.86, 22.11, 202.87), 
}
Config.KeyPrice = 300
Config.ResetPrice = 1000

Config.RemoveLockpickNormal = 0.5 -- Chance to remove lockpick on fail
Config.RemoveLockpickAdvanced = 0.2 -- Chance to remove advanced lockpick on fail

Config.TimeBetweenHotwires = 1000
Config.minHotwireTime = 10000 -- Minimum hotwire time for alarm

Config.AlertCooldown = 10000 -- 10 seconds
Config.PoliceAlertChance = 0.75 -- Chance of alerting police during the day
Config.PoliceNightAlertChance = 0.50 -- Chance of alerting police at night (times:01-06)

Config.ImmuneVehicles = { -- These vehicles cannot be jacked
    'police'
}
