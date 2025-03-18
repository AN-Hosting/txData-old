-- Zones for Menus
Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.BossMenus = {
    police = {
        vector3(447.16, -974.31, 30.47),
    },
    ambulance = {
        vector3(311.21, -599.36, 43.29),
    },
    cardealer = {
        vector3(-32.94, -1114.64, 26.42),
    },
    mechanic = {
        vector3(-347.59, -133.35, 39.01),
    },
    midas = {
        vector3(-929.91, -2029.14, 9.41),
    }, 
    burgerking = {
        vector3(67.4, -806.68, 31.52),
    },
    norauto = {
        vector3(806.47, -882.01, 29.14),
    },
    tabac = {
        vector3(-501.06, -28.01, 45.72),
    },
    dir = {
        vector3(-1780.99, -806.82, 10.55),
    },
    tf1 = {
        vector3(-1052.59, -231.86, 43.76),
    },
    otacos = {
        vector3(88.13, -1424.71, 29.37),
    },
    kfc = {
        vector3(-1196.64, -900.97, 13.68),
    },
    mairie = {
        vector3(-527.21, -590.76, 34.48),
    },
    police_nationale = {
        vector3(379.28, -1625.72, 33.54),
    },
    samu_75 = {
        vector3(-1845.68, -348.49, 83.83),
    },
    concessionnaire = {
        vector3(-202.19, -1170.27, 24.00),
    },
    xpo = {
        vector3(1210.12, -3254.59, 7.09),
    },
    gendarmerie_nationale = {
        vector3(2495.34, -424.42, 98.89),
    },
    vigneron = {
        vector3(-1897.41, 2068.83, 140.49),
    },
    orpi = {
        vector3(-255.95, -902.65, 32.18),
    },
    brinks = {
        vector3(-295.16, 6139.94, 31.56),
    },
    pompiers_de_paris = {
        vector3(1204.08, -1488.74, 42.37)
    },
}

Config.GangMenus = {
    barbes = {
        vector3(-308.77, -1619.8, 57.13),
    },
    felixpyat = {
        vector3(905.6, 764.99, 201.09),
    },
    belleville = {
        vector3(1235.22, -2210.43, 58.38),
    },
    roubaix = {
        vector3(1358.1, 6597.65, 30.42),
    },
    leslopezz = {
        vector3(-1612.24, -918.34, 9.57),
    },
    evry = {
        vector3(2009.41, 3411.17, 47.6)
    },
}
