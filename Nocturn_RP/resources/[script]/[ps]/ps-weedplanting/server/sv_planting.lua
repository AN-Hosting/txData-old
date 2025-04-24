local globalState = GlobalState
local HealthBaseDecay = math.random(Config.HealthBaseDecay[1], Config.HealthBaseDecay[2])

local WeedPlantCache = {}

-- WeedPlant class
-- Represents an individual weed plant with properties for tracking growth, health, water, and fertilizer levels.
-- Each plant is stored in the global WeedPlants table and managed via MySQL.

--- @type table<any, WeedPlant>
--- Global table holding all WeedPlant instances, keyed by their unique ID.
local WeedPlants = {}

--- @class WeedPlant
--- @field id number The unique identifier of the weed plant.
--- @field coords vector3 The coordinates of the weed plant in the game world.
--- @field time number The planting time (Unix timestamp).
--- @field gender string The gender of the plant, "female" or "male".
--- @field fertilizer table A table containing timestamps of fertilizer applications.
--- @field water table A table containing timestamps of water applications.

local WeedPlant = {}
WeedPlant.__index = WeedPlant

--- Creates a new WeedPlant instance.
--- @param id number The unique identifier of the weed plant.
--- @param coords vector3 The coordinates of the weed plant in the game world.
--- @param time number The planting time (Unix timestamp).
--- @param gender string The gender of the plant, "female" or "male".
--- @param fertilizer table A table containing timestamps of fertilizer applications.
--- @param water table A table containing timestamps of water applications.
--- @return DrugLab The created DrugLab object.
function WeedPlant:create(id, coords, time, gender, fertilizer, water)
    local plant = setmetatable({}, WeedPlant)

    plant.id = id
    plant.coords = coords
    plant.time = time or os.time()
    plant.gender = gender or "female"
    plant.fertilizer = fertilizer or {}
    plant.water = water or {}

    WeedPlants[id] = plant
    WeedPlantCache[id] = {
        coords = coords,
        time = time
    }

    return plant
end

--- Inserts a new weed plant into the database, creating a new WeedPlant instance.
--- @param coords (vector3) - Coordinates of the plant
--- @return plant (WeedPlant) or false, error message if failed
function WeedPlant:new(coords)
    if not coords or type(coords) ~= "vector3" then
        print('^3[ps-weedplanting] ^1Erreur dans WeedPlant:new - Coords invalides^7')
        return false, "Coords must be a vector3"
    end

    local time = os.time()
    print('^3[ps-weedplanting] ^5Insertion dans la base de données - Temps: ' .. time .. '^7')
    print('^3[ps-weedplanting] ^5Coordonnées en JSON: ' .. json.encode(coords) .. '^7')

    local id
    local success, result = pcall(function()
        return MySQL.insert.await([[
            INSERT INTO `weedplants` (`coords`, `time`, `fertilizer`, `water`, `gender`)
            VALUES (:coords, :time, :fertilizer, :water, :gender)
        ]], {
            coords = json.encode(coords),
            time = os.date('%Y-%m-%d %H:%M:%S', time),
            fertilizer = json.encode({}),
            water = json.encode({}),
            gender = 'female'
        })
    end)

    if not success then
        print('^3[ps-weedplanting] ^1Erreur SQL: ' .. tostring(result) .. '^7')
        return false, "SQL error: " .. tostring(result)
    end

    id = result
    print('^3[ps-weedplanting] ^5ID reçu de la base de données: ' .. tostring(id) .. '^7')

    if not id then
        print('^3[ps-weedplanting] ^1Échec de l\'insertion dans la base de données^7')
        return false, "Failed to insert new weedplant into database"
    end

    -- Create and return the WeedPlant object using newly generated ID.
    print('^3[ps-weedplanting] ^5Création de l\'objet plante^7')
    local plant = WeedPlant:create(id, coords, time, 'female', {}, {})
    print('^3[ps-weedplanting] ^5Objet plante créé avec ID: ' .. tostring(plant.id) .. '^7')

    -- Update clients cache
    print('^3[ps-weedplanting] ^5Envoi de l\'événement NewPlant à tous les clients^7')
    TriggerClientEvent('weedplanting:client:NewPlant', -1, id, coords, time)
    
    return plant
end

--- Removes the plant from the database and clears it from WeedPlants.
--- Optionally triggers a fire effect if policeDestroy is true.
--- @param policeDestroy (boolean) - Indicates if the plant is destroyed by police
--- @return success (boolean), message (string)
function WeedPlant:remove(policeDestroy)
    local id = self.id
    local coords = self.coords
    
    print('^3[ps-weedplanting] ^5Tentative de suppression de la plante ' .. id .. '^7')

    -- Vérifier que la plante existe avant de la supprimer
    if not WeedPlants[id] then
        print('^3[ps-weedplanting] ^1Erreur: Plante ' .. id .. ' n\'existe pas dans WeedPlants^7')
        return false, "Plant doesn't exist in WeedPlants table"
    end
    
    -- Supprimer d'abord de la mémoire
    WeedPlants[id] = nil
    WeedPlantCache[id] = nil
    print('^3[ps-weedplanting] ^5Plante supprimée de la mémoire^7')
    
    -- Puis suppression de la base de données
    local query_success = false
    local query_error = nil
    
    pcall(function()
        query_success = MySQL.query.await([[
            DELETE FROM `weedplants`
            WHERE `id` = :id
        ]], { 
            id = id
        })
    end)
    
    print('^3[ps-weedplanting] ^5Résultat de la requête SQL: ' .. tostring(query_success) .. '^7')
    
    if policeDestroy then
        print('^3[ps-weedplanting] ^5Envoi de l\'événement FireGoBrrrrrrr pour la plante^7')
        TriggerClientEvent('weedplanting:client:FireGoBrrrrrrr', -1, coords)
        Wait(Config.FireTime)
    end

    -- Update clients cache
    print('^3[ps-weedplanting] ^5Envoi de l\'événement RemovePlant à tous les clients^7')
    TriggerClientEvent('weedplanting:client:RemovePlant', -1, id)

    if query_success then
        return true, ("Successfully deleted weedplant from database with id %s"):format(id)
    else
        -- Même en cas d'erreur SQL, on a supprimé de la mémoire, donc on considère que c'est un succès
        print('^3[ps-weedplanting] ^3Avertissement: Plante supprimée de la mémoire mais pas de la base de données^7')
        return true, ("Plant deleted from memory but not from database with id %s"):format(id)
    end
end

--- Sets a specific property of the plant instance.
--- @param property (string) - Property to set
--- @param value - New value for the property
function WeedPlant:set(property, value)
    self[property] = value
end

--- Saves the current state of the plant to the database.
--- @return success (boolean) - True if rows were affected
function WeedPlant:save()
    local affectedRows = MySQL.update.await([[
        UPDATE `weedplants` SET
            `coords` = :coords,
            `time` = :time,
            `fertilizer` = :fertilizer,
            `water` = :water,
            `gender` = :gender
        WHERE `id` = :id
    ]], {
        coords = json.encode(self.coords),
        time = os.date('%Y-%m-%d %H:%M:%S', self.time),
        fertilizer = json.encode(self.fertilizer),
        water = json.encode(self.water),
        gender = self.gender,
        id = self.id
    })

    return affectedRows > 0
end

--- Retrieves a WeedPlant instance by its ID.
--- @param id (number) - ID of the plant
--- @return WeedPlant instance or nil if not found
function WeedPlant:getPlant(id)
    return WeedPlants[id]
end

--- Calculates the plant's growth progress as a percentage.
--- @return growth (number) - Growth percentage (0-100)
function WeedPlant:calcGrowth()
    local current_time = os.time()
    local growTime = Config.GrowTime * 60
    local progress = os.difftime(current_time, self.time)
    local growth = lib.math.round(progress * 100 / growTime, 2)

    return math.min(growth, 100.00)
end

--- Determines the growth stage of the plant.
--- @return stage (number) - Growth stage (1-5)
function WeedPlant:calcStage()
    local current_time = os.time()
    local growTime = Config.GrowTime * 60
    local progress = os.difftime(current_time, self.time)
    local growth = math.min(lib.math.round(progress * 100 / growTime, 2), 100.00)

    local growthThreshold = 20
    
    return math.min(5, math.floor((growth - 1) / growthThreshold) + 1)
end

--- Calculates the remaining fertilizer level as a percentage.
--- @return fertilizer (number) - Fertilizer level percentage (0-100)
function WeedPlant:calcFertilizer()
    local current_time = os.time()

    if #self.fertilizer == 0 then
        return 0
    else
        local last_fertilizer = self.fertilizer[#self.fertilizer]
        local time_elapsed = os.difftime(current_time, last_fertilizer)
        local fertilizer = lib.math.round(100 - (time_elapsed / 60 * Config.FertilizerDecay), 2)

        return math.max(fertilizer, 0.00)
    end
end

--- Calculates the remaining water level as a percentage.
--- @return water (number) - Water level percentage (0-100)
function WeedPlant:calcWater()
    local current_time = os.time()

    if #self.water == 0 then
        return 0
    else
        local last_water = self.water[#self.water]
        local time_elapsed = os.difftime(current_time, last_water)
        local water = lib.math.round(100 - (time_elapsed / 60 * Config.WaterDecay), 2)

        return math.max(water, 0.00)
    end
end

--- Calculates the overall health of the plant based on water and fertilizer levels over time.
--- @return health (number) - Plant health percentage (0-100)
function WeedPlant:calcHealth()
    local health = 100
    local current_time = os.time()
    local planted_time = self.time
    local elapsed_time = os.difftime(current_time, planted_time)
    local intervals = math.floor(elapsed_time / 60 / Config.LoopUpdate)

    if intervals == 0 then return 100 end

    for i = 1, intervals do
        local interval_time = planted_time + math.floor(i * Config.LoopUpdate * 60)

        if #self.fertilizer == 0 then
            health -= HealthBaseDecay
        else
            -- Find last_fertilizer time before interval_time
            local last_fertilizer = planted_time

            for j = 1, #self.fertilizer, 1 do
                if self.fertilizer[j] < interval_time then
                    last_fertilizer = math.max(last_fertilizer, self.fertilizer[j])
                end
            end

            local time_since_fertilizer = os.difftime(interval_time, last_fertilizer)
            local fertilizer_amount = math.max(lib.math.round(100 - (time_since_fertilizer / 60 * Config.FertilizerDecay), 2), 0.00)

            if last_fertilizer == planted_time or fertilizer_amount < Config.FertilizerThreshold then
                health -= HealthBaseDecay
            end
        end
    
        if #self.water == 0 then
            health -= HealthBaseDecay
        else
            -- Find last_water time before interval_time
            local last_water = planted_time

            for j = 1, #self.water, 1 do
                if self.water[j] < interval_time then
                    last_water = math.max(last_water, self.water[j])
                end
            end

            local time_since_water = os.difftime(interval_time, last_water)
            local water_amount = math.max(lib.math.round(100 - (time_since_water / 60 * Config.WaterDecay), 2), 0.00)

            if last_water == planted_time or water_amount < Config.WaterThreshold then
                health -= HealthBaseDecay
            end
        end
    end

    return math.max(health, 0.0)
end

--- Fetches all data from the database and creates WeedPlant instances
local setupPlants = function()
    local clear = Config.ClearOnStartup
    local result = MySQL.Sync.fetchAll([[
        SELECT * 
        FROM `weedplants`
    ]])

    for _, data in pairs(result) do
        local coords = json.decode(data.coords)
        local fertilizer = json.decode(data.fertilizer)
        local water = json.decode(data.water)
        local time = math.round(data.time / 1000)

        local plant = WeedPlant:create(data.id, vector3(coords.x, coords.y, coords.z), time, data.gender, fertilizer, water)

        if clear then
            if plant:calcHealth() == 0 then
                utils.print(("Clear on startup plant %s"):format(plant.id))
                plant:remove()
            end
        end
    end
end

--- Events

RegisterNetEvent('weedplanting:server:CreateNewPlant', function(coords)
    local src = source
    print('^3[ps-weedplanting] ^5Événement CreateNewPlant reçu du joueur ' .. src .. '^7')
    
    local Player = server.GetPlayerFromId(src)
    if not Player then 
        print('^3[ps-weedplanting] ^1Erreur: Impossible de récupérer le joueur^7')
        return 
    end

    local PlayerData = server.getPlayerData(Player)
    print('^3[ps-weedplanting] ^5Joueur trouvé: ' .. PlayerData.name .. '^7')

    if not coords or type(coords) ~= "vector3" then 
        print('^3[ps-weedplanting] ^1Erreur: Coordonnées invalides^7')
        print('^3[ps-weedplanting] ^1Type de coords: ' .. type(coords) .. '^7')
        if coords then
            print('^3[ps-weedplanting] ^1Valeur: ' .. tostring(coords) .. '^7')
        end
        return 
    end
    
    print('^3[ps-weedplanting] ^5Coordonnées reçues: x=' .. coords.x .. ', y=' .. coords.y .. ', z=' .. coords.z .. '^7')
    
    if #(GetEntityCoords(GetPlayerPed(src)) - coords) > Config.rayCastingDistance + 10 then 
        print('^3[ps-weedplanting] ^1Erreur: Distance trop grande^7')
        return 
    end

    -- Vérification que le joueur a bien l'item
    local hasItem = server.hasItem(src, Config.FemaleSeed, 1)
    print('^3[ps-weedplanting] ^5Vérification de l\'item ' .. Config.FemaleSeed .. ': ' .. tostring(hasItem) .. '^7')
    
    if not hasItem then
        print('^3[ps-weedplanting] ^1Erreur: Le joueur n\'a pas l\'item nécessaire^7')
        return
    end

    print('^3[ps-weedplanting] ^5Tentative de retrait d\'item: ' .. Config.FemaleSeed .. '^7')
    
    -- Utilisation directe de l'export pour retirer l'item
    if exports['qs-inventory']:RemoveItem(src, Config.FemaleSeed, 1) then
        print('^3[ps-weedplanting] ^5Item retiré avec succès, création de la plante^7')
        local plant = WeedPlant:new(coords)
        
        if plant then
            print('^3[ps-weedplanting] ^5Plante créée avec succès: ' .. tostring(plant.id) .. '^7')
            server.createLog(PlayerData.name, 'New Plant', PlayerData.name .. ' (identifier: ' .. PlayerData.identifier .. ' | id: ' .. src .. ')' .. ' placed new plant ' .. coords)
        else
            print('^3[ps-weedplanting] ^1Erreur lors de la création de la plante^7')
            -- Redonner l'item au joueur car la plante n'a pas pu être créée
            exports['qs-inventory']:AddItem(src, Config.FemaleSeed, 1)
            print('^3[ps-weedplanting] ^5Item rendu au joueur^7')
        end
    else
        print('^3[ps-weedplanting] ^1Échec du retrait de l\'item^7')
        utils.notify(src, Locales['notify_title_planting'], "Impossible de retirer l'item de l'inventaire", 'error', 3000)
    end
end)

RegisterNetEvent('weedplanting:server:ClearPlant', function(plantId, policeDestroy)
    local src = source
    print('^3[ps-weedplanting] ^5Événement ClearPlant reçu du joueur ' .. src .. ' pour la plante ' .. plantId .. '^7')
    
    local Player = server.GetPlayerFromId(src)
    if not Player then 
        print('^3[ps-weedplanting] ^1Erreur: Impossible de récupérer le joueur^7')
        return 
    end

    local PlayerData = server.getPlayerData(Player)
    print('^3[ps-weedplanting] ^5Joueur trouvé: ' .. PlayerData.name .. '^7')

    local plant = WeedPlant:getPlant(plantId)
    if not plant then 
        print('^3[ps-weedplanting] ^1Erreur: Plante non trouvée: ' .. plantId .. '^7')
        return 
    end
    print('^3[ps-weedplanting] ^5Plante trouvée: ' .. plantId .. '^7')

    if #(GetEntityCoords(GetPlayerPed(src)) - plant.coords) > 10 then 
        print('^3[ps-weedplanting] ^1Erreur: Joueur trop loin de la plante^7')
        return 
    end
    
    local health = plant:calcHealth()
    print('^3[ps-weedplanting] ^5Santé de la plante: ' .. health .. '^7')

    if policeDestroy and server.isPlayerPolice(Player) then
        print('^3[ps-weedplanting] ^5Suppression par police^7')
        local success = plant:remove(true)
        print('^3[ps-weedplanting] ^5Résultat de la suppression: ' .. tostring(success) .. '^7')
        server.createLog(PlayerData.name, 'Police Destroy', PlayerData.name .. ' (identifier: ' .. PlayerData.identifier .. ' | id: ' .. src .. ')' .. ' destroyed plant ' .. plantId)
    else
        -- Supprimer la condition sur la santé pour permettre le nettoyage dans tous les cas
        print('^3[ps-weedplanting] ^5Nettoyage de plante normal^7')
        local success = plant:remove(false)
        print('^3[ps-weedplanting] ^5Résultat de la suppression: ' .. tostring(success) .. '^7')
        server.createLog(PlayerData.name, 'Clear Plant', PlayerData.name .. ' (identifier: ' .. PlayerData.identifier .. ' | id: ' .. src .. ')' .. ' cleared plant ' .. plantId)
    end
    
    -- Notification au joueur que la plante a été nettoyée
    utils.notify(src, Locales['notify_title_planting'], "Plante nettoyée avec succès.", 'success', 3000)
end)

RegisterNetEvent('weedplanting:server:HarvestPlant', function(plantId)
    local src = source
    print('^3[ps-weedplanting] ^5Événement HarvestPlant reçu du joueur ' .. src .. ' pour la plante ' .. plantId .. '^7')
    
    local Player = server.GetPlayerFromId(src)
    if not Player then 
        print('^3[ps-weedplanting] ^1Erreur: Impossible de récupérer le joueur^7')
        return 
    end

    local PlayerData = server.getPlayerData(Player)
    print('^3[ps-weedplanting] ^5Joueur trouvé: ' .. PlayerData.name .. '^7')

    local plant = WeedPlant:getPlant(plantId)
    if not plant then 
        print('^3[ps-weedplanting] ^1Erreur: Plante non trouvée: ' .. plantId .. '^7')
        return 
    end
    print('^3[ps-weedplanting] ^5Plante trouvée: ' .. plantId .. '^7')

    if #(GetEntityCoords(GetPlayerPed(src)) - plant.coords) > 10 then 
        print('^3[ps-weedplanting] ^1Erreur: Joueur trop loin de la plante^7')
        return 
    end

    local growth = plant:calcGrowth()
    print('^3[ps-weedplanting] ^5Croissance de la plante: ' .. growth .. '%^7')
    
    if growth < 100 then 
        print('^3[ps-weedplanting] ^1Erreur: Plante pas encore mature^7')
        utils.notify(src, Locales['notify_title_planting'], "La plante n'est pas encore prête à être récoltée.", 'error', 3000)
        return 
    end

    local health = plant:calcHealth()
    local gender = plant.gender
    print('^3[ps-weedplanting] ^5Santé de la plante: ' .. health .. '%, Genre: ' .. gender .. '^7')

    if gender == 'female' then
        -- Utilisation des paramètres de configuration pour les plantes femelles
        local rewardConfig = Config.Rewards.Female
        local item = rewardConfig.UseWeedItemDirect and Config.WeedItem or Config.BranchItem
        local weedAmount = math.max(rewardConfig.MinWeed, math.min(rewardConfig.MaxWeed, math.floor(health / rewardConfig.WeedPerHealth)))
        
        print('^3[ps-weedplanting] ^5Ajout de ' .. weedAmount .. ' ' .. item .. ' à l\'inventaire^7')
        
        -- Ajout d'item selon le format simplifié demandé
        exports['qs-inventory']:AddItem(src, item, weedAmount)
        
        -- Notification au joueur
        local itemName = rewardConfig.UseWeedItemDirect and "têtes de cannabis" or "branches de cannabis"
        utils.notify(src, Locales['notify_title_planting'], "Vous avez récolté " .. weedAmount .. " " .. itemName .. ".", 'success', 3000)
    else -- male seed added
        -- Utilisation des paramètres de configuration pour les plantes mâles
        local rewardConfig = Config.Rewards.Male
        
        -- Calcul et ajout des graines mâles
        local mSeeds = math.floor(health / rewardConfig.SeedsPerHealth)
        print('^3[ps-weedplanting] ^5Ajout de ' .. mSeeds .. ' graines mâles^7')
        exports['qs-inventory']:AddItem(src, Config.MaleSeed, mSeeds)

        -- Calcul et ajout des graines femelles
        local fSeeds = math.floor(health / rewardConfig.SeedsPerHealth)
        print('^3[ps-weedplanting] ^5Ajout de ' .. fSeeds .. ' graines femelles^7')
        exports['qs-inventory']:AddItem(src, Config.FemaleSeed, fSeeds)
        
        -- Gestion du bonus de weed
        local weedAmount = 0
        if rewardConfig.AddBonusWeed then
            weedAmount = math.min(rewardConfig.MaxBonusWeed, math.floor(health / rewardConfig.WeedPerHealth))
            if weedAmount > 0 then
                print('^3[ps-weedplanting] ^5Ajout de ' .. weedAmount .. ' têtes de cannabis à l\'inventaire^7')
                exports['qs-inventory']:AddItem(src, Config.WeedItem, weedAmount)
            end
        end
        
        -- Notification au joueur
        local weedText = weedAmount > 0 and " et " .. weedAmount .. " têtes de cannabis" or ""
        utils.notify(src, Locales['notify_title_planting'], "Vous avez récolté " .. mSeeds .. " graines mâles, " .. fSeeds .. " graines femelles" .. weedText .. ".", 'success', 3000)
    end

    print('^3[ps-weedplanting] ^5Suppression de la plante^7')
    plant:remove(false)

    server.createLog(PlayerData.name, 'Harvest Plant', PlayerData.name .. ' (identifier: ' .. PlayerData.identifier .. ' | id: ' .. src .. ')' .. ' harvested plant: ' .. plantId .. ' Gender: ' .. gender .. ' Health: ' .. health)
end)

RegisterNetEvent('weedplanting:server:GiveWater', function(plantId)
    local src = source
    local Player = server.GetPlayerFromId(src)
    if not Player then return end
    
    local plant = WeedPlant:getPlant(plantId)
    if not plant then return end

    if #(GetEntityCoords(GetPlayerPed(src)) - plant.coords) > 10 then return end

    -- Utilisation directe de l'export pour le retrait d'item
    if exports['qs-inventory']:RemoveItem(src, Config.WaterItem, 1) then
        local water = plant.water
        water[#water + 1] = os.time()

        plant:set('water', water)
        local saved = plant:save()

        if not saved then
            utils.print(("Could not save plant with id %s"):format(plantId))
        end

        utils.notify(src, Locales['notify_title_planting'], Locales['watered_plant'], 'success', 2500)
    end
end)

RegisterNetEvent('weedplanting:server:GiveFertilizer', function(plantId)
    local src = source
    local Player = server.GetPlayerFromId(src)
    if not Player then return end

    local plant = WeedPlant:getPlant(plantId)
    if not plant then return end

    if #(GetEntityCoords(GetPlayerPed(src)) - plant.coords) > 10 then return end

    -- Utilisation directe de l'export pour le retrait d'item
    if exports['qs-inventory']:RemoveItem(src, Config.FertilizerItem, 1) then
        local fertilizer = plant.fertilizer
        fertilizer[#fertilizer + 1] = os.time()

        plant:set('fertilizer', fertilizer)
        local saved = plant:save()

        if not saved then
            utils.print(("Could not save plant with id %s"):format(plantId))
        end

        utils.notify(src, Locales['notify_title_planting'], Locales['fertilizer_added'], 'success', 2500)
    end
end)

RegisterNetEvent('weedplanting:server:AddMaleSeed', function(plantId)
    local src = source
    local Player = server.GetPlayerFromId(src)
    if not Player then return end

    local plant = WeedPlant:getPlant(plantId)
    if not plant then return end

    if #(GetEntityCoords(GetPlayerPed(src)) - plant.coords) > 10 then return end

    -- Utilisation directe de l'export pour le retrait d'item
    if exports['qs-inventory']:RemoveItem(src, Config.MaleSeed, 1) then
        plant:set('gender', 'male')
        local saved = plant:save()

        if not saved then
            utils.print(("Could not save plant with id %s"):format(plantId))
        end

        utils.notify(src, Locales['notify_title_planting'], Locales['male_seed_added'], 'success', 2500)
    end
end)

--- Callbacks

lib.callback.register('weedplanting:server:GetPlantData', function(source, plantId)
    local plant = WeedPlant:getPlant(plantId)
    if not plant then
        return false, ("Could not find weedplant with id %s"):format(plantId)
    end
    
    local retData = {
        id = plant.id,
        coords = plant.coords,
        time = plant.time,
        gender = plant.gender,
        fertilizer = plant:calcFertilizer(),
        water = plant:calcWater(),
        stage = plant:calcStage(),
        health = plant:calcHealth(),
        growth = plant:calcGrowth()
    }

    return true, retData
end)

lib.callback.register('weedplanting:server:GetPlantLocations', function(source)
    return(WeedPlantCache)
end)

--- Items

server.registerUseableItem(Config.FemaleSeed, function(source)
    TriggerClientEvent('weedplanting:client:UseWeedSeed', source)
end)

--- Threads

CreateThread(function()
    setupPlants()

    while true do
        globalState.WeedplantingTime = os.time()
        Wait(1000)
    end
end)
