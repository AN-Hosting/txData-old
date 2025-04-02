local Translations = {
    error = {
        no_job = 'Vous n\'avez pas le bon job!',
        not_enough_money = 'Vous n\'avez pas assez d\'argent!',
        no_item = 'Vous n\'avez pas cet item!',
        cant_sell = 'Cet item ne peut pas être vendu!',
    },
    success = {
        item_bought = 'Vous avez acheté %{item} pour $%{price}',
        item_sold = 'Vous avez vendu %{item} pour $%{price}',
    },
    info = {
        open_menu = '~g~E~w~ - Ouvrir le Pawnshop',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
}) 