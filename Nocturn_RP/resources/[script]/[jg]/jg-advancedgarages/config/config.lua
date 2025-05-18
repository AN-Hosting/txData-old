-----------------------------------------------------------------------------------
-- WAIT! Before editing this file manually, try our new easy configuration tool! --
--            https://configurator.jgscripts.com/advanced-garages                --
-----------------------------------------------------------------------------------
Config = {}

-- Localisation
Config.Locale = "fr"
Config.NumberAndDateFormat = "fr-FR"
Config.Currency = "USD"

-- Framework & Integrations
Config.Framework = "auto" -- or "QBCore", "Qbox", "ESX"
Config.FuelSystem = "none" -- or "cdn-fuel", "ps-fuel", "lj-fuel", "ox_fuel", "cdn-fuel", "hyon_gas_station", "okokGasStation", "nd_fuel", "myFuel", "ti_fuel", "Renewed-Fuel", "rcore_fuel", "none"
Config.VehicleKeys = "none" -- or "qb-vehiclekeys", "MrNewbVehicleKeys", "jaksam-vehicles-keys", "qs-vehiclekeys", "mk_vehiclekeys", "wasabi_carlock", "cd_garage", "okokGarage", "t1ger_keys", "Renewed", "tgiann-hotwire" "none"
Config.Notifications = "default" -- or "default", "okokNotify", "ox_lib", "ps-ui"
Config.Banking = "auto" -- or "qb-banking", "qb-management", "esx_addonaccount", "Renewed-Banking", "okokBanking", "fd_banking"
Config.Gangs = "auto" -- "qb-gangs", "rcore_gangs"

-- Draw text UI prompts (key binding control IDs here: https://docs.fivem.net/docs/game-references/controls/)
Config.DrawText = "auto" -- or "jg-textui", "qb-DrawText", "okokTextUI", "ox_lib", "ps-ui"
Config.OpenGarageKeyBind = 38
Config.OpenGaragePrompt = "Ouvrir Garage"
Config.OpenImpoundKeyBind = 38
Config.OpenImpoundPrompt = "Ouvrir Fourière"
Config.InsertVehicleKeyBind = 38
Config.InsertVehiclePrompt = "Ranger Véhicule"
Config.ExitInteriorKeyBind = 38
Config.ExitInteriorPrompt = "[E] Sortie Garage"

-- Target
Config.UseTarget = true
Config.Target = "qb-target" -- or "qb-target"
Config.TargetPed = "s_m_y_valet_01"

-- Radial
Config.UseRadialMenu = false
Config.RadialMenu = "ox_lib"


-- Little vehicle preview images in the garage UI - learn more/add custom images: https://docs.jgscripts.com/advanced-garages/vehicle-images
Config.ShowVehicleImages = true

-- Vehicle Spawning
Config.DoNotSpawnInsideVehicle = true
Config.SaveVehicleDamage = true -- Save and apply body and engine damage when taking the vehicle out a garage
Config.AdvancedVehicleDamage = false -- use Kiminaze's VehicleDeformation
Config.SaveVehiclePropsOnInsert = true

-- If you don't know what this means, don't touch this
-- If you know what this means, I do recommend enabling it but be aware you may experience reliability issues on more populated servers
-- Having significant issues? I beg you to just set it back to false before opening a ticket with us
-- HIGHLY recommended that you set Config.DoNotSpawnInsideVehicle = false if you decide to enable this
-- Want to read my rant about server spawned vehicles? https://docs.jgscripts.com/advanced-garages/misc/why-are-you-not-using-createvehicleserversetter-by-default
Config.SpawnVehiclesWithServerSetter = false

-- Vehicle Transfers
Config.GarageVehicleTransferCost = 250 -- Cost to transfer between garages
Config.TransferHidePlayerNames = true
Config.EnableTransfers = {
  betweenGarages = false,
  betweenPlayers = true
}
Config.DisableTransfersToUnregisteredGarages = false -- Potential hacking protection for vigilant servers - unregistered garages are ones created via events in third-party script integrations, such as housing scripts, and therefore could be prone to script kiddie attacks.

-- Prevent vehicle duplication
-- Learn more: https://docs.jgscripts.com/advanced-garages/vehicle-duplication-prevention
Config.AllowInfiniteVehicleSpawns = false -- Public & private garages
Config.JobGaragesAllowInfiniteVehicleSpawns = false -- Job garages
Config.GangGaragesAllowInfiniteVehicleSpawns = false -- Gang garages
Config.GarageVehicleReturnCost = 250 -- "towing" tax if not placed back in garage after server restart; or if destroyed or underwater while left out
Config.GarageVehicleReturnCostSocietyFund = false -- Job name of society fund to pay return fees into (optional)

-- Public Garages
Config.GarageShowBlips = true
Config.GarageUniqueBlips = true
Config.GarageUniqueLocations = true
Config.GarageEnableInteriors = false
Config.GarageLocations = { -- IMPORTANT - Every garage name must be unique
  ["Legion Square"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(191.52, -930.51, 23.94),
    spawn = {vector4(185.4, -924.56, 23.33, 324.98), vector4(178.76, -919.96, 23.33, 324.38), vector4(175.84, -918.04, 23.33, 326.04), vector4(172.6, -915.89, 23.34, 325.58)}, --  you can add multiple spawn locations into a table
    distance = 10,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  --["Islington South"] = {
  --  coords = vector3(273.0, -343.85, 44.91),
  --  spawn = vector4(270.75, -340.51, 44.92, 342.03),
  --  distance = 15,
  --  type = "car",
  --  hideBlip = false,
  --  blip = {
  --    id = 357,
  --    color = 0,
  --    scale = 0.7
  --  },
  --  hideMarkers = true,
  --  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  --},
  --["Grove Street"] = {
  --  coords = vector3(14.66, -1728.52, 29.3),
  --  spawn = vector4(23.93, -1722.9, 29.3, 310.58),
  --  distance = 15,
  --  type = "car",
  --  hideBlip = false,
  --  blip = {
  --    id = 357,
  --    color = 0,
  --    scale = 0.7
  --  },
  --  hideMarkers = true,
  --  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  --},
  --["Mirror Park"] = {
  --  coords = vector3(1032.84, -765.1, 58.18),
  --  spawn = vector4(1023.2, -764.27, 57.96, 319.66),
  --  distance = 15,
  --  type = "car",
  --  hideBlip = false,
  --  blip = {
  --    id = 357,
  --    color = 0,
  --    scale = 0.7
  --  },
  --  hideMarkers = true,
  --  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  --},
  --["Beach"] = {
  --  coords = vector3(-1248.69, -1425.71, 4.32),
  --  spawn = vector4(-1244.27, -1422.08, 4.32, 37.12),
  --  distance = 15,
  --  type = "car",
  --  hideBlip = false,
  --  blip = {
  --    id = 357,
  --    color = 0,
  --    scale = 0.7
  --  },
  --  hideMarkers = true,
  --  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  --},
  --["Great Ocean Highway"] = {
  --  coords = vector3(-2961.58, 375.93, 15.02),
  --  spawn = vector4(-2964.96, 372.07, 14.78, 86.07),
  --  distance = 15,
  --  type = "car",
  --  hideBlip = false,
  --  blip = {
  --    id = 357,
  --    color = 0,
  --    scale = 0.7
  --  },
  --  hideMarkers = true,
  --  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  --},
  --["Sandy South"] = {
  --  coords = vector3(217.33, 2605.65, 46.04),
  --  spawn = vector4(216.94, 2608.44, 46.33, 14.07),
  --  distance = 15,
  --  type = "car",
  --  hideBlip = false,
  --  blip = {
  --    id = 357,
  --    color = 0,
  --    scale = 0.7
  --  },
  --  hideMarkers = true,
  --  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  --},
  ["Sandy North"] = {
    coords = vector3(1878.44, 3760.1, 32.94),
    spawn = vector4(1880.14, 3757.73, 32.93, 215.54),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  --["North Vinewood Blvd"] = {
  --  coords = vector3(365.21, 295.65, 103.46),
  --  spawn = vector4(364.84, 289.73, 103.42, 164.23),
  --  distance = 15,
  --  type = "car",
  --  hideBlip = false,
  --  blip = {
  --    id = 357,
  --    color = 0,
  --    scale = 0.7
  --  },
  --  hideMarkers = true,
  --  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  --},
  --["Grapeseed"] = {
  --  coords = vector3(1713.06, 4745.32, 41.96),
  --  spawn = vector4(1710.64, 4746.94, 41.95, 90.11),
  --  distance = 15,
  --  type = "car",
  --  hideBlip = false,
  --  blip = {
  --    id = 357,
  --    color = 0,
  --    scale = 0.7
  --  },
  --  hideMarkers = true,
  --  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  --},
  ["Paleto Bay"] = {
    coords = vector3(107.32, 6611.77, 31.98),
    spawn = vector4(110.84, 6607.82, 31.86, 265.28),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  --["Boats"] = {
  --  coords = vector3(-795.15, -1510.79, 1.6),
  --  spawn = vector4(-798.66, -1507.73, -0.47, 102.23),
  --  distance = 20,
  --  type = "sea",
  --  hideBlip = false,
  --  blip = {
  --    id = 356,
  --    color = 0,
  --    scale = 0.7
  --  },
  --  hideMarkers = true,
  --  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  --},
  --["Hangar"] = {
  --  coords = vector3(-1243.49, -3391.88, 13.94),
  --  spawn = vector4(-1258.4, -3394.56, 13.94, 328.23),
  --  distance = 20,
  --  type = "air",
  --  hideBlip = false,
  --  blip = {
  --    id = 359,
  --    color = 0,
  --    scale = 0.7
  --  },
  --  hideMarkers = true,
  --  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  --}
  }

-- Private Garages
Config.PrivGarageCreateCommand = "privategarages"
Config.PrivGarageCreateJobRestriction = {"realestate"}
Config.PrivGarageEnableInteriors = true
Config.PrivGarageHideBlips = false
Config.PrivGarageBlip = {
  id = 357,
  color = 46,
  scale = 0.7
}

-- Job Garages
Config.JobGarageShowBlips = true
Config.JobGarageSetVehicleCommand = "setjobvehicle" -- admin only
Config.JobGarageRemoveVehicleCommand = "removejobvehicle" -- admin only
Config.JobGarageUniqueBlips = false
Config.JobGarageUniqueLocations = true
Config.JobGarageEnableInteriors = true
Config.JobGarageLocations = { -- IMPORTANT - Every garage name must be unique
["Pawnshop"] = {
  coords = vector3(-771.29, -592.61, 30.13),
  spawn = vector4(-785.2, -590.14, 30.13, 343.2),
  distance = 15,
  job = {"pawnshop"},
  type = "car",
  hideBlip = false,
  blip = {
    id = 357,
    color = 0,
    scale = 0.7
  },
  hideMarkers = true,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  vehiclesType = "owned",
},
["VanillaUnicorn"] = {
  coords = vector3(144.76, -1287.38, 29.34),
  spawn = vector4(149.11, -1282.45, 29.03, 216.34),
  distance = 15,
  job = {"vanillaunicorn"},
  type = "car",
  hideBlip = false,
  blip = {
    id = 357,
    color = 0,
    scale = 0.7
  },
  hideMarkers = true,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  vehiclesType = "owned",
},
["MalibuClub"] = {
  coords = vector3(-845.87, -1228.81, 6.89),
  spawn = vector4(-851.03, -1224.54, 6.59, 323.52),
  distance = 15,
  job = {"malibuclub"},
  type = "car",
  hideBlip = false,
  blip = {
    id = 357,
    color = 0,
    scale = 0.7
  },
  hideMarkers = true,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  vehiclesType = "owned",
},
["Casino"] = {
  coords = vector3(885.91, -1.93, 78.76),
  spawn = vector4(890.58, -9.49, 78.76, 234.92),
  distance = 15,
  job = {"casino"},
  type = "car",
  hideBlip = false,
  blip = {
    id = 357,
    color = 0,
    scale = 0.7
  },
  hideMarkers = true,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  vehiclesType = "owned",
},
["Bennys"] = {
  coords = vector3(-1665.06, -778.96, 10.57),
  spawn = vector4(-1669.33, -790.46, 10.57, 326.37), vector4(-1673.78, -787.15, 10.57, 331.66), vector4(-1665.28, -793.72, 10.57, 334.48)
  distance = 15,
  job = {"bennys"},
  type = "car",
  hideBlip = false,
  blip = {
    id = 357,
    color = 0,
    scale = 0.7
  },
  hideMarkers = true,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  vehiclesType = "owned",
},
["Luxury"] = {
  coords = vector3(-766.93, -242.84, 37.1),
  spawn = vector4(-765.46, -247.87, 37.1, 118.44),
  distance = 15,
  job = {"luxury"},
  type = "car",
  hideBlip = false,
  blip = {
    id = 357,
    color = 0,
    scale = 0.7
  },
  hideMarkers = true,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  vehiclesType = "owned",
},
["Dynasty8"] = {
  coords = vector3(-713.13, 277.49, 84.38),
  spawn = vector4(-708.81, 281.81, 84.08, 263.21),
  distance = 15,
  job = {"dynasty8"},
  type = "car",
  hideBlip = false,
  blip = {
    id = 357,
    color = 0,
    scale = 0.7
  },
  hideMarkers = true,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  vehiclesType = "owned",
},
["EMS"] = {
  coords = vector3(299.15, -1443.9, 29.8),
  spawn = vector4(305.39, -1438.59, 29.81, 227.45),
  distance = 15,
  job = {"ems"},
  type = "car",
  hideBlip = false,
  blip = {
    id = 357,
    color = 0,
    scale = 0.7
  },
  hideMarkers = true,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  vehiclesType = "owned",
},
["EMS HELI"] = {
  coords = vector3(302.29, -1466.65, 46.51),
  spawn = {vector4(313.37, -1464.7, 46.51, 319.98), vector4(299.35, -1453.44, 46.51, 322.18)},
  distance = 15,
  job = {"ems"},
  type = "air",
  hideBlip = false,
  blip = {
    id = 357,
    color = 0,
    scale = 0.7
  },
  hideMarkers = true,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  vehiclesType = "owned",
},
["LSPD"] = {
  coords = vector3(442.12, -1010.83, 28.54),
  spawn = vector4(444.55, -1018.67, 28.64, 88.62),
  distance = 15,
  job = {"lspd"},
  type = "car",
  hideBlip = false,
  blip = {
    id = 357,
    color = 0,
    scale = 0.7
  },
  hideMarkers = true,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  vehiclesType = "owned",
},
["Gouvernement"] = {
  coords = vector3(-404.12, 1173.12, 325.64),
  spawn = vector4(-411.24, 1175.13, 325.64, 345.7),
  distance = 15,
  job = {"gouv"},
  type = "car",
  hideBlip = false,
  blip = {
    id = 357,
    color = 0,
    scale = 0.7
  },
  hideMarkers = true,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  vehiclesType = "owned",
},
["BurgerShot"] = {
  coords = vector3(-809.73, -768.42, 21.3),
  spawn = vector4(-815.24, -762.67, 21.81, 3.86),
  distance = 15,
  job = {"burgershot"},
  type = "car",
  hideBlip = false,
  blip = {
    id = 357,
    color = 0,
    scale = 0.7
  },
  hideMarkers = true,
  markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  vehiclesType = "owned",
},
  ["CatCafe"] = {
    coords = vector3(-313.6, -66.57, 53.74),
    spawn = vector4(-323.02, -64.79, 53.74, 163.08),
    distance = 15,
    job = {"catcafe"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ["Mechanic"] = {
    coords = vector3(157.86, -3005.9, 7.03),
    spawn = vector4(165.26, -3014.94, 5.9, 268.8),
    distance = 15,
    job = {"mechanic"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["Police"] = {
    coords = vector3(434.48, -1016.97, 28.83),
    spawn = vector4(434.55, -1014.54, 28.49, 91.56),
    distance = 15,
    job = {"police"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "police", -- spawn code for vehicle
        plate = "PD", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        nickname = "Police car", -- Show a custom name instead of the vehicle's real name
        livery = 1,
        extras = {1, 2},
        maxMods = true
      },
      [2] = {
        model = "police2",
        plate = false,
        minJobGrade = 3,
        livery = 2,
        extras = {},
        maxMods = true
      }
    }
  }
}

-- Gang Garages (QBCore/Qbox only by default)
Config.GangEnableCustomESXIntegration = false -- Set to true if you've added a custom system to cl/sv-functions.lua
Config.GangGarageShowBlips = true
Config.GangGarageSetVehicleCommand = "setgangvehicle" -- admin only
Config.GangGarageRemoveVehicleCommand = "removegangvehicle" -- admin only
Config.GangGarageUniqueBlips = false
Config.GangGarageUniqueLocations = true
Config.GangGarageEnableInteriors = true
Config.GangGarageLocations = { -- IMPORTANT - Every garage name must be unique
  ["The Lost MC"] = {
    coords = vector3(439.18, -1518.48, 29.28),
    spawn = vector4(439.18, -1518.48, 29.28, 139.06),
    distance = 15,
    gang = {"lostmc"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- Use personal vehicles
  }
}

-- Impound
Config.ImpoundCommand = "iv"
Config.ImpoundFeesSocietyFund = "police" -- Job name of society fund to pay impound fees into (optional)
Config.ImpoundShowBlips = true
Config.ImpoundUniqueBlips = false
Config.ImpoundTimeOptions = {0, 1, 4, 12, 24, 72, 168} -- in hours
Config.ImpoundLocations = { -- IMPORTANT - Every impound name must be unique
  ["Impound A"] = {
    coords = vector3(410.8, -1626.26, 29.29),
    spawn = vector4(408.44, -1630.88, 29.29, 136.88),
    distance = 15,
    type = "car",
    job = {"police"},
    hideBlip = false,
    blip = {
      id = 68,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Impound B"] = {
    coords = vector3(1649.71, 3789.61, 34.79),
    spawn = vector4(1643.66, 3798.36, 34.49, 216.16),
    distance = 15,
    type = "car",
    job = {"police"},
    hideBlip = false,
    blip = {
      id = 68,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  }
}

-- Garage Interior
Config.GarageInteriorEntrance = vector4(227.96, -1003.06, -99.0, 0.0)
Config.GarageInteriorCameraCutscene = {
  vector4(227.96, -977.81, -98.99, 0.0), -- from
  vector4(227.96, -1006.96, -98.99, 0.0), -- to (this should be the entrance, or slightly further back from the entrance coords for a better final player transition)
}
Config.GarageInteriorVehiclePositions = {
  vector4(233.000000, -984.000000, -99.410004, 118.000000),
  vector4(233.000000, -988.500000, -99.410004, 118.000000),
  vector4(233.000000, -993.000000, -99.410004, 118.000000),
  vector4(233.000000, -997.500000, -99.410004, 118.000000),
  vector4(233.000000, -1002.000000, -99.410004, 118.000000),
  vector4(223.600006, -979.000000, -99.410004, 235.199997),
  vector4(223.600006, -983.599976, -99.410004, 235.199997),
  vector4(223.600006, -988.200012, -99.410004, 235.199997),
  vector4(223.600006, -992.799988, -99.410004, 235.199997),
  vector4(223.600006, -997.400024, -99.410004, 235.199997),
  vector4(223.600006, -1002.000000, -99.410004, 235.199997),
}

-- Staff Commands
Config.ChangeVehiclePlate = "vplate" -- admin only
Config.DeleteVehicleFromDB = "dvdb" -- admin only
Config.ReturnVehicleToGarage = "vreturn" -- admin only

-- Add your import vehicle's spawn name and desired label here for pretty vehicle names in the garage
-- This is mainly designed for ESX - if you are using QB, do this in shared!
Config.VehicleLabels = {
  ["spawnName"] = "Pretty Vehicle Label"
}

-- Block certain vehicles from being transferred to other players
Config.PlayerTransferBlacklist = {
  "spawnName"
}

Config.AutoRunSQL = false
Config.ReturnToPreviousRoutingBucket = false
Config.HideWatermark = false
Config.__v3Config = true
Config.Debug = false