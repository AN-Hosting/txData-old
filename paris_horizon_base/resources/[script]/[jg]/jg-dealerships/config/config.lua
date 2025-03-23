-----------------------------------------------------------------------------------
-- WAIT! Before editing this file manually, try our new easy configuration tool! --
--               https://configurator.jgscripts.com/dealerships                  --
-----------------------------------------------------------------------------------
Config = {}

-- Localisation
Config.Locale = "fr"
Config.NumberAndDateFormat = "fr-FR"
Config.Currency = "EUR"
Config.SpeedUnit = "kph" -- or "kph"

-- Framework & Integrations
Config.Framework = "auto" -- or "QBCore", "Qbox", "ESX"
Config.FuelSystem = "LegacyFuel" -- or "LegacyFuel", "ps-fuel", "lj-fuel", "ox_fuel", "cdn-fuel", "hyon_gas_station", "okokGasStation", "nd_fuel", "myFuel", "ti_fuel", "Renewed-Fuel", "rcore_fuel", "qs-fuelstations", "none"
Config.VehicleKeys = "sna-vehiclekeys" -- or "qb-vehiclekeys", "MrNewbVehicleKeys", "jaksam-vehicles-keys", "qs-vehiclekeys", "mk_vehiclekeys", "wasabi_carlock", "cd_garage", "okokGarage", "t1ger_keys", "Renewed", "tgiann-hotwire", "none"
Config.Notifications = "ox_lib" -- or "default", "okokNotify", "ox_lib", "ps-ui"
Config.DrawText = "ox_lib" -- or "jg-textui", "qb-DrawText", "okokTextUI", "ox_lib", "ps-ui"

-- Text UI prompts
Config.OpenShowroomPrompt = "[E] Open Showroom"
Config.OpenShowroomKeyBind = 38
Config.ViewInShowroomPrompt = "[E] View in Showroom"
Config.ViewInShowroomKeyBind = 38
Config.OpenManagementPrompt = "[E] Dealership Management"
Config.OpenManagementKeyBind = 38
Config.SellVehiclePrompt = "[E] Sell Vehicle"
Config.SellVehicleKeyBind = 38

-- If you don't know what this means, don't touch this
-- If you know what this means, I do recommend enabling it but be aware you may experience reliability issues on more populated servers
-- Having significant issues? I beg you to just set it back to false before opening a ticket with us
-- Want to read my rant about server spawned vehicles? https://docs.jgscripts.com/advanced-garages/misc/why-are-you-not-using-createvehicleserversetter-by-default
Config.SpawnVehiclesWithServerSetter = false

-- Finance (to disable finance, you have to do it on a per-location basis with Config.DealershipLocations below)
Config.FinancePayments = 12
Config.FinanceDownPayment = 0.1 -- 0.1 means 10%
Config.FinanceInterest = 0.1 -- 0.1 means 10%
Config.FinancePaymentInterval = 12 -- in hours
Config.FinancePaymentFailedHoursUntilRepo = 1 -- in hours
Config.MaxFinancedVehiclesPerPlayer = 5

-- Little vehicle preview images in the garage UI - learn more/add custom images: https://docs.jgscripts.com/advanced-garages/vehicle-images
Config.ShowVehicleImages = true

-- Vehicle purchases
Config.PlateFormat = "1AA111AA" -- https://docs.jgscripts.com/dealerships/plate-format
Config.HideVehicleStats = false

-- Test drives
Config.TestDrivePlate = "TEST1111" -- This is a plate seed so it'll be random every time (read: https://docs.jgscripts.com/dealerships/plate-format)
Config.TestDriveTimeSeconds = 120
Config.TestDriveNotInBucket = false -- Set to true for everyone to see the test driven vehicle (player is instanced by default)

-- Display vehicles (showroom)
Config.DisplayVehiclesPlate = "DEALER"
Config.DisplayVehiclesHidePurchasePrompt = false

-- Dealership stock purchases
Config.DealerPurchasePrice = 0.8 -- 0.8 = Dealers pay 80% of vehicle price
Config.VehicleOrderTime = 1 -- in mins
Config.ManagerCanChangePriceOfVehicles = true -- Managers can change the price of vehicles in the dealership

-- Vehicle colour options (for purchases & display vehicles)
Config.UseRGBColors = true -- this will use the index instead of hex, see https://pastebin.com/pwHci0xK (hex will still be used in the ui)
Config.VehicleColourOptions = {
  {label = "Red", hex = "#e81416", index = 27},
  {label = "Orange", hex = "#ff7518", index = 38},
  {label = "Yellow", hex = "#ffbf00", index = 88},
  {label = "Green", hex = "#79c314", index = 92},
  {label = "Blue", hex = "#487de7", index = 64},
  {label = "Purple", hex = "#70369d", index = 145},
  {label = "Black", hex = "#000000", index = 0},
  {label = "White", hex = "#ffffff", index = 111},
}

Config.Categories = {
  planes = "Planes",
  sportsclassics = "Sports Classics",
  sedans = "Sedans",
  compacts = "Compacts",
  motorcycles = "Motorcycles",
  super = "Super",
  offroad = "Offroad",
  helicopters = "Helicopters",
  coupes = "Coupes",
  muscle = "Muscle",
  boats = "Boats",
  vans = "Vans",
  sports = "Sports",
  suvs = "SUVs",
  commercial = "Commercial",
  cycles = "Cycles",
  industrial = "Industrial",
  aston = "aston", 
  audi = "audi", 
  bentley = "bentley", 
  bmw = "bmw", 
  bugatti = "bugatti", 
  cadillac = "cadillac", 
  citroen = "citroen", 
  chevrolet = "chevrolet", 
  dacia = "dacia", 
  dodge = "dodge", 
  ferrari = "ferrari", 
  ford = "ford", 
  honda = "honda", 
  italdesign = "italdesign", 
  jaguar = "jaguar", 
  jeep = "jeep", 
  koenigsegg = "koenigsegg", 
  lamborghini = "lamborghini", 
  lexus = "lexus", 
  lotus = "lotus", 
  mazda = "mazda", 
  mclaren = "mclaren", 
  mercedes = "mercedes", 
  mitsubishi = "mitsubishi", 
  nissan = "nissan", 
  peugeot = "peugeot", 
  porsche = "porsche", 
  quartz = "quartz", 
  rangerover = "rangerover", 
  renault = "renault", 
  rollsroyce = "rollsroyce", 
  subaru = "subaru", 
  suzuki = "suzuki", 
  tesla = "tesla", 
  toyota = "toyota", 
  volkswagen = "volkswagen", 
  volvo = "volvo", 
  wmotors = "wmotors",
  moto = "Moto / Scooter",
  remorque = "Remorque"
}

Config.DealershipLocations = {
  -- ["paris"] = {
  --   type = "owned", -- or "owned", "self-service"
  --   openShowroom = {
  --     coords = vector3(-190.56, -1162.56, 22.94),
  --     size = 3
  --   },
  --   openManagement = {
  --     coords = vector3(-199.88, -1171.61, 23.76),
  --     size = 3
  --   },
  --   sellVehicle = {
  --     coords = vector3(-199.88, -1171.61, 23.76),
  --     size = 1
  --   },
  --   purchaseSpawn = vector4(-177.08, -1170.97, 22.35, 179.74),
  --   testDriveSpawn = vector4(-2719.11, 3267.43, 32.22, 238.03),
  --   camera = {
  --     name = "Car",
  --     coords = vector4(-146.6166, -596.6301, 166.0, 270.0),
  --     positions = {5.0, 8.0, 12.0, 8.0}
  --   },
  --   categories = {"aston", "audi", "bentley", "bmw", "bugatti", "cadillac", "citroen", "chevrolet", "dacia", "dodge", "ferrari", "ford", "honda", "italdesign", "jaguar", "jeep", "koenigsegg", "lamborghini", "lexus", "lotus", "mazda", "mclaren", "mercedes", "mitsubishi", "nissan", "peugeot", "porsche", "quartz", "rangerover", "renault", "rollsroyce", "subaru", "suzuki", "tesla", "toyota", "volkswagen", "volvo", "wmotors" },
  --   enableTestDrive = true,
  --   hideBlip = false,
  --   blip = {
  --     id = 326,
  --     color = 0,
  --     scale = 1.0
  --   },
  --   enableSellVehicle = false, -- Allow players to sell vehicles back to dealer
  --   sellVehiclePercent = 0.6,  -- 60% of current sale price
  --   enableFinance = false,
  --   hideMarkers = true,
  --   markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  --   showroomJobWhitelist = {},
  --   showroomGangWhitelist = {},
  --   societyPurchaseJobWhitelist = {},
  --   societyPurchaseGangWhitelist = {},
  --   disableShowroomPurchase = true,
  --   job = "concessionnaire", -- Owned dealerships only
  --   directSaleDistance = 50,
  --   paymentOptions = {"cash", "bank"},
  -- },
  -- ["evry"] = {
  --     type = "owned", -- or "owned", "self-service"
  --     openShowroom = {
  --       coords = vector3(1115.34, 2628.69, 39.38),
  --       size = 3
  --     },
  --     openManagement = {
  --       coords = vector3(1156.44, 2635.07, 41.76),
  --       size = 3
  --     },
  --     sellVehicle = {
  --       coords = vector3(-199.88, -1171.61, 23.76),
  --       size = 1
  --     },
  --     purchaseSpawn = vector4(1123.04, 2641.99, 38.36, 89.26),
  --     testDriveSpawn = vector4(-2719.11, 3267.43, 32.22, 238.03),
  --     camera = {
  --       name = "Car",
  --       coords = vector4(-146.6166, -596.6301, 166.0, 270.0),
  --       positions = {5.0, 8.0, 12.0, 8.0}
  --     },
  --     categories = {"aston", "audi", "bentley", "bmw", "bugatti", "cadillac", "citroen", "chevrolet", "dacia", "dodge", "ferrari", "ford", "honda", "italdesign", "jaguar", "jeep", "koenigsegg", "lamborghini", "lexus", "lotus", "mazda", "mclaren", "mercedes", "mitsubishi", "nissan", "peugeot", "porsche", "quartz", "rangerover", "renault", "rollsroyce", "subaru", "suzuki", "tesla", "toyota", "volkswagen", "volvo", "wmotors" },
  --     enableTestDrive = true,
  --     hideBlip = false,
  --     blip = {
  --       id = 326,
  --       color = 0,
  --       scale = 1.0
  --     },
  --     enableSellVehicle = false, -- Allow players to sell vehicles back to dealer
  --     sellVehiclePercent = 0.6,  -- 60% of current sale price
  --     enableFinance = true,
  --     hideMarkers = true,
  --     markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  --     showroomJobWhitelist = {},
  --     showroomGangWhitelist = {},
  --     societyPurchaseJobWhitelist = {},
  --     societyPurchaseGangWhitelist = {},
  --     disableShowroomPurchase = true,
  --     job = "concessionnaire", -- Owned dealerships only
  --     directSaleDistance = 50,
  --     paymentOptions = {"cash", "bank"},
  --   },
    ["cergy"] = {
      type = "owned", -- or "owned", "self-service"
      openShowroom = {
        coords = vector3(1121.57, 2627.2, 39.38),
        size = 3
      },
      openManagement = {
        coords = vector3(1156.66, 2635.11, 41.76),
        size = 3
      },
      sellVehicle = {
        coords = vector3(1155.41, 2632.19, 41.76),
        size = 1
      },
      purchaseSpawn = vector4(1125.65, 2641.93, 38.95, 85.56),
      testDriveSpawn = vector4(-2719.11, 3267.43, 32.22, 238.03),
      camera = {
        name = "Car",
        coords = vector4(-146.6166, -596.6301, 166.0, 270.0),
        positions = {5.0, 8.0, 12.0, 8.0}
      },
      categories = {"aston", "remorque", "audi", "bentley", "bmw", "bugatti", "cadillac", "citroen", "chevrolet", "dacia", "dodge", "ferrari", "ford", "honda", "italdesign", "jaguar", "jeep", "koenigsegg", "lamborghini", "lexus", "lotus", "mazda", "mclaren", "mercedes", "mitsubishi", "nissan", "peugeot", "porsche", "quartz", "rangerover", "renault", "rollsroyce", "subaru", "suzuki", "tesla", "toyota", "volkswagen", "volvo", "wmotors", "moto" },
      enableTestDrive = true,
      hideBlip = false,
      blip = {
        id = 326,
        color = 0,
        scale = 0.8
      },
      enableSellVehicle = false, -- Allow players to sell vehicles back to dealer
      sellVehiclePercent = 0.6,  -- 60% of current sale price
      enableFinance = true,
      hideMarkers = true,
      markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
      showroomJobWhitelist = {},
      showroomGangWhitelist = {},
      societyPurchaseJobWhitelist = {},
      societyPurchaseGangWhitelist = {},
      disableShowroomPurchase = true,
      job = "concessionnaire", -- Owned dealerships only
      directSaleDistance = 50,
      paymentOptions = {"cash", "bank"},
    },
  -- ["luxury"] = {
  --   type = "self-service", -- or "owned", "self-service"
  --   openShowroom = {
  --     coords = vector3(-1257.4, -369.12, 36.98),
  --     size = 5
  --   },
  --   openManagement = {
  --     coords = vector3(-1249.04, -346.96, 37.34),
  --     size = 5
  --   },
  --   sellVehicle = {
  --     coords = vector3(-1233.46, -346.81, 37.33),
  --     size = 5
  --   },
  --   purchaseSpawn = vector4(-1233.46, -346.81, 37.33, 23.36),
  --   testDriveSpawn = vector4(-1233.46, -346.81, 37.33, 23.36),
  --   camera = {
  --     name = "Car",
  --     coords = vector4(-146.6166, -596.6301, 166.0, 270.0),
  --     positions = {5.0, 8.0, 12.0, 8.0}
  --   },
  --   categories = {"super", "sports"},
  --   enableSellVehicle = true, -- Allow players to sell vehicles back to dealer
  --   sellVehiclePercent = 0.6,  -- 60% of current sale price
  --   enableTestDrive = true,
  --   enableFinance = true,
  --   hideBlip = false,
  --   blip = {
  --     id = 523,
  --     color = 2,
  --     scale = 0.6
  --   },
  --   hideMarkers = false,
  --   markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  --   showroomJobWhitelist = {},
  --   showroomGangWhitelist = {},
  --   societyPurchaseJobWhitelist = {},
  --   societyPurchaseGangWhitelist = {},
  -- },
  -- ["boats"] = {
  --   type = "self-service", -- or "owned", "self-service"
  --   openShowroom = {
  --     coords = vector3(-739.55, -1333.75, 1.6),
  --     size = 5
  --   },
  --   openManagement = {
  --     coords = vector3(-731.37, -1310.35, 5.0),
  --     size = 5
  --   },
  --   sellVehicle = {
  --     coords = vector3(-714.42, -1340.01, -0.18),
  --     size = 5
  --   },
  --   purchaseSpawn = vector4(-714.42, -1340.01, -0.18, 139.38),
  --   testDriveSpawn = vector4(-714.42, -1340.01, -0.18, 139.38),
  --   camera = {
  --     name = "Sea",
  --     coords = vector4(-808.28, -1491.19, -0.47, 113.53),
  --     positions = {7.5, 12.0, 15.0, 12.0}
  --   },
  --   categories = {"boats"},
  --   enableSellVehicle = true, -- Allow players to sell vehicles back to dealer
  --   sellVehiclePercent = 0.6,  -- 60% of current sale price
  --   enableTestDrive = false,
  --   hideBlip = false,
  --   blip = {
  --     id = 410,
  --     color = 2,
  --     scale = 0.6
  --   },
  --   hideMarkers = false,
  --   markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  --   showroomJobWhitelist = {},
  --   showroomGangWhitelist = {},
  --   societyPurchaseJobWhitelist = {},
  --   societyPurchaseGangWhitelist = {},
  -- },
  -- ["air"] = {
  --   type = "self-service", -- or "owned", "self-service"
  --   openShowroom = {
  --     coords = vector3(-1623.0, -3151.56, 13.99),
  --     size = 5
  --   },
  --   openManagement = {
  --     coords = vector3(-1637.78, -3177.94, 13.99),
  --     size = 5
  --   },
  --   sellVehicle = {
  --     coords = vector3(-1654.9, -3147.58, 13.99),
  --     size = 5
  --   },
  --   purchaseSpawn = vector4(-1654.9, -3147.58, 13.99, 324.78),
  --   testDriveSpawn = vector4(-1654.9, -3147.58, 13.99, 324.78),
  --   camera = {
  --     name = "Air",
  --     coords = vector4(-1267.0, -3013.14, -48.5, 310.96),
  --     positions = {12.0, 15.0, 20.0, 15.0}
  --   },
  --   categories = {"planes", "helicopters"},
  --   enableSellVehicle = true, -- Allow players to sell vehicles back to dealer
  --   sellVehiclePercent = 0.6,  -- 60% of current sale price
  --   enableTestDrive = false,
  --   hideBlip = false,
  --   blip = {
  --     id = 423,
  --     color = 2,
  --     scale = 0.6
  --   },
  --   hideMarkers = false,
  --   markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  --   showroomJobWhitelist = {},
  --   showroomGangWhitelist = {},
  --   societyPurchaseJobWhitelist = {},
  --   societyPurchaseGangWhitelist = {},
  -- },
  -- ["truck"] = {
  --   type = "self-service", -- or "owned", "self-service"
  --   openShowroom = {
  --     coords = vector3(1214.37, -3204.53, 6.03),
  --     size = 5
  --   },
  --   openManagement = {
  --     coords = vector3(1184.45, -3179.27, 7.1),
  --     size = 5
  --   },
  --   sellVehicle = {
  --     coords = vector3(1196.75, -3205.31, 6.0),
  --     size = 5
  --   },
  --   purchaseSpawn = vector4(1196.75, -3205.31, 6.0, 91.12),
  --   testDriveSpawn = vector4(1196.75, -3205.31, 6.0, 91.12),
  --   camera = {
  --     name = "Truck",
  --     coords = vector4(-1267.0, -3013.14, -48.5, 310.96),
  --     positions = {7.5, 12.0, 15.0, 12.0}
  --   },
  --   categories = {"vans", "commercial", "industrial"},
  --   enableSellVehicle = true, -- Allow players to sell vehicles back to dealer
  --   sellVehiclePercent = 0.6,  -- 60% of current sale price
  --   enableTestDrive = true,
  --   enableFinance = true,
  --   hideBlip = false,
  --   blip = {
  --     id = 477,
  --     color = 2,
  --     scale = 0.6
  --   },
  --   hideMarkers = false,
  --   markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  --   showroomJobWhitelist = {},
  --   showroomGangWhitelist = {},
  --   societyPurchaseJobWhitelist = {},
  --   societyPurchaseGangWhitelist = {},
  -- },
}

-- Commands
Config.MyFinanceCommand = "myfinance"
Config.DirectSaleCommand = "directsale"
Config.DealerAdminCommand = "dealeradmin"

-- Nerd options
Config.RemoveGeneratorsAroundDealership = 60.0
Config.AutoRunSQL = true
Config.ReturnToPreviousRoutingBucket = false
Config.HideWatermark = false
Config.Debug = false