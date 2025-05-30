local Translations = {
    error = {
        not_in_range = 'Trop loin de la mairie'
    },
    success = {
        recived_license = 'Vous avez reçu votre %{value} pour $50'
    },
    info = {
        new_job_app = 'Votre candidature a été envoyée au patron de (%{job})',
        bilp_text = 'Services Publiques',
        city_services_menu = '~g~E~w~ - Menu Services Pubiques',
        id_card = 'Carte d\'identité',
        driver_license = 'Permis de conduire',
        weaponlicense = 'Permis d\'armes',
        new_job = 'Bravo pour votre nouveau travail! (%{job})'
    },
    email = {
        jobAppSender = "%{job}",
        jobAppSub= "Merci d'avoir postulé pour %{job}.",
        jobAppMsg = "Bonjour %{gender} %{lastname}<br /><br />%{job} a reçu votre candidature.<br /><br />Le patron examine votre demande et vous contactera pour un entretien dès que possible.<br /><br />Encore une fois, merci pour votre candidature.",
        mr = 'Mr',
        mrs = 'Mme',
        sender = 'Mairie',
        subject = 'Demande de cours de conduite',
        message = 'Bonjour, %{gender} %{lastname}<br /><br />Nous avons reçu un message de quelqu\'un voulant passer son permis<br />Si vous souhaitez lui faire passer, Veuillez nous contacter:<br />Nom: <strong>%{firstname} %{lastname}</strong><br />Numéro de Téléphone: <strong>%{phone}</strong><br/><br/>Cordialement,<br />Mairie de Los Santos',
    }
}

if GetConvar('qb_locale', 'en') == 'fr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
