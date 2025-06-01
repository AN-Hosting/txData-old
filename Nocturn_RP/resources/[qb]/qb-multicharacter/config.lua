Config = {}
Config.Interior = vector3(-1004.67, -477.0, 50.03) -- Interior to load where characters are previewed
Config.DefaultSpawn = vector3(-1044.07, -2772.21, 4.64) -- Default spawn coords if you have start apartments disabled
Config.PedCoords = vector4(-1006.82, -478.26, 50.03, 206.66) -- Create preview ped at these coordinates
Config.HiddenCoords = vector4(-1001.09, -476.87, 50.03, 126.59) -- Hides your actual ped while you are in selection
Config.CamCoords = vector4(-1005.32, -480.62, 50.03, 28.86) -- Camera coordinates for character preview screen
Config.EnableDeleteButton = false -- Define if the player can delete the character or not
Config.customNationality = false -- Defines if Nationality input is custom of blocked to the list of Countries
Config.SkipSelection = false -- Skip the spawn selection and spawns the player at the last location

Config.DefaultNumberOfCharacters = 1  -- Define maximum amount of default characters (maximum 5 characters defined by default)
Config.PlayersNumberOfCharacters = { -- Define maximum amount of player characters by rockstar license (you can find this license in your server's database in the player table)
    -- { license = "license:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", numberOfChars = 2 },
}