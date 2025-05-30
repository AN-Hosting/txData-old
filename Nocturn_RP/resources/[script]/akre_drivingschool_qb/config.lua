Config = {}

Config.Target = 'qb' -- 'ox' or 'qb'
Config.Units = "kmh" -- "kmh" or "mph"

Config.TestPrice = 500
Config.PassThreshold = 70 -- %

Config.License = {
    ["A"] = "moto",
    ["B"] = "voiture",
    ["C"] = "camion",
    ["D"] = "bus"
}

Config.Blip = {
    enabled = true,
    sprite = 498,
    display = 4,
    scale = 0.7,
    color = 47,
    shortRange = true,
    name = 'Auto-École'
}

Config.DrivingSchoolPed = {
    model = 'a_m_y_business_03',
    coords = vec4(209.35, -1380.86, 30.58, 146.14),
    scenario = 'WORLD_HUMAN_CLIPBOARD',
    target = {
        icon = 'fas fa-book',
        label = 'Commencer le test théorique',
        distance = 2.5
    }
}

Config.DrivingInstructorPed = {
    model = 's_m_m_security_01',
    coords = vec4(214.32, -1400.11, 30.58, 338.38),
    scenario = 'WORLD_HUMAN_CLIPBOARD',
    target = {
        icon = 'fas fa-car',
        distance = 2.5
    }
}

Config.Notify = {
    system = "ox", -- "qb" or "ox"
    messages = {
        -- Payment messages
        payment_success = "Vous avez payé {price} USD",
        insufficient_funds = "Vous n'avez pas assez d'argent ! Il vous faut {price} USD",
        
        -- Theory test messages
        theory_pass = "Vous avez réussi le test théorique ! Maintenant, vous devez compléter les leçons de conduite.",
        theory_fail = "Vous avez échoué au test théorique.",
        theory_required = "Vous devez d'abord compléter le test théorique !",
        
        -- License messages
        license_A = "Vous avez obtenu un permis de conduire Catégorie A (motos)",
        license_B = "Vous avez obtenu un permis de conduire Catégorie B (voitures)",
        license_C = "Vous avez obtenu un permis de conduire Catégorie C (camions)",
        license_D = "Vous avez obtenu un permis de conduire Catégorie D (bus)",
        
        -- Driving test messages
        test_started = "Test de conduite commencé ! Suivez les marqueurs jaunes et respectez les limites de vitesse.",
        penalty_limit = "Vous ne pouvez obtenir qu'un maximum de 3 points de pénalité, sinon vous échouerez !",
        speed_limit = "Limite de vitesse dans cette zone : {limit} {unit}",
        checkpoint_complete = "Point de contrôle {current} terminé ! Passez au suivant.",
        test_passed = "Vous avez réussi le test de conduite ! Points de pénalité : {points}/3",
        test_passed_final = "Vous avez réussi le test de conduite !",
        test_failed = "Vous avez échoué au test de conduite ! Trop de points de pénalité : {points}/3",
        test_failed_reason = "Test échoué ! Raison : {reason}",
        
        -- Vehicle related messages
        vehicle_destroyed = "Le véhicule de test a été détruit ou a disparu ! Test terminé.",
        vehicle_abandoned = "Vous avez abandonné le véhicule de test ! Test échoué.",
        return_vehicle = "Rendez-vous à l'auto-école pour rendre le véhicule !",
        
        -- Failure reasons
        penalty_limit_reached = "Trop de points de pénalité",
        vehicle_destroyed = "Véhicule détruit",
        vehicle_abandoned = "Véhicule abandonné",
        
        -- Speeding notifications
        speeding_penalty = "Vous avez dépassé la limite de vitesse ({limit} {unit}) ! Point de pénalité ! ({points}/3)",
        speeding_fail = "Vous avez dépassé la limite de vitesse ({limit} {unit}) ! Vous avez atteint 3 points de pénalité. Test échoué."
    }
}

Config.LicenseTypes = {
    A = {
        label = "Groupe A (Motos)",
        price = 1500,
        vehicle = "pcj",
        vehicleLabel = "Motos",
        target = {
            icon = 'fas fa-motorcycle'
        }
    },
    B = {
        label = "Groupe B (Véhicules)",
        price = 2000,
        vehicle = "blista",
        vehicleLabel = "Véhicules",
        target = {
            icon = 'fas fa-car-side'
        }
    },
    C = {
        label = "Groupe C (Camions)",
        price = 3000,
        vehicle = "mule",
        vehicleLabel = "Camions",
        target = {
            icon = 'fas fa-truck',
        }
    },
    D = {
        label = "Groupe D (Bus)",
        price = 4000,
        vehicle = "bus",
        vehicleLabel = "Bus",
        target = {
            icon = 'fas fa-bus'
        }
    }
}

Config.StartLocations = {
    vec4(209.15, 375.28, 107.02, 337.87),
    vec4(205.01, 377.29, 107.24, 343.97),
    vec4(204.81, 390.49, 107.22, 170.89),
    vec4(209.21, 389.92, 107.0, 169.47)
}

Config.TestRoutes = {
    {
        {coords = vec3(35.05, 277.53, 109.48), radius = 5.0, speedLimit = 50},
        {coords = vec3(-127.49, 100.97, 70.85), radius = 5.0, speedLimit = 50},
        {coords = vec3(-393.98, 25.98, 46.72), radius = 5.0, speedLimit = 50},
        {coords = vec3(-464.29, -229.05, 35.46), radius = 5.0, speedLimit = 50},
        {coords = vec3(-565.16, -667.11, 32.54), radius = 5.0, speedLimit = 50},
        {coords = vec3(-303.63, -859.65, 31.13), radius = 5.0, speedLimit = 50},
        {coords = vec3(37.14, -795.8, 43.52), radius = 5.0, speedLimit = 50},
        {coords = vec3(110.38, -591.83, 43.34), radius = 5.0, speedLimit = 50},
        {coords = vec3(311.98, -486.7, 42.67), radius = 5.0, speedLimit = 50},
        {coords = vec3(516.35, -179.26, 53.44), radius = 5.0, speedLimit = 50},
        {coords = vec3(680.88, -12.3, 83.54), radius = 5.0, speedLimit = 50},
        {coords = vec3(214.51, 364.95, 105.61), radius = 5.0, speedLimit = 50},
        {coords = vec3(229.73, 386.12, 105.91), radius = 5.0, speedLimit = 50} -- Back to driving school
    },
}

Config.TestQuestions = {
    {
        question = "Quelle est la limite de vitesse dans les zones résidentielles en Californie sauf indication contraire ?",
        options = {
            "40 km/h",
            "56 km/h",
            "72 km/h",
            "88 km/h"
        },
        correct = "40 km/h"
    },
    {
        question = "Lorsque vous approchez d'un panneau stop, vous devez :",
        options = {
            "Ralentir et continuer si la voie est dégagée",
            "Faire un arrêt complet et continuer uniquement si c'est sûr",
            "S'arrêter uniquement s'il y a d'autres véhicules",
            "Klaxonner et continuer à conduire"
        },
        correct = "Faire un arrêt complet et continuer uniquement si c'est sûr"
    },
    {
        question = "Que devez-vous faire lorsque vous voyez un feu de signalisation jaune ?",
        options = {
            "Accélérer pour traverser l'intersection",
            "S'arrêter immédiatement",
            "Continuer avec prudence",
            "Ralentir et se préparer à s'arrêter"
        },
        correct = "Ralentir et se préparer à s'arrêter"
    },
    {
        question = "Quelle est la limite légale d'alcoolémie (BAC) pour les conducteurs de 21 ans et plus en Californie ?",
        options = {
            "0,08%",
            "0,10%",
            "0,05%",
            "0,00%"
        },
        correct = "0,08%"
    },
    {
        question = "Lorsque vous conduisez dans le brouillard, vous devez :",
        options = {
            "Utiliser les feux de route",
            "Utiliser les feux de croisement",
            "Éteindre vos phares",
            "Conduire à la même vitesse que d'habitude"
        },
        correct = "Utiliser les feux de croisement"
    },
    {
        question = "Que signifie une ligne jaune continue de votre côté de la route ?",
        options = {
            "Vous pouvez dépasser si c'est sûr",
            "Le dépassement est interdit",
            "Vous pouvez dépasser uniquement pendant la journée",
            "Vous pouvez dépasser uniquement s'il n'y a pas de trafic"
        },
        correct = "Le dépassement est interdit"
    },
    {
        question = "Quand devez-vous utiliser votre klaxon ?",
        options = {
            "Pour alerter les autres conducteurs de votre présence",
            "Pour exprimer votre frustration",
            "Pour saluer les autres conducteurs",
            "Pour signaler votre intention de tourner"
        },
        correct = "Pour alerter les autres conducteurs de votre présence"
    },
    {
        question = "Quelle est la distance de suivi minimale recommandée dans des conditions idéales ?",
        options = {
            "1 seconde",
            "2 secondes",
            "3 secondes",
            "4 secondes"
        },
        correct = "2 secondes"
    },
    {
        question = "Que devez-vous faire si votre véhicule commence à déraper ?",
        options = {
            "Freiner fortement",
            "Diriger dans la direction du dérapage",
            "Accélérer rapidement",
            "Tourner brusquement le volant"
        },
        correct = "Diriger dans la direction du dérapage"
    },
    {
        question = "Quand êtes-vous autorisé à faire un demi-tour dans un quartier commercial ?",
        options = {
            "Uniquement aux intersections",
            "Uniquement lorsqu'aucun véhicule n'approche",
            "Uniquement là où c'est permis par des panneaux ou des signaux",
            "À tout moment si c'est sûr"
        },
        correct = "Uniquement là où c'est permis par des panneaux ou des signaux"
    },
    {
        question = "Que devez-vous faire si vous ratez votre sortie sur une autoroute ?",
        options = {
            "S'arrêter et faire marche arrière",
            "Continuer jusqu'à la prochaine sortie",
            "Faire un demi-tour",
            "Reculer doucement"
        },
        correct = "Continuer jusqu'à la prochaine sortie"
    },
    {
        question = "Quelle est la pénalité pour une première infraction de conduite en état d'ivresse en Californie ?",
        options = {
            "Une amende uniquement",
            "Une amende et une suspension du permis",
            "Aucune pénalité",
            "Un avertissement"
        },
        correct = "Une amende et une suspension du permis"
    },
    {
        question = "Quand devez-vous céder le passage aux piétons ?",
        options = {
            "Uniquement aux passages piétons",
            "Uniquement quand ils ont un feu vert",
            "Toujours, même s'ils traversent en dehors des passages",
            "Uniquement pendant la journée"
        },
        correct = "Toujours, même s'ils traversent en dehors des passages"
    },
    {
        question = "Que signifie un feu de signalisation rouge clignotant ?",
        options = {
            "Continuer avec prudence",
            "S'arrêter et continuer quand c'est sûr",
            "Ralentir et céder le passage",
            "Le traiter comme un panneau stop"
        },
        correct = "Le traiter comme un panneau stop"
    },
    {
        question = "Quelle est la limite de vitesse dans les zones scolaires pendant les heures d'école ?",
        options = {
            "30 km/h",
            "40 km/h",
            "50 km/h",
            "60 km/h"
        },
        correct = "40 km/h"
    },
    {
        question = "Quand pouvez-vous conduire dans une piste cyclable ?",
        options = {
            "Pour dépasser un autre véhicule",
            "Pour tourner à droite dans les 60 mètres",
            "Pour stationner votre véhicule",
            "Pour éviter le trafic"
        },
        correct = "Pour tourner à droite dans les 60 mètres"
    },
    {
        question = "Que devez-vous faire si vous êtes impliqué dans une collision mineure ?",
        options = {
            "Quitter les lieux immédiatement",
            "Déplacer votre véhicule hors de la circulation si possible",
            "Attendre la police avant de faire quoi que ce soit",
            "Confrontation avec l'autre conducteur"
        },
        correct = "Déplacer votre véhicule hors de la circulation si possible"
    },
    {
        question = "Que signifie un panneau en forme de losange ?",
        options = {
            "Une zone scolaire",
            "Un passage à niveau",
            "Un danger ou un avertissement",
            "Une zone de loisirs"
        },
        correct = "Un danger ou un avertissement"
    },
    {
        question = "Quand devez-vous utiliser vos clignotants ?",
        options = {
            "Uniquement lors du changement de voie",
            "Uniquement lors des virages",
            "Au moins 30 mètres avant de tourner ou changer de voie",
            "Uniquement dans le trafic dense"
        },
        correct = "Au moins 30 mètres avant de tourner ou changer de voie"
    },
    {
        question = "Quel est le but des bandes rugueuses sur la route ?",
        options = {
            "Indiquer une piste cyclable",
            "Avertir les conducteurs d'un danger à venir",
            "Marquer le bord de la route",
            "Réduire les limites de vitesse"
        },
        correct = "Avertir les conducteurs d'un danger à venir"
    },
    {
        question = "Que devez-vous faire si vous voyez un piéton avec une canne blanche ?",
        options = {
            "Klaxonner pour l'alerter",
            "Céder le passage",
            "Accélérer pour le dépasser",
            "L'ignorer"
        },
        correct = "Céder le passage"
    },
    {
        question = "Quelle est la limite de vitesse maximale sur les autoroutes de Californie sauf indication contraire ?",
        options = {
            "88 km/h",
            "105 km/h",
            "113 km/h",
            "121 km/h"
        },
        correct = "105 km/h"
    },
    {
        question = "Que signifie une flèche verte sur un feu de signalisation ?",
        options = {
            "Continuer avec prudence",
            "S'arrêter et attendre un feu vert",
            "Tourner dans la direction de la flèche après avoir cédé le passage",
            "Tourner dans la direction de la flèche ; vous avez la priorité"
        },
        correct = "Tourner dans la direction de la flèche ; vous avez la priorité"
    },
    {
        question = "Que devez-vous faire si votre accélérateur se bloque ?",
        options = {
            "Passer au point mort et freiner",
            "Éteindre le moteur",
            "Pomper la pédale d'accélérateur",
            "Se diriger sur le bas-côté"
        },
        correct = "Passer au point mort et freiner"
    },
    {
        question = "Quel est le but d'un rond-point ?",
        options = {
            "Augmenter la vitesse du trafic",
            "Réduire la congestion et améliorer la sécurité",
            "Créer un arrêt à quatre voies",
            "Permettre les demi-tours"
        },
        correct = "Réduire la congestion et améliorer la sécurité"
    },
    {
        question = "Que devez-vous faire si vous voyez un feu de signalisation jaune clignotant ?",
        options = {
            "S'arrêter et attendre un feu vert",
            "Continuer avec prudence",
            "Accélérer pour traverser l'intersection",
            "Le traiter comme un panneau stop"
        },
        correct = "Continuer avec prudence"
    },
    {
        question = "Quel est le signal manuel correct pour un virage à gauche ?",
        options = {
            "Bras gauche tendu horizontalement",
            "Bras gauche tendu vers le haut",
            "Bras gauche tendu vers le bas",
            "Bras droit tendu horizontalement"
        },
        correct = "Bras gauche tendu horizontalement"
    },
    {
        question = "Que devez-vous faire si vous rencontrez un grand animal sur la route ?",
        options = {
            "Accélérer pour l'effrayer",
            "Freiner fermement et klaxonner",
            "Faire un écart pour l'éviter",
            "S'arrêter et attendre qu'il bouge"
        },
        correct = "Freiner fermement et klaxonner"
    },
    {
        question = "Quel est le but d'une ligne blanche continue sur la route ?",
        options = {
            "Indiquer une piste cyclable",
            "Séparer les voies de circulation dans la même direction",
            "Marquer le bord de la route",
            "Indiquer une zone de non-dépassement"
        },
        correct = "Séparer les voies de circulation dans la même direction"
    },
    {
        question = "Que devez-vous faire si vous conduisez et qu'il commence à grêler ?",
        options = {
            "Accélérer pour sortir de la grêle",
            "Se ranger et attendre que la grêle s'arrête",
            "Allumer vos feux de route",
            "Continuer à conduire à la même vitesse"
        },
        correct = "Se ranger et attendre que la grêle s'arrête"
    },
    {
        question = "Que signifie un panneau octogonal rouge ?",
        options = {
            "Céder le passage",
            "Stop",
            "Sens interdit",
            "Route barrée"
        },
        correct = "Stop"
    },
    {
        question = "Quel est le but d'une voie centrale partagée pour les virages ?",
        options = {
            "Dépasser les véhicules plus lents",
            "Faire des virages à gauche dans les deux directions",
            "Stationner votre véhicule",
            "S'insérer dans la circulation"
        },
        correct = "Faire des virages à gauche dans les deux directions"
    },
    {
        question = "Que devez-vous faire si vous conduisez et que votre pneu éclate ?",
        options = {
            "Freiner fortement",
            "Diriger droit et ralentir progressivement",
            "Accélérer pour reprendre le contrôle",
            "Tourner brusquement le volant"
        },
        correct = "Diriger droit et ralentir progressivement"
    },
    {
        question = "Que signifie un panneau bleu et blanc ?",
        options = {
            "Une zone scolaire",
            "Une aire de repos",
            "Un hôpital",
            "Une zone de stationnement"
        },
        correct = "Une aire de repos"
    },
    {
        question = "Que devez-vous faire si vous conduisez et que votre pédale d'accélérateur se bloque ?",
        options = {
            "Passer au point mort et freiner",
            "Éteindre le moteur",
            "Pomper la pédale d'accélérateur",
            "Se diriger sur le bas-côté"
        },
        correct = "Passer au point mort et freiner"
    },
    {
        question = "Quel est le but d'un trottoir peint en jaune ?",
        options = {
            "Chargement et déchargement de passagers ou de marchandises",
            "Stationnement interdit à tout moment",
            "Stationnement de courte durée",
            "Stationnement réservé aux personnes handicapées uniquement"
        },
        correct = "Chargement et déchargement de passagers ou de marchandises"
    },
    {
        question = "Que devez-vous faire si vous conduisez et que vos freins ne fonctionnent plus ?",
        options = {
            "Rétrograder et pomper les freins",
            "Éteindre le moteur",
            "Utiliser immédiatement le frein à main",
            "Se diriger sur le bas-côté"
        },
        correct = "Rétrograder et pomper les freins"
    },
    {
        question = "Que signifie un feu de signalisation vert ?",
        options = {
            "Continuer avec prudence",
            "S'arrêter et attendre une flèche verte",
            "Passer si la voie est dégagée",
            "Céder le passage au trafic venant en sens inverse"
        },
        correct = "Passer si la voie est dégagée"
    },
    {
        question = "Quel est le but d'un passage piéton ?",
        options = {
            "Indiquer une piste cyclable",
            "Fournir un endroit sûr pour que les piétons traversent",
            "Marquer le bord de la route",
            "Séparer les voies de circulation"
        },
        correct = "Fournir un endroit sûr pour que les piétons traversent"
    },
    {
        question = "Que devez-vous faire si vous conduisez et que vos phares ne fonctionnent plus ?",
        options = {
            "Continuer à conduire à la même vitesse",
            "Se ranger et s'arrêter",
            "Utiliser vos feux de route",
            "Allumer vos feux de détresse"
        },
        correct = "Se ranger et s'arrêter"
    },
    {
        question = "Que signifie un trottoir peint en blanc ?",
        options = {
            "Chargement et déchargement de passagers ou de marchandises",
            "Stationnement interdit à tout moment",
            "Stationnement de courte durée",
            "Stationnement réservé aux personnes handicapées uniquement"
        },
        correct = "Stationnement de courte durée"
    },
    {
        question = "Que devez-vous faire si vous conduisez et que vos essuie-glaces ne fonctionnent plus ?",
        options = {
            "Continuer à conduire à la même vitesse",
            "Se ranger et s'arrêter",
            "Utiliser vos feux de route",
            "Allumer vos feux de détresse"
        },
        correct = "Se ranger et s'arrêter"
    },
    {
        question = "Que signifie un feu de signalisation rouge ?",
        options = {
            "Continuer avec prudence",
            "S'arrêter et attendre un feu vert",
            "Céder le passage au trafic venant en sens inverse",
            "Tourner à droite si la voie est dégagée"
        },
        correct = "S'arrêter et attendre un feu vert"
    },
    {
        question = "Que devez-vous faire si vous conduisez et que votre moteur surchauffe ?",
        options = {
            "Continuer à conduire à la même vitesse",
            "Se ranger et s'arrêter",
            "Utiliser vos feux de route",
            "Allumer vos feux de détresse"
        },
        correct = "Se ranger et s'arrêter"
    },
    {
        question = "Que signifie une flèche jaune clignotante ?",
        options = {
            "Continuer avec prudence",
            "S'arrêter et attendre une flèche verte",
            "Céder le passage au trafic venant en sens inverse",
            "Tourner dans la direction de la flèche après avoir cédé le passage"
        },
        correct = "Tourner dans la direction de la flèche après avoir cédé le passage"
    },
    {
        question = "Quel est le but d'une ligne jaune continue sur la route ?",
        options = {
            "Indiquer une piste cyclable",
            "Séparer les voies de circulation en sens inverse",
            "Marquer le bord de la route",
            "Indiquer une zone de non-dépassement"
        },
        correct = "Séparer les voies de circulation en sens inverse"
    },
    {
        question = "Que devez-vous faire si vous conduisez et que votre direction ne fonctionne plus ?",
        options = {
            "Freiner fortement",
            "Passer au point mort et freiner",
            "Accélérer pour reprendre le contrôle",
            "Tourner brusquement le volant"
        },
        correct = "Passer au point mort et freiner"
    }
}

