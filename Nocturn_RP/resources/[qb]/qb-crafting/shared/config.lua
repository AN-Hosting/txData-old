Config = {}

Config.EnableSkillCheck = false
Config.ImageBasePath = "nui://qs-inventory/html/images/"

-- Options des zones
Config.Zones = {
    debugPoly = true,     -- Afficher les polygones de debug
    size = {
        length = 1.0,     -- Longueur des boxzones
        width = 2.0,      -- Largeur des boxzones
        verticalOffset = 1.0  -- Offset vertical (au-dessus et en-dessous du point)
    },
    interaction = {
        distance = 3.0    -- Distance d'interaction
    }
}

-- Liste des configurations à charger
local configFiles = {
    'police',
    'medical',
    'catcafe',
    'burgershot'
}

-- Configuration dynamique des tables de craft
Config.CraftingTables = {}

-- Chargement direct des configurations
for _, configName in ipairs(configFiles) do
    local configPath = ('shared/configs/%s.lua'):format(configName)
    local configFile = LoadResourceFile(GetCurrentResourceName(), configPath)
    if configFile then
        local chunk, err = load(configFile, configPath, 't')
        if chunk then
            local success, result = pcall(chunk)
            if success and result then
                Config[configName:upper() .. 'Crafting'] = result
                if type(result) == 'table' then
                    for _, table in pairs(result) do
                        if table.coords then
                            Config.CraftingTables[#Config.CraftingTables + 1] = table
                        else
                            print("^1[QB-Crafting] Table invalide dans " .. configName .. " (coords manquantes)^7")
                        end
                    end
                end
            else
                print("^1[QB-Crafting] Erreur dans " .. configPath .. ": " .. tostring(result) .. "^7")
            end
        else
            print("^1[QB-Crafting] Erreur de syntaxe dans " .. configPath .. ": " .. tostring(err) .. "^7")
        end
    else
        print("^1[QB-Crafting] Fichier non trouvé: " .. configPath .. "^7")
    end
end

print("^2[QB-Crafting] " .. #Config.CraftingTables .. " tables de craft chargées^7") 