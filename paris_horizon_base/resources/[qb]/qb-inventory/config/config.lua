Config = {
    UseTarget = GetConvar('UseTarget', 'false') == 'true',

    MaxWeight = 120000,
    MaxSlots = 40,

    StashSize = {
        maxweight = 2000000,
        slots = 100
    },

    DropSize = {
        maxweight = 1000000,
        slots = 50
    },

    Keybinds = {
        Open = 'TAB',
        Hotbar = 'Z',
    },

    CleanupDropTime = 15,    -- in minutes
    CleanupDropInterval = 1, -- in minutes

    ItemDropObject = `bkr_prop_duffel_bag_01a`,
    ItemDropObjectBone = 28422,
    ItemDropObjectOffset = {
        vector3(0.260000, 0.040000, 0.000000),
        vector3(90.000000, 0.000000, -78.989998),
    },

    VendingObjects = {
        'error'
    },

    VendingItems = {
        { name = 'coca',        price = 150, amount = 50 },
        { name = 'icetea',      price = 150, amount = 50 },
        { name = 'sprite',      price = 150, amount = 50 },
        { name = 'redbull',     price = 160, amount = 50 },
        { name = 'orangina',    price = 150, amount = 50 },
        { name = 'fanta',       price = 150, amount = 50 },
        { name = 'monster',       price = 150, amount = 50 },
    },
}
