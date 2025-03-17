local Translations = {
    afk = {
        will_kick = 'Vous êtes AFK et serez expulsé dans ',
        time_seconds = ' secondes !',
        time_minutes = ' minute(s) !',
        kick_message = 'Vous avez été expulsé pour inactivité'
    },
    wash = {
        in_progress = "Le véhicule est en cours de lavage...",
        wash_vehicle = "[E] Laver le véhicule",
        wash_vehicle_target = "Laver le véhicule",
        dirty = "Le véhicule n'est pas sale",
        cancel = "Lavage annulé..."
    },
    consumables = {
        eat_progress = "En train de manger...",
        drink_progress = "En train de boire...",
        liqour_progress = "En train de boire de l'alcool...",
        coke_progress = "Petite prise rapide...",
        crack_progress = "En train de fumer du crack...",
        ecstasy_progress = "Prend des pilules",
        healing_progress = "Soin en cours",
        meth_progress = "En train de fumer de la meth",
        joint_progress = "Allume le joint...",
        use_parachute_progress = "Met le parachute...",
        pack_parachute_progress = "Plie le parachute...",
        no_parachute = "Vous n'avez pas de parachute !",
        armor_full = "Vous avez déjà assez de protection !",
        armor_empty = "Vous ne portez pas de gilet...",
        armor_progress = "Enfile le gilet pare-balles...",
        heavy_armor_progress = "Enfile le gilet pare-balles lourd...",
        remove_armor_progress = "Retire le gilet pare-balles...",
        canceled = "Annulé..."
    },
    cruise = {
        unavailable = "Régulateur de vitesse indisponible",
        activated = "Régulateur de vitesse activé",
        deactivated = "Régulateur de vitesse désactivé"
    },
    editor = {
        started = "Enregistrement démarré !",
        save = "Enregistrement sauvegardé !",
        delete = "Enregistrement supprimé !",
        editor = "À plus tard !"
    },
    firework = {
        place_progress = "Installation du feu d'artifice...",
        canceled = "Annulé...",
        time_left = "Lancement du feu d'artifice dans ~r~"
    },
    seatbelt = {
        use_harness_progress = "Attache le harnais de course",
        remove_harness_progress = "Retire le harnais de course",
        no_car = "Vous n'êtes pas dans une voiture."
    },
    teleport = {
        teleport_default = 'Utiliser l\'ascenseur'
    },
    pushcar = {
        stop_push = "[E] Arrêter de pousser"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})