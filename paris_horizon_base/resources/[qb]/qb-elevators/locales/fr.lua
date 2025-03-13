local Translations = {
    error = {
        ['no_access'] = "Vous n'avez pas accès à cet ascenseur",
    },
    menu = {
        ['elevator']     = "Ascenseur",
        ['use_elevator'] = "Utilisez l'ascenseur depuis l'étage %{level}",
        ['close_menu']   = "Fermer le menu",
        ['floor']        = "Niveau %{level}",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
