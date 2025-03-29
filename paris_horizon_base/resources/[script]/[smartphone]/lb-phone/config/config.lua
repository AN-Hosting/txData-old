Config = {}
Config.Debug = false -- Set to true to enable debug mode

Config.Logs = {}
Config.Logs.Enabled = false
Config.Logs.Service = "discord" -- fivemanage, discord or ox_lib. if discord, set your webhook in server/apiKeys.lua
Config.Logs.Actions = {
    Calls = true,
    Messages = true,
    InstaPic = true,
    Birdy = true,
    YellowPages = true,
    Marketplace = true,
    Mail = true,
    Wallet = true,
    DarkChat = true,
    Services = true,
    Crypto = true,
    Trendy = true,
    Uploads = true
}

Config.DatabaseChecker = {}
Config.DatabaseChecker.Enabled = true -- if true, the phone will check the database for any issues and fix them if possible
Config.DatabaseChecker.AutoFix = true

--[[ FRAMEWORK OPTIONS ]] --
Config.Framework = "qb"
--[[
    Supported frameworks:
        * auto: auto-detect framework
        * esx: es_extended - https://github.com/esx-framework/esx-legacy
        * qb: qb-core - https://github.com/qbcore-framework/qb-core
        * qbox: qbx_core - https://github.com/Qbox-project/qbx_core
        * ox: ox_core - https://github.com/overextended/ox_core
        * vrp2: vrp 2.0 (ONLY THE OFFICIAL vRP 2.0, NOT CUSTOM VERSIONS)
        * standalone: no framework. note that framework specific apps will not work unless you implement the functions
]]
Config.CustomFramework = false -- if set to true and you use standalone, you will be able to use framework specific apps
Config.QBMailEvent = false -- if you want this script to listen for qb email events, enable this.
Config.QBOldJobMethod = false -- use the old method to check job in qb-core? this is slower, and only needed if you use an outdated version of qb-core.

Config.Item = {}
-- If you want to set up multiple items & frame colours, see https://docs.lbscripts.com/phone/configuration/#multiple-items--colored-phones
Config.Item.Require = true -- require a phone item to use the phone
Config.Item.Name = "phone" -- name of the phone item

Config.Item.Unique = true -- should each phone be unique? https://docs.lbscripts.com/phone/configuration/#unique-phones
Config.Item.Inventory = "qb-inventory" --[[
    The inventory you use, IGNORE IF YOU HAVE Config.Item.Unique DISABLED.
    Supported:
        * auto: auto-detect inventory (ONLY WORKS WITH THE ONE LISTED BELOW)
        * ox_inventory - https://github.com/overextended/ox_inventory
        * qb-inventory - https://github.com/qbcore-framework/qb-inventory
        * lj-inventory - https://github.com/loljoshie/lj-inventory
        * core_inventory - https://www.c8re.store/package/5121548
        * mf-inventory - https://modit.store/products/mf-inventory?variant=39985142268087
        * qs-inventory - https://buy.quasar-store.com/package/4770732
        * codem-inventory - https://codem.tebex.io/package/5900973
]]

Config.ServerSideSpawn = false -- should entities be spawned on the server? (phone prop, vehicles)

Config.PhoneModel = `lb_phone_prop` -- the prop of the phone, if you want to use a custom phone model, you can change this here
Config.PhoneRotation = vector3(0.0, 0.0, 180.0) -- the rotation of the phone when attached to a player
Config.PhoneOffset = vector3(0.0, -0.005, 0.0) -- the offset of the phone when attached to a player

Config.DisableOpenNUI = true -- disable the phone from opening if another script has NUI focus?

Config.DynamicIsland = true -- if enabled, the phone will have a Iphone 14 Pro inspired Dynamic Island.
Config.SetupScreen = true -- if enabled, the phone will have a setup screen when the player first uses the phone.

Config.AutoDeleteNotifications = true -- notifications that are more than X hours old, will be deleted. set to false to disable. if set to true, it will delete 1 week old notifications.
Config.MaxNotifications = 50 -- the maximum amount of notifications a player can have. if they have more than this, the oldest notifications will be deleted. set to false to disable
Config.DisabledNotifications = { -- an array of apps that should not send notifications, note that you should use the app identifier, found in config.json
    -- "DarkChat",
}

--[[
    Here you can whitelist/blacklist apps for certain jobs. There are two formats:

    an array of jobs that are allowed/blacklisted
    e.g.: { "police", "ambulance" }

    a key-value pair of jobs that are allowed/blacklisted, where the key is the job name and the value is the minimum grade required to access the app
    e.g.: { ["police"] = 1, ["ambulance"] = 1 }

    The key is the app identifier. The default app identifiers can be found in config/config.json. For custom apps, ask the creator of the app.
--]]

Config.WhitelistApps = {
    -- ["Weather"] = { "police", "ambulance" }
}

Config.BlacklistApps = {
    -- ["Maps"] = { "police" }
}

Config.ChangePassword = {
    ["Trendy"] = true,
    ["InstaPic"] = true,
    ["Birdy"] = true,
    ["DarkChat"] = true,
    ["Mail"] = true,
}

Config.DeleteAccount = {
    ["Trendy"] = false,
    ["InstaPic"] = false,
    ["Birdy"] = false,
    ["DarkChat"] = false,
    ["Mail"] = false,
    ["Spark"] = false,
}

Config.Companies = {}
Config.Companies.Enabled = true -- allow players to call companies?
Config.Companies.MessageOffline = true -- if true, players can message companies even if no one in the company is online
Config.Companies.DefaultCallsDisabled = false -- should receiving company calls be disabled by default?
Config.Companies.AllowAnonymous = false -- allow players to call companies with "hide caller id" enabled?
Config.Companies.SeeEmployees = "everyone" -- who should be able to see employees? they will see name, online status & phone number. options are: "everyone", "employees" or "none"
Config.Companies.DeleteConversations = true -- allow employees to delete conversations?
Config.Companies.Services = {
    {
        job = "police_nationale",
        name = "Police National",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704337465147423/police_nationale.png?ex=67e29ee8&is=67e14d68&hm=81d6c1531c715c26da6014e7b4f94bd9d063d45533978d5d9891fa514318b46e&",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = { "boss" }, -- ranks that can manage the company
        location = {
            name = "Police National",
            coords = {
                x = 428.9,
                y = -984.5,
            }
        }
        -- customIcon = "IoShield", -- if you want to use a custom icon for the company, set it here: https://react-icons.github.io/react-icons/icons?name=io5
        -- onCustomIconClick = function()
        --    print("Clicked")
        -- end
    },
    {
        job = "samu_75",
        name = "Samu",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704338505338910/samu.png?ex=67e29ee8&is=67e14d68&hm=1fec92dc257eb4a8ee6ce2c3cabc41a7ddc30be3b15a83b03f5ddffafe23129a&",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss", "doctor"}, -- ranks that can manage the company
        location = {
            name = "Samu",
            coords = {
                x = 304.2,
                y = -587.0
            }
        }
    },
    {
        job = "midas",
        name = "Phantom Garage",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704260566519918/midas.png?ex=67e29ed6&is=67e14d56&hm=449843b74b82a496e99f1680563d4862fb0d3cf757242523453bfc104870637d&",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss", "worker"}, -- ranks that can manage the company
        location = {
            name = "Phantom Garage",
            coords = {
                x = -826.72,
                y = -434.01
            }
        }
    },
    {
        job = "norauto",
        name = "Auto Exotic",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704261116100648/norauto.png?ex=67e29ed6&is=67e14d56&hm=212293cb94ce2c2e40fdc5d93030c9a8a1d3faff5bf513f1dedb66f3bea9bf78&",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss", "driver"}, -- ranks that can manage the company
        location = {
            name = "Auto Exotic",
            coords = {
                x =984.2,
                y = -219.0
            }
        }
    },
    {
        job = "tabac",
        name = "Tabac",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704338781896797/tabac.png?ex=67e29ee8&is=67e14d68&hm=5cf7ddaa4093960a794d8b78d986532701bdc4a538391dd72471eb1f9498a145&",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss", "driver"}, -- ranks that can manage the company
        location = {
            name = "Tabac",
            coords = {
                x =984.2,
                y = -219.0
            }
        }
    },
    {
        job = "mairie",
        name = "Mairie",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704338102681631/prefecture.png?ex=67e29ee8&is=67e14d68&hm=7a29ea7cf2be39b7c87dbf78147e83d54085c2b5bfd0e24da0d3b465eb6f75d6&",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss", "driver"}, -- ranks that can manage the company
        location = {
            name = "mMirie",
            coords = {
                x =984.2,
                y = -219.0
            }
        }
    },
    {
        job = "gendarmerie_nationale",
        name = "Gendarmerie National",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704259660550224/gendarmerie.png?ex=67e29ed6&is=67e14d56&hm=12473b38bd539618352ba0cc1bef79269a37f89a10feb53c15233e4956bfeb39&",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss", "driver"}, -- ranks that can manage the company
        location = {
            name = "Gendarmerie Nationale",
            coords = {
                x = 2516.95,
                y = -384.31
            }
        }
    },
    {
        job = "pompiers_de_paris",
        name = "Pompiers",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704337771204710/pompie.png?ex=67e29ee8&is=67e14d68&hm=e50caa9bd7b8c31ff688ff783d50075eb57bc5cabd29a5a3a2829e9aec80dade&",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss", "driver"}, -- ranks that can manage the company
        location = {
            name = "Pompiers",
            coords = {
                x =984.2,
                y = -219.0
            }
        }
    },
    {
        job = "orpi",
        name = "Orpi",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704261367631963/orpi.png?ex=67e29ed6&is=67e14d56&hm=a543a129f911e89f816520dfe94a0a239290a563935b63c52b573b800df98967&",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss", "driver"}, -- ranks that can manage the company
        location = {
            name = "Orpi",
            coords = {
                x =984.2,
                y = -219.0
            }
        }
    },
    {
        job = "concessionnaire",
        name = "Concessionnaire",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704189775319101/concess.png?ex=67e29ec5&is=67e14d45&hm=3abeddeb5535d1ac2f26c71fe6a1a102d917166686a2fa819aa807b328cfe05e&",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss", "driver"}, -- ranks that can manage the company
        location = {
            name = "Concessionnaire",
            coords = {
                x =984.2,
                y = -219.0
            }
        }
    },
    {
        job = "otacos",
        name = "Otacos",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704261581799496/otacas.png?ex=67e29ed6&is=67e14d56&hm=5dfe53e2f406db1b88b527268201b21e21864a11ebc626e2a4086e4dc560a34e&",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss", "driver"}, -- ranks that can manage the company
        location = {
            name = "Otacos",
            coords = {
                x =984.2,
                y = -219.0
            }
        }
    },
    {
        job = "kfc",
        name = "Kfc",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704259945758730/kfc.png?ex=67e29ed6&is=67e14d56&hm=0ef3609aa60c1209ea60170fa21e409704b82bee160941fccea0c0737298cf66&",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss", "driver"}, -- ranks that can manage the company
        location = {
            name = "Kfc",
            coords = {
                x =984.2,
                y = -219.0
            }
        }
    },
    {
        job = "pizza",
        name = "Pizza",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704262135451768/pizza.png?ex=67e29ed6&is=67e14d56&hm=60effabb4f06d8bac00208afe9a82bf9e34a29cc7a4157a0339853dd84c85e2c&",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss", "driver"}, -- ranks that can manage the company
        location = {
            name = "Pizza",
            coords = {
                x =984.2,
                y = -219.0
            }
        }
    },
    {
        job = "avocats_de_paris",
        name = "Avocat",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704187652870196/avocat.png?ex=67e29ec4&is=67e14d44&hm=9ec7650d7173f915f95078a9ab196941372a65e76273cfcbd1cc5b99b49ef988&",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss", "driver"}, -- ranks that can manage the company
        location = {
            name = "Avocat",
            coords = {
                x =984.2,
                y = -219.0
            }
        }
    },
    {
        job = "vigneron",
        name = "Vigneron",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704371073978388/vigneron.png?ex=67e29ef0&is=67e14d70&hm=e62938a3bd042e8e1fc7ce5578fd016898b25e8a8242c9528698d68454b24039&",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss", "driver"}, -- ranks that can manage the company
        location = {
            name = "Vigneron",
            coords = {
                x =984.2,
                y = -219.0
            }
        }
    },
    {
        job = "brinks",
        name = "Brinks",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704188177289298/brinks.png?ex=67e29ec5&is=67e14d45&hm=9c83591edb72e6644759f7e878a408b7e63af583174eb9afa44a9c4fccfcd1e7&",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss", "driver"}, -- ranks that can manage the company
        location = {
            name = "Brinks",
            coords = {
                x =984.2,
                y = -219.0
            }
        }
    },
    {
        job = "burgerking",
        name = "Burger King",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704188420427806/burgerking.png?ex=67e29ec5&is=67e14d45&hm=f9aa109e05304c3ba22ebab5ba15ca55434597c00b8ccfa543050fb355c97ca7&",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss", "driver"}, -- ranks that can manage the company
        location = {
            name = "Burger King",
            coords = {
                x =984.2,
                y = -219.0
            }
        }
    },
    {
        job = "tf1",
        name = "TF1",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704339365040148/tf1.png?ex=67e29ee9&is=67e14d69&hm=0f8f655893d650317293473622e6b9852bd1708a1945b29cf2c4b6e3300ef1e2&",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss", "driver"}, -- ranks that can manage the company
        location = {
            name = "TF1",
            coords = {
                x =984.2,
                y = -219.0
            }
        }
    },
    {
        job = "dir",
        name = "DIR",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704190026846300/dir.png?ex=67e29ec5&is=67e14d45&hm=d28256ca23b57a486396c3b6dbd5158ebb64ddef706c84647475eb8e074869fa&s",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss", "driver"}, -- ranks that can manage the company
        location = {
            name = "DIR",
            coords = {
                x =984.2,
                y = -219.0
            }
        }
    },
    {
        job = "protectsafe",
        name = "ProtectSafe",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1354071033275220082/protectsafe.png?ex=67e3f46b&is=67e2a2eb&hm=0a68084597483e3bf5678b89c7eddbacfc61a9f44f77e0bb6c18c99b26a19ba6&",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss", "driver"}, -- ranks that can manage the company
        location = {
            name = "ProtectSafe",
            coords = {
                x =984.2,
                y = -219.0
            }
        }
    },
    {
        job = "cyberbar",
        name = "Cyber Bar",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1355329342074523708/cyberbar.png?ex=67e8884f&is=67e736cf&hm=a6501c7540de83d859a8c31e8d95fe9f31e340acd8b020650594139a765d8ba3&",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss", "driver"}, -- ranks that can manage the company
        location = {
            name = "Cyber Bar",
            coords = {
                x =984.2,
                y = -219.0
            }
        }
    },
    
}

Config.Companies.Contacts = { -- not needed if you use the services app, this will add the contact to the contacts app
    -- ["police"] = {
    --     name = "Police",
    --     photo = "https://cdn-icons-png.flaticon.com/512/7211/7211100.png"
    -- },
}

Config.Companies.Management = {
    Enabled = true, -- if true, employees & the boss can manage the company

    Duty = true, -- if true, employees can go on/off duty
    -- Boss actions
    Deposit = true, -- if true, the boss can deposit money into the company
    Withdraw = true, -- if true, the boss can withdraw money from the company
    Hire = true, -- if true, the boss can hire employees
    Fire = true, -- if true, the boss can fire employees
    Promote = true, -- if true, the boss can promote employees
}

Config.CustomApps = {} -- https://docs.lbscripts.com/phone/custom-apps/

Config.Valet = {}
Config.Valet.Enabled = true -- allow players to get their vehicles from the phone
Config.Valet.Price = 10000 -- price to get your vehicle
Config.Valet.Model = `S_M_Y_XMech_01`
Config.Valet.Drive = true -- should a ped bring the car, or should it just spawn in front of the player?
Config.Valet.DisableDamages = false -- disable vehicle damages (engine & body health) on esx
Config.Valet.FixTakeOut = false -- repair the vehicle after taking it out?

Config.HouseScript = "auto" --[[
    The housing script you use on your server
    Supported:
        * loaf_housing - https://store.loaf-scripts.com/package/4310850
        * qb-houses - https://github.com/qbcore-framework/qb-houses
        * qs-housing - https://buy.quasar-store.com/package/5677308
]]

--[[ VOICE OPTIONS ]] --
Config.Voice = {}
Config.Voice.CallEffects = false -- enable call effects while on speaker mode? (NOTE: This may create sound-issues if you have too many submixes registered in your server)
Config.Voice.System = "auto"
--[[
    Supported voice systems:
        * pma: pma-voice - HIGHLY RECOMMENDED
        * mumble: mumble-voip - Not recommended, update to pma-voice
        * salty: saltychat - Not recommended, change to pma-voice
        * toko: tokovoip - Not recommended, change to pma-voice
]]

Config.Voice.HearNearby = true --[[
    Only works with pma-voice

    If true, players will be heard on instapic live if they are nearby
    If false, only the person who is live will be heard

    If true, allow nearby players to listen to phone calls if speaker is enabled
    If false, only the people in the call will be able to hear each other

    This feature is a work in progress and may not work as intended. It may have an impact on performance.
]]

Config.Voice.RecordNearby = true --[[
    Should video recordings include nearby players?
]]

--[[ PHONE OPTIONS ]] --
Config.Locations = { -- Locations that'll appear in the maps app.
    {
        position = vector2(428.9, -984.5),
        name = "Police National",
        description = "Poste Police National",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704337465147423/police_nationale.png?ex=67e29ee8&is=67e14d68&hm=81d6c1531c715c26da6014e7b4f94bd9d063d45533978d5d9891fa514318b46e&",
    },
    {
        position = vector2(-1860.76, -355.25),
        name = "Samu",
        description = "Centre hospitalier",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704338505338910/samu.png?ex=67e29ee8&is=67e14d68&hm=1fec92dc257eb4a8ee6ce2c3cabc41a7ddc30be3b15a83b03f5ddffafe23129a&",
    },
    {
        position = vector2(-826.72, -434.01),
        name = "Phantom Garage",
        description = "Garage Phantom",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704260566519918/midas.png?ex=67e29ed6&is=67e14d56&hm=449843b74b82a496e99f1680563d4862fb0d3cf757242523453bfc104870637d&",
    },
    {
        position = vector2(535.97, -184.51),
        name = "Auto Exotic",
        description = "Garage Auto Exotic",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704261116100648/norauto.png?ex=67e29ed6&is=67e14d56&hm=212293cb94ce2c2e40fdc5d93030c9a8a1d3faff5bf513f1dedb66f3bea9bf78&",
    },
    {
        position = vector2(-261.88, -900.95),
        name = "Orpi",
        description = "Agence Immobilière Orpi",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704261367631963/orpi.png?ex=67e29ed6&is=67e14d56&hm=a543a129f911e89f816520dfe94a0a239290a563935b63c52b573b800df98967&",
    },
    {
        position = vector2(53.05, -798.65),
        name = "Burger King",
        description = "Restauration Burger King",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704188420427806/burgerking.png?ex=67e29ec5&is=67e14d45&hm=f9aa109e05304c3ba22ebab5ba15ca55434597c00b8ccfa543050fb355c97ca7&",
    },
    {
        position = vector2(100.53, -1419.08),
        name = "O Tacos",
        description = "Restauration O Tacos",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704261581799496/otacas.png?ex=67e29ed6&is=67e14d56&hm=5dfe53e2f406db1b88b527268201b21e21864a11ebc626e2a4086e4dc560a34e&",
    },
    {
        position = vector2(-1179.64, -884.88),
        name = "KFC",
        description = "Restauration KFC",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704259945758730/kfc.png?ex=67e29ed6&is=67e14d56&hm=0ef3609aa60c1209ea60170fa21e409704b82bee160941fccea0c0737298cf66&",
    },
    {
        position = vector2(2516.95, -384.31),
        name = "Gendarmerie National",
        description = "Poste Gendarmerie National",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704259660550224/gendarmerie.png?ex=67e29ed6&is=67e14d56&hm=12473b38bd539618352ba0cc1bef79269a37f89a10feb53c15233e4956bfeb39&",
    },
    {
        position = vector2(1102.71, 2663.35),
        name = "Concessionnaire",
        description = "Concessionnaire Evry",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704189775319101/concess.png?ex=67e29ec5&is=67e14d45&hm=3abeddeb5535d1ac2f26c71fe6a1a102d917166686a2fa819aa807b328cfe05e&",
    },
    {
        position = vector2(915.57, 46.52),
        name = "Casino",
        description = "Casino",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704189527588905/casino.png?ex=67e29ec5&is=67e14d45&hm=f6656fd73969395036b091563d3f8d8fcb8525d5bd3beb0f6547fb21d47372e1&",
    },
    {
        position = vector2(-1755.34, -756.41),
        name = "DIR",
        description = "Direction interdépartementale des routes",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704190026846300/dir.png?ex=67e29ec5&is=67e14d45&hm=d28256ca23b57a486396c3b6dbd5158ebb64ddef706c84647475eb8e074869fa&",
    },
    {
        position = vector2(-518.16, -19.01),
        name = "Tabac",
        description = "Bar Tabac",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704338781896797/tabac.png?ex=67e29ee8&is=67e14d68&hm=5cf7ddaa4093960a794d8b78d986532701bdc4a538391dd72471eb1f9498a145&",
    },
    {
        position = vector2(-555.7, -638.76),
        name = "Mairie",
        description = "Mairie de Paris",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704338102681631/prefecture.png?ex=67e29ee8&is=67e14d68&hm=7a29ea7cf2be39b7c87dbf78147e83d54085c2b5bfd0e24da0d3b465eb6f75d6&",
    },
    {
        position = vector2(-379.16, 223.18),
        name = "Maisonette 10",
        description = "Boite de nuit Maisonette 10",
        icon = "https://cdn-icons-png.flaticon.com/128/1032/1032989.png",
    },
    {
        position = vector2(1706.09, 3777.02),
        name = "Pizza",
        description = "Pizzeria Evry",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704262135451768/pizza.png?ex=67e29ed6&is=67e14d56&hm=60effabb4f06d8bac00208afe9a82bf9e34a29cc7a4157a0339853dd84c85e2c&",
    },
    {
        position = vector2(-286.78, 6125.86),
        name = "Brinks",
        description = "Transports de Fonds",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704188177289298/brinks.png?ex=67e29ec5&is=67e14d45&hm=9c83591edb72e6644759f7e878a408b7e63af583174eb9afa44a9c4fccfcd1e7&",
    },
    {
        position = vector2(1778.73, 3629.51),
        name = "Tribunal",
        description = "Tribunal Avocat et Juge",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1353704187652870196/avocat.png?ex=67e29ec4&is=67e14d44&hm=9ec7650d7173f915f95078a9ab196941372a65e76273cfcbd1cc5b99b49ef988&",
    },
    {
        position = vector2(340.72, -944.02),
        name = "CyberBar",
        description = "Bar et boite de nuit",
        icon = "https://cdn.discordapp.com/attachments/1353703511669604353/1355329342074523708/cyberbar.png?ex=67e8884f&is=67e736cf&hm=a6501c7540de83d859a8c31e8d95fe9f31e340acd8b020650594139a765d8ba3&",
    },
}

Config.Locales = { -- If your desired language isn't here, you may contribute at https://github.com/lbphone/lb-phone-locales
    {
        locale = "en",
        name = "English"
    },
    {
        locale = "de",
        name = "Deutsch"
    },
    {
        locale = "fr",
        name = "Français"
    },
    {
        locale = "es",
        name = "Español"
    },
    {
        locale = "nl",
        name = "Nederlands"
    },
    {
        locale = "dk",
        name = "Dansk"
    },
    {
        locale = "no",
        name = "Norsk"
    },
    {
        locale = "th",
        name = "ไทย"
    },
    {
        locale = "ar",
        name = "عربي"
    },
    {
        locale = "ru",
        name = "Русский"
    },
    {
        locale = "cs",
        name = "Czech"
    },
    {
        locale = "sv",
        name = "Svenska"
    },
    {
        locale = "pl",
        name = "Polski"
    },
    {
        locale = "hu",
        name = "Magyar"
    },
    {
        locale = "tr",
        name = "Türkçe"
    },
    {
        locale = "pt-br",
        name = "Português (Brasil)"
    },
    {
        locale = "pt-pt",
        name = "Português"
    },
    {
        locale = "it",
        name = "Italiano"
    },
    {
        locale = "ua",
        name = "Українська"
    },
    {
        locale = "ba",
        name = "Bosanski"
    },
    {
        locale = "zh-cn",
        name = "简体中文 (Chinese Simplified)"
    },
    {
        locale = "ro",
        name = "Romana"
    },
}

Config.DefaultLocale = "fr"
Config.DateLocale = "fr-FR" -- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat
Config.DateFormat = "auto" -- auto: use the date format from the locale, or set a custom format (e.g. "DDDD, MMMM DD")

Config.FrameColor = "#39334d" -- This is the color of the phone frame. Default (#39334d) is SILVER.
Config.AllowFrameColorChange = true -- Allow players to change the color of their phone frame?

Config.PhoneNumber = {}
Config.PhoneNumber.Format = "+{2} {2}-{2}-{2}-{2}" -- Don't touch unless you know what you're doing. IMPORTANT: The sum of the numbers needs to be equal to the phone number length + prefix length
Config.PhoneNumber.Length = 10 -- This is the length of the phone number WITHOUT the prefix.
Config.PhoneNumber.Prefixes = { -- These are the first numbers of the phone number, usually the area code. They all need to be the same length
    "33",
    "34"
}

Config.Battery = {} -- WITH THESE SETTINGS, A FULL CHARGE WILL LAST AROUND 2 HOURS.
Config.Battery.Enabled = false -- Enable battery on the phone, you'll need to use the exports to charge it.
Config.Battery.ChargeInterval = { 5, 10 } -- How much battery
Config.Battery.DischargeInterval = { 50, 60 } -- How many seconds for each percent to be removed from the battery
Config.Battery.DischargeWhenInactiveInterval = { 80, 120 } -- How many seconds for each percent to be removed from the battery when the phone is inactive
Config.Battery.DischargeWhenInactive = true -- Should the phone remove battery when the phone is closed?

Config.CurrencyFormat = "€%s" -- ($100) Choose the formatting of the currency. %s will be replaced with the amount.
Config.MaxTransferAmount = 150000 -- The maximum amount of money that can be transferred at once via wallet / messages.
Config.TransferOffline = false -- Allow players to transfer money to offline players via the wallet app?

Config.TransferLimits = {}
Config.TransferLimits.Daily = false -- The maximum amount of money that can be transferred in a day. Set to false for unlimited.
Config.TransferLimits.Weekly = false -- The maximum amount of money that can be transferred in a week. Set to false for unlimited.

Config.EnableMessagePay = true -- Allow players to pay other players via messages?
Config.EnableVoiceMessages = true -- Allow players to send voice messages?
Config.EnableGIFs = true

Config.CityName = "Paris Horizon" -- The name that's being used in the weather app etc.
Config.RealTime = true -- if true, the time will use real life time depending on where the user lives, if false, the time will be the ingame time.
Config.CustomTime = false -- NOTE: disable Config.RealTime if using this. you can set this to a function that returns custom time, as a table: { hour = 0-24, minute = 0-60 }

Config.EmailDomain = "parishorizon.com"
Config.AutoCreateEmail = false -- should the phone automatically create an email for the player when they set up the phone?
Config.DeleteMail = true -- allow players to delete mails in the mail app?
Config.ConvertMailToMarkdown = false -- convert mails from html to markdown?

Config.DeleteMessages = true -- allow players to delete messages in the messages app?

Config.SyncFlash = true -- should flashlights be synced across all players? May have an impact on performance
Config.EndLiveClose = false -- should InstaPic live end when you close the phone?

Config.AllowExternal = { -- allow people to upload external images? (note: this means they can upload nsfw / gore etc)
    Gallery = false, -- allow importing external links to the gallery?
    Birdy = false, -- set to true to enable external images on that specific app, set to false to disable it.
    InstaPic = false,
    Spark = false,
    Trendy = false,
    Pages = false,
    MarketPlace = false,
    Mail = false,
    Messages = false,
    Other = false, -- other apps that don't have a specific setting (ex: setting a profile picture for a contact, backgrounds for the phone etc)
}

-- Blacklisted domains for external images. You will not be able to upload from these domains.
Config.ExternalBlacklistedDomains = {
    "imgur.com",
    "discord.com",
    "discordapp.com",
}

-- Whitelisted domains for external images. If this is not empty/nil/false, you will only be able to upload images from these domains.
Config.ExternalWhitelistedDomains = {
    -- "fivemanage.com"
}

-- Set to false/empty to disable
Config.UploadWhitelistedDomains = { -- domains that are allowed to upload images to the phone (prevent using devtools to upload images)
    "fivemanage.com",
    "cfx.re" -- lb-upload
}

Config.WordBlacklist = {}
Config.WordBlacklist.Enabled = false
Config.WordBlacklist.Apps = { -- apps that should use the word blacklist (if Config.WordBlacklist.Enabled is true)
    Birdy = true,
    InstaPic = true,
    Trendy = true,
    Spark = true,
    Messages = true,
    Pages = true,
    MarketPlace = true,
    DarkChat = true,
    Mail = true,
    Other = true,
}
Config.WordBlacklist.Words = {
    -- array of blacklisted words, e.g. "badword", "anotherbadword"
}

Config.AutoFollow = {}
Config.AutoFollow.Enabled = false

Config.AutoFollow.Birdy = {}
Config.AutoFollow.Birdy.Enabled = true
Config.AutoFollow.Birdy.Accounts = {} -- array of usernames to automatically follow when creating an account. e.g. "username", "anotherusername"

Config.AutoFollow.InstaPic = {}
Config.AutoFollow.InstaPic.Enabled = true
Config.AutoFollow.InstaPic.Accounts = {} -- array of usernames to automatically follow when creating an account. e.g. "username", "anotherusername"

Config.AutoFollow.Trendy = {}
Config.AutoFollow.Trendy.Enabled = true
Config.AutoFollow.Trendy.Accounts = {} -- array of usernames to automatically follow when creating an account. e.g. "username", "anotherusername"

Config.AutoBackup = true -- should the phone automatically create a backup when you get a new phone?

Config.Post = {} -- What apps should send posts to discord? You can set your webhooks in server/webhooks.lua
Config.Post.Birdy = true -- Announce new posts on Birdy?
Config.Post.InstaPic = true -- Anmnounce new posts on InstaPic?
Config.Post.Accounts = {
    Birdy = {
        Username = "Birdy",
        Avatar = "https://loaf-scripts.com/fivem/lb-phone/icons/Birdy.png"
    },
    InstaPic = {
        Username = "InstaPic",
        Avatar = "https://loaf-scripts.com/fivem/lb-phone/icons/InstaPic.png"
    }
}

Config.BirdyTrending = {}
Config.BirdyTrending.Enabled = true -- show trending hashtags?
Config.BirdyTrending.Reset = 7 * 24 -- How often should trending hashtags be reset on birdy? (in hours)

Config.BirdyNotifications = false -- should everyone get a notification when someone posts? (if set to false, only followers will get a notification)
Config.InstaPicLiveNotifications = false -- should everyone get a notification when someone goes live on InstaPic? (if set to false, only followers will get a notification)

Config.PromoteBirdy = {}
Config.PromoteBirdy.Enabled = true -- should you be able to promote post?
Config.PromoteBirdy.Cost = 2500 -- how much does it cost to promote a post?
Config.PromoteBirdy.Views = 100 -- how many views does a promoted post get?

Config.UsernameFilter = {
    Regex = "[a-zA-Z0-9]+", -- This regex is used to clean up usernames in mentions & account creation
    LuaPattern = "^[%w]+$", -- This pattern is used to ensure the username doesn't contain any special characters when creating an account
}

Config.TrendyTTS = {
    {"English (US) - Female", "en_us_001"},
    {"English (US) - Male 1", "en_us_006"},
    {"English (US) - Male 2", "en_us_007"},
    {"English (US) - Male 3", "en_us_009"},
    {"English (US) - Male 4", "en_us_010"},

    {"English (UK) - Male 1", "en_uk_001"},
    {"English (UK) - Male 2", "en_uk_003"},

    {"English (AU) - Female", "en_au_001"},
    {"English (AU) - Male", "en_au_002"},

    {"French - Male 1", "fr_001"},
    {"French - Male 2", "fr_002"},

    {"German - Female", "de_001"},
    {"German - Male", "de_002"},

    {"Spanish - Male", "es_002"},

    {"Spanish (MX) - Male", "es_mx_002"},

    {"Portuguese (BR) - Female 2", "br_003"},
    {"Portuguese (BR) - Female 3", "br_004"},
    {"Portuguese (BR) - Male", "br_005"},

    {"Indonesian - Female", "id_001"},

    {"Japanese - Female 1", "jp_001"},
    {"Japanese - Female 2", "jp_003"},
    {"Japanese - Female 3", "jp_005"},
    {"Japanese - Male", "jp_006"},

    {"Korean - Male 1", "kr_002"},
    {"Korean - Male 2", "kr_004"},
    {"Korean - Female", "kr_003"},

    {"Ghostface (Scream)", "en_us_ghostface"},
    {"Chewbacca (Star Wars)", "en_us_chewbacca"},
    {"C3PO (Star Wars)", "en_us_c3po"},
    {"Stitch (Lilo & Stitch)", "en_us_stitch"},
    {"Stormtrooper (Star Wars)", "en_us_stormtrooper"},
    {"Rocket (Guardians of the Galaxy)", "en_us_rocket"},

    {"Singing - Alto", "en_female_f08_salut_damour"},
    {"Singing - Tenor", "en_male_m03_lobby"},
    {"Singing - Sunshine Soon", "en_male_m03_sunshine_soon"},
    {"Singing - Warmy Breeze", "en_female_f08_warmy_breeze"},
    {"Singing - Glorious", "en_female_ht_f08_glorious"},
    {"Singing - It Goes Up", "en_male_sing_funny_it_goes_up"},
    {"Singing - Chipmunk", "en_male_m2_xhxs_m03_silly"},
    {"Singing - Dramatic", "en_female_ht_f08_wonderful_world"}
}

-- ICE Servers for WebRTC (ig live, live video). If you don't know what you're doing, leave this as it is.
-- see https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection/RTCPeerConnection
-- Config.RTCConfig = {
--     iceServers = {
--         { urls = "stun:stun.l.google.com:19302" },
--     }
-- }

Config.Crypto = {}
Config.Crypto.Enabled = true
Config.Crypto.Coins = {"bitcoin","ethereum","tether","binancecoin","usd-coin","ripple","binance-usd","cardano","dogecoin","solana","shiba-inu","polkadot","litecoin","bitcoin-cash"}
Config.Crypto.Currency = "usd" -- currency to use for crypto prices. https://api.coingecko.com/api/v3/simple/supported_vs_currencies
Config.Crypto.Refresh = 5 * 60 * 1000 -- how often should the crypto prices be refreshed (client cache)? (Default 5 minutes)
Config.Crypto.QBit = false -- support QBit? (requires qb-crypto & qb-core)
Config.Crypto.Limits = {}
Config.Crypto.Limits.Buy = 1000000 -- how much ($) you can buy for at once
Config.Crypto.Limits.Sell = 1000000 -- how much ($) you can sell at once

Config.KeyBinds = {
    -- Find keybinds here: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    Open = { -- toggle the phone
        Command = "togglephone",
        Bind = "M",
        Description = "Ouvrir Telephone"
    },
    Focus = { -- keybind to toggle the mouse cursor.
        Command = "togglePhoneFocus",
        Bind = "LMENU",
        Description = "Toggle cursor on your phone"
    },
    StopSounds = { -- in case the sound would bug out, you can use this command to stop all sounds.
        Command = "stopSounds",
        Bind = false,
        Description = "Stop all phone sounds"
    },

    FlipCamera = {
        Command = "flipCam",
        Bind = "UP",
        Description = "Flip phone camera"
    },
    TakePhoto = {
        Command = "takePhoto",
        Bind = "RETURN",
        Description = "Take a photo / video"
    },
    ToggleFlash = {
        Command = "toggleCameraFlash",
        Bind = "E",
        Description = "Toggle flash"
    },
    LeftMode = {
        Command = "leftMode",
        Bind = "LEFT",
        Description = "Change mode"
    },
    RightMode = {
        Command = "rightMode",
        Bind = "RIGHT",
        Description = "Change mode"
    },
    RollLeft = {
        Command = "cameraRollLeft",
        Bind = "Z",
        Description = "Roll camera to the left"
    },
    RollRight = {
        Command = "cameraRollRight",
        Bind = "C",
        Description = "Roll camera to the right"
    },
    FreezeCamera = {
        Command = "cameraFreeze",
        Bind = "X",
        Description = "Freeze camera"
    },

    AnswerCall = {
        Command = "answerCall",
        Bind = "RETURN",
        Description = "Answer incoming call"
    },
    DeclineCall = {
        Command = "declineCall",
        Bind = "BACK",
        Description = "Decline incoming call"
    },
    UnlockPhone = {
        Bind = "SPACE",
        Description = "Open your phone",
    },
}

Config.KeepInput = true -- keep input when nui is focused (meaning you can walk around etc)

--[[ PHOTO / VIDEO OPTIONS ]] --
Config.Camera = {}
Config.Camera.Enabled = true -- use a custom camera that allows you to walk around while taking photos?
Config.Camera.Roll = true -- allow rolling the camera to the left & right?
Config.Camera.AllowRunning = true
Config.Camera.MaxFOV = 60.0 -- higher = zoomed out
Config.Camera.MinFOV = 10.0 -- lower = zoomed in
Config.Camera.MaxLookUp = 80.0
Config.Camera.MaxLookDown = -80.0

Config.Camera.Vehicle = {}
Config.Camera.Vehicle.Zoom = true -- allow zooming in vehicles?
Config.Camera.Vehicle.MaxFOV = 80.0
Config.Camera.Vehicle.MinFOV = 10.0
Config.Camera.Vehicle.MaxLookUp = 50.0
Config.Camera.Vehicle.MaxLookDown = -30.0
Config.Camera.Vehicle.MaxLeftRight = 120.0
Config.Camera.Vehicle.MinLeftRight = -120.0

Config.Camera.Selfie = {}
Config.Camera.Selfie.Offset = vector3(0.05, 0.55, 0.6)
Config.Camera.Selfie.Rotation = vector3(10.0, 0.0, -180.0)
Config.Camera.Selfie.MaxFov = 90.0
Config.Camera.Selfie.MinFov = 50.0

Config.Camera.Freeze = {}
Config.Camera.Freeze.Enabled = false -- allow players to freeze the camera when taking photos? (this will make it so they can take photos in 3rd person)
Config.Camera.Freeze.MaxDistance = 10.0 -- max distance the camera can be from the player when frozen
Config.Camera.Freeze.MaxTime = 60 -- max time the camera can be frozen for (in seconds)

-- Set your api keys in lb-phone/server/apiKeys.lua
Config.UploadMethod = {}
-- You can edit the upload methods in lb-phone/shared/upload.lua
-- We recommend Fivemanage, https://fivemanage.com
-- A video tutorial for how to set up Fivemanage can be found here: https://www.youtube.com/watch?v=y3bCaHS6Moc
-- If you want to host uploads yourself, you can use LBUpload: https://github.com/lbphone/lb-upload
-- We STRONGLY discourage using Discord as an upload method, as uploaded files may become inaccessible after a while.
Config.UploadMethod.Video = "Fivemanage" -- "Fivemanage" or "LBUpload" or "Custom"
Config.UploadMethod.Image = "Fivemanage" -- "Fivemanage" or "LBUpload" or "Custom
Config.UploadMethod.Audio = "Fivemanage" -- "Fivemanage" or "LBUpload" or "Custom"

Config.Video = {}
Config.Video.Bitrate = 400 -- video bitrate (kbps), increase to improve quality, at the cost of file size
Config.Video.FrameRate = 24 -- video framerate (fps), 24 fps is a good mix between quality and file size used in most movies
Config.Video.MaxSize = 25 -- max video size (MB)
Config.Video.MaxDuration = 60 -- max video duration (seconds)

Config.Image = {}
Config.Image.Mime = "image/webp" -- image mime type, "image/webp" or "image/png" or "image/jpg"
Config.Image.Quality = 0.95
