local QBCore = exports['qb-core']:GetCoreObject()

isLoggedIn = true
PlayerJob = {}

local onDuty = true

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

-- Fonction pour vérifier si le joueur a les ingrédients nécessaires
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

-- Fonction pour créer dynamiquement les zones d'interaction basées sur la configuration
Citizen.CreateThread(function()
	-- Attendre que la configuration soit chargée
	Citizen.Wait(1000)
	
	if Config.DebugMode then
		print("Début de création des zones d'interaction...")
	end
	
	-- Créer les zones d'interaction pour chaque job
	for jobName, jobData in pairs(Config.BarJobs) do
		local locations = jobData.locations
		
		if Config.DebugMode then
			print("Création des zones pour le job:", jobName)
		end
		
		-- Points de stockage
		if locations.storage then
			if Config.DebugMode then
				print("Création des zones de stockage pour:", jobName)
			end
			
			for i, storage in pairs(locations.storage) do
				exports['qb-target']:AddBoxZone(
					jobName.."_storage_"..i, 
					storage.coords, 
					0.8, 0.8, 
					{
						name = jobName.."_storage_"..i,
						heading = 0,
						debugPoly = Config.DebugMode,
						minZ = storage.coords.z - 0.2,
						maxZ = storage.coords.z + 0.8,
					},
					{
			options = {
			    {
								event = storage.event,
								icon = "fas fa-box",
								label = storage.label,
								job = jobName,
				},
			},
			distance = 1.5
					}
				)
				
				if Config.DebugMode then
					print("Zone stockage créée:", jobName.."_storage_"..i)
				end
			end
		end
		
		-- Points de craft
		if locations.crafting then
			if Config.DebugMode then
				print("Création des zones de craft pour:", jobName)
			end
			
			for stationType, station in pairs(locations.crafting) do
				if Config.DebugMode then
					print("Configuration station:", stationType, "Coordonnées:", station.coords.x, station.coords.y, station.coords.z)
				end
				
				local options = {}
				
				-- Option principale pour ouvrir le menu de craft avec la nouvelle approche
				table.insert(options, {
					type = "client",  -- Spécifier explicitement le type
					event = "bar-jobs:DirectCraftMenu", -- Utiliser l'événement direct à la place
				icon = "fas fa-cocktail",
					label = station.label,
					job = jobName,
					stationType = stationType,  -- Ajouter le type de station directement dans l'objet
					jobName = jobName  -- Ajouter le job directement dans l'objet
				})
				
				if Config.DebugMode then
					print("Arguments pour", stationType, "- stationType:", stationType, "jobName:", jobName)
				end
				
				-- Ajouter des options spécifiques pour certains types de stations
				if stationType == "accessories" then
					if station.recipes["shot-glass"] then
						table.insert(options, {
				event = "bar-jobs:GetShotGlass",
				icon = "fas fa-hand",
							label = "Prendre un verre à shot",
							job = jobName,
						})
					end
					if station.recipes["cocktail-glass"] then
						table.insert(options, {
							event = "bar-jobs:GetCockGlass",
				icon = "fas fa-hand",
							label = "Prendre un verre à cocktail",
							job = jobName,
						})
					end
				end
				
				exports['qb-target']:AddBoxZone(
					jobName.."_"..stationType, 
					station.coords, 
					1.0, 1.0, -- Augmenter la taille des zones
					{
						name = jobName.."_"..stationType,
						heading = 0,
						debugPoly = Config.DebugMode, -- Utiliser la configuration pour debugPoly
						minZ = station.coords.z - 0.4, -- Augmenter la hauteur de la zone
						maxZ = station.coords.z + 1.0, -- Augmenter la hauteur de la zone
					},
					{
						options = options,
						distance = 2.5 -- Augmenter la distance d'interaction
					}
				)
				
				if Config.DebugMode then
					print("Zone craft créée:", jobName.."_"..stationType, "avec", #options, "options")
				end
			end
		else
			if Config.DebugMode then
				print("Pas de zones de craft pour le job:", jobName)
			end
		end
	end
	
	if Config.DebugMode then
		print("Toutes les zones d'interaction ont été créées")
	end
end)

-- Maintenir la compatibilité avec les anciens menus
RegisterNetEvent('bar-jobs:DrinksMenu')
AddEventHandler('bar-jobs:DrinksMenu', function()
	local jobName = QBCore.Functions.GetPlayerData().job.name
	if Config.BarJobs[jobName] and Config.BarJobs[jobName].locations.crafting.cocktails then
		TriggerEvent("bar-jobs:OpenCraftMenu", "cocktails", jobName)
	end
end)

RegisterNetEvent('bar-jobs:ShotsMenu')
AddEventHandler('bar-jobs:ShotsMenu', function()
	local jobName = QBCore.Functions.GetPlayerData().job.name
	if Config.BarJobs[jobName] and Config.BarJobs[jobName].locations.crafting.shots then
		TriggerEvent("bar-jobs:OpenCraftMenu", "shots", jobName)
	end
end)

-- Fonction pour créer un menu de craft directement (méthode alternative)
function CreateCraftMenu(stationType, jobName)
	-- Vérification plus stricte des paramètres
	if not stationType then
		QBCore.Functions.Notify("Erreur: Type de station non spécifié", "error")
		if Config.DebugMode then
			print("ERREUR CRITIQUE: stationType est nil")
		end
		return
	end
	
	if not jobName then
		jobName = QBCore.Functions.GetPlayerData().job.name
		if Config.DebugMode then
			print("Pas de jobName spécifié, utilisation du job actuel:", jobName)
		end
	end
	
	if Config.DebugMode then
		print("Création directe de menu - Type:", stationType, "Job:", jobName)
	end
	
	local jobData = Config.BarJobs[jobName]
	if not jobData then
		QBCore.Functions.Notify("Erreur: Job " .. jobName .. " non configuré", "error")
		if Config.DebugMode then
			print("ERREUR: Job non configuré dans Config.BarJobs:", jobName)
		end
		return
	end
	
	if not jobData.locations then
		QBCore.Functions.Notify("Erreur: Locations non configurées pour " .. jobName, "error")
		if Config.DebugMode then
			print("ERREUR: Pas de locations pour le job:", jobName)
		end
		return
	end
	
	if not jobData.locations.crafting then
		QBCore.Functions.Notify("Erreur: Points de craft non configurés pour " .. jobName, "error")
		if Config.DebugMode then
			print("ERREUR: Pas de crafting pour le job:", jobName)
		end
		return
	end
	
	if not jobData.locations.crafting[stationType] then
		QBCore.Functions.Notify("Erreur: Type de station " .. stationType .. " non configuré", "error")
		if Config.DebugMode then
			print("ERREUR: Station non configurée:", stationType, "pour job:", jobName)
			print("Stations disponibles:")
			for key, _ in pairs(jobData.locations.crafting) do
				print("- " .. key)
			end
		end
		return
	end
	
	local station = jobData.locations.crafting[stationType]
	local menuItems = {}
	
	if not station.recipes or next(station.recipes) == nil then
		QBCore.Functions.Notify("Erreur: Aucune recette configurée pour " .. stationType, "error")
		if Config.DebugMode then
			print("ERREUR: Pas de recettes pour la station:", stationType)
		end
		return
	end
	
	if Config.DebugMode then
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
			txt = "Ingrédients: " .. GetIngredientsText(recipeData.ingredients),
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
		
		-- Afficher les logs uniquement en mode debug
		if Config.DebugMode then
			print("Ajout recette au menu:", itemName, recipeData.label, "Peut crafter:", canCraft)
		end
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
	if Config.DebugMode then
		print("Menu ouvert avec", #menuItems - 2, "recettes")
	end
end

-- Événement pour ouvrir directement un menu de craft
RegisterNetEvent("bar-jobs:DirectCraftMenu")
AddEventHandler("bar-jobs:DirectCraftMenu", function(data)
	if Config.DebugMode then
		print("DirectCraftMenu appelé avec données:", data, type(data))
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
		else
			-- Format ancien (deux arguments distincts)
			stationType = data
			jobName = QBCore.Functions.GetPlayerData().job.name
			if Config.DebugMode then
				print("Format ancien détecté, stationType:", stationType, "jobName:", jobName)
			end
		end
	else
		-- Format direct (premier argument = stationType, deuxième = jobName)
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
	
	CreateCraftMenu(stationType, jobName)
end)

-- Événement pour craft direct (sans passer par qb-menu)
RegisterNetEvent("bar-jobs:DirectCraft")
AddEventHandler("bar-jobs:DirectCraft", function(data)
	if not data or not data.itemName or not data.craftData then
		QBCore.Functions.Notify("Erreur: Données de craft invalides", "error")
		return
	end
	
	TriggerEvent("bar-jobs:CraftDrink", data.itemName, data.craftData)
end)

-- Remplacer l'événement d'origine par notre nouvelle méthode pour garantir la compatibilité
RegisterNetEvent('bar-jobs:OpenCraftMenu')
AddEventHandler('bar-jobs:OpenCraftMenu', function(stationType, jobName)
	CreateCraftMenu(stationType, jobName)
end)

-- Pour maintenir la compatibilité avec les anciens scripts
RegisterNetEvent('bar-jobs:MesaBusinessMenu')
AddEventHandler('bar-jobs:MesaBusinessMenu', function()
	-- Ne rien faire, le menu business a été supprimé
	QBCore.Functions.Notify("Cette fonctionnalité a été désactivée", "error")
end)
