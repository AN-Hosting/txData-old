Config = {}

Config.RequiredJob = 'pawnshop' -- Le job requis pour utiliser le pawnshop (Rachat occasion)
Config.UseOkokBanking = true -- Utiliser okokBanking pour les transactions
Config.UseLbPhone = true -- Utiliser lb-phone pour les notifications

Config.PawnshopLocation = vector4(212.29, -1100.06, 29.49, 134.04) -- Position du pawnshop (x, y, z, heading)
Config.PawnshopBlip = {
    sprite = 431,
    color = 5,
    scale = 0.7,
    label = "Rachat occasion"
}

Config.Items = {
    ['goldchain'] = {
        label = "Chaîne en Or",
        buyPrice = 1500,
        sellPrice = 750,
        description = "Une chaîne en or de grande valeur"
    },
    ['diamond_ring'] = {
        label = "Bague en Diamant",
        buyPrice = 2500,
        sellPrice = 1250,
        description = "Une bague en diamant précieuse"
    },
    ['rolex'] = {
        label = "Montre Rolex",
        buyPrice = 3000,
        sellPrice = 1500,
        description = "Une montre de luxe"
    },
    -- Ajoutez d'autres objets ici
}

Config.MenuSettings = {
    title = "Rachat occasion",
    position = "top-right",
    canClose = true,
    width = 400
} 