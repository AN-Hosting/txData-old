Config = {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)
Config.PauseMapText = ''                                     -- Text shown above the map when ESC is pressed. If left empty 'FiveM' will appear
Config.HarnessUses = 20
Config.DamageNeeded = 100.0                                  -- amount of damage till you can push your vehicle. 0-1000
Config.Logging = 'discord'                                   -- fivemanage

Config.AFK = {
    ignoredGroups = {
        ['mod'] = true,
        ['admin'] = true,
        ['god'] = true
    },
    secondsUntilKick = 1000000, -- AFK Kick Time Limit (in seconds)
    kickInCharMenu = false      -- Set to true if you want to kick players for being AFK even when they are in the character menu.
}

Config.HandsUp = {
    command = 'hu',
    keybind = 'X',
    controls = { 24, 25, 47, 58, 59, 63, 64, 71, 72, 75, 140, 141, 142, 143, 257, 263, 264 }
}

Config.Binoculars = {
    zoomSpeed = 10.0,        -- camera zoom speed
    storeBinocularsKey = 177 -- backspace by default
}

Config.AIResponse = {
    wantedLevels = false, -- if true, you will recieve wanted levels
    dispatchServices = {  -- AI dispatch services
        [1] = false,      -- Police Vehicles
        [2] = false,      -- Police Helicopters
        [3] = false,      -- Fire Department Vehicles
        [4] = false,      -- Swat Vehicles
        [5] = false,      -- Ambulance Vehicles
        [6] = false,      -- Police Motorcycles
        [7] = false,      -- Police Backup
        [8] = false,      -- Police Roadblocks
        [9] = false,      -- PoliceAutomobileWaitPulledOver
        [10] = false,     -- PoliceAutomobileWaitCruising
        [11] = false,     -- Gang Members
        [12] = false,     -- Swat Helicopters
        [13] = false,     -- Police Boats
        [14] = false,     -- Army Vehicles
        [15] = false      -- Biker Backup
    }
}

-- To Set This Up visit https://forum.cfx.re/t/how-to-updated-discord-rich-presence-custom-image/157686
Config.Discord = {
    isEnabled = true,                                     -- If set to true, then discord rich presence will be enabled
    applicationId = '1345559598043758592',                   -- The discord application id
    iconLarge = 'logo',                               -- The name of the large icon
    iconLargeHoverText = 'This is a Large icon with text', -- The hover text of the large icon
    iconSmall = 'logo',                         -- The name of the small icon
    iconSmallHoverText = 'This is a Small icon with text', -- The hover text of the small icon
    updateRate = 60000,                                    -- How often the player count should be updated
    showPlayerCount = true,                                -- If set to true the player count will be displayed in the rich presence
    maxPlayers = 8,                                       -- Maximum amount of players
    buttons = {
        {
            text = '🔥 Connect 🔥',
            url = 'fivem://connect/87.106.59.194:30120'
        },
        {
            text = '✨ Discord ✨',
            url = 'https://discord.gg/PFxbMHgSzs'
        }
    }
}

Config.Density = {
    parked = 0.3,
    vehicle = 0.4,
    multiplier = 0.4,
    peds = 1,
    scenario = 0.4
}

Config.Disable = {
    hudComponents = { 1, 2, 3, 4, 7, 9, 13, 14, 16, 19, 20, 21, 22 }, -- Hud Components: https://docs.fivem.net/natives/?_0x6806C51AD12B83B8
    controls = { 37 },                                            -- Controls: https://docs.fivem.net/docs/game-references/controls/
    displayAmmo = true,                                           -- alse disables ammo display
    ambience = false,                                             -- disables distance sirens, distance car alarms, flight music, etc
    idleCamera = true,                                            -- disables the idle cinematic camera
    vestDrawable = false,                                         -- disables the vest equipped when using heavy armor
    pistolWhipping = true,                                        -- disables pistol whipping
    driveby = false,                                              -- disables driveby
}

Config.RelieveWeedStress = math.random(0, 0) -- stress relief amount (100 max)

Config.Consumables = {
    eat = { -- default food items
        ['sandwich'] = math.random(5, 10),
        ['burgerpoulet'] = math.random(45, 65),
        ['cheeseburger'] = math.random(30, 50),
        ['frite'] = math.random(1, 1),
        ['friteburgerking'] = math.random(20, 30),
        ['fritekfc'] = math.random(20, 30),
        ['fritemacdo'] = math.random(20, 30),
        ['fritetacos'] = math.random(20, 30),
        ['glaceburgerking'] = math.random(15, 20),
        ['glacekfc'] = math.random(15, 20),
        ['glacemacdo'] = math.random(15, 20),
        ['glacetacos'] = math.random(15, 20),
        ['nuggetsburgerking'] = math.random(35, 45),
        ['nuggetskfc'] = math.random(35, 45),
        ['painhamburger'] = math.random(1, 1),
        ['steakhacher'] = math.random(1, 1),
        ['tacos'] = math.random(45, 65),
        ['triplechesse'] = math.random(55, 75),
        ['champignon'] = math.random(1, 1),
        ['chorizo'] = math.random(1, 1),
        ['mozarella'] = math.random(1, 1),
        ['jambon'] = math.random(1, 1),
        ['pateapizza'] = math.random(0, 0),
        ['pizzachampijambon'] = math.random(35, 45),
        ['pizzachorizo'] = math.random(35, 45),
        ['pizzajambon'] = math.random(35, 45),
        ['apple'] = math.random(10, 15),
        ['banana'] = math.random(10, 15),
        ['pear'] = math.random(10, 15),
        ['pineapple'] = math.random(10, 15),
        ['orange'] = math.random(10, 15),
        ['raspberry'] = math.random(10, 15),
        ['tosti'] = math.random(10, 15),

    },
    drink = { -- default drink items
        ['coca'] = math.random(20, 30),
        ['icetea'] = math.random(20, 30),
        ['sprite'] = math.random(20, 30),
        ['redbull'] = math.random(20, 30),
        ['orangina'] = math.random(20, 30),
        ['fanta'] = math.random(20, 30),
        ['monster'] = math.random(20, 30),
        ['water_bottle'] = math.random(20, 30),

    },
    alcohol = { -- default alcohol items
        ['whiskey'] = math.random(20, 30),
        ['beer'] = math.random(30, 40),
        ['vodka'] = math.random(20, 40),
    },
    custom = { -- put any custom items here
        -- ['newitem'] = {
        --     progress = {
        --         label = 'Using Item...',
        --         time = 5000
        --     },
        --     animation = {
        --         animDict = 'amb@prop_human_bbq@male@base',
        --         anim = 'base',
        --         flags = 8,
        --     },
        --     prop = {
        --         model = false,
        --         bone = false,
        --         coords = false, -- vector 3 format
        --         rotation = false, -- vector 3 format
        --     },
        --     replenish = {'''
        --         type = 'Hunger', -- replenish type 'Hunger'/'Thirst' / false
        --         replenish = math.random(20, 40),
        --         isAlcohol = false, -- if you want it to add alcohol count
        --         event = false, -- 'eventname' if you want it to trigger an outside event on use useful for drugs
        --         server = false -- if the event above is a server event
        --     }
        -- }
    }
}

Config.Fireworks = {
    delay = 5, -- time in s till it goes off
    items = {  -- firework items
        'firework1',
        'firework2',
        'firework3',
        'firework4'
    }
}

Config.BlacklistedScenarios = {
    types = {
        'WORLD_VEHICLE_MILITARY_PLANES_SMALL',
        'WORLD_VEHICLE_MILITARY_PLANES_BIG',
        'WORLD_VEHICLE_AMBULANCE',
        'WORLD_VEHICLE_POLICE_NEXT_TO_CAR',
        'WORLD_VEHICLE_POLICE_CAR',
        'WORLD_VEHICLE_POLICE_BIKE'
    },
    groups = {
        2017590552,
        2141866469,
        1409640232,
        `ng_planes`
    }
}

Config.BlacklistedVehs = {
    [`shamal`] = true,
    [`luxor`] = true,
    [`luxor2`] = true,
    [`jet`] = true,
    [`lazer`] = true,
    [`buzzard`] = true,
    [`buzzard2`] = true,
    [`annihilator`] = true,
    [`savage`] = true,
    [`titan`] = true,
    [`rhino`] = true,
    [`firetruck`] = true,
    [`mule`] = true,
    [`maverick`] = true,
    [`blimp`] = true,
    [`airtug`] = true,
    [`camper`] = true,
    [`hydra`] = true,
    [`oppressor`] = true,
    [`technical3`] = true,
    [`insurgent3`] = true,
    [`apc`] = true,
    [`tampa3`] = true,
    [`trailersmall2`] = true,
    [`halftrack`] = true,
    [`hunter`] = true,
    [`vigilante`] = true,
    [`akula`] = true,
    [`barrage`] = true,
    [`khanjali`] = true,
    [`caracara`] = true,
    [`blimp3`] = true,
    [`menacer`] = true,
    [`oppressor2`] = true,
    [`scramjet`] = true,
    [`strikeforce`] = true,
    [`cerberus`] = true,
    [`cerberus2`] = true,
    [`cerberus3`] = true,
    [`scarab`] = true,
    [`scarab2`] = true,
    [`scarab3`] = true,
    [`rrocket`] = true,
    [`ruiner2`] = true,
    [`deluxo`] = true,
    [`cargoplane2`] = true,
    [`voltic2`] = true
}

Config.BlacklistedWeapons = {
    [`WEAPON_RAILGUN`] = true,
}

Config.BlacklistedPeds = {
    [`s_m_y_ranger_01`] = true,
    [`s_m_y_sheriff_01`] = true,
    [`s_m_y_cop_01`] = true,
    [`s_f_y_sheriff_01`] = true,
    [`s_f_y_cop_01`] = true,
    [`s_m_y_hwaycop_01`] = true
}

Config.Objects = { -- for object removal
    { coords = vector3(266.09, -349.35, 44.74), heading = 0, length = 200, width = 200, model = 'prop_sec_barier_02b' },
    { coords = vector3(285.28, -355.78, 45.13), heading = 0, length = 200, width = 200, model = 'prop_sec_barier_02a' },
}

-- You may add more than 2 selections and it will bring up a menu for the player to select which floor be sure to label each section though
Config.Teleports = {
    [1] = {                   -- Elevator @ labs
        [1] = {               -- up
            poly = { coords = vector3(3540.74, 3675.59, 20.99), heading = 167.5, length = 2, width = 2 },
            allowVeh = false, -- whether or not to allow use in vehicle
            label = false     -- set this to a string for a custom label or leave it false to keep the default. if more than 2 options, label all options

        },
        [2] = { -- down
            poly = { coords = vector3(3540.74, 3675.59, 28.11), heading = 172.5, length = 2, width = 2 },
            allowVeh = false,
            label = false
        }
    },
    [2] = { --Coke Processing Enter/Exit
        [1] = {
            poly = { coords = vector3(909.49, -1589.22, 30.51), heading = 92.24, length = 2, width = 2 },
            allowVeh = false,
            label = '[E] Enter Coke Processing'
        },
        [2] = {
            poly = { coords = vector3(1088.81, -3187.57, -38.99), heading = 181.7, length = 2, width = 2 },
            allowVeh = false,
            label = '[E] Leave'
        }
    }
}

Config.CarWash = {
    dirtLevel = 0.1,                                                                                   -- threshold for the dirt level to be counted as dirty
    defaultPrice = 20,                                                                                 -- default price for the carwash
    locations = {
        [1] = { coords = vector3(174.81, -1736.77, 28.87), length = 7.0, width = 8.8, heading = 359 }, -- South Los Santos Carson Avenue
        [2] = { coords = vector3(25.2, -1391.98, 28.91), length = 6.6, width = 8.2, heading = 0 },     -- South Los Santos Innocence Boulevard
        [3] = { coords = vector3(-74.27, 6427.72, 31.02), length = 9.4, width = 8, heading = 315 },    -- Paleto Bay Boulevard
        [4] = { coords = vector3(1362.69, 3591.81, 34.5), length = 6.4, width = 8, heading = 21 },     -- Sandy Shores
        [5] = { coords = vector3(-699.84, -932.68, 18.59), length = 11.8, width = 5.2, heading = 0 }   -- Little Seoul Gas Station
    }
}

-------------- Skateboard --------------
Config.MaxSpeedKmh = 200
Config.maxJumpHeight = 5.0
Config.LoseConnectionDistance = 100.0

-------------- Telescopes --------------
Config.UseQTarget = false
Config.UseQBTarget = true

Config.Targeting = {
	Icon = "fas fa-binoculars",
	Label = "Utiliser le télescope"
}

-- Text
Config.HelpText = "Appuyez sur ~INPUT_TALK~ pour regarder à travers le télescope"
Config.NoFoundMessage = "Aucun télescope n'a été trouvé!"
Config.TelescopeInUse = "Quelqu'un d'autre utilise déjà le télescope!"
Config.ToFarAway = "Tu es allé loin!"

-- Other
Config.UseDistanceThread = true
Config.UseQbcoreNotifiactions = false -- will use custom (mythic notify by default) notifications if set to false

Config.MaxInteractionDist = 1.5
Config.MaxDetectionDist = 6.0

Config.MovementSpeed = {
	Keyboard = 2.75,
	Controller = 1.0
}

Config.Zoom = {
	Max = 50.0,
	Min = 5.0,
	Speed = 5.0
}

Config.Animations = {
	["default"] = {
		enter = "enter_front",
		enterTime = 1500,
		exit = "exit_front",
		idle = "idle"
	},
	["public"] = {
		enter = "public_enter_front",
		enterTime = 1500,
		exit = "public_exit_front",
		idle = "public_idle"
	},
	["upright"] = {
		enter = "upright_enter_front",
		enterTime = 2500,
		exit = "upright_exit_front",
		idle = "upright_idle"
	}
}

Config.Models = {
	[1186047406] = { MaxHorizontal = 55.0, MaxVertical = 20.0, offset = vector3(0.0, 0.95, 0.0), headingOffset = 180.0, animation = "public", cameraOffset = vector3(0.0, -0.5, 0.7), scaleform = "OBSERVATORY_SCOPE" }, -- prop_telescope_01 (Public)
	[844159446] = { MaxHorizontal = 55.0, MaxVertical = 20.0, offset = vector3(0.0, -0.85, 1.0), animation = "upright", cameraOffset = vector3(0.0, 0.2, 1.7), scaleform = "BINOCULARS" }, -- prop_telescope (Mount Chilliad)
	[-656927072] = { MaxHorizontal = 55.0, MaxVertical = 35.0, offset = vector3(1.25, 0.0, 0.0), headingOffset = 90.0, animation = "default", cameraOffset = vector3(-0.25, 0.0, 1.3), scaleform = "OBSERVATORY_SCOPE" }, -- prop_t_telescope_01b (Domestic)
	[1930051531] = { MaxHorizontal = 55.0, MaxVertical = 20.0, offset = vector3(0.0, 0.95, 0.0), headingOffset = 180.0, animation = "public", cameraOffset = vector3(0.0, -0.5, 0.7), scaleform = "BINOCULARS" }, -- xs_prop_arena_telescope_01 (not tested)
}

-- This list is only for the help text. If you only use the command or a 3rd eye then this list is not needed.
Config.Telescopes = {
	-- Public --
	-- Galileo Observatory
	{ model = 1186047406, coords = vector3(-490.6682, 1095.387, 319.9773) },
	{ model = 1186047406, coords = vector3(-487.7137, 1094.643, 319.9769) },
	{ model = 1186047406, coords = vector3(-466.6990, 1088.443, 327.5582) },
	{ model = 1186047406, coords = vector3(-452.7089, 1082.787, 332.4135) },
	{ model = 1186047406, coords = vector3(-457.2304, 1101.254, 332.4135) },
	{ model = 1186047406, coords = vector3(-451.7881, 1099.751, 332.4135) },
	{ model = 1186047406, coords = vector3(-415.1138, 1089.622, 332.4135) },
	{ model = 1186047406, coords = vector3(-409.6714, 1088.119, 332.4135) },
	{ model = 1186047406, coords = vector3(-401.0349, 1051.714, 323.721) },

	-- Senora National Park
	{ model = 1186047406, coords = vector3(2615.951, 3667.427, 101.9804) },
	{ model = 1186047406, coords = vector3(2613.160, 3662.852, 101.9836) },

	-- Del Perro Beach
	{ model = 1186047406, coords = vector3(-1722.135, -1014.014, 5.067778) },
	{ model = 1186047406, coords = vector3(-1719.312, -1016.231, 5.140132) },
	{ model = 1186047406, coords = vector3(-1677.599, -989.2823, 7.260609) },
	{ model = 1186047406, coords = vector3(-1682.565, -1005.748, 7.264191) },
	{ model = 1186047406, coords = vector3(-1704.427, -1058.541, 12.89529) }, -- This one is on the pier but is much closer to the beach ones

	-- Del Perro Pier
	{ model = 1186047406, coords = vector3(-1839.998, -1166.770, 12.8953) },
	{ model = 1186047406, coords = vector3(-1852.887, -1182.131, 12.8953) },
	{ model = 1186047406, coords = vector3(-1865.726, -1197.432, 12.8953) },
	{ model = 1186047406, coords = vector3(-1879.108, -1213.380, 12.898) },
	{ model = 1186047406, coords = vector3(-1867.321, -1223.522, 12.898) },
	{ model = 1186047406, coords = vector3(-1856.398, -1232.756, 12.91837) },
	{ model = 1186047406, coords = vector3(-1838.830, -1247.536, 12.91732) },
	{ model = 1186047406, coords = vector3(-1823.529, -1260.374, 12.918) },
	{ model = 1186047406, coords = vector3(-1826.419, -1270.177, 8.503754) },
	{ model = 1186047406, coords = vector3(-1841.719, -1257.338, 8.5031) },
	{ model = 1186047406, coords = vector3(-1857.081, -1244.448, 8.50415) },

	-- Hill Valley Church (West Eclipse Boulevard)
	{ model = 1186047406, coords = vector3(-1810.320, -129.073, 78.66142) },

	-- Public Binocular --
	-- Mount Chilliad
	{ model = 844159446, coords = vector3(499.8335, 5602.674, 796.9147) },
	{ model = 844159446, coords = vector3(503.3787, 5602.383, 796.9147) },

	-- Chumash
	{ model = 844159446, coords = vector3(-3259.545, 982.4403, 11.59678) }, -- Both are at the base of the pier
	{ model = 844159446, coords = vector3(-3259.456, 987.225, 11.59678) },

	-- Domestics --
	-- Houses/Apartment
	{ model = -656927072, coords = vector3(13.73517, 528.4813, 174.2378) }, -- Franklin
	{ model = -656927072, coords = vector3(-667.9016, 845.2842, 224.6442) }, -- 6085 Milton Road
	{ model = -656927072, coords = vector3(-1018.618, 658.7, 160.8932) }, -- 2884 Hillcrest Avenue (Martin Madrazo's house)

	{ model = -656927072, coords = vector3(-130.2234, -645.0045, 168.4174) }, -- Apartment (Arcadius Business Center)
	{ model = -656927072, coords = vector3(-1473.417, -543.9343, 73.04141) }, -- Apartment (Marathon Ave/North Rockford Drive)
	{ model = -656927072, coords = vector3(-15.94042, -580.2412, 79.02798) }, -- Apartment (Integrity)

	-- Other apartments
	{ model = -656927072, coords = vector3(-774.7643, 604.7314, 143.3283) },
	{ model = -656927072, coords = vector3(-662.9636, 582.7271, 144.5675) },
	{ model = -656927072, coords = vector3(-570.1771, 640.1734, 145.0294) },
	{ model = -656927072, coords = vector3(-851.1698, 671.2417, 152.0503) },
	{ model = -656927072, coords = vector3(-1282.699, 429.0291, 97.09206) },
	{ model = -656927072, coords = vector3(-162.235, 479.5696, 136.8414) },
	{ model = -656927072, coords = vector3(126.4659, 540.1469, 183.4945) },
	{ model = -656927072, coords = vector3(327.7837, 421.3323, 148.5685) },
	{ model = -656927072, coords = vector3(375.5592, 401.9527, 145.0975) },
	{ model = -656927072, coords = vector3(-12.571, -581.1641, 98.44279) },
	{ model = -656927072, coords = vector3(-44.62522, -578.5092, 88.32477) },
	{ model = -656927072, coords = vector3(-260.373, -941.1046, 75.44127) },
	{ model = -656927072, coords = vector3(-282.813, -967.2342, 90.72084) },
	{ model = -656927072, coords = vector3(-880.5233, -442.9293, 124.7444) },
	{ model = -656927072, coords = vector3(-918.014, -446.9025, 119.817) },
	{ model = -656927072, coords = vector3(-901.0436, -425.5372, 93.67105) },
	{ model = -656927072, coords = vector3(-912.1877, -386.501, 113.2719) },
	{ model = -656927072, coords = vector3(-895.6904, -368.2518, 83.69043) },
	{ model = -656927072, coords = vector3(-934.3463, -383.0493, 107.6502) },
	{ model = -656927072, coords = vector3(-1475.581, -539.8524, 55.13894) },
	{ model = -656927072, coords = vector3(-1475.581, -539.8524, 67.76656) },
	{ model = -656927072, coords = vector3(-1557.817, -580.1621, 108.1199) },
	{ model = -656927072, coords = vector3(-1368.97, -468.4037, 71.63905) },
	{ model = -656927072, coords = vector3(-625.4163, 59.26805, 106.237) },
	{ model = -656927072, coords = vector3(-612.4269, 39.68902, 97.1973) },
	{ model = -656927072, coords = vector3(-575.95, 48.04946, 91.83607) },

	-- DLC: Los Santos The Contract
	{ model = -656927072, coords = vector3(-1017.182, -436.4265, 67.2585) },
	{ model = -656927072, coords = vector3(-1011.75, -435.0921, 72.0585) },
	{ model = -656927072, coords = vector3(380.2575, -69.22025, 106.7604) },
	{ model = -656927072, coords = vector3(384.9384, -72.2832, 111.5604) },
	{ model = -656927072, coords = vector3(-994.3716, -760.9808, 65.29156) },
	{ model = -656927072, coords = vector3(-993.0943, -755.5347, 70.09155) },
	{ model = -656927072, coords = vector3(-588.0742, -706.9901, 116.4024) },
	{ model = -656927072, coords = vector3(-593.5171, -705.6987, 121.2024) },
}

-- Vehicule push
Config.target = true -- Use target system for vehicle push (disables TextUI)
Config.targetSystem = 'qb-target' -- Target System to use. ox_target, qtarget, qb-target
Config.Usebones = true -- Use bones for vehicle push
Config.PushKey = 'E' -- Key to push vehicle
Config.TurnRightKey = 'Q' -- Keys to turn the vehicle while pushing it.
Config.TurnLeftKey = 'A' -- Keys to turn the vehicle while pushing it.
Config.TextUI = false -- Use Text UI for vehicle push
Config.useOTSkills = false -- Use OT Skills for XP gain from pushing vehicles. Found here: https://otstudios.tebex.io
Config.maxReward = 20 -- Max amount of xp that can be gained from pushing a vehicle per push, make sure this is the same or less than what is set for strength in your OT_skills config.
Config.healthMin = 2000.0 -- Minimum health of vehicle to be able to push it.

Config.blacklist = { -- blacklist vehicle models from being pushed.
    [`phantom`] = true
}

-- Menu Perso
Config.ServiceCommands = {
    gendarmerie_nationale = '19',
    samu_75 = '15',
    pompiers_de_paris = '18',
    avocats_de_paris = '115',
    police_nationale = '17',
    norauto = '116',
    midas = '117',
    concessionnaire = '118',
    taxi = '119',
    orpi = '120',
    tabac = '121',
    burgerking = '122',
    kfc = '123',
    otacos = '124',
    Dir = '127',
    Vinci = '128',
    ['XPO Logistics'] = '129',
    TF1 = '130',
    Vigneron = '131',
    Pizza = '132'
}