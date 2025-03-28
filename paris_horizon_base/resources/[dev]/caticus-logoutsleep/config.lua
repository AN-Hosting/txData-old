Config = {}

Config.SleepingAnimation = "timetable@tracy@sleep@"
Config.SleepingAnimationScene = "idle_c"

-- How far below the player's position should the sleeping ped be placed
Config.ZOffset = 1.0

-- Whether to cleanup sleeping peds on resource restart
Config.CleanupOnRestart = false

-- Inventory Settings
Config.MaxSlots = 50
Config.MaxWeight = 100000

-- Robbery Settings
Config.AllowRobbing = false -- Set to false to disable robbing sleeping players
Config.RobAnimDict = "mini@repair"
Config.RobAnimName = "fixing_a_ped"
Config.RobDuration = 3500 -- milliseconds

Config.CarryAnimations = {
    carrier = {
        dict = "missfinale_c2mcs_1",
        anim = "fin_c2_mcs_1_camman",
        flag = 49
    },
    carried = {
        dict = "nm",
        anim = "firemans_carry",
        flag = 33
    }
}

Config.CarryOffset = {
    x = 0.27,
    y = 0.15,
    z = 0.63,
    pitch = 0.5,
    roll = 0.5,
    yaw = 0.0
}

Config.Debug = true