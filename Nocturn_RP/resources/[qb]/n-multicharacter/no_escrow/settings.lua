-- | # For help with this script: https://discord.gg/thugstudios
-- | # For more free scripts: https://discord.gg/thugstudios
-- | # For the best quality scripts: https://discord.gg/thugstudios

Config = {}

Config.Settings = {
    
    -- | # General  --------------------------------------------------------------------------------

    ['Framework'] = 'qb', -- | # In this section you have the options 'esx', 'qb', 'old-qb', 'qbox'
    ['Inventory'] = 'qs-inventory', -- | # In this section you have the options 'qb-default', 'esx-default', 'ox-inv', etc.
    ['Clothing_Script'] = 'illenium-appearance', -- | # In this section you have the options 'illenium-appearance', 'qb-clothing'
    ['N_Spawn_Selector'] = false, -- | # If you are using n-spawn-selector-v2, set this to true. (https://forum.cfx.re/t/modern-spawn-selector-n-spawn-selector-v2/5290040)
    ['QB_Weathersync'] = false, -- | # If you are using qb-weathersync, set this to true.
    ['Server_License_Type'] = 'license:', -- | # In this section you have the options 'steam:', 'license:', 'license2:'
    ['SQL'] = 'oxmysql', -- | # In this section you have the options 'oxmysql', 'ghmattimysql', 'mysql-async'

    -- | # Character Settings  ----------------------------------------------------------------------------

    ['Can_Be_Character_Delete'] = true, -- | # If you set this to true, you allow players to delete their characters.
    ['Default_Bucket'] = 0, -- | # 
    ['First_Spawn_Coords'] = vector4(-1845.6074, -1196.9731, 18.1849, 164.0252), -- | # Where will a first-time character create be spawn?
    ['Character_Slots'] = {
        [1] = { enabled = true },
        [2] = { enabled = false },
        [3] = { enabled = false },
        [4] = { enabled = false },
    },

    -- | # Starter Items  --------------------------------------------------------------------------------

    ['Give_Starter_Items'] = false, -- | # If you set this to true, after a character is created for the first time, the character will have the following items.
    ['Starter_Items'] = {
        ["bread"]          = { amount = 5 },
        ["water"]          = { amount = 3 }
    },

    -- | # Blacklist Names  --------------------------------------------------------------------------------
    -- | # If any player tries to create a character with one of the names you specify in this section, they will get an error.
    ['Blacklist_Names'] = {
        "Jefrey",
        "Kevin",
        "Tery",
        "Tupac"
    },

    -- | # Customizable Character Settings  -------------------------------------------------------------------------------------

    ['Vehicles'] = {
        [1] = { name = "sultan"   },
        [2] = { name = "elegy2"   },
        [3] = { name = "oracle"   },
        [4] = { name = "buffalo"   },
        [5] = { name = "coquette4"   },
        [6] = { name = "jester"   },
        [7] = { name = "t20"      },
        [8] = { name = "zentorno" },
        [9] = { name = "nero"     },
    },
    ['Animations'] = {
        [1] = { scenario = "WORLD_HUMAN_JOG_STANDING"             },
        [2] = { scenario = "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT"  },
        [3] = { scenario = "WORLD_HUMAN_WINDOW_SHOP_BROWSE"       },
        [4] = { scenario = "WORLD_HUMAN_DRUG_DEALER"              },
        [5] = { scenario = "WORLD_HUMAN_HANG_OUT_STREET"          },
        [6] = { scenario = "WORLD_HUMAN_PARTYING"                 },
        [7] = { scenario = "WORLD_HUMAN_MUSICIAN"                 },
        [8] = { scenario = "WORLD_HUMAN_SECURITY_SHINE_TORCH"     },
        [9] = { scenario = "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS"      },
    },
}
