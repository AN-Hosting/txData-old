Config = {}
Config.Interior = vector3(-84.78, -829.14, 222.0) -- Interior to load where characters are previewed
Config.DefaultSpawn = vector3(-1035.71, -2731.87, 12.86) -- Default spawn coords if you have start apartments disabled
Config.PedCoords = vector4(-85.88, -834.2, 222.0, 275.0) -- Create preview ped at these coordinates
Config.HiddenCoords = vector4(-84.91, -824.72, 222.0, 14.72) -- Hides your actual ped while you are in selection
Config.CamCoords = vector4(-84.09, -834.0, 221.93, 96.82) -- Camera coordinates for character preview screen
Config.EnableDeleteButton = false -- Define if the player can delete the character or not
Config.customNationality = false -- Defines if Nationality input is custom of blocked to the list of Countries
Config.SkipSelection = true -- Skip the spawn selection and spawns the player at the last location

Config.DefaultNumberOfCharacters = 1 -- Define maximum amount of default characters (maximum 5 characters defined by default)
Config.PlayersNumberOfCharacters = { -- Define maximum amount of player characters by rockstar license (you can find this license in your server's database in the player table)
    { license = "license:79b355c37aff2d003091800c4e52f531a801c1a1", numberOfChars = 4 }, -- Nico
    { license = "license:07451e3c9f7a322fb30c44791735aa8b037c9078", numberOfChars = 4 }, -- Minox
    { license = "license:3d0f61a039b8eeab05905900b0d47d15fe3b062c", numberOfChars = 4 }, -- TOTO
}