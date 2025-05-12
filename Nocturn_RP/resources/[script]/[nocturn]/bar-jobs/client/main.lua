local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
local onDuty = true
PlayerJob = {}
local IsMakingDrink = false

-- Variable globale pour stocker temporairement des données de craft
_G.tempCraftData = nil

-- Fonction simplifiée pour encoder des tables en JSON pour le débogage
json = {}
json.encode = function(tbl)
    if type(tbl) ~= "table" then return tostring(tbl) end
    
    local result = "{"
    local first = true
    
    for k, v in pairs(tbl) do
        if not first then result = result .. ", " else first = false end
        
        -- Clé
        if type(k) == "number" then
            result = result .. "[" .. k .. "]"
        else
            result = result .. "\"" .. tostring(k) .. "\""
        end
        
        result = result .. ": "
        
        -- Valeur
        if type(v) == "table" then
            result = result .. json.encode(v)
        elseif type(v) == "string" then
            result = result .. "\"" .. v .. "\""
        else
            result = result .. tostring(v)
        end
    end
    
    result = result .. "}"
    return result
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
	onDuty = duty
end)

-- Fonction générique pour ouvrir un stockage
RegisterNetEvent("bar-jobs:OpenStorage")
AddEventHandler("bar-jobs:OpenStorage", function(stashName, maxWeight, slots)
    TriggerEvent("inventory:client:SetCurrentStash", stashName)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", stashName, {
        maxweight = maxWeight,
        slots = slots,
    })
end)

-- Fonction pour générer des événements de stockage pour tous les jobs
Citizen.CreateThread(function()
    -- Attendre que la configuration soit chargée
    Citizen.Wait(1000)
    
    -- Pour chaque job dans la configuration
    for jobName, jobData in pairs(Config.BarJobs) do
        -- Pour chaque point de stockage
        if jobData.locations and jobData.locations.storage then
            for _, storage in pairs(jobData.locations.storage) do
                -- Créer un gestionnaire d'événements pour l'événement spécifié
                if storage.event then
                    -- Utiliser AddEventHandler dynamiquement
                    AddEventHandler(storage.event, function()
                        TriggerEvent("bar-jobs:OpenStorage", storage.stashName, storage.maxWeight, storage.slots)
                    end)
                end
            end
        end
    end
    
    if Config.DebugMode then
        print("Événements de stockage générés pour tous les jobs")
    end
end)

-- Fonction générique pour créer une boisson
RegisterNetEvent("bar-jobs:CraftDrink")
AddEventHandler("bar-jobs:CraftDrink", function(data)
    if Config.DebugMode then
        print("CraftDrink appelé avec:", json.encode(data))
    end
    
    local itemName, craftData
    
    -- Traitement des arguments selon leur format
    if type(data) == "table" then
        if data.itemName and data.craftData then
            -- Format provenant de qb-menu args = { itemName = x, craftData = y }
            itemName = data.itemName
            craftData = data.craftData
            if Config.DebugMode then
                print("Format qb-menu détecté, itemName:", itemName)
            end
        else
            -- Format incompatible
            QBCore.Functions.Notify("Erreur: Format de données incompatible", "error")
            if Config.DebugMode then
                print("Erreur: Format de données incompatible", json.encode(data))
            end
            return
        end
    else
        -- Format direct (pour compatibilité)
        itemName = data
        craftData = _G.tempCraftData
        
        if not craftData then
            QBCore.Functions.Notify("Erreur: Données de craft non disponibles", "error")
            if Config.DebugMode then
                print("Erreur: Données de craft non disponibles pour l'item", itemName)
            end
            return
        end
        
        if Config.DebugMode then
            print("Format direct détecté, itemName:", itemName)
        end
    end
    
    if not itemName or not craftData then
        QBCore.Functions.Notify("Erreur: Informations de craft incomplètes", "error")
        if Config.DebugMode then
            print("Erreur: itemName ou craftData manquant - itemName:", itemName, "craftData:", craftData)
        end
        return
    end
    
    if onDuty then
        local jobName = PlayerJob.name
        if Config.DebugMode then
            print("Vérification des ingrédients pour:", itemName, "job:", jobName)
        end
        
        if Config.BarJobs[jobName] then
            -- Vérifier les ingrédients
            QBCore.Functions.TriggerCallback('bar-jobs:server:CheckIngredients', function(HasItems)
                if HasItems then
                    if Config.DebugMode then
                        print("Ingrédients disponibles, début du craft")
                    end
                    IsMakingDrink = true
                    
                    -- Animation
                    QBCore.Functions.Progressbar('bartend', 'Préparation en cours...', craftData.time, false, true, {
                        disableMovement = false,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = false,
                        disableInventory = true,
                    }, {
                        animDict = craftData.animation.dict,
                        anim = craftData.animation.anim,
                        flags = craftData.animation.flags,
                    }, {
                        model = craftData.animation.prop and craftData.animation.prop.model or nil,
                        bone = craftData.animation.prop and craftData.animation.prop.bone or nil,
                        coords = craftData.animation.prop and craftData.animation.prop.coords or nil,
                        rotation = craftData.animation.prop and craftData.animation.prop.rotation or nil,
                    }, {}, function()
                        -- Retirer les ingrédients
                        for ingredient, amount in pairs(craftData.ingredients) do
                            TriggerServerEvent('QBCore:Server:RemoveItem', ingredient, amount)
                        end
                        
                        -- Ajouter l'item crafté
                        TriggerServerEvent('QBCore:Server:AddItem', itemName, 1)
                        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "add")
                        QBCore.Functions.Notify("Vous avez préparé un " .. craftData.label .. "!", "success", "20")
                        IsMakingDrink = false
                        if Config.DebugMode then
                            print("Craft réussi pour:", itemName)
                        end
                    end, function() -- Cancel
                        StopAnimTask(PlayerPedId(), craftData.animation.dict, craftData.animation.anim, 1.0)
                        QBCore.Functions.Notify("Annulé...", "error")
                        IsMakingDrink = false
                        if Config.DebugMode then
                            print("Craft annulé pour:", itemName)
                        end
                    end)
                else
                    QBCore.Functions.Notify("Vous n'avez pas les ingrédients nécessaires", "error")
                    if Config.DebugMode then
                        print("Ingrédients manquants pour:", itemName)
                    end
                end
            end, craftData.ingredients)
        else
            QBCore.Functions.Notify("Vous n'êtes pas autorisé à faire cela", "error")
            if Config.DebugMode then
                print("Job non autorisé:", jobName)
            end
        end
    else
        QBCore.Functions.Notify("Vous devez être en service", "error")
        if Config.DebugMode then
            print("Joueur pas en service, job:", PlayerJob.name, "onDuty:", onDuty)
        end
    end
end)

-- Importer la fonction HasRequiredItems depuis menus.lua si elle n'est pas déjà disponible
if not HasRequiredItems then
    function HasRequiredItems(ingredients)
        local playerItems = QBCore.Functions.GetPlayerData().items
        if not playerItems then return false end
        
        -- Si pas d'ingrédients requis, retourner true
        if not ingredients or next(ingredients) == nil then
            return true
        end
        
        -- Vérifier chaque ingrédient
        for itemName, requiredAmount in pairs(ingredients) do
            local hasItem = false
            local totalAmount = 0
            
            -- Vérifier dans l'inventaire
            for _, item in pairs(playerItems) do
                if item.name == itemName then
                    totalAmount = totalAmount + item.amount
                    if totalAmount >= requiredAmount then
                        hasItem = true
                        break
                    end
                end
            end
            
            if not hasItem then
                return false
            end
        end
        
        return true
    end
end

-- Événement pour ouvrir le menu de craft
RegisterNetEvent("bar-jobs:OpenCraftMenu")
AddEventHandler("bar-jobs:OpenCraftMenu", function(data)
    -- Déboguer ce qui est reçu
    if Config.DebugMode then
        print("OpenCraftMenu appelé avec données:", json.encode(data))
    end
    
    local stationType, jobName
    
    -- Si data est une table envoyée par qb-target (avec les propriétés directement dans data)
    if type(data) == "table" then
        if data.stationType then
            stationType = data.stationType
            jobName = data.jobName
            if Config.DebugMode then
                print("Format qb-target détecté, stationType:", stationType, "jobName:", jobName)
            end
        elseif data.itemName then
            -- Format provenant de qb-menu (args = { itemName = x, craftData = y })
            return TriggerEvent("bar-jobs:CraftDrink", data)
        else
            -- Format ancien (paramètres dans data)
            stationType = data
            jobName = QBCore.Functions.GetPlayerData().job.name
            if Config.DebugMode then
                print("Format ancien détecté, stationType:", stationType, "jobName:", jobName)
            end
        end
    else
        -- Format direct (premier argument = stationType)
        stationType = data
        jobName = QBCore.Functions.GetPlayerData().job.name
        if Config.DebugMode then
            print("Format direct détecté, stationType:", stationType, "jobName:", jobName)
        end
    end
    
    -- Si jobName n'est toujours pas défini, utiliser le job actuel
    if not jobName then
        jobName = QBCore.Functions.GetPlayerData().job.name
        if Config.DebugMode then
            print("Job non spécifié, utilisation du job actuel:", jobName)
        end
    end
    
    if not stationType then
        QBCore.Functions.Notify("Erreur: Type de station non spécifié", "error")
        if Config.DebugMode then
            print("Erreur: Type de station non spécifié")
        end
        return
    end
    
    local jobData = Config.BarJobs[jobName]
    if not jobData then
        QBCore.Functions.Notify("Erreur: Job non configuré", "error")
        if Config.DebugMode then
            print("Job non trouvé:", jobName)
        end
        return
    end
    
    if not jobData.locations.crafting or not jobData.locations.crafting[stationType] then
        QBCore.Functions.Notify("Erreur: Station non configurée", "error")
        if Config.DebugMode then
            print("Station non trouvée:", stationType, "pour le job", jobName)
        end
        return
    end
    
    local station = jobData.locations.crafting[stationType]
    local menuItems = {}
    
    if Config.DebugMode then
        print("Ouverture du menu:", stationType, "pour le job", jobName)
        print("Nombre de recettes:", TableLength(station.recipes))
    end
    
    -- Ajouter un en-tête au menu
    table.insert(menuItems, {
        header = jobData.label .. " - " .. station.label,
        isMenuHeader = true
    })
    
    for itemName, recipeData in pairs(station.recipes) do
        -- Vérifier si le joueur a les ingrédients nécessaires
        local canCraft = HasRequiredItems(recipeData.ingredients)
        
        table.insert(menuItems, {
            header = canCraft and recipeData.label or recipeData.label .. " (Ingrédients manquants)",
            txt = "Ingrédients requis: " .. GetIngredientsText(recipeData.ingredients),
            icon = QBCore.Shared.Items[itemName] and (Config.ImageBasePath .. QBCore.Shared.Items[itemName].image) or 'fas fa-question',
            disabled = not canCraft,
            params = {
                event = "bar-jobs:CraftDrink",
                args = {
                    itemName = itemName,
                    craftData = recipeData
                }
            }
        })
    end
    
    -- Ajouter l'option de fermeture
    table.insert(menuItems, {
        header = "Fermer",
        txt = "",
        params = {
            event = "qb-menu:client:closeMenu"
        }
    })
    
    -- Vérifier si des éléments de menu ont été générés
    if #menuItems <= 2 then
        QBCore.Functions.Notify("Erreur: Aucune recette disponible", "error")
        return
    end
    
    -- Ouvrir le menu
    exports['qb-menu']:openMenu(menuItems)
end)

-- Fonction pour formater le texte des ingrédients
function GetIngredientsText(ingredients)
    local text = ""
    local count = 0
    
    for ingredient, amount in pairs(ingredients) do
        count = count + 1
        local itemLabel = QBCore.Shared.Items[ingredient] and QBCore.Shared.Items[ingredient].label or ingredient
        text = text .. amount .. "x " .. itemLabel
        
        if count < TableLength(ingredients) then
            text = text .. ", "
        end
    end
    
    if text == "" then
        text = "Aucun"
    end
    
    return text
end

-- Fonction pour compter les éléments d'une table
function TableLength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

-- Fonction DrawText3Ds pour l'aide visuelle (uniquement pour le débogage)
function DrawText3Ds(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 90)
end

-- Mode d'aide visuelle (activé par commande)
local showHelpMarkers = false

-- Thread pour afficher les marqueurs d'aide
Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        
        if showHelpMarkers then
            sleep = 0
            local playerCoords = GetEntityCoords(PlayerPedId())
            
            -- Parcourir tous les jobs
            for jobName, jobData in pairs(Config.BarJobs) do
                -- Afficher les stations de craft
                if jobData.locations and jobData.locations.crafting then
                    for stationType, station in pairs(jobData.locations.crafting) do
                        local coords = station.coords
                        local distance = #(playerCoords - coords)
                        
                        if distance < 10.0 then
                            DrawText3Ds(coords, "~y~" .. station.label .. "~w~\nType: " .. stationType .. "\nDistance: " .. string.format("%.1f", distance) .. "m\nCommande: ~g~/bar_menu " .. jobName .. " " .. stationType)
                            DrawMarker(1, coords.x, coords.y, coords.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 0.5, 255, 255, 0, 100, false, true, 2, false, nil, nil, false)
                        end
                    end
                end
            end
        end
        
        Citizen.Wait(sleep)
    end
end)

-- Commande pour activer/désactiver les marqueurs d'aide
RegisterCommand("bar_markers", function()
    showHelpMarkers = not showHelpMarkers
    QBCore.Functions.Notify("Marqueurs d'aide: " .. (showHelpMarkers and "Activés" or "Désactivés"), "info")
    
    if showHelpMarkers then
        QBCore.Functions.Notify("Utilisez la commande /bar_menu [job] [type] pour ouvrir les menus", "info")
    end
end, false)

-- Fonction de débogage pour analyser la configuration
function DebugConfig()
    if not Config.DebugMode then return end
    
    print("===== DÉBOGAGE DE LA CONFIGURATION DES BARS =====")
    print("Nombre de jobs configurés:", TableLength(Config.BarJobs))
    
    for jobName, jobData in pairs(Config.BarJobs) do
        print("\nJOB:", jobName, "Label:", jobData.label)
        
        if jobData.locations and jobData.locations.crafting then
            print("  Stations de craft:")
            for stationType, station in pairs(jobData.locations.crafting) do
                print("    - Type:", stationType, "Label:", station.label, "Coords:", station.coords.x, station.coords.y, station.coords.z)
                print("      Recettes:")
                
                if station.recipes then
                    for itemName, recipe in pairs(station.recipes) do
                        print("        * Item:", itemName, "Label:", recipe.label)
                        print("          Ingrédients:", GetIngredientsText(recipe.ingredients))
                    end
                else
                    print("        ERREUR: Pas de recettes configurées!")
                end
            end
        else
            print("  ERREUR: Pas de stations de craft configurées!")
        end
    end
    
    print("===== FIN DU DÉBOGAGE =====")
end

-- Commande pour tester la configuration
RegisterCommand("debug_bar_jobs", function()
    DebugConfig()
end, false)

-- Commande pour tester directement l'ouverture d'un menu de craft
RegisterCommand("test_bar_menu", function(source, args)
    local jobName = args[1] or "unicorn"
    local stationType = args[2] or "cocktails"
    
    if Config.DebugMode then
        print("Test de menu pour job:", jobName, "station:", stationType)
    end
    TriggerEvent("bar-jobs:OpenCraftMenu", stationType, jobName)
end, false)

-- Événement pour ouvrir directement un menu spécifique (pour test)
RegisterNetEvent("bar-jobs:TestMenu")
AddEventHandler("bar-jobs:TestMenu", function(jobName, stationType)
    jobName = jobName or "unicorn"
    stationType = stationType or "cocktails"
    
    if Config.DebugMode then
        print("Test de menu pour job:", jobName, "station:", stationType)
    end
    TriggerEvent("bar-jobs:OpenCraftMenu", stationType, jobName)
end)

-- Commandes d'urgence pour résoudre les problèmes de menu
RegisterCommand("bar_coffee", function()
    local jobName = QBCore.Functions.GetPlayerData().job.name
    TriggerEvent("bar-jobs:DirectCraftMenu", "coffee", jobName)
end, false)

RegisterCommand("bar_cocktails", function()
    local jobName = QBCore.Functions.GetPlayerData().job.name
    TriggerEvent("bar-jobs:DirectCraftMenu", "cocktails", jobName)
end, false)

RegisterCommand("bar_shots", function()
    local jobName = QBCore.Functions.GetPlayerData().job.name
    TriggerEvent("bar-jobs:DirectCraftMenu", "shots", jobName)
end, false)

RegisterCommand("bar_accessories", function()
    local jobName = QBCore.Functions.GetPlayerData().job.name
    TriggerEvent("bar-jobs:DirectCraftMenu", "accessories", jobName)
end, false)

RegisterCommand("bar_all_menus", function()
    -- Lister tous les jobs et stations de craft disponibles
    print("\n=== TOUS LES MENUS DISPONIBLES ===")
    for jobName, jobData in pairs(Config.BarJobs) do
        print("Job:", jobName)
        if jobData.locations and jobData.locations.crafting then
            for stationType, _ in pairs(jobData.locations.crafting) do
                print("  - /bar_menu " .. jobName .. " " .. stationType)
            end
        end
    end
end, false)

RegisterCommand("bar_menu", function(source, args)
    local jobName = args[1]
    local stationType = args[2]
    
    if not jobName or not stationType then
        QBCore.Functions.Notify("Usage: /bar_menu [job] [type]", "error")
        return
    end
    
    TriggerEvent("bar-jobs:DirectCraftMenu", stationType, jobName)
end, false)

-- Notification d'aide pour les utilisateurs
RegisterCommand("bar_help", function()
    print("\n=== COMMANDES D'AIDE POUR LES MENUS BAR ===")
    print("/bar_coffee - Ouvre le menu des cafés")
    print("/bar_cocktails - Ouvre le menu des cocktails")
    print("/bar_shots - Ouvre le menu des shots")
    print("/bar_accessories - Ouvre le menu des accessoires")
    print("/bar_menu [job] [type] - Ouvre un menu spécifique")
    print("/bar_all_menus - Liste tous les menus disponibles")
    print("/debug_bar_jobs - Affiche les détails de configuration")
    print("=======================================")
    
    QBCore.Functions.Notify("Commandes d'aide affichées dans la console (F8)", "info")
end, false)

-- Événements pour les accessoires
RegisterNetEvent("bar-jobs:GetShotGlass")
AddEventHandler("bar-jobs:GetShotGlass", function()
    TriggerServerEvent('QBCore:Server:AddItem', "shot-glass", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['shot-glass'], "add")
end)

RegisterNetEvent("bar-jobs:GetCockGlass")
AddEventHandler("bar-jobs:GetCockGlass", function()
    TriggerServerEvent('QBCore:Server:AddItem', "cocktail-glass", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['cocktail-glass'], "add")
end)