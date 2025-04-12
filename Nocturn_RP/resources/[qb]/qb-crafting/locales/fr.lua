local Translations = {
    menus = {
        header = 'Menu de Fabrication',
        pickupworkBench = 'Ramasser l\'établi',
        entercraftAmount = 'Quantité à fabriquer :',
    },
    notifications = {
        pickupBench = 'Vous avez ramassé l\'établi.',
        invalidAmount = 'Quantité invalide',
        invalidInput = 'Entrée invalide',
        notenoughMaterials = 'Vous n\'avez pas assez de matériaux !',
        craftingCancelled = 'Fabrication annulée',
        tablePlace = 'Votre table de fabrication a été placée',
        craftMessage = 'Vous avez fabriqué %dx %s',
        xpGain = 'Vous avez gagné %d XP en %s',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
