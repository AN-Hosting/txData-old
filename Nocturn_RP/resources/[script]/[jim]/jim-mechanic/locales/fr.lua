Loc = Loc or {}

Loc["fr"] = {
    common = {
        vehicleNotOwned         = "Véhicule non possédé",
        close                  = "Fermer",
        ret                    = "Retour",
        stockLabel             = "Stock", -- Par défaut, original, ou tout autre mot utilisé
        currentInstalled       = "Actuellement installé",
        noOptionsAvailable     = "Aucune option disponible pour cet objet",
        notInstalled           = "Non installé",
        actionInstalling       = "Installation en cours",
        installedMsg           = "Installé !",
        installationFailed     = "Échec de l'installation !",
        removedMsg             = "Retiré !",
        actionRemoving         = "Retrait en cours",
        removalFailed          = "échec du retrait !",
        cannotInstall          = "Impossible d'installer sur ce véhicule",
        optionsCount           = "Nombre d'options : ",
        alreadyInstalled       = "déjà installé", -- ex : "Pare-chocs d'origine déjà installé"
        menuInstalledText      = "Installé", -- ex : "[4 Options] Installé : Grille 1"
        nearWheelWarning       = "Vous devez vous rapprocher d'une roue",
        nearEngineWarning      = "Vous devez vous rapprocher du moteur",
        closerToHeadlights     = "Rapprochez-vous des phares",
        attachingHarness       = "Fixation du harnais de course...",
        liveryPrefix           = "Livrée",
        extraPrefix            = "Extra",
        oldLiverySuffix        = " ancienneLiv", -- seulement en mode debug
        zeroPrefix             = "0 - ",
        submit                 = "Valider",
        settingBaseCoat        = "Application de la couche de base...",
        sprayCancelled         = "Pulvérisation annulée",

        toggleOn               = "ACTIVÉ",
        toggleOff              = "DÉSACTIVÉ",
        backButton             = "Retour",
        unknownStatus          = "Inconnu",
        notApplicable          = "N/A",

        needVehicle            = "Vous devez être dans un véhicule pour faire cela...",
        needDriver             = "Vous devez être le conducteur pour faire cela...",

        dutyMessage            = "Veuillez contacter un mécanicien !",
    },

    stancer = {
        wheel_lf                = "Roue avant gauche",
        wheel_rf                = "Roue avant droite",
        wheel_lr                = "Roue arrière gauche",
        wheel_rr                = "Roue arrière droite",
        wheel_lm1               = "Roue centrale gauche (1)",
        wheel_rm1               = "Roue centrale droite (1)",
        wheel_lm2               = "Roue centrale gauche (2)",
        wheel_rm2               = "Roue centrale droite (2)",
        wheel_lm3               = "Roue centrale gauche (3)",
        wheel_rm3               = "Roue centrale droite (3)",
        spacer                  = "Cale",
        camber                  = "Carrossage",
        width                   = "Largeur (toutes roues)",
        size                    = "Taille (toutes roues)",
        stance                  = "Position",
        reset                   = "Réinitialiser",
        resetAll                = "Tout réinitialiser",
        resetBar                = "Réinitialisation de toutes les roues",
        adjusting               = "Ajustement"
    },

    progressbar = {
        progress_washing        = "Lavage des mains",
        progress_mix            = "Préparation d'un(e) ",
        progress_pour           = "Service d'un(e) ",
        progress_drink          = "Boire un(e) ",
        progress_eat            = "Manger un(e) ",
        progress_make           = "Préparation d'un(e) ",
    },

    error = {
        not_clockedin           = "Pas en service",
        cancelled               = "Annulé",
    },

    tireActions = {
        removeBulletProofTires  = "Pneus pare-balles retirés !",
        removeDriftTires        = "Pneus drift retirés !",
    },

    xenonSettings = {
        notInstalled            = "Phares xénon non installés",
        headerLighting          = "Contrôles d'éclairage",
        neonHeaderUnderglow     = "Contrôles néon sous la voiture",
        neonHeaderColor         = "Contrôles couleur néon",
        xenonHeaderHeadlight    = "Contrôles phares xénon",
        customRGBHeader         = "RGB personnalisé",
        customConfirm           = "APPLIQUER",
        neonTextDescription     = "Contrôle précis de l'éclairage néon",
        toggleAll               = "Tout activer/désactiver",
        frontLabel              = "Avant",
        rightLabel              = "Droite",
        backLabel               = "Arrière",
        leftLabel               = "Gauche",
        neonTextChangeColor     = "Changer la couleur du néon",
        xenonHeader             = "Contrôles xénon",
        xenonTextDescription    = "Ajuster la couleur des phares du véhicule",
    },

    bumpers = {
        grilleMenu              = "Grille",
        frontBumperMenu         = "Pare-chocs avant",
        backBumperMenu          = "Pare-chocs arrière",
    },

    exhaustMod = {
        menuHeader              = "Modification échappement",
    },

    exteriorMod = {
        stockMod                = "Mod extérieur d'origine...",
    },

    hoodMod = {
        menuHeader              = "Modification capot",
    },

    hornsMod = {
        testCurrentHorn         = "Tester le klaxon actuel",
        testHorn                = "Tester le klaxon",
        applyHorn               = "Appliquer le klaxon",
        menuHeader              = "Modification klaxon",
    },

    liveryMod = {
        oldMod                  = "ancien",
        menuHeader              = "Modification livrée",
        menuOldHeader           = "Modification livrée toit",
    },

    nosSettings = {
        turboNotInstalled       = "Turbo non installé",
        needNOSCan              = "Vous avez besoin d'une bonbonne de NOS pour cela",
        refillingMsg            = "Remplissage en cours",
        insufficientCash        = "Pas assez d'argent",
        nosPurchased            = "Recharge NOS achetée",

        nosColor                = "Couleur purge NOS",
        boostMode               = "Mode boost",
        purgeMode               = "Mode purge",
        boostPower              = "Puissance boost",
        sprayStrength           = "Intensité du jet",

        keyBoostLevelUp         = "Augmenter niveau boost/purge",
        keyBoostLevelDown       = "Diminuer niveau boost/purge",
        keyToggleBoost          = "Activer/désactiver boost/purge",
        keyBoost                = "Boost",
    },

    paintOptions = {
        primaryColor            = "Primaire",
        secondaryColor          = "Secondaire",
        pearlescent             = "Nacré",
        wheelColor              = "Jantes",
        dashboardColor          = "Tableau de bord",
        interiorColor           = "Intérieur",

        classicFinish           = "Classique",
        metallicFinish          = "Métallique",
        matteFinish             = "Mat",
        metalsFinish            = "Métaux",
        chameleonFinish         = "Caméléon",

        menuHeader              = "Peinture",
    },

    paintRGB = {
        finishSelectLabel       = "Sélection finition :",
        customHeader            = "HEX et RGB personnalisés",
        chromeLabel             = "Chrome",
        hexPickerLabel          = "Sélecteur HEX",
        rgbPickerLabel          = "Sélecteur RGB",
        sprayingBase            = "Application de la couche de base...",
        sprayingVehicle         = "Application de la peinture...",
        stopInstruction         = "Arrêter - [Retour]",
        hexLabel                = "HEX :",
        rgbLabel                = "RGB :",
        redLabel                = "R - ",
        greenLabel              = "V - ",
        blueLabel               = "B - ",
    },

    plates = {
        plateHolder             = "Support de plaque",
        vanityPlates            = "Plaques personnalisées",
        customPlates            = "Plaques sur mesure",
    },

    rimsMod = {
        menuHeader              = "Modification jantes",
        sportRims               = "Sport",
        muscleRims              = "Muscle",
        lowriderRims            = "Lowrider",
        suvRims                 = "SUV",
        offroadRims             = "Tout-terrain",
        tunerRims               = "Tuner",
        highendRims             = "Haut de gamme",
        bennysOriginals         = "Benny's Originales",
        bennysBespoke           = "Benny's Sur-mesure",
        openWheel               = "Roue ouverte",
        streetRims              = "Rue",
        trackRims               = "Piste",
        frontWheel              = "Roue avant",
        backWheel               = "Roue arrière",
        motorcycleRims          = "Moto",
        customRims              = "Jantes personnalisées",
        customTires             = "Pneus personnalisés",
    },

    rollCageMod = {
        menuHeader              = "Modification arceau de sécurité",
    },

    roofMod = {
        menuHeader              = "Modification toit",
    },

    seatMod = {
        menuHeader              = "Modification sièges",
    },

    spoilersMod = {
        menuHeader              = "Modification aileron",
    },

    smokeSettings = {
        alreadyApplied          = "Cette couleur est déjà appliquée !",
        menuHeader              = "Modification fumée pneus",
        removeSmoke             = "Retirer la couleur de fumée",
        customRGB               = "RGB PERSONNALISÉ",
    },

    windowTints = {
        menuHeader              = "Teintes vitres",
    },

    storeMenu = {
        browseStore             = "Parcourir le magasin",
        mechanicTools           = "Outils mécanicien",
        performanceItems        = "Éléments de performance",
        cosmeticItems           = "Éléments cosmétiques",
        repairItems             = "Éléments de réparation",
        nosItems                = "Éléments NOS",
    },

    craftingMenu = {
        menuHeader              = "Fabrication mécanicien",
        toolsHeader             = "Outils mécanicien",
        repairHeader            = "Éléments de réparation",
        performanceHeader       = "Éléments de performance",
        cosmeticHeader          = "Éléments cosmétiques",
        nosHeader               = "Éléments NOS",
        itemsCountSuffix        = " objets",  -- ex : "11 objets"
        extras                  = "Extras",
    },

    payments = {
        charge                  = "Facturer le client",
    },

    damageMessages = {
        engineOverheating       = "Votre moteur surchauffe",
        steeringIssue           = "La direction semble étrange...",
        engineStalled           = "Le moteur s'est arrêté",
        lightsAffected          = "Quelque chose affecte vos lumières...",
        drippingSound           = "Vous entendez un bruit de goutte...",
    },

    checkDetails = {
        plateLabel              = "Plaque",
        valueLabel              = "Valeur : €",
        unavailable             = "❌ Indisponible",

        engineLabel             = "Moteur",
        brakesLabel             = "Freins",
        suspensionLabel         = "Suspension",
        transmissionLabel       = "Transmission",
        armorLabel              = "Blindage",
        turboLabel              = "Turbo",
        xenonLabel              = "Xénon",
        driftTyresLabel         = "Pneus drift",
        bulletproofTyresLabel   = "Pneus pare-balles",
        cosmeticsListHeader     = "Liste des cosmétiques possibles",
        vehicleLabel            = "Véhicule",

        optionsLabel            = "options",
        externalCosmetics       = "Cosmétiques externes",
        internalCosmetics       = "Cosmétiques internes",
        spoilersLabel           = "Ailerons",
        frontBumpersLabel       = "Pare-chocs avant",
        rearBumpersLabel        = "Pare-chocs arrière",
        skirtsLabel             = "Bas de caisse",
        exhaustsLabel           = "Échappements",
        grillesLabel            = "Grilles",
        hoodsLabel              = "Capots",
        leftFenderLabel         = "Aile gauche",
        rightFenderLabel        = "Aile droite",
        roofLabel               = "Toit",
        plateHoldersLabel       = "Supports de plaque",
        vanityPlatesLabel       = "Plaques personnalisées",
        trimALabel              = "Finition A",
        trimBLabel              = "Finition B",
        trunksLabel             = "Coffres",
        engineBlocksLabel       = "Blocs moteur",
        airFiltersLabel         = "Filtres à air",
        engineStrutLabel        = "Barre anti-rapprochement",
        archCoversLabel         = "Couvre-arches",

        rollCagesLabel          = "Arceaux de sécurité",
        ornamentsLabel          = "Ornements",
        dashboardsLabel         = "Tableaux de bord",
        dialsLabel              = "Cadrans",
        doorSpeakersLabel       = "Haut-parleurs de porte",
        seatsLabel              = "Sièges",
        steeringWheelsLabel     = "Volants",
        shifterLeversLabel      = "Leviers de vitesse",
        plaquesLabel            = "Plaques",
        speakersLabel           = "Haut-parleurs",
        hydraulicsLabel         = "Hydrauliques",
        aerialsLabel            = "Antennes",
        fuelTanksLabel          = "Réservoirs",
        wrapLabel               = "Livrée",
        yesLabel                = "Oui",
        noLabel                 = "Non",
        removePrompt            = "Voulez-vous retirer ",
        antilagLabel            = "Antilag",
        harnessLabel            = "Harnais",
        nitrousLabel            = "Nitro",
    },

    repairActions = {
        checkingEngineDamage    = "Vérification des dégâts moteur...",
        checkingBodyDamage      = "Vérification des dégâts carrosserie...",

        bodyLabel               = "Carrosserie",
        oilLevelLabel           = "Niveau d'huile",
        driveshaftLabel         = "Arbre de transmission",
        sparkPlugs              = "Bougies d'allumage",
        carBattery              = "Batterie",
        fuelTank                = "Réservoir",
        replaceTires            = "Remplacer les pneus",

        actionRepairing         = "Réparation en cours",
        actionChanging          = "Changement : ",
        repairedMsg             = "entièrement réparé",     -- ex : "Moteur entièrement réparé"
        repairCancelled         = "Réparation annulée !",
        noMaterialsInSafe       = "Pas assez de matériaux dans le coffre",

        costLabel               = "Coût",
        repairPrompt            = "Voulez-vous réparer le/la ",

        applyingDuctTape        = "Application du ruban adhésif...",
        ductTapeLimit           = "Vous ne pouvez plus utiliser de ruban adhésif sur cette voiture",
        noVehicleNearby         = "Aucun véhicule à proximité",
    },

    policeMenu = {
        header                  = "Station de modification",
        useRepairStation        = "Utiliser la station de modification",
        repairOption            = "Réparer",
        extrasOption            = "Extras",
        extraOption             = "Extra",
        cleaningVehicle         = "Nettoyage du véhicule...",
        repairingEngine         = "Réparation du moteur...",
        repairingBody           = "Réparation de la carrosserie...",
        repairComplete          = "Réparation terminée",
        emergencyOnly           = "Réservé aux véhicules d'urgence",
    },

    manualRepairs = {
        replaceTyres            = "Remplacement des pneus endommagés",
        removeWindows           = "Retrait des vitres endommagées",
        repairDoors             = "Réparation des portes",
    },

    carWaxOptions = {
        cleanVehicle            = "Nettoyer le véhicule",
        cleanAndWax             = "Nettoyer et cirer",
        cleanAndPremiumWax      = "Nettoyer et cire premium",
        cleanAndUltimateWax     = "Nettoyer et cire ultime",
    },

    extraOptions = {
        vehicleClean            = "Véhicule propre",
        doorError               = "Erreur porte",
        doorsLocked             = "Portes du véhicule verrouillées",
        flippingVehicle         = "Retournement du véhicule",
        vehicleFlipped          = "Succès ! Véhicule retourné",
        flipFailed              = "Échec du retournement !",
        moveSeat                = "Vous vous déplacez au siège ",
        seatFastWarning         = "Ce véhicule va trop vite...",
        seatUnavailable         = "Ce siège n'est pas disponible...",
        raceHarnessActive       = "Vous portez un harnais de course ; impossible de changer de siège.",
        exitRestriction         = "Vous ne pouvez pas sortir du véhicule tant que votre harnais/ceinture est attaché(e).",
        seatbeltOnMsg           = "Ceinture attachée",
        seatbeltOffMsg          = "Ceinture détachée",
        toggleSeatbelt          = "Activer/désactiver la ceinture",
    },

    generalFunctions = {
        distanceLabel           = "Distance : ",
        actionInsideVehicle     = "Cette action ne peut pas être effectuée à l'intérieur du véhicule",
        actionOutsideVehicle    = "Cette action ne peut pas être effectuée à l'extérieur du véhicule",
        vehicleLocked           = "Véhicule verrouillé",
        shopRestriction         = "Impossible de travailler hors d'un atelier",
        mechanicOnly            = "Seul un mécanicien peut effectuer cette action",
        notThisShop             = "Vous ne pouvez pas travailler dans cet atelier"
    },

    serverFunctions = {
        checkVehicleDamage      = "Vérifier les dégâts du véhicule",
        checkVehicleMods        = "Vérifier les modifications disponibles sur un véhicule",
        flipNearestVehicle      = "Retourner le véhicule le plus proche",
        cleanVehicle            = "Nettoyer la voiture",
        toggleHood              = "Ouvrir/Fermer le capot",
        toggleTrunk             = "Ouvrir/Fermer le coffre",
        toggleDoor              = "Ouvrir/Fermer la porte [0-3]",
        changeSeat              = "Aller à un autre siège [-1 à 10]",
    },

    previewSettings = {
        changesLabel            = "Modifications",
        previewNotAllowed       = "Impossible pendant l'aperçu",
        cameraEnabledMsg        = "Caméra activée",
        classLabel              = "Classe",
        rgbPreviewToolHeader    = "Outil d'aperçu peinture RGB",
        finishOption            = "Finition",
        redOption               = "R",
        greenOption             = "V",
        blueOption              = "B",
    },

    plateChange = {
        alreadyExists = "Plaque déjà existante !",
        illegalChar = "La plaque contient des caractères illégaux !",
        tooShort = "Nom trop court",
        tooLong = "Nom trop long",
        plateUpdated = "Plaques du véhicule mises à jour :",
        specificJob = "Utilisable uniquement par certains métiers",
        specificItem = "Cette commande est réservée à certains métiers",
        cannotChange = "Impossible de changer cette plaque",
        blacklisted = "Mot interdit détecté",
        notOnline = "Le propriétaire n'est pas en ligne"
    },

    vehicleWindowOptions = {
        { name = "Limo", id = 4 },
        { name = "Vert", id = 5 },
        { name = "Fumée claire", id = 3 },
        { name = "Fumée foncée", id = 2 },
        { name = "Noir intense", id = 1 }
    },

    vehiclePlateOptions = {
        { name = "Bleu sur blanc #1", id = 0 },
        { name = "Bleu sur blanc #2", id = 3 },
        { name = "Bleu sur blanc #3", id = 4 },
        { name = "Jaune sur bleu", id = 2 },
        { name = "Jaune sur noir", id = 1 },
        { name = "North Yankton", id = 5 },

        (GetGameBuildNumber() >= 3095) and { name = "Las Venturas", id = 7 } or nil,
        (GetGameBuildNumber() >= 3095) and { name = "Liberty City", id = 8 } or nil,
        (GetGameBuildNumber() >= 3095) and { name = "LS Car Meet", id = 9 } or nil,
        (GetGameBuildNumber() >= 3095) and { name = "Panic", id = 10 } or nil,
        (GetGameBuildNumber() >= 3095) and { name = "Pounders", id = 11 } or nil,
        (GetGameBuildNumber() >= 3095) and { name = "Sprunk", id = 12 } or nil,
    },

    vehicleNeonOptions = {
        { name = "Blanc", R = 255, G = 255, B = 255 },
        { name = "Bleu", R = 2, G = 21, B = 255 },
        { name = "Bleu électrique", R = 3, G = 83, B = 255 },
        { name = "Vert menthe", R = 0, G = 255, B = 140 },
        { name = "Vert citron", R = 94, G = 255, B = 1 },
        { name = "Jaune", R = 255, G = 255, B = 0 },
        { name = "Jaune doré", R = 255, G = 150, B = 0 },
        { name = "Orange", R = 255, G = 62, B = 0 },
        { name = "Rouge", R = 255, G = 1, B = 1 },
        { name = "Rose poney", R = 255, G = 50, B = 100 },
        { name = "Rose vif", R = 255, G = 5, B = 190 },
        { name = "Violet", R = 35, G = 1, B = 255 },
        { name = "Lumière noire", R = 15, G = 3, B = 255 }
    },

    vehicleHorns = Loc["en"].vehicleHorns,
    vehicleResprayOptionsClassic = Loc["en"].vehicleResprayOptionsClassic,
    vehicleResprayOptionsMatte = Loc["en"].vehicleResprayOptionsMatte,
    vehicleResprayOptionsMetals = Loc["en"].vehicleResprayOptionsMetals,
    vehicleResprayOptionsChameleon = Loc["en"].vehicleResprayOptionsChameleon,
} 