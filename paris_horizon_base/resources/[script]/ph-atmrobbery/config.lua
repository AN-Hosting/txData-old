Config = {}

-- ATM models provenant de okokBanking
Config.ATM = {
    {model = -870868698},
    {model = -1126237515},
    {model = -1364697528},
    {model = 506770882}
}

-- Temps en secondes entre chaque explosion
Config.ExplosionDelay = 12

-- Nombre d'explosions nécessaires pour ouvrir l'ATM
Config.ExplosionsNeeded = 2

-- Cooldown entre deux braquages (en minutes)
Config.Cooldown = 0 -- Plus de cooldown personnel

-- Item nécessaire pour poser la bombe
Config.BombItem = 'atm_bomb'

-- Nombre de liasses d'argent générées
Config.MoneyStacksAmount = {min = 5, max = 10}

-- Argent par liasse
Config.MoneyPerStack = {min = 500, max = 2000}

-- Probabilité que l'argent soit sale (%)
Config.BlackMoneyChance = 75

-- Types d'argent (utilisés comme noms d'items)
Config.MoneyTypes = {
    clean = 'black',    -- Item argent propre
    dirty = 'black'    -- Item argent sale
}

-- Durée pendant laquelle l'ATM reste inutilisable après un braquage (en minutes)
Config.ATMCooldown = 120 -- 2 heures

-- Durée de vie des sacs d'argent (en minutes)
Config.MoneyBagLifetime = 120 -- 2 heures

-- Props pour les objets du jeu
Config.Props = {
    bomb = 'prop_ld_bomb_01',
    money = 'prop_money_bag_01',
    broken_atm = 'prop_atm_02_vent' -- ATM cassé
}

-- Notifications
Config.Locale = {
    bomb_planted = "Vous avez placé une bombe sur l'ATM",
    explosion_countdown = "Explosion dans %s secondes",
    atm_exploded = "L'ATM a explosé ! Encore %s explosion(s) nécessaire(s)",
    atm_opened = "L'ATM est maintenant ouvert !",
    collecting_money = "Vous récupérez de l'argent...",
    collected_money = "Vous avez récupéré ~g~$%s~s~",
    cooldown_active = "Vous ne pouvez pas braquer un ATM pour le moment",
    atm_already_being_robbed = "Cet ATM est déjà en cours de braquage",
    atm_already_robbed = "Cet ATM a déjà été braqué récemment",
    need_item = "Vous avez besoin d'une bombe pour braquer cet ATM",
    police_alert = "Un braquage d'ATM est en cours !",
    police_required = "Pas assez de policiers en service"
}

-- Configuration police
Config.RequiredPolice = 2 -- Nombre de policiers requis
Config.PoliceJobs = {'leo'} -- Jobs de police
