local chanceCrevaison = 20       -- Pourcentage de chance de crever une roue après un choc
local seuilImpact = 50.0         -- Seuil minimal d'impact pour déclencher une crevaison
local cooldown = 10               -- Cooldown pour éviter des déclenchements multiples

-- Paramètres pour les crevaisons aléatoires
local chanceCrevaisonAleatoire = 0.10  -- Pourcentage de chance (0.01 = 0.01% par vérification)
local vitesseMinCrevaison = 30   -- Vitesse minimale en km/h pour qu'une crevaison aléatoire se produise
local cooldownAleatoire = 10      -- Cooldown pour les crevaisons aléatoires

-- Détection des chocs sur le véhicule et crevaisons aléatoires
CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        
        if veh ~= 0 and IsPedInAnyVehicle(ped, false) and GetPedInVehicleSeat(veh, -1) == ped then
            local vitesse = GetEntitySpeed(veh) * 3.6 -- Conversion en km/h
            
            -- Gestion des crevaisons par impact
            if vitesse > 10 then -- Éviter de déclencher à l'arrêt
                -- Vérification plus sûre des vecteurs de vitesse
                local vecteurVitesse = GetEntitySpeedVector(veh, true)
                
                -- Protection contre les valeurs nil ou invalides
                if vecteurVitesse and vecteurVitesse.x and vecteurVitesse.y then
                    local impactForceY = vecteurVitesse.y * vitesse
                    local impactForceX = vecteurVitesse.x * vitesse
                    
                    -- Ajout d'un cooldown pour éviter les détections multiples
                    if cooldown <= 0 then
                        -- Détection d'impact avec des valeurs plus raisonnables
                        if impactForceY < -seuilImpact then  -- Impact frontal (avant)
                            local chance = math.random(1, 100)
                            if chance <= chanceCrevaison then
                                CreverRouesSelonImpact(veh, "avant")
                                cooldown = 20 -- 10 secondes (20 * 500ms)
                            end
                        elseif impactForceY > seuilImpact then  -- Impact arrière
                            local chance = math.random(1, 100)
                            if chance <= chanceCrevaison then
                                CreverRouesSelonImpact(veh, "arriere")
                                cooldown = 20
                            end
                        elseif math.abs(impactForceX) > seuilImpact then -- Impact latéral
                            local chance = math.random(1, 100)
                            if chance <= chanceCrevaison then
                                if impactForceX > 0 then  -- Impact côté droit
                                    CreverRouesSelonImpact(veh, "droite")
                                else  -- Impact côté gauche
                                    CreverRouesSelonImpact(veh, "gauche")
                                end
                                cooldown = 20
                            end
                        end
                    else
                        cooldown = cooldown - 1
                    end
                end
            end
            
            -- Crevaisons aléatoires (sans impact)
            if vitesse >= vitesseMinCrevaison and cooldownAleatoire <= 0 then
                local chanceAleatoire = math.random(1, 10000) / 100 -- Génère un nombre entre 0.01 et 100
                if chanceAleatoire <= chanceCrevaisonAleatoire then
                    CreverRoueAleatoire(veh)
                    cooldownAleatoire = 120 -- 60 secondes de cooldown (120 * 500ms)
                end
            else
                if cooldownAleatoire > 0 then
                    cooldownAleatoire = cooldownAleatoire - 1
                end
            end
        end
        
        -- Réduction de la fréquence de vérification si pas dans un véhicule
        if veh == 0 then
            Wait(1000) -- Attendre plus longtemps si pas dans un véhicule
        else
            Wait(500)  -- Vérification toutes les 0.5 secondes
        end
    end
end)

-- Fonction pour crever une roue aléatoire sans lien avec un impact
function CreverRoueAleatoire(veh)
    -- Vérification que le véhicule existe toujours
    if not DoesEntityExist(veh) then return end
    
    -- Vérification du nombre de roues sur le véhicule
    local nombreRoues = GetVehicleNumberOfWheels(veh)
    if nombreRoues < 1 then return end -- Protection contre les véhicules sans roues
    
    -- Sélection d'une roue aléatoire
    local roueAleatoire = math.random(0, nombreRoues - 1)
    
    -- Vérifier si la roue n'est pas déjà crevée
    if not IsVehicleTyreBurst(veh, roueAleatoire, false) then
        SetVehicleTyreBurst(veh, roueAleatoire, false, 1000.0)
        -- Notification optionnelle
        -- TriggerEvent('chatMessage', 'SYSTÈME', {255, 0, 0}, 'Crevaison aléatoire sur la roue ' .. roueAleatoire)
    end
end

-- Fonction pour crever les roues selon la direction de l'impact
function CreverRouesSelonImpact(veh, direction)
    -- Vérification que le véhicule existe toujours
    if not DoesEntityExist(veh) then return end
    
    local rouesPossibles = {}
    
    -- Vérification du nombre de roues sur le véhicule pour éviter les index invalides
    local nombreRoues = GetVehicleNumberOfWheels(veh)
    if nombreRoues < 2 then return end -- Protection contre les véhicules sans roues
    
    if direction == "avant" then
        if nombreRoues >= 2 then
            rouesPossibles = {0, 1}  -- Roues avant (gauche et droite)
        end
    elseif direction == "arriere" then
        if nombreRoues >= 4 then
            rouesPossibles = {2, 3}  -- Roues arrière (gauche et droite)
        elseif nombreRoues >= 2 then
            rouesPossibles = {0, 1}  -- Fallback pour véhicules à 2 roues
        end
    elseif direction == "gauche" then
        if nombreRoues >= 4 then
            rouesPossibles = {0, 2}  -- Roues côté gauche (avant et arrière)
        elseif nombreRoues >= 1 then
            rouesPossibles = {0}     -- Fallback pour véhicules à 2 roues
        end
    elseif direction == "droite" then
        if nombreRoues >= 4 then
            rouesPossibles = {1, 3}  -- Roues côté droit (avant et arrière)
        elseif nombreRoues >= 2 then
            rouesPossibles = {1}     -- Fallback pour véhicules à 2 roues
        end
    end
    
    -- Protection en cas de tableau vide
    if #rouesPossibles == 0 then return end
    
    -- Nombre aléatoire de roues à crever (1 ou maximum disponible)
    local nombreCrevaison = math.random(1, math.min(2, #rouesPossibles))
    
    -- Mélanger le tableau pour une sélection aléatoire
    for i = #rouesPossibles, 2, -1 do
        local j = math.random(i)
        rouesPossibles[i], rouesPossibles[j] = rouesPossibles[j], rouesPossibles[i]
    end
    
    -- Crever les roues sélectionnées avec protection contre les erreurs
    for i = 1, nombreCrevaison do
        local roue = rouesPossibles[i]
        -- Vérification supplémentaire que l'index de roue est valide
        if roue and roue < nombreRoues then
            if not IsVehicleTyreBurst(veh, roue, false) then
                SetVehicleTyreBurst(veh, roue, false, 1000.0)
                -- Notification optionnelle pour débogage
                -- TriggerEvent('chatMessage', 'SYSTÈME', {255, 0, 0}, 'Crevaison détectée sur la roue ' .. roue)
            end
        end
    end
end