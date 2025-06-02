Config = {}

Config.Items = {
    -- Items de faible valeur (chances élevées)
    {
        name = "paquetcigarette",
        label = "Paquet de cigarettes",
        chance = 85,
        min = 1,
        max = 3
    },
    {
        name = "joint",
        label = "Joint",
        chance = 75,
        min = 1,
        max = 4
    },
    {
        name = "preservatif",
        label = "Préservatif",
        chance = 90,
        min = 1,
        max = 3
    },
    {
        name = "briquet",
        label = "Briquet",
        chance = 80,
        min = 1,
        max = 2
    },

    -- Items de valeur moyenne (chances moyennes)
    {
        name = "cash",
        label = "Argent",
        chance = 65,
        min = 50,
        max = 250
    },
    {
        name = "silver_watch",
        label = "Montre en argent",
        chance = 45,
        min = 1,
        max = 2
    },
    {
        name = "gold_bracelet",
        label = "Bracelet en or",
        chance = 40,
        min = 1,
        max = 2
    },

    -- Items de haute valeur (chances faibles)
    {
        name = "goldchain",
        label = "Chaîne en or",
        chance = 30,
        min = 1,
        max = 2
    },
    {
        name = "rolex",
        label = "Montre Rolex",
        chance = 20,
        min = 1,
        max = 1
    },
    {
        name = "diamond_ring",
        label = "Bague en diamant",
        chance = 15,
        min = 1,
        max = 1
    },
    {
        name = "diamond",
        label = "Diamant",
        chance = 10,
        min = 1,
        max = 1
    }
}

Config.Animation = {
    dict = "anim@gangops@hostage@",
    anim = "perp_idle",
    victimAnim = "victim_idle",
    victimAnimName = "victim_idle",
    duration = 3000 -- 3 secondes
}

Config.Distance = 2.0
Config.Cooldown = 60000
Config.PoliceNotificationChance = 75 