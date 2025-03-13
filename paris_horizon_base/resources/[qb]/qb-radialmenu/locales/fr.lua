local Translations = {
    error = {
        no_people_nearby = "Aucun joueur n'est a proximite.",
        no_vehicle_found = "Aucun vehicule n'a ete retrouve.",
        extra_deactivated = "%{extra} supplementaires ont ete desactives.",
        extra_not_present = "%{extra} supplementaires ne sont pas presents sur ce vehicule.",
        not_driver = "Tu n'es pas le conducteur de vehicule.",
        vehicle_driving_fast = "Ce vehicule va trop vite.",
        seat_occupied = "Ce siege est occupe.",
        race_harness_on = "Tu as un harnais de course. Tu ne peux pas changer.",
        obj_not_found = "Impossible de creer l'objet demande.",
        not_near_ambulance = "Tu n'es pas pres d'une ambulance.",
        far_away = "Tu es trop loin.",
        stretcher_in_use = "Cette civiere est deja utilisee.",
        not_kidnapped = "Tu n'as pas kidnappe cette personne.",
        trunk_closed = "Le coffre est ferme.",
        cant_enter_trunk = "Tu ne peux pas entrer dans ce coffre.",
        already_in_trunk = "Tu es deja dans le coffre.",
        someone_in_trunk = "Quelqu'un est deja dans le coffre."
    },
    success = {
        extra_activated = "%{extra} supplementaires ont ete actives.",
        entered_trunk = "Tu es dans le coffre."
    },
    info = {
        no_variants = "Il ne semble pas y avoir de variantes pour cela.",
        wrong_ped = "Ce modele ped ne permet pas cette option.",
        nothing_to_remove = "Tu n'as rien a enlever.",
        already_wearing = "Tu le portes deja.",
        switched_seats = "Tu es maintenant dans le %{seat}."
    },
    general = {
        command_description = "Ouvrer le Menu Radial",
        push_stretcher_button = "[E] - Pousser la Civiere",
        stop_pushing_stretcher_button = "~g~E~w~ - Arreter de Pousser",
        lay_stretcher_button = "[G] - Se Coucher sur la Civiere",
        push_position_drawtext = "Poussez Ici",
        get_off_stretcher_button = "[G] - Descendre de la Civiere",
        get_out_trunk_button = "[E] Sortir du Coffre",
        close_trunk_button = "[G] Fermer le Coffre",
        open_trunk_button = "[G] Ouvrir le Coffre",
        getintrunk_command_desc = "Entrer dans le Coffre",
        putintrunk_command_desc = "Mettre le Joueur dans le Coffre"
    },
    options = {
        emergency_button = "Le Bouton d'Urgence",
        driver_seat = "Le Siege du Conducteur",
        passenger_seat = "Le Siege Passager",
        other_seats = "L'Autre Siege",
        rear_left_seat = "Le Siege Arriere Gauche",
        rear_right_seat = "Le Siege Arriere Droit"
    },
}

if GetConvar('qb_locale', 'en') == 'fr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
