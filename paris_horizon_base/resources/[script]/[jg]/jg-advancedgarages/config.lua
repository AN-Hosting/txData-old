Config = {}

-- 3D Text Overlays
-- You can find a key binding control index here: https://docs.fivem.net/docs/game-references/controls/
-- The script is using control type 0 (PLAYER_CONTROL)
Config.OpenGarageKeyBind = 38
Config.OpenGaragePrompt = "Parking"
Config.OpenImpoundKeyBind = 38
Config.OpenImpoundPrompt = "Fourriére"
Config.InsertVehicleKeyBind = 38
Config.InsertVehiclePrompt = "Rentrer le Véhicules"

-- General Config
Config.CurrencySymbol = "€"
Config.SaveVehicleDamage = true -- Setting this to false will restore the vehicles body and engine damage when putting it in a garage

-- Garages Config
Config.EnableTransfers = {
  betweenGarages = true,
  betweenPlayers = true
}
Config.GarageVehicleReturnCost = 550
Config.GarageVehicleTransferCost = 550
Config.GarageShowBlips = true
Config.GarageBlipId = 369
Config.GarageBlipColour = 0
Config.GarageBlipScale = 0.5
Config.GarageUniqueBlips = false
Config.GarageLocations = { -- IMPORTANT - Every garage name must be unique
  ['Parking Marina'] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(-692.94, -1403.42, 5.0),
    spawn = vector4(-692.94, -1403.42, 5.0, 137.49),
    distance = 8,
    type = "car"
  },
  ['Parking Paleto'] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(-193.90, 6234.12, 31.50),
    spawn = vector4(-197.60, 6228.70, 30.89, 225.92),
    distance = 8,
    type = "car"
  },
  ['Parking Prison'] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(1855.17, 2588.5, 45.67),
    spawn = vector4(1855.24, 2595.26, 45.67, 168.96),
    distance = 8,
    type = "car"
  },
  ['Parking Cergy'] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(161.36, 6592.54, 32.0),
    spawn = vector4(155.61, 6593.92, 31.84, 178.49),
    distance = 8,
    type = "car"
  },
  ['Parking Casino'] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(887.64, -68.39, 78.76),
    spawn = vector4(887.63, -63.55, 78.76, 237.09),
    distance = 8,
    type = "car"
  },
  ['Parking Plage'] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(-2033.49, -463.25, 11.42),
    spawn = vector4(-2036.7, -460.26, 11.42, 137.65),
    distance = 8,
    type = "car"
  },
  ['Parking N104'] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(633.95, 2722.71, 41.89),
    spawn = vector4(629.95, 2723.7, 41.84, 3.96),
    distance = 8,
    type = "car"
  },
  ['Parking Aeroport'] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
  coords = vector3(-832.16, -2351.32, 14.57),
  spawn = vector4(-829.8, -2356.59, 14.57, 330.19),
  distance = 8,
  type = "car"
},
  -- ['Islington South'] = {
  --   coords = vector3(273.0, -343.85, 44.91),
  --   spawn = vector4(270.75, -340.51, 44.92, 342.03),
  --   distance = 15,
  --   type = "car"
  -- },
  -- ['Grove Street'] = {
  --   coords = vector3(14.66, -1728.52, 29.3),
  --   spawn = vector4(23.93, -1722.9, 29.3, 310.58),
  --   distance = 15,
  --   type = "car"
  -- },
  -- ['Mirror Park'] = {
  --   coords = vector3(1032.84, -765.1, 58.18),
  --   spawn = vector4(1023.2, -764.27, 57.96, 319.66),
  --   distance = 15,
  --   type = "car"
  -- },
  -- ['Beach'] = {
  --   coords = vector3(-1248.69, -1425.71, 4.32),
  --   spawn = vector4(-1244.27, -1422.08, 4.32, 37.12),
  --   distance = 15,
  --   type = "car"
  -- },
  -- ['Great Ocean Highway'] = {
  --   coords = vector3(-2961.58, 375.93, 15.02),
  --   spawn = vector4(-2964.96, 372.07, 14.78, 86.07),
  --   distance = 15,
  --   type = "car"
  -- },
  -- ['Sandy South'] = {
  --   coords = vector3(217.33, 2605.65, 46.04),
  --   spawn = vector4(216.94, 2608.44, 46.33, 14.07),
  --   distance = 15,
  --   type = "car"
  -- },
  -- ['Sandy North'] = {
  --   coords = vector3(1878.44, 3760.1, 32.94),
  --   spawn = vector4(1880.14, 3757.73, 32.93, 215.54),
  --   distance = 15,
  --   type = "car"
  -- },
  -- ['North Vinewood Blvd'] = {
  --   coords = vector3(365.21, 295.65, 103.46),
  --   spawn = vector4(364.84, 289.73, 103.42, 164.23),
  --   distance = 15,
  --   type = "car"
  -- },
  -- ['Grapeseed'] = {
  --   coords = vector3(1713.06, 4745.32, 41.96),
  --   spawn = vector4(1710.64, 4746.94, 41.95, 90.11),
  --   distance = 15,
  --   type = "car"
  -- },
  -- ['Paleto Bay'] = {
  --   coords = vector3(107.32, 6611.77, 31.98),
  --   spawn = vector4(110.84, 6607.82, 31.86, 265.28),
  --   distance = 15,
  --   type = "car"
  -- },
  ['Boats'] = {
    coords = vector3(-795.15, -1510.79, 1.6),
    spawn = vector4(-798.66, -1507.73, -0.47, 102.23),
    distance = 20,
    type = "sea"
  },
  ['Hangar'] = {
    coords = vector3(-1243.49, -3391.88, 13.94),
    spawn = vector4(-1258.4, -3394.56, 13.94, 328.23),
    distance = 20,
    type = "air"
  }
}

-- Private Garages
Config.PrivGarageCreateCommand = "createprivategarage"
Config.PrivGarageCreateJobRestriction = {"realestates"}

-- Job Garages
Config.JobGarageShowBlips = false
Config.JobGarageBlipId = 357
Config.JobGarageBlipColour = 0
Config.JobGarageBlipScale = 0.6
Config.JobGarageSetVehicleCommand = "setjobvehicle" -- admin only
Config.JobGarageRemoveVehicleCommand = "removejobvehicle" -- admin only
Config.JobGarageUniqueBlips = false
Config.JobGarageLocations = { -- IMPORTANT - Every garage name must be unique
  ['Tabac'] = {
    coords = vector3(-500.66, -44.25, 44.51),
    spawn = vector4(-524.65, -36.94, 44.52, 358.96),
    distance = 5,
    job = "tabac",
    type = "car"
  },
  ['Concessionnaire Cergy'] = {
    coords = vector3(-92.72, 6506.94, 31.55),
    spawn = vector4(-100.11, 6503.45, 31.52, 316.34),
    distance = 5,
    job = "concessionnaire",
    type = "car"
  },
  ['Burger King'] = {
    coords = vector3(44.97, -805.04, 31.5),
    spawn = vector4(37.59, -840.42, 30.9, 160.05),
    distance = 5,
    job = "burgerking",
    type = "car"
  },
  ['O Tacos'] = {
    coords = vector3(96.43, -1416.94, 29.42),
    spawn = vector4(109.08, -1401.75, 29.28, 135.87),
    distance = 5,
    job = "otacos",
    type = "car"
  },
  ['Brinks'] = {
    coords = vector3(-292.3, 6125.61, 31.82),
    spawn = vector4(-309.0, 6107.94, 31.83, 291.87),
    distance = 5,
    job = "brinks",
    type = "car"
  },
  ['KFC'] = {
    coords = vector3(-1177.31, -900.57, 13.64),
    spawn = vector4(-1177.31, -900.57, 13.64, 299.75),
    distance = 5,
    job = "kfc",
    type = "car"
  },
  ['Midas'] = {
    coords = vector3(-974.25, -2077.17, 9.47),
    spawn = vector4(-982.82, -2056.39, 9.41, 225.21),
    distance = 5,
    job = "midas",
    type = "car"
  },
  ['Norauto'] = {
    coords = vector3(870.56, -892.75, 25.88),
    spawn = vector4(870.56, -892.75, 25.88, 108.99),
    distance = 5,
    job = "norauto",
    type = "car"
  },
  ['Taxi'] = {
    coords = vector3(98.18, -217.64, 54.49),
    spawn = vector4(98.18, -217.64, 54.49, 75.61),
    distance = 5,
    job = "taxi",
    type = "car"
  },
  ['Orpi'] = {
    coords = vector3(-277.9, -904.77, 31.08),
    spawn = vector4(-277.9, -904.77, 31.08, 68.22),
    distance = 5,
    job = "orpi",
    type = "car"
  },
  ['Samu 75'] = {
    coords = vector3(-1842.64, -320.32, 49.14),
    spawn = vector4(-1842.64, -320.32, 49.14, 35.35),
    distance = 5,
    job = "samu_75",
    type = "car"
  },
  ['Mairie'] = {
    coords = vector(-553.59, -645.14, 33.23),
    spawn = vector4(-553.59, -645.14, 33.23, 221.42),
    distance = 5,
    job = "mairie",
    type = "car"
  },
  ['Police Nationale'] = {
    coords = vector3(394.97, -1624.71, 29.29),
    spawn = vector4(394.97, -1624.71, 29.29, 336.84),
    distance = 5,
    job = "police_nationale",
    type = "car"
  },
  ['Gendarmerie Nationale'] = {
    coords = vector3(2541.77, -395.17, 92.99),
    spawn = vector4(2541.77, -395.17, 92.99, 190.69),
    distance = 5,
    job = "gendarmerie_nationale",
    type = "car"
  },
  ['Pompier de Paris'] = {
    coords = vector3(-242.72, -1313.89, 31.3),
    spawn = vector4(-242.72, -1313.89, 31.3, 180.88),
    distance = 5,
    job = "pompiers_de_paris",
    type = "car"
  },
  ['Vinci'] = {
    coords = vector3(2721.09, 3479.78, 56.32),
    spawn = vector4(2721.09, 3479.78, 56.32, 252.84),
    distance = 5,
    job = "vinci",
    type = "car"
  },
  ['Taxi'] = {
    coords = vector3(885.24, -149.31, 69.38),
    spawn = vector4(885.24, -149.31, 69.38, 146.62),
    distance = 5,
    job = "taxi",
    type = "car"
  },
  ['Pizza'] = {
    coords = vector3(1708.46, 3775.04, 34.51),
    spawn = vector4(1708.46, 3775.04, 34.51, 213.89),
    distance = 5,
    job = "pizza",
    type = "car"
  },
  ['Avocats de Paris'] = {
    coords = vector3(1746.72, 3611.7, 35.0),
    spawn = vector4(1746.72, 3611.7, 35.0, 307.47),
    distance = 5,
    job = "avocats_de_paris",
    type = "car"
  },
  ['Vigneron'] = {
    coords = vector3(-1895.66, 2034.89, 140.74),
    spawn = vector4(-1895.66, 2034.89, 140.74, 155.65),
    distance = 5,
    job = "vigneron",
    type = "car"
  },
  ['Dir'] = {
    coords = vector3(-1773.7, -755.9, 10.83),
    spawn = vector4(-1773.7, -755.9, 10.83, 324.01),
    distance = 5,
    job = "dir",
    type = "car"
  },
  ['XPO Logistics'] = {
    coords = vector3(1233.98, -3227.34, 5.9),
    spawn = vector4(1233.98, -3227.34, 5.9, 5.54),
    distance = 5,
    job = "xpo",
    type = "car"
  },
  ['TF1'] = {
    coords = vector3(-1100.16, -260.56, 37.68),
    spawn = vector4(-1100.16, -260.56, 37.68, 195.17),
    distance = 5,
    job = "tf1",
    type = "car"
  },
  ['Pompier de Paris'] = {
    coords = vector3(1205.94, -1497.04, 34.1),
    spawn = vector4(1205.94, -1497.04, 34.1, 176.87),
    distance = 5,
    job = "pompiers_de_paris",
    type = "car"
  }
}

-- Gang Garages
Config.GangGarageShowBlips = false
Config.GangGarageBlipId = 357
Config.GangGarageBlipColour = 0
Config.GangGarageBlipScale = 0.6
Config.GangGarageSetVehicleCommand = "setgangvehicle" -- admin only
Config.GangGarageRemoveVehicleCommand = "removegangvehicle" -- admin only
Config.GangGarageUniqueBlips = false
Config.GangGarageLocations = { -- IMPORTANT - Every garage name must be unique
  ['Cité Barbes'] = {
    coords = vector3(-215.75, -1555.13, 34.14),
    spawn = vector4(-215.75, -1555.13, 34.14, 323.46),
    distance = 15,
    gang = "barbes",
    type = "car"
  },
  ['Cité Belleville'] = {
    coords = vector3(1189.81, -2251.54, 45.34),
    spawn = vector4(1189.81, -2251.54, 45.34, 240.55),
    distance = 15,
    gang = "belleville",
    type = "car"
  },
  ['Cité Felix Pyat'] = {
    coords = vector3(846.4, 789.06, 188.01),
    spawn = vector4(846.4, 789.06, 188.01, 359.94),
    distance = 15,
    gang = "felixpyat",
    type = "car"
  },
  ['Les Lopezz'] = {
    coords = vector3(-1600.14, -909.27, 9.12),
    spawn = vector4(-1600.14, -909.27, 9.12, 57.16),
    distance = 15,
    gang = "leslopezz",
    type = "car"
  },
  ['Cité Roubaix'] = {
    coords = vector3(1372.15, 6580.49, 17.14),
    spawn = vector4(1372.15, 6580.49, 17.14, 248.97),
    distance = 15,
    gang = "roubaix",
    type = "car"
  },
  ['Cité Evry'] = {
    coords = vector3(2036.61, 3386.92, 45.09),
    spawn = vector4(2036.61, 3386.92, 45.09, 289.68),
    distance = 15,
    gang = "evry",
    type = "car"
  }

}

-- Impound
Config.ImpoundCommand = "fourriere"
Config.ImpoundJobRestriction = {"leo"}
Config.ImpoundShowBlips = true
Config.ImpoundBlipId = 317
Config.ImpoundBlipColour = 17
Config.ImpoundBlipScale = 0.7
Config.ImpoundUniqueBlips = false
Config.ImpoundLocations = { -- IMPORTANT - Every impound name must be unique
  ['Impound A'] = {
    coords = vector3(410.8, -1626.26, 29.29),
    spawn = vector4(408.44, -1630.88, 29.29, 136.88),
    distance = 15
  },
  ['Impound B'] = {
    coords = vector3(1649.71, 3789.61, 34.79),
    spawn = vector4(1643.66, 3798.36, 34.49, 216.16),
    distance = 15
  }
}

-- Staff Commands
Config.ChangeVehiclePlate = "vplate" -- admin only
Config.DeleteVehicleFromDB = "dvdb" -- admin only
