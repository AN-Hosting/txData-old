Locations = Locations or {}



Locations["bennys_motor_works"] = {
    Enabled = true,
    autoClock = { enter = true, exit = true, },
    job = "bennys",
    label = "BENNY'S Motor Works",
    img = "https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png",
    zones = {
        vec2(-1708.09, -722.21),
        vec2(-1729.3, -747.88),
        vec2(-1648.4, -817.0),
        vec2(-1627.73, -790.92),
    },
    blip = {
        coords = vec3(-1678.23, -759.25, 10.76),
        color = 1,
        sprite = 446,
        disp = 6,
        scale = 0.7,
        cat = nil,
    },
    Stash = {
        -- 1st room
        {   coords = vec4(-1674.3, -769.62, 10.76, 205.69), width = 4.5, depth = 0.8, minZ = 28.18, maxZ = 30.78,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
    },
    PersonalStash = {
        -- 2nd Room
        {   coords = vec4(3.41, -1294.11, 28.35, 90.0), width = 2.5, depth = 0.8, minZ = 28.35, maxZ = 30.55,
            label = "Personal Stash",
            icon = "fas fa-box-open",
            stashName = "redsAuto_Personal_",
        },
    },
	Shop = {
        -- 1st Room
        {   coords = vec4(-12.4, -1338.63, 29.18, 85.0), width = 0.8, depth = 2.6, minZ = 27.98, maxZ = 30.78,
            label = "Shop", icon = "fas fa-box-open",
        },
	},
    Crafting = {
        -- 1st Room
        {   coords = vec4(-1684.88, -750.13, 10.77, 230.07), width = 2.5, depth = 0.8, minZ = 28.18, maxZ = 29.78,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
    },
    Clockin = { },
    BossMenus = {
        -- 1st room
        {   coords = vec4(-15.13, -1340.96, 28.78, 90.0), width = 0.7, depth = 0.8, minZ = 28.78, maxZ = 29.58,
            label = "Open Bossmenu",
            icon = "fas fa-list",
        },
    },
    manualRepair = {
        {   prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(-3.05, -1300.05, 29.25, 178.91), },
            label = "Manual Repair", icon = "fas fa-cogs",
        },
    },
    Payments = {
        -- 1st room
        {   coords = vec4(-15.83, -1340.74, 28.78, 0.0), width = 0.6, depth = 0.6, minZ = 28.78, maxZ = 29.58,
            label = "Charge",
            icon = "fas fa-credit-card",
        },
    },
    PropAdd = {
        --{ model = "prop_atm_01", coords = vec4(5.09, -1291.56, 29.32, 0.0) },
    },
    PropHide = {
        --
    },
    Restrictions = { -- Remove what you DON'T what the location to be able to edit
        Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", "Boats", },
        Allow = { "tools", "cosmetics", "repairs", "nos", "perform", "paints" },
    },
    nosrefill = {
        --
    },
    discord = {
        link = "",
        color = 16711680,
    }
}