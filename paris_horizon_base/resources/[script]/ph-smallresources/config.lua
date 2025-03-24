Config = {}

Config.CommandName = 'annonce' -- La commande pour ouvrir le menu

-- Menu Perso
Config.ServiceCommands = {
    gendarmerie_nationale = '19',
    samu_75 = '15',
    pompiers_de_paris = '18',
    avocats_de_paris = '115',
    police_nationale = '17',
    norauto = '116',
    midas = '117',
    concessionnaire = '118',
    taxi = '119',
    orpi = '120',
    tabac = '121',
    burgerking = '122',
    kfc = '123',
    otacos = '124',
    dir = '127',
    vinci = '128',
    xpo = '129',
    tf1 = '130',
    vigneron = '131',
    pizza = '132'
}

-- Menu Job
Config.Jobs = {
    ["police"] = {
        menuoptions = {
            {icon = "fas fa-bell", header = "Bouton d'urgence", txt = "Appuyer sur le bouton d'urgence", event = "police:client:SendPoliceEmergencyAlert", submenu = "", subheader = "", rank = 1},
            {icon = "fas fa-circle-info", header = "État du véhicule", txt = "Vérifier l'état du véhicule", event = "qb-tunerchip:client:TuneStatus", submenu = "", subheader = "", rank = 2},
            {icon = "fas fa-key", header = "Réinitialiser maison", txt = "Réinitialiser l'accès à la maison", event = "qb-houses:client:ResetHouse", submenu = "", subheader = "", rank = 3},
            {icon = "fas fa-id-card", header = "Permis de conduire", txt = "Retirer le permis de conduire", event = "police:client:SeizeDriverLicense", submenu = "", subheader = "", rank = 4},
            -- Police interactions submenu
            {icon = "fas fa-list-check", header = "Interactions Police", txt = "Menu d'interactions police", event = "qb-jobmenu:client:opensubmenu", submenu = "", subheader = "policeinteractions", rank = 4},
            {icon = "fas fa-heart-pulse", header = "Vérifier état", txt = "Vérifier l'état de santé", event = "hospital:client:CheckStatus", submenu = "policeinteractions", subheader = ""},
            {icon = "fas fa-question", header = "Vérifier statut", txt = "Vérifier le statut", event = "police:client:CheckStatus", submenu = "policeinteractions", subheader = ""},
            {icon = "fas fa-user-group", header = "Escorter", txt = "Escorter un joueur", event = "police:client:EscortPlayer", submenu = "policeinteractions", subheader = ""},
            {icon = "fas fa-magnifying-glass", header = "Fouiller", txt = "Fouiller un joueur", event = "police:client:SearchPlayer", submenu = "policeinteractions", subheader = ""},
            {icon = "fas fa-user-lock", header = "Emprisonner", txt = "Mettre en prison", event = "police:client:JailPlayer", submenu = "policeinteractions", subheader = ""},
            -- Police objects submenu
            {icon = "fas fa-road", header = "Objets Police", txt = "Menu des objets", event = "qb-jobmenu:client:opensubmenu", submenu = "", subheader = "policeobjects", rank = 4},
            {icon = "fas fa-triangle-exclamation", header = "Poser un cône", txt = "Placer un cône", event = "police:client:spawnCone", submenu = "policeobjects", subheader = ""},
            {icon = "fas fa-torii-gate", header = "Poser une barrière", txt = "Placer une barrière", event = "police:client:spawnBarrier", submenu = "policeobjects", subheader = ""},
            {icon = "fas fa-sign", header = "Poser un panneau", txt = "Placer un panneau", event = "police:client:spawnRoadSign", submenu = "policeobjects", subheader = ""},
            {icon = "fas fa-campground", header = "Poser une tente", txt = "Placer une tente", event = "police:client:spawnTent", submenu = "policeobjects", subheader = ""},
            {icon = "fas fa-lightbulb", header = "Poser un éclairage", txt = "Placer un éclairage", event = "police:client:spawnLight", submenu = "policeobjects", subheader = ""},
            {icon = "fas fa-caret-up", header = "Herse", txt = "Poser une herse", event = "police:client:SpawnSpikeStrip", submenu = "policeobjects", subheader = ""},
            {icon = "fas fa-trash", header = "Supprimer objet", txt = "Supprimer un objet", event = "police:client:deleteObject", submenu = "policeobjects", subheader = ""},
        }
    },
    ["ambulance"] = {
        menuoptions = {
            {icon = "fas fa-heart-pulse", header = "Vérifier état", txt = "Vérifier l'état du patient", event = "hospital:client:CheckStatus", submenu = "", subheader = "", rank = 1},
            {icon = "fas fa-user-doctor", header = "Réanimer", txt = "Réanimer le patient", event = "hospital:client:RevivePlayer", submenu = "", subheader = "", rank = 1},
            {icon = "fas fa-bandage", header = "Soigner", txt = "Soigner les blessures", event = "hospital:client:TreatWounds", submenu = "", subheader = "", rank = 1},
            {icon = "fas fa-bell", header = "Urgence", txt = "Bouton d'urgence", event = "police:client:SendPoliceEmergencyAlert", submenu = "", subheader = "", rank = 1},
            {icon = "fas fa-user-group", header = "Escorter", txt = "Escorter un patient", event = "police:client:EscortPlayer", submenu = "", subheader = "", rank = 1},
            -- Ambulance stretcher options
            {icon = "fas fa-bed-pulse", header = "Options Brancard", txt = "Gestion du brancard", event = "qb-jobmenu:client:opensubmenu", submenu = "", subheader = "stretcheroptions", rank = 2},
            {icon = "fas fa-plus", header = "Sortir brancard", txt = "Sortir le brancard", event = "qb-radialmenu:client:TakeStretcher", submenu = "stretcheroptions", subheader = ""},
            {icon = "fas fa-minus", header = "Ranger brancard", txt = "Ranger le brancard", event = "qb-radialmenu:client:RemoveStretcher", submenu = "stretcheroptions", subheader = ""},
        }
    },
    ["norauto"] = {
        menuoptions = {
            {icon = "fas fa-truck-pickup", header = "Remorquer", txt = "Remorquer un véhicule", event = "qb-tow:client:TowVehicle", submenu = "", subheader = "", rank = 1},
        }
    },
    ["taxi"] = {
        menuoptions = {
            {icon = "fas fa-eye-slash", header = "Compteur", txt = "Afficher/Masquer le compteur", event = "qb-taxi:client:toggleMeter", submenu = "", subheader = "", rank = 1},
            {icon = "fas fa-hourglass-start", header = "Activer compteur", txt = "Démarrer le compteur", event = "qb-taxi:client:enableMeter", submenu = "", subheader = "", rank = 1},
            {icon = "fas fa-taxi", header = "Mission PNJ", txt = "Commencer une course PNJ", event = "qb-taxi:client:DoTaxiNpc", submenu = "", subheader = "", rank = 2},
        }
    },
}

Config.Icons = {
    identity = "👤",
    job = "💼",
    quit = "❌",
    jobMenu = "👔",
    invoice = "📄",
    finance = "💵",
    actions = "⚡",
    back = "◀️",
    emote = "��",
    editor = "🎥",
    record = "⏺️",
    clip = "🎬",
    save = "💾",
    delete = "🗑️",
    edit = "✏️"
}