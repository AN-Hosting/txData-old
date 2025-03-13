--[[ ===================================================== ]]--
--[[          QBCore Elevators Script by MaDHouSe          ]]--
--[[ ===================================================== ]]--

Config = {}

Config.UseTableSort = true
Config.ShowBlips = true

Config.Elevators = {

    ['pillbox_hospital_elevator'] = {

        ['blip'] = {
            ['label'] = "Pillbox Hospital Elevator",
            ['show'] = false,
            ['coords'] = vector3(341.05, -580.84, 28.8),
            ['sprite'] = 728,
            ['colour'] = 44,
            ['scale'] = 0.8,
        },

        ['floors'] = {
            ["Parking"] = { -- basement
                coords = vector3(341.05, -580.84, 28.8), 
                heading = 86.6,
                tpVehicle = false,
            },

            ["Hall"] = { -- ground floor
                coords = vector3(332.17, -595.61, 43.28),
                heading = 68.44,
                tpVehicle = false,
            },

            ["Toit"] = { -- roof
                coords = vector3(339.7, -584.19, 74.16),
                heading = 242.64,
                tpVehicle = false,
            },
        }
    },

    ['cityhall_elevator'] = {

        ['blip'] = {
            ['label'] = "Cityhall Elevator",
            ['show'] = false,
            ['coords'] = vector3(341.05, -580.84, 28.8),
            ['sprite'] = 728,
            ['colour'] = 44,
            ['scale'] = 0.8,
        },

        ['floors'] = {
            ["0 Parking"] = { 
                coords = vector3(-1309.33, -559.04, 20.8), 
                heading = 220.67,
                tpVehicle = false,
            },

            ["1 Hall"] = { 
                coords = vector3(-1307.32, -561.97, 30.57),
                heading = 220.67,
                tpVehicle = false,
            },

            ["2"] = { 
                coords = vector3(-1307.47, -561.81, 34.38),
                heading = 220.67,
                tpVehicle = false,
            },
            ["3"] = { 
                coords = vector3(-1307.25, -562.09, 37.38),
                heading = 220.67,
                tpVehicle = false,
            },
            ["4 (privé)"] = { 
                coords = vector3(-1308.89, -564.3, 41.19),
                heading = 220.67,
                tpVehicle = false,
            },
        }
    },
    ['newhospital'] = {

        ['blip'] = {
            ['label'] = "Cityhall Elevator",
            ['show'] = false,
            ['coords'] = vector3(341.05, -580.84, 28.8),
            ['sprite'] = 728,
            ['colour'] = 44,
            ['scale'] = 0.8,
        },

        ['floors'] = {
            ["0 Parking"] = { 
                coords = vector3(-664.35, 326.06, 78.12), 
                heading = 360.67,
                tpVehicle = false,
            },

            ["1 Hall"] = { 
                coords = vector3(-664.34, 326.16, 83.09),
                heading = 360.67,
                tpVehicle = false,
            },

            ["2"] = { 
                coords = vector3(-664.34, 326.17, 88.01),
                heading = 360.67,
                tpVehicle = false,
            },
            ["3"] = { 
                coords = vector3(-664.33, 326.27, 92.74),
                heading = 360.67,
                tpVehicle = false,
            },
            ["4 Toît"] = { 
                coords = vector3(-664.32, 326.37, 140.12),
                heading = 360.67,
                tpVehicle = false,
            },
        }
    },
    ['rockfordhillsPD'] = {

        ['blip'] = {
            ['label'] = "LSPD",
            ['show'] = false,
            ['coords'] = vector3(604.83, 5.5, 97.87),
            ['sprite'] = 728,
            ['colour'] = 44,
            ['scale'] = 0.8,
        },

        ['floors'] = {
            ["1"] = { 
                coords = vector3(604.83, 5.5, 97.87), 
                heading = 285.02,
                tpVehicle = false,
            },
            ["2 Toît"] = { 
                    coords = vector3(566.04, 4.93, 103.23),
                    heading = 360.67,
                    tpVehicle = false,
            

            },
        }
    },
    ['newsPDP'] = {

        ['blip'] = {
            ['label'] = "LSPD",
            ['show'] = false,
            ['coords'] = vector3(604.83, 5.5, 97.87),
            ['sprite'] = 728,
            ['colour'] = 44,
            ['scale'] = 0.8,
        },

        ['floors'] = {
            ["-2 | SWAT"] = { 
                coords = vector3(-361.59, -366.43, 20.23), 
                heading = 170.02,
                tpVehicle = false,
            },
            ["-1 | Parking"] = { 
                coords = vector3(-400.20, -357.43, 25.10), 
                heading = 170.02,
                tpVehicle = false,
            },
            ["0 | Hall"] = { 
                    coords = vector3(-405.20, -347.17, 38.43),
                    heading = 252.67,
                    tpVehicle = false,
            },
            ["1 | Salle de pause"] = { 
                    coords = vector3(-405.21, -347.23, 43.60),
                    heading = 252.67,
                    tpVehicle = false,
            },
            ["2 | Bureaux"] = { 
                    coords = vector3(-405.20, -347.13, 48.53),
                    heading = 252.67,
                    tpVehicle = false,
            },
            ["3 | Labo / FBI"] = { 
                    coords = vector3(-405.11, -347.16, 53.26),
                    heading = 252.67,
                    tpVehicle = false,
            },
            ["4 | Toît"] = { 
                    coords = vector3(-405.48, -358.39, 71.27),
                    heading = 352.67,
                    tpVehicle = false,
            },
        }
    },


    ['red_garage_elevator'] = {

        ['blip'] = {
            ['label'] = "Red Garage Elevator",
            ['show'] = false,
            ['coords'] = vector3(-322.65, -774.91, 33.96),
            ['sprite'] = 728,
            ['colour'] = 44,
            ['scale'] = 0.8,
        },

        ['floors'] = {
            [1] = { -- ground floor
                coords = vector3(-322.65, -774.91, 33.96),
                heading = 48.92,
                tpVehicle = false,
            },

            [2] = { 
                coords = vector3(-322.5, -774.88, 38.78),
                heading = 48.83,
                tpVehicle = false,
            },

            [3] = {
                coords = vector3(-322.43, -774.9, 43.61),
                heading = 47.51,
                tpVehicle = false,
            },

            [4] = { -- roof
                coords = vector3(-322.37, -774.92, 53.25),
                heading = 41.19,
                tpVehicle = false,
            },
        }

    },
 
    ['maze_bank_vehicle_elevator'] = {

        ['blip'] = {
            ['label'] = "Maze Bank Vehicle Elevator",
            ['show'] = false,
            ['coords'] = vector3(-84.03, -820.96, 35.62),
            ['sprite'] = 728,
            ['colour'] = 44,
            ['scale'] = 0.8,
        },

        ['floors'] = {
            [0] = { -- basement
                coords = vector3(-84.03, -820.96, 35.62),
                heading = 349.74,
                tpVehicle = true,
            },

            [1] = { -- floor 
                coords = vector3(-72.34, -813.36, 284.59),
                heading = 160.96,
                tpVehicle = true,
            },
        }
    },
}
