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
    {
        name = "makeup",
        label = "Maquillage",
        chance = 70,
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

-- Liste des modèles de PNJs féminins
Config.FemalePeds = {
    `mp_f_freemode_01`, -- MP Female
    `a_f_m_beach_01`,
    `a_f_m_bevhills_01`,
    `a_f_m_bevhills_02`,
    `a_f_m_bodybuild_01`,
    `a_f_m_business_02`,
    `a_f_m_downtown_01`,
    `a_f_m_eastsa_01`,
    `a_f_m_eastsa_02`,
    `a_f_m_fatbla_01`,
    `a_f_m_fatcult_01`,
    `a_f_m_fatwhite_01`,
    `a_f_m_ktown_01`,
    `a_f_m_ktown_02`,
    `a_f_m_prolhost_01`,
    `a_f_m_salton_01`,
    `a_f_m_skidrow_01`,
    `a_f_m_soucent_01`,
    `a_f_m_soucent_02`,
    `a_f_m_soucentmc_01`,
    `a_f_m_tourist_01`,
    `a_f_m_tramp_01`,
    `a_f_m_trampbeac_01`,
    `a_f_o_genstreet_01`,
    `a_f_o_indian_01`,
    `a_f_o_ktown_01`,
    `a_f_o_salton_01`,
    `a_f_o_soucent_01`,
    `a_f_o_soucent_02`,
    `a_f_y_beach_01`,
    `a_f_y_bevhills_01`,
    `a_f_y_bevhills_02`,
    `a_f_y_bevhills_03`,
    `a_f_y_bevhills_04`,
    `a_f_y_business_01`,
    `a_f_y_business_02`,
    `a_f_y_business_03`,
    `a_f_y_business_04`,
    `a_f_y_eastsa_01`,
    `a_f_y_eastsa_02`,
    `a_f_y_eastsa_03`,
    `a_f_y_epsilon_01`,
    `a_f_y_fitness_01`,
    `a_f_y_fitness_02`,
    `a_f_y_genhot_01`,
    `a_f_y_golfer_01`,
    `a_f_y_hiker_01`,
    `a_f_y_hippie_01`,
    `a_f_y_hipster_01`,
    `a_f_y_hipster_02`,
    `a_f_y_hipster_03`,
    `a_f_y_hipster_04`,
    `a_f_y_indian_01`,
    `a_f_y_juggalo_01`,
    `a_f_y_runner_01`,
    `a_f_y_rurmeth_01`,
    `a_f_y_scdressy_01`,
    `a_f_y_skater_01`,
    `a_f_y_soucent_01`,
    `a_f_y_soucent_02`,
    `a_f_y_soucent_03`,
    `a_f_y_tennis_01`,
    `a_f_y_topless_01`,
    `a_f_y_tourist_01`,
    `a_f_y_tourist_02`,
    `a_f_y_vinewood_01`,
    `a_f_y_vinewood_02`,
    `a_f_y_vinewood_03`,
    `a_f_y_vinewood_04`,
    `a_f_y_yoga_01`,
    `g_f_y_ballas_01`,
    `g_f_y_families_01`,
    `g_f_y_lost_01`,
    `g_f_y_vagos_01`,
    `s_f_m_fembarber`,
    `s_f_m_maid_01`,
    `s_f_m_shop_high`,
    `s_f_m_sweatshop_01`,
    `s_f_y_airhostess_01`,
    `s_f_y_bartender_01`,
    `s_f_y_baywatch_01`,
    `s_f_y_cop_01`,
    `s_f_y_factory_01`,
    `s_f_y_hooker_01`,
    `s_f_y_hooker_02`,
    `s_f_y_hooker_03`,
    `s_f_y_migrant_01`,
    `s_f_y_movprem_01`,
    `s_f_y_ranger_01`,
    `s_f_y_scrubs_01`,
    `s_f_y_sheriff_01`,
    `s_f_y_shop_low`,
    `s_f_y_shop_mid`,
    `s_f_y_stripper_01`,
    `s_f_y_stripper_02`,
    `s_f_y_stripperlite`,
    `s_f_y_sweatshop_01`,
    `u_f_m_corpse_01`,
    `u_f_m_miranda`,
    `u_f_m_promourn_01`,
    `u_f_o_moviestar`,
    `u_f_o_prolhost_01`,
    `u_f_y_bikerchic`,
    `u_f_y_comjane`,
    `u_f_y_corpse_01`,
    `u_f_y_corpse_02`,
    `u_f_y_hotposh_01`,
    `u_f_y_jewelass_01`,
    `u_f_y_mistress`,
    `u_f_y_poppymich`,
    `u_f_y_princess`,
    `u_f_y_spyactress`
} 