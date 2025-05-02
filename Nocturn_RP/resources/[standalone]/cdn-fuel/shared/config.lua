Config = {}
Config.FuelDebug = false                -- Used for debugging, although there are not many areas in yet (Default: false) + Enables Setfuel Commands (0, 50, 100).
Config.PolyDebug = false                 -- Enables Polyzone Debugging to see PolyZones!
Config.ShowNearestGasStationOnly = true -- When enabled, only the nearest gas stations will be shown on the map.
Config.LeaveEngineRunning = true        -- When true, the vehicle's engine will be left running upon exit if the player *HOLDS* F.
Config.VehicleBlowUp = true             -- When true, there will be a configurable chance of the vehicle blowing up, if you fuel while the engine is on.
Config.BlowUpChance = 25                -- Percentage for Chance of Engine Explosion (Default: 5% or 5)
Config.CostMultiplier = 3               -- Amount to multiply 1 by. This indicates fuel price. (Default: $3.0/l or 3.0)
Config.GlobalTax = 21.0                 -- The tax, in %, that people will be charged at the pump. (Default: 15% or 15.0)
Config.FuelNozzleExplosion = true       -- When true, it enables the fuel pump exploding when players run away with the nozzle. Highly recommeded to be false.
Config.FuelDecor = "_FUEL_LEVEL"        -- Do not touch! (Default: "_FUEL_LEVEL")
Config.RefuelTime = 600                 -- Highly recommended to leave at 600. This value will be multiplied times the amount the player is fueling for the progress bar and cancellation logic! DON'T GO BELOW 250, performance WILL drop!
Config.FuelTargetExport = false         -- DO NOT USE WITH OX_TARGET! This is only used to fix this qb-target issue: https://github.com/CodineDev/cdn-fuel/issues/3. <br> <br> If you don't have this issue and haven't installed this exports in qb-target, then this should be false. Otherwise there will be an error.

Config.OwnersPickupFuel = false          -- If an owner buys fuel, they will have to go pick it up at a configured location.
Config.PossibleDeliveryTrucks = {
    "hauler",
    "phantom",
    "packer",
}
Config.DeliveryTruckSpawns = { -- https://i.imgur.com/VS22i8R.jpeg
    ['trailer'] = vector4(2767.11, 1468.25, 24.52, 165.11),
    ['truck'] = vector4(2765.30, 1456.92, 24.53, 165.45),
    ['PolyZone'] = {
        ['coords'] = {
            vector2(2772.26, 1471.97),
            vector2(2764.13, 1473.98),
            vector2(2756.77, 1448.27),
            vector2(2765.27, 1444.64),
        },
        ['minz'] = 20.0,
        ['maxz'] = 25.0,
    }
}



Config.EmergencyServicesDiscount = {
    ['enabled'] = false,                -- Enables Emergency Services Getting a discount based on the value below for Refueling & Electricity Charging Cost
    ['discount'] = 25,                  -- % Discount off of price.
    ['emergency_vehicles_only'] = true, -- Only allows discounts to be applied to Emergency Vehicles
    ['ondutyonly'] = true,              -- Discount only applies while on duty.
    ['job'] = {
        -- "police",
        -- "sasp",
        -- "trooper",
        -- "ambulance",
    }
}
Config.Core = 'qb-core'             -- Change this to your core resources (Ex: 'qbx-core' | 'qb-core'), must be qb based!
Config.Ox = {
    Inventory = false,              -- Uses OX_Inventory's metadata instead of QB-Inventory's.
    Menu = false,                   -- Uses OX Libraries instead of qb-menu.
    Input = false,                  -- Uses Ox Input Dialog instead of qb-input.
    DrawText = false,               -- Uses Ox DrawText instead of qb-core DrawText.
    Progress = false                -- Uses Ox ProgressBar instead of progressbar.
}
Config.TargetResource = "qb-target"                         -- Supported: { 'qb-target', 'ox_target'} -- Others must use the same format as QB-Target or manual configuration is required.
Config.PumpHose = true              -- If true, it creates a hose from the pump to the nozzle the client is holding, to give it a more realistic feel.
Config.RopeType = {                 -- Options: 1-2-3-4-5; 1: Khaki Color, Kind of Thick, 2: Very Thick Khaki Rope, 3: Very Thick Black Rope, 4: Very Thin Black Rope, 5: Same as 3
    ['fuel'] = 1,
    ['electric'] = 1,
}
Config.FaceTowardsVehicle = false                           -- Ped will turn towards the entity's boot bone for refueling, sometimes can result in incorrect nozzle placement when refueling.
Config.VehicleShutoffOnLowFuel = {                          -- If enabled, vehicles will turn off when the reach 0 fuel. This works well in conjuction with disallowing people to turn on a vehicle with 0 fuel.
    ['shutOffLevel'] = 0,                                   -- At this fuel level, the vehicle will shut off. Default: 0, Recommended: 0-5.
    ['sounds'] = {
        ['enabled'] = true,                                 -- Are Sounds Enabled when vehicle has no fuel?
        -- Find sound banks and sounds here: https://pastebin.com/A8Ny8AHZ.
        ['audio_bank'] = "DLC_PILOT_ENGINE_FAILURE_SOUNDS", -- Audio Bank of Sound.
        ['sound'] = "Landing_Tone",                         -- Sound Name in Audio Bank.
    }
}



-- Phone --
Config.RenewedPhonePayment = false -- Enables use of Renewed-Phone Payment System and Notifications

-- Syphoning --
Config.UseSyphoning = true                 -- Follow the Syphoning Install Guide to enable this option!
Config.SyphonDebug = false                  -- Used for Debugging the syphon portion!
Config.SyphonKitCap = 50                    -- Maximum amount (in L) the syphon kit can fit!
Config.SyphonPoliceCallChance = 25          -- Math.Random(1, 100) Default: 25%
Config.SyphonDispatchSystem = "ps-dispatch"                               -- Options: "ps-dispatch", "qb-dispatch", "qb-default" (just blips) or "custom" (Custom: you must configure yourself!)

--- Jerry Can -----
Config.UseJerryCan = true  -- Enable the Jerry Can functionality. Will only work if properly installed.
Config.JerryCanCap = 50    -- Maximum amount (in L) the jerrycan can fit! (Default: 50L)
Config.JerryCanPrice = 200 -- The price of a jerry can, not including tax.
Config.JerryCanGas = 25    -- The amount of Gas that the Jerry Can you purchase comes with. This should not be bigger that your Config.JerryCanCap!

-- Animations --
Config.StealAnimDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@'   -- Used for Syphoning
Config.StealAnim = 'machinic_loop_mechandplayer'                    -- Used for Syphoning
Config.JerryCanAnimDict = 'weapon@w_sp_jerrycan'                    -- Used for Syphoning & Jerry Can
Config.JerryCanAnim = 'fire'                                        -- Used for Syphoning & Jerry Can
Config.RefuelAnimation = "gar_ig_5_filling_can"                     -- This is for refueling and charging.
Config.RefuelAnimationDictionary = "timetable@gardener@filling_can" -- This is for refueling and charging.

--- Player Owned Gas (Gasoline) Ergonomic Refueling Stations (Poggers) ---
Config.PlayerOwnedGasStationsEnabled = false -- When true, peds will be located at all gas stations, and players will be able to talk with peds & purchase gas stations, having to manage fuel supplies.
Config.StationFuelSalePercentage = 0.65     -- % of sales that the station gets. If they sell 4 Liters of Gas for $16 (not including taxes), they will get 16*Config.StationFuelSalePercentage back from the sale. Treat this as tax, also, it balances the profit margins a bit.
Config.EmergencyShutOff = false             -- When true, players can walk up to the ped and shut off the pumps at a gas station. While false, this option is disabled, because it can obviously be an issue.
Config.UnlimitedFuel = false                -- When true, the fuel stations will not require refuelling by gas station owners, this is for the early stages of implementation.
Config.MaxFuelReserves = 10000              -- This is the maximum amount that the fuel station's reserves can hold.
Config.FuelReservesPrice = 2.0              -- This is the price of fuel reserves for gas station owners.
Config.GasStationSellPercentage = 50        -- This is the percentage that players will get of the gas stations price, when they sell a location!
Config.MinimumFuelPrice = 2                 -- This is the minimum value you want to let players set their fuel prices to.
Config.MaxFuelPrice = 8                     -- This is the maximum value you want to let players set their fuel prices to.
Config.PlayerControlledFuelPrices = true    -- This gives you the option to disable people being able to control fuel prices. When true, players can control the fuel prices via to management menu for the location.
Config.GasStationNameChanges = false        -- This gives you the option to disable people being able to change the name of their gas station, only recommended if it becomes a problem.
Config.NameChangeMinChar = 10               -- This is the minimum length that a Gas Station's name must be.
Config.NameChangeMaxChar = 25               -- This is the maximum length that a Gas Station's name must be.
Config.WaitTime = 400                       -- This is the wait time after callbacks, if you are having issues with menus not popping up, or being greyed out, up this to around ~300, it is not recommended to go over ~750, as menus will get slower and more unresponsive the higher you go. (Fixes this issue: https://www.shorturl.at/eqS19)
Config.OneStationPerPerson = true           -- This prevents players that already own one station from buying another, to prevent monopolies over Gas Stations.

--- Electric Vehicles
Config.ElectricVehicleCharging = true -- When true, electric vehicles will actually consume resources and decrease 'Fuel / Battery' while driving. This means players will have to recharge their vehicle!
Config.ElectricChargingPrice = 4      -- Per "KW". This value is multiplied times the amount of electricity someone put into their vehicle, to constitute the final cost of the charge. Players whom own the gas station will not recieve the money from electric charging.
Config.ElectricVehicles = {           -- List of Electric Vehicles in the Base Game.
    ["surge"] = {
        isElectric = true,
    },
    ["iwagen"] = {
        isElectric = true,
    },
    ["voltic"] = {
        isElectric = true,
    },
    ["voltic2"] = {
        isElectric = true,
    },
    ["raiden"] = {
        isElectric = true,
    },
    ["cyclone"] = {
        isElectric = true,
    },
    ["tezeract"] = {
        isElectric = true,
    },
    ["neon"] = {
        isElectric = true,
    },
    ["omnisegt"] = {
        isElectric = true,
    },
    ["caddy"] = {
        isElectric = true,
    },
    ["caddy2"] = {
        isElectric = true,
    },
    ["caddy3"] = {
        isElectric = true,
    },
    ["airtug"] = {
        isElectric = true,
    },
    ["rcbandito"] = {
        isElectric = true,
    },
    ["imorgon"] = {
        isElectric = true,
    },
    ["dilettante"] = {
        isElectric = true,
    },
    ["khamelion"] = {
        isElectric = true,
    },
}
Config.ElectricSprite = 620        -- This is for when the player is in an electric charger, the blips with change to this sprite. (Sprite with a car with a bolt going through it: 620)
Config.ElectricChargerModel = true -- If you wish, you can set this to false to add your own props, or use a ymap for the props instead.

-- Basic Configuration Settings
-- Turn on Config.FuelDebug and use this command to get the name for here: getVehNameForBlacklist
Config.NoFuelUsage = { -- This is for you to put vehicles that you don't want to use fuel.
    ["bmx"] = {
        blacklisted = true
    },
}

Config.Classes = { -- Class multipliers. If you want SUVs to use less fuel, you can change it to anything under 1.0, and vise versa.
    [0] = 1.0,     -- Compacts
    [1] = 1.0,     -- Sedans
    [2] = 1.0,     -- SUVs
    [3] = 1.0,     -- Coupes
    [4] = 1.0,     -- Muscle
    [5] = 1.0,     -- Sports Classics
    [6] = 1.0,     -- Sports
    [7] = 1.0,     -- Super
    [8] = 1.0,     -- Motorcycles
    [9] = 1.0,     -- Off-road
    [10] = 1.0,    -- Industrial
    [11] = 1.0,    -- Utility
    [12] = 1.0,    -- Vans
    [13] = 0.0,    -- Cycles
    [14] = 1.0,    -- Boats
    [15] = 1.0,    -- Helicopters
    [16] = 1.0,    -- Planes
    [17] = 1.0,    -- Service
    [18] = 1.0,    -- Emergency
    [19] = 1.0,    -- Military
    [20] = 1.0,    -- Commercial
    [21] = 1.0,    -- Trains
}

Config.FuelUsage = { -- The left part is at percentage RPM, and the right is how much fuel (divided by 10) you want to remove from the tank every second
    [1.0] = 2.0,
    [0.9] = 1.0,
    [0.8] = 0.9,
    [0.7] = 0.8,
    [0.6] = 0.7,
    [0.5] = 0.5,
    [0.4] = 0.3,
    [0.3] = 0.2,
    [0.2] = 0.1,
    [0.1] = 0.1,
    [0.0] = 0.0,
}

Config.AirAndWaterVehicleFueling = {
    ['enabled'] = true,
    ['locations'] = {
        -- MRPD Helipad
        [1] = {
            ['PolyZone'] = {
                ['coords'] = {
                    vector2(439.96, -973.0),
                    vector2(458.09, -973.04),
                    vector2(458.26, -989.47),
                    vector2(439.58, -989.94),
                },
                ['minmax'] = {
                    ['min'] = 40,
                    ['max'] = 50.0
                },
            },
            ['draw_text'] = "[G] Refuel Helicopter",
            ['type'] = 'air',
            ['whitelist'] = {
                ['enabled'] = true,
                ['on_duty_only'] = true,
                ['whitelisted_jobs'] = {
                    'police', 'ambulance'
                },
            },
            ['prop'] = {
                ['model'] = 'prop_gas_pump_1d',
                ['coords'] = vector4(442.08, -977.15, 42.69, 269.52),
            }
        },
        -- Pillbox Hospital
        [2] = {
            ['PolyZone'] = {
                ['coords'] = {
                    vector2(340.46, -580.02),
                    vector2(351.11, -575.06),
                    vector2(360.2, -578.35),
                    vector2(364.99, -588.36),
                    vector2(361.57, -597.44),
                    vector2(351.71, -601.99),
                    vector2(342.19, -598.38),
                    vector2(337.23, -587.49),
                },
                ['minmax'] = {
                    ['min'] = 72.50,
                    ['max'] = 78.50
                },
            },
            ['draw_text'] = "[G] Refuel Helicopter",
            ['type'] = 'air',
            ['whitelist'] = {
                ['enabled'] = true,
                ['on_duty_only'] = true,
                ['whitelisted_jobs'] = {
                    'police', 'ambulance'
                },
            },
            ['prop'] = {
                ['model'] = 'prop_gas_pump_1d',
                ['coords'] = vector4(362.65, -592.64, 73.16, 71.26),
            }
        },
        -- Devin Weston Terminal
        [3] = {
            ['PolyZone'] = {
                ['coords'] = {
                    vector2(-944.57, -2963.51),
                    vector2(-954.6, -2981.75),
                    vector2(-929.13, -2996.81),
                    vector2(-918.35, -2978.74),
                },
                ['minmax'] = {
                    ['min'] = 11.00,
                    ['max'] = 19.50
                },
            },
            ['draw_text'] = "[G] Refuel Aircraft",
            ['type'] = 'air',
            ['whitelist'] = {
                ['enabled'] = false,
                ['on_duty_only'] = false,
                ['whitelisted_jobs'] = {
                    'police', 'ambulance'
                },
            },
            ['prop'] = {
                ['model'] = 'prop_gas_pump_1d',
                ['coords'] = vector4(-923.12, -2976.81, 12.95, 149.55),
            }
        },
        -- Back Right Terminal
        [4] = {
            ['PolyZone'] = {
                ['coords'] = {
                    vector2(-1658.47, -3109.69),
                    vector2(-1645.78, -3085.85),
                    vector2(-1664.28, -3074.94),
                    vector2(-1677.93, -3098.61),
                },
                ['minmax'] = {
                    ['min'] = 12.00,
                    ['max'] = 19.50
                },
            },
            ['draw_text'] = "[G] Refuel Aircraft",
            ['type'] = 'air',
            ['whitelist'] = {
                ['enabled'] = false,
                ['on_duty_only'] = false,
                ['whitelisted_jobs'] = {
                    'police', 'ambulance'
                },
            },
            ['prop'] = {
                ['model'] = 'prop_gas_pump_1d',
                ['coords'] = vector4(-1665.44, -3104.53, 12.94, 329.89),
            }
        },
        -- La Puerta Helicopter Pad #1
        [5] = {
            ['PolyZone'] = {
                ['coords'] = {
                    vector2(-701.34, -1441.48),
                    vector2(-728.05, -1473.15),
                    vector2(-712.1, -1486.4),
                    vector2(-685.58, -1454.86),
                },
                ['minmax'] = {
                    ['min'] = 4.00,
                    ['max'] = 10.50
                },
            },
            ['draw_text'] = "[G] Refuel Aircraft",
            ['type'] = 'air',
            ['whitelist'] = {
                ['enabled'] = false,
                ['on_duty_only'] = false,
                ['whitelisted_jobs'] = {
                    'police', 'ambulance'
                },
            },
            ['prop'] = {
                ['model'] = 'prop_gas_pump_1d',
                ['coords'] = vector4(-706.13, -1464.14, 4.04, 320.0),
            }
        },
        -- La Puerta Helicopter Pad #2
        [6] = {
            ['PolyZone'] = {
                ['coords'] = {
                    vector2(-777.17, -1446.61),
                    vector2(-761.78, -1459.59),
                    vector2(-739.92, -1433.25),
                    vector2(-755.4, -1420.29),
                },
                ['minmax'] = {
                    ['min'] = 4.00,
                    ['max'] = 10.50
                },
            },
            ['draw_text'] = "[G] Refuel Aircraft",
            ['type'] = 'air',
            ['whitelist'] = {
                ['enabled'] = false,
                ['on_duty_only'] = false,
                ['whitelisted_jobs'] = {
                    'police', 'ambulance'
                },
            },
            ['prop'] = {
                ['model'] = 'prop_gas_pump_1d',
                ['coords'] = vector4(-764.81, -1434.32, 4.06, 320.0),
            }
        },
        -- La Puerta Boat Dock #1
        [7] = {
            ['PolyZone'] = {
                ['coords'] = {
                    vector2(-793.1, -1482.94),
                    vector2(-786.39, -1500.85),
                    vector2(-809.39, -1508.94),
                    vector2(-817.48, -1491.62),
                },
                ['minmax'] = {
                    ['min'] = -5.00,
                    ['max'] = 8.50
                },
            },
            ['draw_text'] = "[G] Refuel Watercraft",
            ['type'] = 'water',
            ['whitelist'] = {
                ['enabled'] = false,
                ['on_duty_only'] = false,
                ['whitelisted_jobs'] = {
                    'police', 'ambulance'
                },
            },
            ['prop'] = {
                ['model'] = 'prop_gas_pump_1d',
                ['coords'] = vector4(-805.9, -1496.68, 0.6, 200.00),
            }
        },
        -- Fort Zancudo Military Base Hangar
        [8] = {
            ['PolyZone'] = {
                ['coords'] = {
                    vector2(-2145.24, 3291.63),
                    vector2(-2127.94, 3281.7),
                    vector2(-2139.37, 3260.35),
                    vector2(-2157.69, 3271.1),
                },
                ['minmax'] = {
                    ['min'] = 30.00,
                    ['max'] = 37.50
                },
            },
            ['draw_text'] = "[G] Refuel Aircraft",
            ['type'] = 'air',
            ['whitelist'] = {
                ['enabled'] = true,
                ['on_duty_only'] = true,
                ['whitelisted_jobs'] = {
                    'police', 'ambulance'
                },
            },
            ['prop'] = {
                ['model'] = 'prop_gas_pump_1d',
                ['coords'] = vector4(-2148.8, 3283.99, 31.81, 240.0),
            }
        },
        -- Paleto Bay Police Department
        [9] = {
            ['PolyZone'] = {
                ['coords'] = {
                    vector2(-497.03, 5987.98),
                    vector2(-476.48, 6008.6),
                    vector2(-454.99, 5986.53),
                    vector2(-475.77, 5966.83),
                },
                ['minmax'] = {
                    ['min'] = 30.00,
                    ['max'] = 37.50
                },
            },
            ['draw_text'] = "[G] Refuel Aircraft",
            ['type'] = 'air',
            ['whitelist'] = {
                ['enabled'] = true,
                ['on_duty_only'] = true,
                ['whitelisted_jobs'] = {
                    'police', 'ambulance'
                },
            },
            ['prop'] = {
                ['model'] = 'prop_gas_pump_1d',
                ['coords'] = vector4(-486.22, 5977.65, 30.3, 315.4),
            }
        },
        -- Grapeseed Airfield
        [10] = {
            ['PolyZone'] = {
                ['coords'] = {
                    vector2(2094.41, 4771.26),
                    vector2(2080.85, 4797.71),
                    vector2(2104.56, 4811.8),
                    vector2(2118.06, 4782.09),
                },
                ['minmax'] = {
                    ['min'] = 40.00,
                    ['max'] = 47.50
                },
            },
            ['draw_text'] = "[G] Refuel Aircraft",
            ['type'] = 'air',
            ['whitelist'] = {
                ['enabled'] = false,
                ['on_duty_only'] = false,
                ['whitelisted_jobs'] = {
                    'police', 'ambulance'
                },
            },
            ['prop'] = {
                ['model'] = 'prop_gas_pump_1d',
                ['coords'] = vector4(2101.82, 4776.8, 40.02, 21.41),
            }
        },
        -- Grapeseed Airfield
        [11] = {
            ['PolyZone'] = {
                ['coords'] = {
                    vector2(1347.76, 4277.37),
                    vector2(1330.47, 4279.02),
                    vector2(1328.53, 4261.64),
                    vector2(1346.13, 4260.88),
                },
                ['minmax'] = {
                    ['min'] = 28.00,
                    ['max'] = 37.50
                },
            },
            ['draw_text'] = "[G] Refuel Watercraft",
            ['type'] = 'water',
            ['whitelist'] = {
                ['enabled'] = false,
                ['on_duty_only'] = false,
                ['whitelisted_jobs'] = {
                    'police', 'ambulance'
                },
            },
            ['prop'] = {
                ['model'] = 'prop_gas_pump_1d',
                ['coords'] = vector4(1338.13, 4269.62, 30.5, 85.00),
            }
        },
        -- Bob Smith PD
        [12] = {
            ['PolyZone'] = {
                ['coords'] = {
                    vector2(-1083.85, -837.07),
                    vector2(-1100.36, -849.84),
                    vector2(-1108.85, -839.11),
                    vector2(-1107.04, -837.76),
                    vector2(-1109.65, -834.04),
                    vector2(-1104.1, -829.69),
                    vector2(-1104.29, -829.07),
                    vector2(-1095.62, -822.42),
                },
                ['minmax'] = {
                    ['min'] = 36.00,
                    ['max'] = 42.50
                },
            },
            ['draw_text'] = "[G] Refuel Helicopter",
            ['type'] = 'air',
            ['whitelist'] = {
                ['enabled'] = true,
                ['on_duty_only'] = true,
                ['whitelisted_jobs'] = {
                    'police', 'ambulance'
                },
            },
            ['prop'] = {
                ['model'] = 'prop_gas_pump_1d',
                ['coords'] = vector4(-1089.72, -830.6, 36.68, 129.00),
            }
        },
        -- Merryweather Helipad
        [13] = {
            ['PolyZone'] = {
                ['coords'] = {
                    vector2(488.84, -3383.66),
                    vector2(489.23, -3356.98),
                    vector2(467.46, -3356.83),
                    vector2(467.58, -3383.62),
                    vector2(472.59, -3383.59),
                    vector2(472.63, -3382.13),
                    vector2(476.67, -3382.11),
                    vector2(476.8, -3383.94),
                },
                ['minmax'] = {
                    ['min'] = 4.50,
                    ['max'] = 10.50
                },
            },
            ['draw_text'] = "[G] Refuel Helicopter",
            ['type'] = 'air',
            ['whitelist'] = {
                ['enabled'] = false,
                ['on_duty_only'] = false,
                ['whitelisted_jobs'] = {
                    'police', 'ambulance'
                },
            },
            ['prop'] = {
                ['model'] = 'prop_gas_pump_1d',
                ['coords'] = vector4(483.28, -3382.83, 5.07, 0.0),
            }
        },
        -- Airport Helipad #1 & #2
        [14] = {
            ['PolyZone'] = {
                ['coords'] = {
                    vector2(-1133.49, -2860.32),
                    vector2(-1143.33, -2877.61),
                    vector2(-1191.03, -2850.14),
                    vector2(-1180.98, -2832.84),
                },
                ['minmax'] = {
                    ['min'] = 12.50,
                    ['max'] = 18.50
                },
            },
            ['draw_text'] = "[G] Refuel Helicopter",
            ['type'] = 'air',
            ['whitelist'] = {
                ['enabled'] = false,
                ['on_duty_only'] = false,
                ['whitelisted_jobs'] = {
                    'police', 'ambulance'
                },
            },
            ['prop'] = {
                ['model'] = 'prop_gas_pump_1d',
                ['coords'] = vector4(-1158.29, -2848.67, 12.95, 240.0),
            }
        },
        -- Airport Helipad #3
        [15] = {
            ['PolyZone'] = {
                ['coords'] = {
                    vector2(-1124.63, -2865.31),
                    vector2(-1134.74, -2882.56),
                    vector2(-1108.76, -2897.71),
                    vector2(-1099.04, -2880.39),
                },
                ['minmax'] = {
                    ['min'] = 12.50,
                    ['max'] = 18.50
                },
            },
            ['draw_text'] = "[G] Refuel Helicopter",
            ['type'] = 'air',
            ['whitelist'] = {
                ['enabled'] = false,
                ['on_duty_only'] = false,
                ['whitelisted_jobs'] = {
                    'police', 'ambulance'
                },
            },
            ['prop'] = {
                ['model'] = 'prop_gas_pump_1d',
                ['coords'] = vector4(-1125.15, -2866.97, 12.95, 240.0),
            }
        },
        -- Sandy Shores Helipad
        [16] = {
            ['PolyZone'] = {
                ['coords'] = {
                    vector2(1764.15, 3226.34),
                    vector2(1758.66, 3246.44),
                    vector2(1777.28, 3250.51),
                    vector2(1781.89, 3230.8),
                },
                ['minmax'] = {
                    ['min'] = 40.50,
                    ['max'] = 47.50
                },
            },
            ['draw_text'] = "[G] Refuel Helicopter",
            ['type'] = 'air',
            ['whitelist'] = {
                ['enabled'] = false,
                ['on_duty_only'] = false,
                ['whitelisted_jobs'] = {
                    'police', 'ambulance'
                },
            },
            ['prop'] = {
                ['model'] = 'prop_gas_pump_1d',
                ['coords'] = vector4(1771.81, 3229.24, 41.51, 15.00),
            }
        },
        -- Sandy Shores Hangar
        [17] = {
            ['PolyZone'] = {
                ['coords'] = {
                    vector2(1755.37, 3301.3),
                    vector2(1764.9, 3294.63),
                    vector2(1769.42, 3277.19),
                    vector2(1728.83, 3266.58),
                    vector2(1721.75, 3291.6),
                },
                ['minmax'] = {
                    ['min'] = 40.00,
                    ['max'] = 47.50
                },
            },
            ['draw_text'] = "[G] Refuel Aircraft",
            ['type'] = 'air',
            ['whitelist'] = {
                ['enabled'] = false,
                ['on_duty_only'] = false,
                ['whitelisted_jobs'] = {
                    'police', 'ambulance'
                },
            },
            ['prop'] = {
                ['model'] = 'prop_gas_pump_1d',
                ['coords'] = vector4(1748.31, 3297.08, 40.16, 15.0),
            }
        },
    },
    ['refuel_button'] = 47,   -- "G" Button for Draw Text.
    ['nozzle_length'] = 20.0, -- The max distance you can go from the "Special Pump" before the nozzle in returned to the pump.
    ['air_fuel_price'] = 14,  -- Price Per Liter of Fuel for Air Vehicles (Emergency Services Discount Still Applies)
    ['water_fuel_price'] = 6, -- Price Per Liter of Fuel for Water Vehicles (Emergency Services Discount Still Applies)
}

Config.GasStations = { -- Configuration options for various gas station related things, including peds, coords and labels.
    [1] = {
        zones = {
            vector2(197.74, -1563.29),
            vector2(179.72, -1539.49),
            vector2(154.16, -1565.64),
            vector2(162.11, -1572.40),
            vector2(163.96, -1573.63),
            vector2(165.90, -1574.60),
            vector2(167.80, -1575.28),
            vector2(170.21, -1575.73),
            vector2(172.79, -1575.81),
            vector2(175.72, -1575.30),
            vector2(178.32, -1574.33),
            vector2(180.68, -1573.07),
        },
        minz = 28.2,
        maxz = 30.3,
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = 167.06,
            y = -1553.56,
            z = 28.26,
            h = 220.44,
        },
        electriccharger = nil,
        electricchargercoords = vector4(175.9, -1546.65, 28.26, 224.29),
        label = "Davis Avenue Ron",
    },
    [2] = {
        zones = {
            vector2(-37.98, -1751.00),
            vector2(-54.94, -1737.10),
            vector2(-92.21, -1753.55),
            vector2(-93.36, -1755.61),
            vector2(-92.59, -1758.21),
            vector2(-91.72, -1759.77),
            vector2(-66.16, -1780.47),
            vector2(-57.10, -1770.26),
            vector2(-55.42, -1771.35),
        },
        minz = 28.2,
        maxz = 30.4,
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = -40.94,
            y = -1751.7,
            z = 28.42,
            h = 140.72,
        },
        electriccharger = nil,
        electricchargercoords = vector4(-51.09, -1767.02, 28.26, 47.16),
        label = "Grove Street LTD",
    },
    [3] = {
        zones = {
            vector2(-544.08, -1215.58),
            vector2(-522.31, -1225.72),
            vector2(-521.52, -1223.44),
            vector2(-519.19, -1224.45),
            vector2(-514.51, -1215.24),
            vector2(-504.97, -1202.43),
            vector2(-509.94, -1194.82),
            vector2(-514.67, -1190.73),
            vector2(-524.19, -1195.56),
            vector2(-534.29, -1192.25),
        },
        minz = 17.4,
        maxz = 21.04,
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = -531.2,
            y = -1220.83,
            z = 17.45,
            h = 335.73,
        },
        electriccharger = nil,
        electricchargercoords = vector4(-522.64, -1223.68, 17.45, 337.40),
        label = "Dutch London Xero",
    },
    [4] = {
        zones = {
            vector2(-697.15, -945.45),
            vector2(-723.88, -947.20),
            vector2(-737.02, -948.65),
            vector2(-734.73, -906.5),
            vector2(-711.0, -906.76),
            vector2(-710.65, -903.27),
            vector2(-696.82, -903.21),
        },
        minz = 18.0,
        maxz = 20.4,
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = -705.66,
            y = -905.04,
            z = 18.22,
            h = 179.46,
        },
        electriccharger = nil,
        electricchargercoords = vector4(-704.64, -935.71, 18.21, 90.02),
        label = "Little Seoul LTD",
    },
    [5] = {
        zones = {
            vector2(289.39, -1284.23),
            vector2(289.23, -1251.89),
            vector2(300.83, -1251.89),
            vector2(300.58, -1238.62),
            vector2(267.66, -1238.39),
            vector2(264.94, -1232.55),
            vector2(248.70, -1232.61),
            vector2(248.13, -1236.88),
            vector2(244.06, -1239.61),
            vector2(244.06, -1239.61),
            vector2(246.64, -1254.24),
            vector2(248.44, -1255.93),
            vector2(248.81, -1277.41),
            vector2(251.29, -1278.16),
            vector2(254.16, -1280.28),
            vector2(255.72, -1283.75),
        },
        minz = 28.1,
        maxz = 31.3,
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = 288.83,
            y = -1267.01,
            z = 28.44,
            h = 93.81,
        },
        electriccharger = nil,
        electricchargercoords = vector4(288.01, -1252.17, 28.44, 101.00),
        label = "Strawberry Ave Xero",

    },
    [6] = {
        zones = {
            vector2(835.17, -1016.09),
            vector2(801.99, -1017.74),
            vector2(803.75, -1047.23),
            vector2(812.86, -1047.82),
            vector2(812.74, -1041.38),
            vector2(823.91, -1041.35),
            vector2(835.16, -1041.23),
        },
        minz = 25.1,
        maxz = 28.1,
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = 816.42,
            y = -1040.51,
            z = 25.75,
            h = 2.07,
        },
        electriccharger = nil,
        electricchargercoords = vector4(834.27, -1028.7, 26.16, 88.39),
        label = "Popular Street Ron",
    },
    [7] = {
        zones = {
            vector2(1194.21, -1418.19),
            vector2(1201.45, -1417.88),
            vector2(1205.89, -1416.15),
            vector2(1210.17, -1414.14),
            vector2(1215.74, -1408.78),
            vector2(1219.05, -1404.27),
            vector2(1219.87, -1404.53),
            vector2(1221.24, -1401.54),
            vector2(1222.26, -1396.94),
            vector2(1222.23, -1392.26),
            vector2(1220.70, -1382.96),
            vector2(1214.98, -1383.16),
            vector2(1214.76, -1388.55),
            vector2(1205.22, -1388.79),
            vector2(1194.27, -1388.66),
        },
        minz = 34.1,
        maxz = 36.3,
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = 1211.13,
            y = -1389.18,
            z = 34.38,
            h = 177.39,
        },
        electriccharger = nil,
        electricchargercoords = vector4(1194.41, -1394.44, 34.37, 270.3),
        label = "Capital Blvd Ron",
    },
    [8] = {
        zones = {
            vector2(1150.74, -346.51),
            vector2(1159.86, -348.75),
            vector2(1171.36, -351.31),
            vector2(1175.67, -344.61),
            vector2(1197.30, -341.01),
            vector2(1196.45, -334.78),
            vector2(1194.72, -323.86),
            vector2(1192.51, -316.42),
            vector2(1190.09, -310.66),
            vector2(1167.78, -314.69),
            vector2(1166.82, -309.38),
            vector2(1145.28, -313.24),
        },
        minz = 67.1,
        maxz = 70.7,
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = 1163.64,
            y = -314.21,
            z = 68.21,
            h = 190.92,
        },
        electriccharger = nil,
        electricchargercoords = vector4(1168.38, -323.56, 68.3, 280.22),
        label = "Mirror Park LTD",
    },
    [9] = {
        zones = {
            vector2(650.64, 273.89),
            vector2(653.89, 280.59),
            vector2(635.58, 291.50),
            vector2(612.78, 290.63),
            vector2(600.74, 273.95),
            vector2(600.35, 260.83),
            vector2(606.90, 256.53),
            vector2(621.52, 248.62),
            vector2(629.99, 244.06),
            vector2(633.57, 248.85),
            vector2(635.51, 248.18),
        },
        minz = 101.9,
        maxz = 104.8,
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = 642.08,
            y = 260.59,
            z = 102.3,
            h = 61.39,
        },
        electriccharger = nil,
        electricchargercoords = vector4(648.00, 272.71, 102.30, 63.93),
        label = "Clinton Ave Globe Oil",
    },
    [10] = {
        zones = {
            vector2(-1437.33, -257.53),
            vector2(-1453.16, -274.96),
            vector2(-1430.72, -301.65),
            vector2(-1413.16, -284.51)
        },
        minz = 45.0,
        maxz = 47.3,
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = -1428.4,
            y = -268.69,
            z = 45.21,
            h = 132.94,
        },
        electriccharger = nil,
        electricchargercoords = vector4(-1420.51, -278.76, 45.26, 137.35),
        label = "North Rockford Ron",
    },
    [11] = {
        zones = {
            vector2(-2074.87, -341.00),
            vector2(-2071.47, -312.15),
            vector2(-2058.33, -313.70),
            vector2(-2056.03, -296.19),
            vector2(-2128.49, -288.64),
            vector2(-2133.06, -304.27),
            vector2(-2115.20, -309.18),
            vector2(-2112.49, -312.62),
            vector2(-2112.27, -313.46),
            vector2(-2114.36, -333.38),
            vector2(-2108.18, -336.44),
            vector2(-2104.96, -342.90),
        },
        minz = 12.0,
        maxz = 14.3,
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = -2074.28,
            y = -327.22,
            z = 12.32,
            h = 132.94,
        },
        electriccharger = nil,
        electricchargercoords = vector4(-2080.61, -338.52, 12.26, 352.21),
        label = "Great Ocean Xero",
    },
    [12] = {
        zones = {
            vector2(-113.32, 6409.80),
            vector2(-103.97, 6399.41),
            vector2(-83.78, 6419.25),
            vector2(-81.10, 6416.49),
            vector2(-76.98, 6420.55),
            vector2(-90.28, 6434.03),
        },
        minz = 30.34,
        maxz = 33.5,
        pumpheightadd = 1.5, --  For Config.PumpHose
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = -93.50,
            y = 6410.11,
            z = 30.64,
            h = 49.19,
        },
        electriccharger = nil,
        electricchargercoords = vector4(-82.66, 6418.31, 30.64, 317.66),
        label = "Paleto Blvd Xero",
    },
    [13] = {
        zones = {
            vector2(176.31, 6641.08),
            vector2(166.87, 6631.75),
            vector2(171.24, 6627.98),
            vector2(167.62, 6624.74),
            vector2(163.26, 6619.43),
            vector2(162.38, 6592.56),
            vector2(206.07, 6599.80),
            vector2(204.43, 6619.89),
            vector2(204.53, 6631.40),
            vector2(191.46, 6634.47),
            vector2(179.71, 6635.03),
        },
        minz = 30.7,
        maxz = 33.4,
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = 170.44,
            y = 6633.74,
            z = 30.59,
            h = 221.95,
        },
        electriccharger = nil,
        electricchargercoords = vector4(188.00, 6600.67, 31.05, 290.33),
        label = "Paleto Ron",
    },
    [14] = {
        zones = {
            vector2(1697.38, 6427.07),
            vector2(1698.35, 6429.28),
            vector2(1691.94, 6432.29),
            vector2(1682.33, 6413.06),
            vector2(1707.69, 6401.02),
            vector2(1716.54, 6420.93),
            vector2(1701.31, 6427.89),
            vector2(1700.29, 6425.76),
        },
        minz = 31.4,
        maxz = 34.2,
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = 1698.62,
            y = 6425.84,
            z = 31.76,
            h = 156.61,
        },
        electriccharger = nil,
        electricchargercoords = vector4(1703.56, 6426.48, 31.77, 165.81),
        label = "Paleto Globe Oil",
    },
    [15] = {
        zones = {
            vector2(1700.59, 4952.47),
            vector2(1691.53, 4947.74),
            vector2(1682.01, 4940.31),
            vector2(1679.25, 4936.86),
            vector2(1676.00, 4928.56),
            vector2(1674.26, 4919.07),
            vector2(1677.53, 4917.73),
            vector2(1701.15, 4901.24),
            vector2(1725.27, 4935.08),
        },
        minz = 41.05,
        maxz = 43.17,
        pumpheightadd = 1.5, --  For Config.PumpHose
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = 1704.59,
            y = 4917.5,
            z = 41.06,
            h = 52.16,
        },
        electriccharger = nil,
        electricchargercoords = vector4(1703.57, 4937.23, 41.08, 55.74),
        label = "Grapeseed LTD",
    },
    [16] = {
        zones = {
            vector2(2007.53, 3783.64),
            vector2(1999.29, 3779.51),
            vector2(1998.33, 3781.15),
            vector2(1992.05, 3777.87),
            vector2(2000.20, 3759.09),
            vector2(2011.58, 3765.93),
            vector2(2011.05, 3769.10),
            vector2(2014.01, 3771.27),
        },
        minz = 31.18,
        maxz = 33.60,
        pumpheightadd = 1.5, --  For Config.PumpHose
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = 2001.33,
            y = 3779.87,
            z = 31.18,
            h = 211.44,
        },
        electriccharger = nil,
        electricchargercoords = vector4(1994.54, 3778.44, 31.18, 215.25),
        label = "Sandy Shores Xero",
    },
    [17] = {
        zones = {
            vector2(1768.95, 3338.93),
            vector2(1778.84, 3322.03),
            vector2(1790.49, 3330.03),
            vector2(1781.77, 3345.98)
        },
        minz = 39.0,
        maxz = 44.6,
        pumpheightadd = 1.5, --  For Config.PumpHose
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = 1776.57,
            y = 3327.36,
            z = 40.43,
            h = 297.57,
        },
        electriccharger = nil,
        electricchargercoords = vector4(1770.86, 3337.97, 40.43, 301.1),
        label = "Sandy Shores Globe Oil",
    },
    [18] = {
        zones = {
            vector2(2685.84, 3288.65),
            vector2(2675.37, 3294.47),
            vector2(2660.19, 3267.24),
            vector2(2685.85, 3252.51),
            vector2(2700.59, 3280.14),
        },
        minz = 54.24,
        maxz = 56.4,
        pumpheightadd = 1.5, --  For Config.PumpHose
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = 2673.98,
            y = 3266.87,
            z = 54.24,
            h = 240.9,
        },
        electriccharger = nil,
        electricchargercoords = vector4(2690.25, 3265.62, 54.24, 58.98),
        label = "Senora Freeway Xero",
    },
    [19] = {
        zones                 = {
            vector2(1188.64, 2651.89),
            vector2(1202.27, 2663.64),
            vector2(1212.50, 2661.74),
            vector2(1217.05, 2651.52),
            vector2(1210.61, 2633.33),
            vector2(1201.52, 2638.26)
        },
        minz                  = 36.7,
        maxz                  = 38.85,
        pumpheightadd         = 1.5, --  For Config.PumpHose
        pedmodel              = "a_m_m_indian_01",
        cost                  = 100000,
        shutoff               = false,
        pedcoords             = {
            x = 2675.51,
            y = 3288.70,
            z = 54.24,
            h = 112.59,
        },
        electriccharger       = nil,
        electricchargercoords = vector4(1208.26, 2649.46, 36.85, 222.32),
        label                 = "Harmony Globe Oil",
    },
    [20] = {
        zones = {
            vector2(1045.44, 2663.80),
            vector2(1045.56, 2661.57),
            vector2(1052.64, 2661.56),
            vector2(1052.53, 2683.05),
            vector2(1031.78, 2684.20),
            vector2(1031.67, 2663.69),
        },
        minz = 38.24,
        maxz = 40.55,
        pumpheightadd = 1.5, --  For Config.PumpHose
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = 1039.44,
            y = 2664.37,
            z = 38.55,
            h = 10.07,
        },
        electriccharger = nil,
        electricchargercoords = vector4(1044.58, 2664.13, 38.55, 3.51),
        label = "Route 68 Globe Oil",
    },
    [21] = {
        zones = {
            vector2(269.83, 2598.74),
            vector2(251.18, 2595.05),
            vector2(247.65, 2612.47),
            vector2(266.46, 2616.62),
        },
        minz = 43.60,
        maxz = 45.95,
        pumpheightadd = 1.5, --  For Config.PumpHose
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = 265.89,
            y = 2598.3,
            z = 43.84,
            h = 9.88,
        },
        electriccharger = nil,
        electricchargercoords = vector4(267.96, 2599.47, 43.69, 5.8),
        label = "Route 68 Workshop Globe Oil",
    },
    [22] = {
        zones = {
            vector2(64.32, 2790.97),
            vector2(48.36, 2769.27),
            vector2(32.16, 2780.09),
            vector2(49.39, 2802.16)
        },
        minz = 56.8,
        maxz = 58.9,
        pumpheightadd = 1.5, --  For Config.PumpHose
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = 46.53,
            y = 2789.05,
            z = 56.88,
            h = 143.93,
        },
        electriccharger = nil,
        electricchargercoords = vector4(50.21, 2787.38, 56.88, 147.2),
        label = "Route 68 Xero",
    },
    [23] = {
        zones = {
            vector2(-2565.97, 2314.77),
            vector2(-2521.89, 2317.83),
            vector2(-2526.24, 2351.78),
            vector2(-2568.68, 2349.04),
        },
        minz = 32.05,
        maxz = 34.08,
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = -2544.04,
            y = 2316.15,
            z = 32.22,
            h = 2.5,
        },
        electriccharger = nil,
        electricchargercoords = vector4(-2554.72, 2326.86, 32.08, 178.64),
        label = "Route 68 Ron",
    },
    [24] = {
        zones = {
            vector2(2540.32, 2605.53),
            vector2(2533.13, 2602.87),
            vector2(2543.49, 2574.73),
            vector2(2550.59, 2577.24),
        },
        minz = 36.94,
        maxz = 38.94,
        pumpheightadd = 1.5, --  For Config.PumpHose
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = 2545.02,
            y = 2591.72,
            z = 36.96,
            h = 113.52,
        },
        electriccharger = nil,
        electricchargercoords = vector4(2545.81, 2586.18, 36.94, 83.74),
        label = "Rex's Diner Globe Oil",
    },
    [25] = {
        zones = {
            vector2(2541.13, 349.08),
            vector2(2597.17, 346.57),
            vector2(2598.64, 377.41),
            vector2(2593.12, 401.01),
            vector2(2542.82, 400.44)
        },
        minz = 107.4,
        maxz = 109.4,
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = 2550.66,
            y = 387.88,
            z = 107.62,
            h = 132.77,
        },
        electriccharger = nil,
        electricchargercoords = vector4(2561.24, 357.3, 107.62, 266.65),
        label = "Palmino Freeway Ron",
    },
    [26] = {
        zones = {
            vector2(-1820.41, 767.31),
            vector2(-1775.49, 802.95),
            vector2(-1798.5, 828.42),
            vector2(-1841.71, 791.66)
        },
        minz = 136.64,
        maxz = 139.9,
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = -1825.33,
            y = 800.96,
            z = 137.1,
            h = 220.96,
        },
        electriccharger = nil,
        electricchargercoords = vector4(-1819.22, 798.51, 137.16, 315.13),
        label = "North Rockford LTD",
    },
    [27] = {
        zones = {
            vector2(-354.55, -1452.65),
            vector2(-354.17, -1499.62),
            vector2(-301.52, -1497.73),
            vector2(-296.59, -1453.03)
        },
        minz = 29.5,
        maxz = 31.9,
        pedmodel = "a_m_m_indian_01",
        cost = 100000,
        shutoff = false,
        pedcoords = {
            x = -342.37,
            y = -1482.97,
            z = 29.71,
            h = 273.47,
        },
        electriccharger = nil,
        electricchargercoords = vector4(-341.63, -1459.39, 29.76, 271.73),
        label = "Alta Street Globe Oil",
    },
}

-- Profanity Dictionary from another source, used for stopping people from putting the words blacklisted as the name of their gas stations. --

Config.ProfanityList = {

}
