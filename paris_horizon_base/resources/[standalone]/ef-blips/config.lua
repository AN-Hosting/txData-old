Config = Config or {}

---EF-Blips  
Config.blipsShow = true

Config.Locations = {
[1] = {
    vector = vector3(932.95, 41.69, 81.1), 
    text = "Casino", 
    color = 0, 
    sprite = 103, 
    scale = 0.8,
},
[2] = {
    vector = vector3(-509.96, -29.88, 45.74), 
    text = "Tabac Chez JoJo", 
    color = 0, 
    sprite = 140, 
    scale = 0.8,
},
[3] = {
    vector = vector3(-1748.86, -752.11, 10.83), 
    text = "Dir", 
    color = 0, 
    sprite = 473, 
    scale = 0.8,
},
[4] = {
    vector = vector3(-1082.61, -258.99, 37.76), 
    text = "TF1", 
    color = 0, 
    sprite = 135, 
    scale = 0.8,
},
[5] = {
    vector = vector3(98.4, -1420.16, 29.43), 
    text = "Otacos", 
    color = 0, 
    sprite = 285, 
    scale = 0.8,
},
[6] = {
    vector = vector3(-1183.32, -888.09, 13.89), 
    text = "KFC", 
    color = 0, 
    sprite = 289, 
    scale = 0.8,
},
[7] = {
    vector = vector3(1227.36, -411.55, 68.19), 
    text = "Police Municipale", 
    color = 0, 
    sprite = 60, 
    scale = 0.8,
},
[8] = {
    vector = vector3(440.61, -976.0, 35.06), 
    text = "Police Nationale", 
    color = 0, 
    sprite = 137, 
    scale = 0.8,
},
[9] = {
    vector = vector3(2519.96, -383.14, 92.99), 
    text = "Gendarmerie", 
    color = 0, 
    sprite = 110, 
    scale = 0.8,
},
[10] = {
    vector = vector3(-262.7, -902.15, 32.31), 
    text = "Orpi", 
    color = 0, 
    sprite = 350, 
    scale = 0.8,
},
[11] = {
    vector = vector3(1222.7, -3256.88, 5.52), 
    text = "XPO Logistics", 
    color = 0, 
    sprite = 51, 
    scale = 0.8,
},
[12] = {
    vector = vector3(1200.99, -1470.56, 34.69), 
    text = "Pompier de Paris", 
    color = 0, 
    sprite = 436, 
    scale = 0.8,
},
[13] = {
    vector = vector3(-1888.09, 2046.63, 140.87), 
    text = "Vigneron", 
    color = 0, 
    sprite = 76, 
    scale = 0.8,
},
[14] = {
    vector = vector3(-286.87, 6126.97, 31.82), 
    text = "Brinks", 
    color = 0, 
    sprite = 106, 
    scale = 0.8,
},
[15] = {
    vector = vector3(53.4, -803.15, 31.65), 
    text = "Burger King", 
    color = 0, 
    sprite = 290, 
    scale = 0.8,
},
[16] = {
    vector = vector3(1703.3, 3781.42, 34.76), 
    text = "Pizzeria", 
    color = 0, 
    sprite = 291, 
    scale = 0.8,
},
[17] = {
    vector = vector3(2726.07, 3483.71, 56.32), 
    text = "Vinci Autoroute", 
    color = 0, 
    sprite = 474, 
    scale = 0.8,
},
[18] = {
    vector = vector3(-392.29, 201.04, 83.16), 
    text = "Maisonette 10", 
    color = 0, 
    sprite = 827, 
    scale = 0.8,
},
[19] = {
    vector = vector3(540.96, -177.76, 54.49), 
    text = "Auto Exotic", 
    color = 0, 
    sprite = 225, 
    scale = 0.8,
},
[20] = {
    vector = vector3(73.07, -1745.73, 29.29), 
    text = "Carrefour", 
    color = 0, 
    sprite = 59, 
    scale = 0.8,
},


-- Example 
-- [[
-- [4] = {
--     vector = vector3(0, 0, 0),
--     text = "Blip Name", 
--     color = 3, 
--     sprite = Blip ID, 
--     scale = size,
-- }, ]]

--- add more
}
Config.LocationsGang = {
    [1] = {
        vector = vector3(906.42, 797.56, 241.36), 
        sprite = 209,
        scale = 0.8,
        color = 0,
        text = "Cité Felix Pyat",
        radius = 150.0, -- Rayon du cercle (0 pour désactiver)
        colorraduis = 1 -- Rayon du cercle (0 pour désactiver)
    },
    [2] = {
        vector = vector3(1203.09, -2267.05, 45.34), 
        sprite = 181,
        scale = 0.8,
        color = 0,
        text = "Cité Belleville",
        radius = 170.0, -- Rayon du cercle (0 pour désactiver)
        colorraduis = 2 -- Rayon du cercle (0 pour désactiver)
    },
    [3] = {
        vector = vector3(-245.63, -1590.69, 33.71), 
        sprite = 176,
        scale = 0.8,
        color = 0,
        text = "Cité Barbes",
        radius = 120.0, -- Rayon du cercle (0 pour désactiver)
        colorraduis = 3 -- Rayon du cercle (0 pour désactiver)
    },
    [4] = {
        vector = vector3(-1630.74, -901.91, 8.87), 
        sprite = 210,
        scale = 0.8,
        color = 0,
        text = "Les Lopezz",
        radius = 80.0, -- Rayon du cercle (0 pour désactiver)
        colorraduis = 4 -- Rayon du cercle (0 pour désactiver)
    },
    [5] = {
        vector = vector3(1421.4, 6617.29, 17.3), 
        sprite = 183,
        scale = 0.8,
        color = 0,
        text = "Cité Roubaix",
        radius = 120.0, -- Rayon du cercle (0 pour désactiver)
        colorraduis = 5
    },
    [6] = {
        vector = vector3(2046.37, 3429.21, 44.09), 
        sprite = 182,
        scale = 0.8,
        color = 0,
        text = "Cité Evry",
        radius = 120.0, -- Rayon du cercle (0 pour désactiver)
        colorraduis = 6
    },
    [7] = {
        vector = vector3(4836.86, -4267.99, 18.18), 
        sprite = 208,
        scale = 0.8,
        color = 0,
        text = "DZ Mafia",
        radius = 80.0, -- Rayon du cercle (0 pour désactiver)
        colorraduis = 7
    }
}
