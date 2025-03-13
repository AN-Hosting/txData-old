Config = {}

Config.OperationTables = {
    {
        coords = vector3(107.29, 266.08, 102.23),
        heading = 0.0
    },
    -- Ajoutez d'autres tables d'opération ici
}

Config.DisposalPoints = {
    {
        coords = vector3(0.0, 0.0, 0.0),
        heading = 0.0
    },
    -- Ajoutez d'autres points de disposition ici
}

Config.Organs = {
    kidney = {
        label = "Rein",
        price = 1500,
        chance = 70
    },
    liver = {
        label = "Foie",
        price = 2000,
        chance = 30
    },
    heart = {
        label = "Coeur",
        price = 3000,
        chance = 15
    },
    lung = {
        label = "Poumon",
        price = 1800,
        chance = 60
    },
    blood = {
        label = "Sang",
        price = 800,
        chance = 90
    },
    skin = {
        label = "Peau",
        price = 1200,
        chance = 85
    },
    spleen = {
        label = "Rate",
        price = 1400,
        chance = 65
    },
    eye = {
        label = "Œil",
        price = 1800,
        chance = 45
    },
    stomach = {
        label = "Estomac",
        price = 1600,
        chance = 55
    },
    tongue = {
        label = "Langue",
        price = 1000,
        chance = 75
    },
    tooth = {
        label = "Dent",
        price = 500,
        chance = 95
    },
    brain = {
        label = "Cerveau",
        price = 2800,
        chance = 20
    },
    pancreas = {
        label = "Pancréas",
        price = 1700,
        chance = 60
    },
    ear = {
        label = "Oreille",
        price = 900,
        chance = 80
    }
}

Config.Dealer = {
    model = 'g_m_m_chemwork_01',
    coords = vector4(116.09, 254.47, 102.9, 0.0),
    items = {
        { 
            name = 'chloroform', 
            label = 'Chloroforme', 
            price = 200 
        },
        { 
            name = 'cloth', 
            label = 'Torchon', 
            price = 50 
        },
        { 
            name = 'scalpel', 
            label = 'Scalpel', 
            price = 150 
        }
    }
}

Config.OrganBuyer = {
    model = 's_m_m_doctor_01', -- Un modèle de docteur
    coords = vector4(-1810.44, -348.34, 49.14, 0.0),
    items = {
        kidney = { price = 1500 },
        liver = { price = 2000 },
        heart = { price = 3000 },
        lung = { price = 1800 },
        blood = { price = 800 },
        skin = { price = 1200 },
        spleen = { price = 1400 },
        eye = { price = 1800 },
        stomach = { price = 1600 },
        tongue = { price = 1000 },
        tooth = { price = 500 },
        brain = { price = 2800 },
        pancreas = { price = 1700 },
        ear = { price = 900 }
    }
} 