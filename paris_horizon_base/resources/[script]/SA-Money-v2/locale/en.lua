local Translations = {
    notifications = {
        enoughmoney = "Vous n'avez pas assez d'argent.",
        FullInventory = "Votre inventaire est plein, votre argent a été déposé en banque - %{money}€",
        recieved = "Vous avez reçu %{money}€",
        paid = "Vous avez payé %{money}€",
        error = "Une erreur s'est produite lors de l'ajout d'argent. Contactez un administrateur"
    },
    migration = {
        info = 'Outil de migration de l\'argent liquide vers le compte bancaire. (God)',
        done = 'Migration terminée',
        error = 'La migration a échoué',
        progress = '%{progress} / %{accounts} utilisateurs en cours de migration'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
