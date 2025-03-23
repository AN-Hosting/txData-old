-----------------------------------------------------------------------------------
-- WAIT! Before editing this file manually, try our new easy configuration tool! --
--            https://configurator.jgscripts.com/advanced-garages                --
-----------------------------------------------------------------------------------
Config = {}

-- Localisation
Config.Locale = "fr"
Config.NumberAndDateFormat = "fr-FR"
Config.Currency = "EUR"

-- Framework & Integrations
Config.Framework = "auto" -- or "QBCore", "Qbox", "ESX"
Config.FuelSystem = "LegacyFuel" -- or "LegacyFuel", "ps-fuel", "lj-fuel", "ox_fuel", "cdn-fuel", "hyon_gas_station", "okokGasStation", "nd_fuel", "myFuel", "ti_fuel", "Renewed-Fuel", "rcore_fuel", "none"
Config.VehicleKeys = "sna-vehiclekeys" -- or "qb-vehiclekeys", "MrNewbVehicleKeys", "jaksam-vehicles-keys", "qs-vehiclekeys", "mk_vehiclekeys", "wasabi_carlock", "cd_garage", "okokGarage", "t1ger_keys", "Renewed", "tgiann-hotwire" "none"
Config.Notifications = "auto" -- or "default", "okokNotify", "ox_lib", "ps-ui"
Config.Banking = "auto" -- or "qb-banking", "qb-management", "esx_addonaccount", "Renewed-Banking", "okokBanking", "fd_banking"
Config.Gangs = "auto" -- "qb-gangs", "rcore_gangs"

-- Draw text UI prompts (key binding control IDs here: https://docs.fivem.net/docs/game-references/controls/)
Config.DrawText = "ox_lib" -- or "jg-textui", "qb-DrawText", "okokTextUI", "ox_lib", "ps-ui"
Config.OpenGarageKeyBind = 38
Config.OpenGaragePrompt = "[E] Ouvrir Garage"
Config.OpenImpoundKeyBind = 38
Config.OpenImpoundPrompt = "[E] Ouvrir Fouriére"
Config.InsertVehicleKeyBind = 38
Config.InsertVehiclePrompt = "[E] Ranger le Véhicules"
Config.ExitInteriorKeyBind = 38
Config.ExitInteriorPrompt = "[E] Quiter le Garage"

-- Target
Config.UseTarget = false
Config.Target = "qb-target" -- or "qb-target"
Config.TargetPed = "s_m_y_valet_01"

-- Radial
Config.UseRadialMenu = false
Config.RadialMenu = "ox_lib"


-- Little vehicle preview images in the garage UI - learn more/add custom images: https://docs.jgscripts.com/advanced-garages/vehicle-images
Config.ShowVehicleImages = false

-- Vehicle Spawning
Config.DoNotSpawnInsideVehicle = true
Config.SaveVehicleDamage = true -- Save and apply body and engine damage when taking the vehicle out a garage
Config.AdvancedVehicleDamage = true -- use Kiminaze's VehicleDeformation
Config.SaveVehiclePropsOnInsert = true

-- If you don't know what this means, don't touch this
-- If you know what this means, I do recommend enabling it but be aware you may experience reliability issues on more populated servers
-- Having significant issues? I beg you to just set it back to false before opening a ticket with us
-- HIGHLY recommended that you set Config.DoNotSpawnInsideVehicle = false if you decide to enable this
-- Want to read my rant about server spawned vehicles? https://docs.jgscripts.com/advanced-garages/misc/why-are-you-not-using-createvehicleserversetter-by-default
Config.SpawnVehiclesWithServerSetter = false

-- Vehicle Transfers
Config.GarageVehicleTransferCost = 5000 -- Cost to transfer between garages
Config.TransferHidePlayerNames = true
Config.EnableTransfers = {
  betweenGarages = true,
  betweenPlayers = true
}
Config.DisableTransfersToUnregisteredGarages = false -- Potential hacking protection for vigilant servers - unregistered garages are ones created via events in third-party script integrations, such as housing scripts, and therefore could be prone to script kiddie attacks.

-- Prevent vehicle duplication
-- Learn more: https://docs.jgscripts.com/advanced-garages/vehicle-duplication-prevention
Config.AllowInfiniteVehicleSpawns = false -- Public & private garages
Config.JobGaragesAllowInfiniteVehicleSpawns = false -- Job garages
Config.GangGaragesAllowInfiniteVehicleSpawns = false -- Gang garages
Config.GarageVehicleReturnCost = 2500 -- "towing" tax if not placed back in garage after server restart; or if destroyed or underwater while left out
Config.GarageVehicleReturnCostSocietyFund = true -- Job name of society fund to pay return fees into (optional)

-- Public Garages
Config.GarageShowBlips = true
Config.GarageUniqueBlips = false
Config.GarageUniqueLocations = true
Config.GarageEnableInteriors = false
Config.GarageLocations = { -- IMPORTANT - Every garage name must be unique
  ["Legion Square"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(215.09, -805.17, 30.81),
    spawn = {vector4(216.84, -802.02, 30.78, 69.82), vector4(218.09, -799.42, 30.76, 66.17), vector4(219.29, -797.23, 30.75, 65.4), vector4(219.59, -794.44, 30.75, 69.35), vector4(220.63, -792.03, 30.75, 63.76), vector4(206.81, -798.35, 30.99, 248.53)}, --  you can add multiple spawn locations into a table
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Islington South"] = {
    coords = vector3(273.0, -343.85, 44.91),
    spawn = vector4(270.75, -340.51, 44.92, 342.03),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Grove Street"] = {
    coords = vector3(14.66, -1728.52, 29.3),
    spawn = vector4(23.93, -1722.9, 29.3, 310.58),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Mirror Park"] = {
    coords = vector3(1032.84, -765.1, 58.18),
    spawn = vector4(1023.2, -764.27, 57.96, 319.66),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Beach"] = {
    coords = vector3(-1248.69, -1425.71, 4.32),
    spawn = vector4(-1244.27, -1422.08, 4.32, 37.12),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Great Ocean Highway"] = {
    coords = vector3(-2961.58, 375.93, 15.02),
    spawn = vector4(-2964.96, 372.07, 14.78, 86.07),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Sandy South"] = {
    coords = vector3(217.33, 2605.65, 46.04),
    spawn = vector4(216.94, 2608.44, 46.33, 14.07),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Sandy North"] = {
    coords = vector3(1878.44, 3760.1, 32.94),
    spawn = vector4(1880.14, 3757.73, 32.93, 215.54),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["North Vinewood Blvd"] = {
    coords = vector3(365.21, 295.65, 103.46),
    spawn = vector4(364.84, 289.73, 103.42, 164.23),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Grapeseed"] = {
    coords = vector3(1713.06, 4745.32, 41.96),
    spawn = vector4(1710.64, 4746.94, 41.95, 90.11),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Paleto Bay"] = {
    coords = vector3(107.32, 6611.77, 31.98),
    spawn = vector4(110.84, 6607.82, 31.86, 265.28),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Boats"] = {
    coords = vector3(-795.15, -1510.79, 1.6),
    spawn = vector4(-798.66, -1507.73, -0.47, 102.23),
    distance = 20,
    type = "sea",
    hideBlip = false,
    blip = {
      id = 356,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Hangar"] = {
    coords = vector3(-1243.49, -3391.88, 13.94),
    spawn = vector4(-1258.4, -3394.56, 13.94, 328.23),
    distance = 20,
    type = "air",
    hideBlip = false,
    blip = {
      id = 359,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  }
}

-- Private Garages
Config.PrivGarageCreateCommand = "privategarages"
Config.PrivGarageCreateJobRestriction = {"realestate"}
Config.PrivGarageEnableInteriors = true
Config.PrivGarageHideBlips = false
Config.PrivGarageBlip = {
  id = 369,
  color = 0,
  scale = 0.5
}

-- Job Garages
Config.JobGarageShowBlips = false
Config.JobGarageSetVehicleCommand = "setjobvehicle" -- admin only
Config.JobGarageRemoveVehicleCommand = "removejobvehicle" -- admin only
Config.JobGarageUniqueBlips = false
Config.JobGarageUniqueLocations = true
Config.JobGarageEnableInteriors = true
Config.JobGarageLocations = { -- IMPORTANT - Every garage name must be unique
  ['Tabac'] = {
    coords = vector3(-500.66, -44.25, 44.51),
    spawn = vector4(-524.65, -36.94, 44.52, 358.96),
    distance = 5,
    job = {"tabac"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['Concessionnaire Centre'] = {
    coords = vector3(-181.17, -1179.74, 23.12),
    spawn = vector4(-186.92, -1182.8, 22.98, 86.82),
    distance = 5,
    job = {"concessionnaire"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['Burger King'] = {
    coords = vector3(44.97, -805.04, 31.5),
    spawn = vector4(37.59, -840.42, 30.9, 160.05),
    distance = 5,
    job = {"burgerking"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['O Tacos'] = {
    coords = vector3(96.43, -1416.94, 29.42),
    spawn = vector4(109.08, -1401.75, 29.28, 135.87),
    distance = 5,
    job = {"otacos"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['Brinks'] = {
    coords = vector3(-292.3, 6125.61, 31.82),
    spawn = vector4(-309.0, 6107.94, 31.83, 291.87),
    distance = 5,
    job = {"brinks"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['KFC'] = {
    coords = vector3(-1177.31, -900.57, 13.64),
    spawn = vector4(-1177.31, -900.57, 13.64, 299.75),
    distance = 5,
    job = {"kfc"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['Midas'] = {
    coords = vector3(-849.97, -417.71, 36.64),
    spawn = vector4(-850.9, -413.07, 36.64, 251.61),
    distance = 5,
    job = {"midas"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['Norauto'] = {
    coords = vector3(870.56, -892.75, 25.88),
    spawn = vector4(870.56, -892.75, 25.88, 108.99),
    distance = 5,
    job = {"norauto"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['Taxi'] = {
    coords = vector3(98.18, -217.64, 54.49),
    spawn = vector4(98.18, -217.64, 54.49, 75.61),
    distance = 5,
    job = {"taxi"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['Orpi'] = {
    coords = vector3(-277.9, -904.77, 31.08),
    spawn = vector4(-277.9, -904.77, 31.08, 68.22),
    distance = 5,
    job = {"orpi"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['Samu 75'] = {
    coords = vector3(-1842.64, -320.32, 49.14),
    spawn = vector4(-1842.64, -320.32, 49.14, 35.35),
    distance = 5,
    job = {"samu_75"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['Mairie'] = {
    coords = vector(-553.59, -645.14, 33.23),
    spawn = vector4(-553.59, -645.14, 33.23, 221.42),
    distance = 5,
    job = {"mairie"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['Police Nationale'] = {
    coords = vector3(441.66, -1011.13, 28.71),
    spawn = vector4(443.09, -1015.38, 28.64, 89.59),
    distance = 5,
    job = {"police_nationale"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['Gendarmerie Nationale'] = {
    coords = vector3(2541.77, -395.17, 92.99),
    spawn = vector4(2541.77, -395.17, 92.99, 190.69),
    distance = 5,
    job = {"gendarmerie_nationale"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['Pompier de Paris'] = {
    coords = vector3(-242.72, -1313.89, 31.3),
    spawn = vector4(-242.72, -1313.89, 31.3, 180.88),
    distance = 5,
    job = {"pompiers_de_paris"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['Vinci'] = {
    coords = vector3(2721.09, 3479.78, 56.32),
    spawn = vector4(2721.09, 3479.78, 56.32, 252.84),
    distance = 5,
    job = {"vinci"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['Taxi'] = {
    coords = vector3(885.24, -149.31, 69.38),
    spawn = vector4(885.24, -149.31, 69.38, 146.62),
    distance = 5,
    job = {"taxi"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['Pizza'] = {
    coords = vector3(1708.46, 3775.04, 34.51),
    spawn = vector4(1708.46, 3775.04, 34.51, 213.89),
    distance = 5,
    job = {"pizza"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['Avocats de Paris'] = {
    coords = vector3(1746.72, 3611.7, 35.0),
    spawn = vector4(1746.72, 3611.7, 35.0, 307.47),
    distance = 5,
    job = {"avocats_de_paris"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['Vigneron'] = {
    coords = vector3(-1895.66, 2034.89, 140.74),
    spawn = vector4(-1895.66, 2034.89, 140.74, 155.65),
    distance = 5,
    job = {"vigneron"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['Dir'] = {
    coords = vector3(-1773.7, -755.9, 10.83),
    spawn = vector4(-1773.7, -755.9, 10.83, 324.01),
    distance = 5,
    job = {"dir"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['XPO Logistics'] = {
    coords = vector3(1233.98, -3227.34, 5.9),
    spawn = vector4(1233.98, -3227.34, 5.9, 5.54),
    distance = 5,
    job = {"xpo"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['TF1'] = {
    coords = vector3(-1100.16, -260.56, 37.68),
    spawn = vector4(-1100.16, -260.56, 37.68, 195.17),
    distance = 5,
    job = {"tf1"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['Maisonette 10'] = {
    coords = vector3(-395.66, 206.88, 83.57),
    spawn = vector4(-400.35, 204.42, 83.23, 3.14),
    distance = 5,
    job = {"maisonette10"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  },
  ['Pompier de Paris'] = {
    coords = vector3(1205.94, -1497.04, 34.1),
    spawn = vector4(1205.94, -1497.04, 34.1, 176.87),
    distance = 5,
    job = {"pompiers_de_paris"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned",
  }
}

-- Gang Garages (QBCore/Qbox only by default)
Config.GangEnableCustomESXIntegration = false -- Set to true if you've added a custom system to cl/sv-functions.lua
Config.GangGarageShowBlips = false
Config.GangGarageSetVehicleCommand = "setgangvehicle" -- admin only
Config.GangGarageRemoveVehicleCommand = "removegangvehicle" -- admin only
Config.GangGarageUniqueBlips = false
Config.GangGarageUniqueLocations = true
Config.GangGarageEnableInteriors = true
Config.GangGarageLocations = { -- IMPORTANT - Every garage name must be unique
  -- ["The Lost MC"] = {
  --   coords = vector3(439.18, -1518.48, 29.28),
  --   spawn = vector4(439.18, -1518.48, 29.28, 139.06),
  --   distance = 15,
  --   gang = {"lostmc"},
  --   type = "car",
  --   hideBlip = false,
  --   blip = {
  --     id = 369,
  --     color = 0,
  --     scale = 0.5
  --   },
  --   hideMarkers = false,
  --   markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  --   vehiclesType = "owned", --"personal", -- Use personal vehicles
  -- }
  ['Cité Barbes'] = {
    coords = vector3(-208.62, -1547.1, 34.17),
    spawn = vector4(-216.28, -1550.31, 33.81, 133.46),
    distance = 15,
    gang = {"barbes"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned", --"personal",
  },
  ['Cité Belleville'] = {
    coords = vector3(1186.32, -2247.75, 45.34),
    spawn = vector4(1189.81, -2251.54, 45.34, 240.55),
    distance = 15,
    gang = {"belleville"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned", --"personal",
  },
  ['Cité Felix Pyat'] = {
    coords = vector3(846.08, 785.65, 188.16),
    spawn = vector4(846.4, 789.06, 188.01, 359.94),
    distance = 15,
    gang = {"felixpyat"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned", --"personal",
  },
  ['Les Lopezz'] = {
    coords = vector3(-1605.11, -910.83, 9.04),
    spawn = vector4(-1600.14, -909.27, 9.12, 57.16),
    distance = 15,
    gang = {"leslopezz"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned", --"personal",
  },
  ['Cité Roubaix'] = {
    coords = vector3(1368.37, 6580.98, 17.27),
    spawn = vector4(1372.15, 6580.49, 17.14, 248.97),
    distance = 15,
    gang = {"roubaix"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned", --"personal",
  },
  ['Cité Evry'] = {
    coords = vector3(2037.14, 3384.31, 45.27),
    spawn = vector4(2036.61, 3386.92, 45.09, 289.68),
    distance = 15,
    gang = {"evry"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 369,
      color = 0,
      scale = 0.5
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned", --"personal",
  }
}

-- Impound
Config.ImpoundCommand = "fourriere"
Config.ImpoundFeesSocietyFund = {"police_nationale", "gendarmerie_nationale", "midas", "norauto" } -- Job name of society fund to pay impound fees into (optional)
Config.ImpoundShowBlips = true
Config.ImpoundUniqueBlips = false
Config.ImpoundTimeOptions = {0, 1, 4, 12, 24, 72, 168} -- in hours
Config.ImpoundLocations = { -- IMPORTANT - Every impound name must be unique
  ["Fouriére A"] = {
    coords = vector3(410.8, -1626.26, 29.29),
    spawn = vector4(408.44, -1630.88, 29.29, 136.88),
    distance = 15,
    type = "car",
    job = {"police_nationale", "gendarmerie_nationale", "midas", "norauto" },
    hideBlip = false,
    blip = {
      id = 317,
      color = 17,
      scale = 0.7
    },
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Fouriére B"] = {
    coords = vector3(1649.71, 3789.61, 34.79),
    spawn = vector4(1643.66, 3798.36, 34.49, 216.16),
    distance = 15,
    type = "car",
    job = {"police_nationale", "gendarmerie_nationale", "midas", "norauto" },
    hideBlip = false,
    blip = {
      id = 317,
      color = 17,
      scale = 0.7
    },
    hideMarkers = false,
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

Config.AutoRunSQL = true
Config.ReturnToPreviousRoutingBucket = false
Config.HideWatermark = false
Config.__v3Config = true
Config.Debug = false