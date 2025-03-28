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
Config.Framework = "QBCore" -- or "QBCore", "Qbox", "ESX"
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
Config.MaxFinancedVehiclesPerPlayer = 2

-- Little vehicle preview images in the garage UI - learn more/add custom images: https://docs.jgscripts.com/advanced-garages/vehicle-images
Config.ShowVehicleImages = false

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
Config.VehicleOrderTime = 5 -- in mins
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
  remorque = "Remorque",
  gendarmerie = "gendarmerie",
  pompier = "pompier",
  samu = "samu",
  dir = "dir",
  midas = "midas",
  auto_exotic = "auto_exotic",
  vinci = "vinci",
  tabac = "tabac",
  police_national = "police_national",
  raid = "raid",
  banaliser = "banaliser",
  chronopost = "chronopost",
  enedis = "enedis",
  concess = "concess",
  top_auto = "top_auto",
  job = "job",
  camion = "camion"
}

Config.DealershipLocations = {
  ["cergy"] = {
    type = "owned", -- or "owned", "self-service"
    openShowroom = {
      coords = vector3(1124.01, 2647.21, 38.96),
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
    purchaseSpawn = vector4(1103.34, 2642.1, 38.95, 88.47),
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
    hideMarkers = false,
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
  ["job"] = {
    type = "owned", -- or "owned", "self-service"
    openShowroom = {
      coords = vector3(1121.32, 2627.49, 39.38),
      size = 3
    },
    openManagement = {
      coords = vector3(1115.39, 2626.87, 39.38),
      size = 3
    },
    sellVehicle = {
      coords = vector3(1155.41, 2632.19, 41.76),
      size = 1
    },
    purchaseSpawn = vector4(1091.86, 2632.23, 38.89, 354.07),
    testDriveSpawn = vector4(-2719.11, 3267.43, 32.22, 238.03),
    camera = {
      name = "Car",
      coords = vector4(-146.6166, -596.6301, 166.0, 270.0),
      positions = {5.0, 8.0, 12.0, 8.0}
    },
    categories = {  "remorque", "gendarmerie", "pompier", "samu", "dir", "midas", "auto_exotic", "vinci", "tabac",
      "police_national", "raid", "banaliser", "chronopost", "enedis", "concess", "top_auto", "job", "camion"
    },
    enableTestDrive = true,
    hideBlip = true,
    blip = {
      id = 326,
      color = 0,
      scale = 0.8
    },
    enableSellVehicle = false, -- Allow players to sell vehicles back to dealer
    sellVehiclePercent = 0.6,  -- 60% of current sale price
    enableFinance = false,
    hideMarkers = false,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    showroomJobWhitelist = {},
    showroomGangWhitelist = {},
    societyPurchaseJobWhitelist = { maisonette10 = { 4, 5 }, police_nationale = { 4 }, tabac = { 4, 5 }, mairie = { 4, 5 }, gendarmerie_nationale = { 4, 5 }, 
      samu_75 = { 4 }, pompiers_de_paris = { 4 }, orpi = { 4, 5 }, taxi = { 4, 5 }, concessionnaire = { 4, 5 }, norauto = { 4, 5 }, midas = { 4, 5 }, 
      vinci = { 4, 5 }, otacos = { 4, 5 }, kfc = { 4, 5 }, pizza = { 4, 5 }, avocats_de_paris = { 4, 5 }, vigneron = { 4, 5 }, brinks = { 4, 5 }, 
      burgerking = { 4, 5 }, tf1 = { 4, 5 }, dir = { 4, 5 }, casino = { 4, 5 }, xpo = { 4, 5 }, cyberbar = { 4, 5 }, pawnshop = { 4, 5 }, 
    },
    societyPurchaseGangWhitelist = {},
    disableShowroomPurchase = true,
    job = "concessionnaire", -- Owned dealerships only
    directSaleDistance = 20,
    paymentOptions = {"societyFund"},
  },
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