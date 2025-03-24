Config = Config or {}
-- ██╗███╗░░░███╗██████╗░░█████╗░██████╗░████████╗░█████╗░███╗░░██╗████████╗
-- ██║████╗░████║██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗████╗░██║╚══██╔══╝ 
-- ██║██╔████╔██║██████╔╝██║░░██║██████╔╝░░░██║░░░███████║██╔██╗██║░░░██║░░░ 
-- ██║██║╚██╔╝██║██╔═══╝░██║░░██║██╔══██╗░░░██║░░░██╔══██║██║╚████║░░░██║░░░
-- ██║██║░╚═╝░██║██║░░░░░╚█████╔╝██║░░██║░░░██║░░░██║░░██║██║░╚███║░░░██║░░░
-- ╚═╝╚═╝░░░░░╚═╝╚═╝░░░░░░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚══╝░░░╚═╝░░░ 

--[[

    BEFORE YOU CONTINUE READ THIS

    If you are going to make any changes in these apps.
    How to translate them, change the order, delete them.

    It is very important that you USE the /deletallapps command in your server console and then restart the server.

    IF YOU DO NOT DO this the apps will continue as before

]]

-- ██████╗░███████╗███████╗░█████╗░██╗░░░██╗██╗░░░░░████████╗   ░█████╗░██████╗░██████╗░░██████╗
-- ██╔══██╗██╔════╝██╔════╝██╔══██╗██║░░░██║██║░░░░░╚══██╔══╝   ██╔══██╗██╔══██╗██╔══██╗██╔════╝
-- ██║░░██║█████╗░░█████╗░░███████║██║░░░██║██║░░░░░░░░██║░░░   ███████║██████╔╝██████╔╝╚█████╗░
-- ██║░░██║██╔══╝░░██╔══╝░░██╔══██║██║░░░██║██║░░░░░░░░██║░░░   ██╔══██║██╔═══╝░██╔═══╝░░╚═══██╗
-- ██████╔╝███████╗██║░░░░░██║░░██║╚██████╔╝███████╗░░░██║░░░   ██║░░██║██║░░░░░██║░░░░░██████╔╝
-- ╚═════╝░╚══════╝╚═╝░░░░░╚═╝░░╚═╝░╚═════╝░╚══════╝░░░╚═╝░░░   ╚═╝░░╚═╝╚═╝░░░░░╚═╝░░░░░╚═════╝░

--[[
    -- Pre-installed applications (If you modify them, remember to empty the "apps" column of your sql "users").
    -- Example app DONT UNCOMMENT

    [1] = {                             -- Slot id, 'It is important that you follow the order of the numbers [1], [2], [3]....'
        custom = false,                 -- Is a custom app?
        app = "phone",                  -- name of app (dont touch if it is not custom).
        color = "img/apps/phone.png",   -- App visual image.
        tooltipText = "Phone",          -- Name on smartphone (Traslate if you want).
        tooltipPos = "top",             -- Ignore.
        job = false,                    -- Ignore.
        blockedjobs = {},               -- Ignore.
        slot = 1,                       -- Slot where the app will appear.
        Alerts = 0,                     -- Alerts that will appear in the app as soon as you use the phone.
        bottom = true                   -- Ignore.
    },
]]

Config.PhoneApplications = {
    [1] = {                           --- @param -- Slot id, 'It is important that you follow the order of the numbers [1], [2], [3]....'
        custom = false,               --
        app = 'phone',                -- App label.
        color = 'img/apps/phone.png', -- App visual image.
        tooltipText = 'Téléphone',        -- Ignore.
        tooltipPos = 'top',           -- Ignore.
        job = false,                  -- Ignore.
        blockedjobs = {},             -- Ignore.
        slot = 1,                     -- Slot where the app will appear.
        Alerts = 0,                   -- Alerts that will appear in the app as soon as you use the phone.
        bottom = true                 -- Ignore.
    },
    [2] = {
        custom = false,
        app = 'photos',
        color = 'img/apps/gallery.png',
        tooltipText = 'Photos',
        job = false,
        slot = 2,
        blockedjobs = {},
        Alerts = 0,
        bottom = true
    },
    [3] = {
        custom = false,
        app = 'messages',
        color = 'img/apps/messages.png',
        tooltipText = 'Messages',
        job = false,
        blockedjobs = {},
        slot = 3,
        Alerts = 0,
        bottom = true
    },
    [4] = {
        custom = false,
        app = 'safari',
        color = 'img/apps/zoo.png',
        tooltipText = 'Safari',
        tooltipPos = 'top',
        job = false,
        blockedjobs = {},
        slot = 4,
        Alerts = 0,
        bottom = true
    },
    [5] = {
        custom = false,
        app = 'mail',
        color = 'img/apps/mail.png',
        tooltipText = 'Mail',
        job = false,
        slot = 5,
        blockedjobs = {},
        Alerts = 0
    },
    [6] = {
        custom = false,
        app = 'calendar',
        color = 'img/apps/calendar.png',
        tooltipText = 'Calendrier',
        job = false,
        blockedjobs = {},
        slot = 6,
        Alerts = 0
    },
    [7] = {
        custom = false,
        app = 'camera',
        color = 'img/apps/camera.png',
        tooltipText = 'Appareil photo',
        job = false,
        slot = 7,
        blockedjobs = {},
        Alerts = 0
    },
    [8] = {
        custom = false,
        app = 'store',
        color = 'img/apps/appstore.png',
        tooltipText = 'App Store',
        job = false,
        blockedjobs = {},
        slot = 8,
        Alerts = 0
    },
    [9] = {
        custom = false,
        app = 'clock',
        color = 'img/apps/clock.png',
        tooltipText = 'Horloge',
        job = false,
        blockedjobs = {},
        slot = 9,
        Alerts = 0
    },
    [10] = {
        custom = false,
        app = 'ping',
        color = 'img/apps/ping.png',
        tooltipText = 'Ping',
        job = false,
        blockedjobs = {},
        slot = 10,
        Alerts = 0
    },
    [11] = {
        custom = false,
        app = 'calculator',
        color = 'img/apps/calculator.png',
        tooltipText = 'Calculatrice',
        job = false,
        blockedjobs = {},
        slot = 11,
        Alerts = 0
    },
    [12] = {
        custom = false,
        app = 'bank',
        color = 'img/apps/bank.png',
        tooltipText = 'Cartes',
        job = false,
        blockedjobs = {},
        slot = 12,
        Alerts = 0
    },
    [13] = {
        custom = false,
        app = 'weather',
        color = 'img/apps/weather.png',
        tooltipText = 'Météo',
        job = false,
        slot = 13,
        blockedjobs = {},
        Alerts = 0
    },
    [14] = {
        custom = false,
        app = 'notes',
        color = 'img/apps/notes.png',
        tooltipText = 'Notes',
        job = false,
        slot = 14,
        blockedjobs = {},
        Alerts = 0
    },
    [15] = {
        custom = false,
        app = 'settings',
        color = 'img/apps/settings.png',
        tooltipText = 'Réglages',
        job = false,
        blockedjobs = {},
        slot = 15,
        Alerts = 0
    },
    [16] = {
        custom = false,
        app = 'business',
        color = 'img/apps/business.png',
        tooltipText = 'Entreprise',
        job = false,
        slot = 16,
        blockedjobs = {},
        Alerts = 0
    },
    --[[ [17] = {
        custom = false,
        app = "tips",
        color = "img/apps/tips.png",
        tooltipText = "Tips",
        job = false,
        slot = 17,
        blockedjobs = {},
        Alerts = 1
    }, ]]

    -- Temple for custom app!
    -- Check in docuementation for more info.
    --[[ [18] = {
        custom = true,
        app = "example",
        color = "img/apps/example.png",
        tooltipText = "Example",
        job = false,
        slot = 18,
        blockedjobs = {},
        Alerts = 0
    }, ]]
}

--░█████╗░██████╗░██████╗░  ░██████╗████████╗░█████╗░██████╗░███████╗
--██╔══██╗██╔══██╗██╔══██╗  ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝
--███████║██████╔╝██████╔╝  ╚█████╗░░░░██║░░░██║░░██║██████╔╝█████╗░░
--██╔══██║██╔═══╝░██╔═══╝░  ░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══╝░░
--██║░░██║██║░░░░░██║░░░░░  ██████╔╝░░░██║░░░╚█████╔╝██║░░██║███████╗
--╚═╝░░╚═╝╚═╝░░░░░╚═╝░░░░░  ╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝

Config.StoreAppToday = {
    {
        header = 'Jeux d\'arcade',
        head = 'Téléchargez et jouez aux jeux les plus bizarres que vous trouverez !',
        image = 'https://www.apple.com/newsroom/images/product/apple-arcade/Apple_Arcade-Update_disney-melee-mania_11152021.jpg.news_app_ed.jpg',
        footer = 'Découvrez nos nouveaux jeux dans l\'App Store, jouez avec vos amis mais n\'oubliez pas de profiter du Roleplay !',
        textcolor = 'white'
    },
    {
        header = 'De la musique partout',
        head = 'Avec Soundfy, profitez de votre musique préférée partout !',
        image = 'https://www.apple.com/newsroom/images/product/app-store/Apple-women-developers-apps-games-Niamh-Fitzgerald-and-Chantelle-Cole_inline.jpg.large.jpg',
        footer = 'Recherchez vos hits préférés, créez des listes de lecture et montrez à vos amis la vraie musique, profitez de tout cela avec Soundfy',
        textcolor = 'white'
    }
}

Config.StoreApps = {
    -- Apps from the App Store.
    ['instagram'] = {
        custom = false,                    -- Is custom app?
        app = 'instagram',                 -- App label.
        color = 'img/apps/instagraph.png', -- App visual image.
        tooltipText = 'Instagram',        -- Visual app name.
        tooltipPos = 'top',                -- Ignore.
        job = false,                       -- If you want this app to work only with jobs, put them inside ' '.
        blockedjobs = {},                  -- If you want this app to crash with jobs, put them inside {}.
        slot = 18,                         -- Slot where the app will be installed.
        Alerts = 0,                        -- Ignore.
        creator = 'Instagram, Inc.​',
        password = false,
        isGame = false,
        description = 'Gratuit - Propose des achats intégrés.',
        score = '4.25', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = '22.5M Notes',
        age = '16+',
        extraDescription = {
            {
                header = 'INSTAGRAM',
                head = 'Amusez-vous avec vos amis !',
                image = 'https://img.freepik.com/premium-photo/group-diverse-friends-taking-selfie-beach_53876-91925.jpg?w=2000',
                footer = 'Vous rapprocher des personnes et des choses que vous aimez !',
                textcolor = 'white'
            }
        }
    },
    ['garage'] = {
        custom = false,
        app = 'garage',
        color = 'img/apps/garages.png',
        tooltipText = 'Mon Garage',
        tooltipPos = 'top',
        job = false,
        blockedjobs = {},
        slot = 19,
        creator = 'Raffaele Di Marzo.​',
        Alerts = 0,
        password = false,
        isGame = false,
        description = 'Gérez les données de vos véhicules.',
        score = '3.75', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = '48 Notes',
        age = '18+',
        extraDescription = {
            {
                header = 'MON GARAGE',
                head = 'Gérez vos véhicules ici.',
                image = 'https://i.ibb.co/k6VyMMC/Pv9-W8i-P-d.webp',
                footer = 'Mon Garage est l\'application que tous les propriétaires de voitures, motos ou autres véhicules.',
                textcolor = 'white'
            }
        }
    },
    ['whatsapp'] = {
        custom = false,
        app = 'whatsapp',
        color = 'img/apps/chitchat.png',
        tooltipText = 'WhatsApp',
        tooltipPos = 'top',
        job = false,
        blockedjobs = {},
        slot = 20,
        creator = 'WhatsApp Inc.',
        Alerts = 0,
        password = false,
        isGame = false,
        description = 'Simple. Fiable. Privé.',
        score = '4', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = '9.6M Notes',
        age = '16+',
        extraDescription = {
            {
                header = 'WHATSAPP',
                head = '#3 en réseaux sociaux',
                image = 'https://img.freepik.com/premium-photo/happy-indian-guy-using-mobile-phone-blue-studio-background_116547-20423.jpg?w=360',
                footer = 'WhatsApp es une application de messagerie et d\'appel vidéo GRATUITE.',
                textcolor = 'white'
            }
        }
    },
    ['twitter'] = {
        custom = false,
        app = 'twitter',
        color = 'img/apps/tweedle.png',
        tooltipText = 'Twitter',
        tooltipPos = 'top',
        job = false,
        blockedjobs = {},
        slot = 21,
        creator = 'Twitter, Inc.',
        Alerts = 0,
        password = false,
        isGame = false,
        description = 'Contient des publicités · Propose des achats intégrés',
        score = '3.75', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = '19.3M Notes',
        age = '17+',
        extraDescription = {
            {
                header = 'TWITTER',
                head = 'Êtes-vous prêt à tweeter ?',
                image = 'https://heraldodemexico.com.mx/u/fotografias/m/2022/12/12/f425x230-634931_648913_0.png',
                footer = 'Développez votre réseau social et restez informé des tendances actuelles.',
                textcolor = 'white'
            }
        }
    },
    ['advert'] = {
        custom = false,
        app = 'advert',
        color = 'img/apps/yellow_pages.png',
        tooltipText = 'Le Bon Coin',
        tooltipPos = 'top',
        job = false,
        blockedjobs = {},
        slot = 22,
        creator = 'LEBONCOIN.COM LLC.​',
        Alerts = 0,
        password = false,
        isGame = false,
        description = 'Trouvez des entreprises locales près de chez vous.',
        score = '4', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = '36.1K Notes',
        age = '4+',
        extraDescription = {
            {
                header = 'LE BON COIN',
                head = 'Annoncez vos articles ici.',
                image = 'https://thumbs.dreamstime.com/b/portsmouth-hampshire-uk-mobile-phone-cell-being-held-hand-yellow-pages-app-open-screen-209900632.jpg',
                footer = 'Plus de 30 000 personnes publient leurs articles ici !',
                textcolor = 'white'
            }
        }
    },
    ['tinder'] = {
        custom = false,
        app = 'tinder',
        color = 'img/apps/finder.png',
        tooltipText = 'Tinder',
        tooltipPos = 'top',
        job = false,
        blockedjobs = {},
        slot = 23,
        creator = 'Tinder Inc.​',
        Alerts = 0,
        password = false,
        isGame = false,
        description = 'Discutez et rencontrez de nouvelles personnes !',
        score = '4.25', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = '10.5M Notes',
        age = '16+',
        extraDescription = {
            {
                header = 'TINDER',
                head = 'Avec 30 milliards de matchs à ce jour !',
                image = 'https://www.lavanguardia.com/files/og_thumbnail/uploads/2018/07/10/5fa43bdde7073.jpeg',
                footer = 'Finder est l\'application la plus populaire au monde pour rencontrer de nouvelles personnes.',
                textcolor = 'white'
            }
        }
    },
    ['youtube'] = {
        custom = false,
        app = 'youtube',
        color = 'img/apps/youlink.png',
        tooltipText = 'Youtube',
        tooltipPos = 'top',
        job = false,
        blockedjobs = {},
        slot = 24,
        creator = 'Youtube LLC.​',
        Alerts = 0,
        password = false,
        isGame = false,
        description = 'Vidéos, musique et diffusions en direct',
        score = '3.25', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = '24.3M Notes',
        age = '17+',
        extraDescription = {
            {
                header = 'YOUTUBE',
                head = 'Vos vidéos et créateurs préférés.',
                image = 'https://us.123rf.com/450wm/ufabizphoto/ufabizphoto1808/ufabizphoto180800224/105916085-mesa-de-trabajo-del-fot%C3%B3grafo.jpg?ver=6',
                footer = 'Découvrez un grand nombre de vidéos et de créateurs de contenu !',
                textcolor = 'white'
            }
        }
    },
    ['uber'] = {
        custom = false,
        app = 'uber',
        color = 'img/apps/doorRun.png',
        tooltipText = 'Uber',
        tooltipPos = 'top',
        job = false,
        blockedjobs = {},
        slot = 25,
        creator = 'Uber , Inc.​',
        Alerts = 0,
        password = false,
        isGame = false,
        description = 'Toute commande à emporter livrée à votre porte !',
        score = '3.75', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = '4.9M Notes',
        age = '12+',
        extraDescription = {
            {
                header = 'UBER',
                head = 'Trouvez la livraison de nourriture selon votre budget.',
                image = 'https://www.galgo.com/wp-content/uploads/2023/01/Ventajas-de-comprar-una-moto-para-delivery.webp',
                footer = 'Commencez à travailler maintenant, d\'un simple clic !',
                textcolor = 'white'
            }
        }
    },
    ['darkweb'] = {
        custom = false,
        app = 'darkweb',
        color = 'img/apps/darkweb.png',
        tooltipText = 'Dark Web',
        tooltipPos = 'top',
        job = false,
        blockedjobs = { 'police' },
        slot = 26,
        creator = 'Mike Tigas.​',
        Alerts = 0,
        password = false,
        isGame = false,
        description = 'Dark Web, web anonyme avec Tor.',
        score = '3.25', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = '1.2K Notes',
        age = '18+',
        extraDescription = {
            {
                header = 'Dark Web',
                head = 'Secure, site web/boutique anonyme avec Tor',
                image = 'https://www.adslzone.net/app/uploads-adslzone.net/2018/09/tor-browser-android.jpg?x=480&y=375&quality=40',
                footer = 'La meilleure offre liée à Tor sur iOS à l\'heure actuelle est Onion Browser',
                textcolor = 'white'
            }
        }
    },
    ['state'] = {
        custom = false,
        app = 'state',
        color = 'img/apps/workspace.png',
        tooltipText = 'Mairie',
        tooltipPos = 'top',
        job = false,
        blockedjobs = {},
        slot = 28,
        creator = 'Mairie Inc.​',
        Alerts = 0,
        password = false,
        isGame = false,
        description = 'Contactez les employés de Paris.',
        score = '4.25', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = ' 12M Notes',
        age = '4+',
        extraDescription = {
            {
                header = 'MAIRIE',
                head = 'Police, ambulances et bien plus encore ici',
                image = 'https://cdn.oldskull.net/wp-content/uploads/2014/12/los-santos-ciudad-de-gta.jpg',
                footer = 'Contactez-les directement dès maintenant.',
                textcolor = 'white'
            }
        }
    },
    ['meos'] = {
        custom = false,
        app = 'meos',
        color = 'img/apps/police.png',
        tooltipText = 'Police',
        tooltipPos = 'top',
        job = { 'police' },
        blockedjobs = {},
        slot = 29,
        creator = 'Paris Department.​',
        Alerts = 0,
        password = false,
        isGame = false,
        description = 'MDT exclusif pour les policiers.',
        score = '5', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = ' 12 Notes',
        age = '18+',
        extraDescription = {
            {
                header = 'MDT',
                head = 'Base de données pour la police !',
                image = 'https://i.ibb.co/vV7zBqV/xIn2bWQ.png',
                footer = 'Les Parisiens sont en sécurité grâce à votre travail.',
                textcolor = 'white'
            }
        }
    },
    ['jump'] = {
        custom = false,
        app = 'jump',
        color = 'img/apps/jump.png',
        tooltipText = 'Doodle Jump',
        tooltipPos = 'top',
        job = false,
        blockedjobs = {},
        slot = 30,
        creator = 'Hydra Dev.​',
        Alerts = 0,
        password = false,
        isGame = true,
        description = 'Incroyablement addictif !',
        score = '4.75', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = ' 660 Notes',
        age = '4+',
        extraDescription = {
            {
                header = 'DOODLE JUMP',
                head = 'ATTENTION : Incroyablement addictif !',
                image = 'https://thumbs.gfycat.com/ContentEnragedIridescentshark-size_restricted.gif',
                footer = 'Jeu de saut très amusant !',
                textcolor = 'white'
            }
        }
    },
    ['spotify'] = {
        custom = false,
        app = 'spotify',
        color = 'img/apps/soundfy.png',
        tooltipText = 'Spotify',
        tooltipPos = 'top',
        job = false,
        blockedjobs = {},
        slot = 31,
        creator = 'Soundfy AB.​',
        Alerts = 0,
        password = false,
        isGame = false,
        description = 'Jouez votre musique !',
        score = '4.75', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = '25M Notes',
        age = '12+',
        extraDescription = {
            {
                header = 'SPOTIFY',
                head = 'Jouez votre musique"',
                image = 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bXVzaWN8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
                footer = 'Écoutez quelques morceaux sur la radio Soundfy.',
                textcolor = 'white'
            }
        }
    },
    ['flappy'] = {
        custom = false,
        app = 'flappy',
        color = 'img/apps/flappy.png',
        tooltipText = 'Flappy Bird',
        tooltipPos = 'top',
        job = false,
        blockedjobs = {},
        slot = 32,
        creator = 'Essendon Studios.​',
        Alerts = 0,
        password = false,
        isGame = true,
        description = 'Sautez avec votre oiseau autour du monde !',
        score = '4.75', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = '2M Notes',
        age = '12+',
        extraDescription = {
            {
                header = 'FLAPPY BIRD',
                head = 'Sautez avec votre oiseau autour du monde !',
                image = 'https://deblogsyjuegos.files.wordpress.com/2015/10/flappygif.gif',
                footer = 'Amusez-vous avec le nouveau Flappy Bird !',
                textcolor = 'white'
            }
        }
    },
    ['kong'] = {
        custom = false,
        app = 'kong',
        color = 'img/apps/kong.png',
        tooltipText = 'Donkey Kong',
        tooltipPos = 'top',
        job = false,
        blockedjobs = {},
        slot = 33,
        creator = 'Nintendo Inc.​',
        Alerts = 0,
        password = false,
        isGame = true,
        description = 'Sauvez la princesse!',
        score = '2.25', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = '3M Notes',
        age = '4+',
        extraDescription = {
            {
                header = 'DONKEY KONG',
                head = 'Sauvez la princesse',
                image = 'https://i.gifer.com/1INx.gif',
                footer = 'Incarnez Mario pour sauver la princesse Peach des griffes de Donkey Kong !',
                textcolor = 'white'
            }
        }
    },
    ['uberDriver'] = {
        custom = false,
        app = 'uberDriver',
        color = 'img/apps/drivenow.png',
        tooltipText = 'Uber VTC',
        tooltipPos = 'top',
        job = false,
        blockedjobs = {},
        slot = 36,
        creator = 'Conduisez maintenant, Inc.',
        Alerts = 0,
        password = false,
        isGame = false,
        description = 'Demandez des voyages quand vous le souhaitez',
        score = '4', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = '12M Notes',
        age = '16+',
        extraDescription = {
            {
                header = 'UBER VTC',
                head = 'Demandez des voyages quand vous le souhaitez',
                image = 'https://www.acunor.es/wp-content/uploads/elementor/thumbs/shutterstock_2045581154FILEminimizer-pu611nm0zd2qyrj4p5mdneydbdm3yslsn9p6mk7mcw.jpg',
                footer = 'Chez Uber VTC, nous nous engageons pour votre sécurité.',
                textcolor = 'white'
            }
        }
    },
    ['weazel'] = {
        custom = false,
        app = 'weazel',
        color = 'img/apps/news.png',
        tooltipText = 'Nouvelle',
        tooltipPos = 'top',
        job = false,
        blockedjobs = {},
        slot = 37,
        creator = 'iQS Basics',
        Alerts = 0,
        password = false,
        isGame = false,
        description = 'Découvrez toutes les actualités fraîches',
        score = '4.75', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = '18M Notes',
        age = '9+',
        extraDescription = {
            {
                header = 'NOUVELLE',
                head = 'Journalistes de Paris !',
                image = 'https://cdn.neow.in/news/images/uploaded/2020/02/1580744740_og__divs9jfd19aq.jpg',
                footer = 'Découvrez toutes les actualités fraîches.',
                textcolor = 'white'
            }
        }
    },
    ['tiktok'] = {
        custom = false,
        app = 'tiktok',
        color = 'img/apps/ticktock.png',
        tooltipText = 'TikTock',
        tooltipPos = 'top',
        job = false,
        blockedjobs = {},
        slot = 38,
        creator = 'TikTock Pte. Ltd.',
        Alerts = 0,
        password = false,
        isGame = false,
        description = 'TikTock est une communauté mondiale de courtes vidéos.',
        score = '5', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = '900M Notes',
        age = '9+',
        extraDescription = {
            {
                header = 'TikTock',
                head = 'TikTock est une communauté mondiale de courtes vidéos.',
                image = 'https://images.saymedia-content.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:eco%2Cw_1200/MTc0MzA4OTQ1ODc0NjU5MTk2/soul-line-dances.jpg',
                footer = 'Avec cette application, vous pouvez découvrir, créer et éditer des vidéos incroyables',
                textcolor = 'white'
            }
        }
    },
    ['tower'] = {
        custom = false,
        app = 'tower',
        color = 'img/apps/tower.png',
        tooltipText = 'City Building',
        tooltipPos = 'top',
        job = false,
        blockedjobs = {},
        slot = 39,
        creator = 'Cool Heureux',
        Alerts = 0,
        password = false,
        isGame = true,
        description = 'Jeu de construction de maison Happy Tower',
        score = '3.75', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = '20K Notes',
        age = '9+',
        extraDescription = {
            {
                header = 'City Building',
                head = 'Maison amusante et drôle',
                image = 'https://is1-ssl.mzstatic.com/image/thumb/Purple122/v4/dd/09/0d/dd090df4-bf4c-788f-62e0-ca006227886d/source/512x512bb.jpg',
                footer = 'Jeu de construction de maison Happy Tower',
                textcolor = 'white'
            }
        }
    },
    ['labyrinth'] = {
        custom = false,
        app = 'labyrinth',
        color = 'img/apps/labyrinth.png',
        tooltipText = 'Jeu de puzzle de labyrinthe',
        tooltipPos = 'top',
        job = false,
        blockedjobs = {},
        slot = 40,
        creator = 'iOS Basics',
        Alerts = 0,
        password = false,
        isGame = true,
        description = 'Jeu de labyrinthe classique où vous contrôlez la balle',
        score = '4', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = '100K Notes',
        age = '9+',
        extraDescription = {
            {
                header = 'Maze Puzzle Game',
                head = 'Jeu de labyrinthe classique où vous contrôlez la balle',
                image = 'https://i.ytimg.com/vi/JRXC2A9Hgl0/maxresdefault.jpg',
                footer = 'Jouez au meilleur jeu de labyrinthe sur votre mobile',
                textcolor = 'white'
            }
        }
    },
    ['radio'] = {
        custom = false,
        app = 'radio',
        color = 'img/apps/radio.png',
        tooltipText = 'Radio',
        tooltipPos = 'top',
        job = false,
        blockedjobs = {},
        slot = 42,
        creator = 'Radio Inc.​',
        Alerts = 0,
        password = false,
        isGame = false,
        description = 'Radio pour tous les utilisateurs.',
        score = '3.25', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = ' 332 Notes',
        age = '16+',
        extraDescription = {
            {
                header = 'RADIO',
                head = 'Une radio pour se connecter à de nombreuses fréquences !',
                image = 'https://i.ibb.co/RB7Pv6n/ENBVOUI.png',
                footer = 'Communiquez rapidement et en toute sécurité.',
                textcolor = 'black'
            }
        }
    },

    -- Temple for custom app!
    -- Check in docuementation for more info.
    --[[ ['example'] = {
        custom = true,
        app = "example",
        color = "./img/apps/example.png",
        background = "#FFFFFF",
        tooltipText = "Example",
        tooltipPos = 'top',
        job = false,
        blockedjobs = {},
        slot = 44,
        creator = "Lucceti's Pizza, Inc.",
        Alerts = 0,
        password = false,
        isGame = false,
        description = 'Request Pizza Deliveries',
        score = '4', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = '12M Ratings',
        age = '3+',
        extraDescription = {
            {
                header = 'Uber',
                head = 'Request Pizza Deliveries',
                image = 'https://www.autofacil.es/wp-content/uploads/2021/05/coche_uber.jpg',
                footer = 'In Uber we commit ourselves to your security.',
                textcolor = 'white'
            }
        }
    }, ]]
    --[[ ['rentel'] = { -- Rental DLC.
        custom = false,
        app = "rentel",
        color = "img/apps/rentel.png",
        tooltipText = "Nextbike",
        tooltipPos = 'top',
        job = false,
        blockedjobs = {},
        slot = 45,
        creator = "nextbike.​",
        Alerts = 0,
        password = false,
        isGame = false,
        description = 'Start cycling!',
        score = '3.50', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = '333 Ratings',
        age = '4+',
        extraDescription = {
            {
                header = 'NEXTBIKE',
                head = 'The best bike rental app!',
                image = 'https://i.ibb.co/tsQT2hH/WPzp1PV.png',
                footer = 'Find bike rental areas or even make friends!',
                textcolor = 'white'
            }
        }
    }, ]]
    ['racing'] = { -- Racing DLC.
        custom = false,
        app = 'racing',
        color = 'img/apps/racing.png',
        tooltipText = 'Courses',
        tooltipPos = 'top',
        job = false,
        blockedjobs = { 'police' },
        slot = 46,
        creator = 'Paris Horizon.​',
        Alerts = 0,
        password = false,
        isGame = false,
        description = 'Application de courses illégales de Paris.',
        score = '4.25', -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = '5M Notes',
        age = '16+',
        extraDescription = {
            {
                header = 'COURSES',
                head = 'Courses illégales à Paris !',
                image = 'https://ibb.co/mzvLSRx',
                footer = 'Application créée par Dominique Toretto, pour apporter du confort aux conducteurs.',
                textcolor = 'white'
            }
        }
    },

    --[[ ["sellix"] = { -- Sellix DLC.
        custom = false,
        app = "sellix",
        color = "img/apps/sellix.png",
        tooltipText = "Sellix",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 47,
        creator = "Sellix Inc.​",
        Alerts = 0,
        password = false,
        isGame = false,
        description = "eCommerce Dashboard",
        score = "2.25", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = " 199 Ratings",
        age = "18+",
        extraDescription = {
            {
                header = "SELLIX",
                head = "eCommerce Dashboard",
                image = "https://i.ytimg.com/vi/yjEKxwnHLEc/maxresdefault.jpg",
                footer = "Manage your products and sales",
                textcolor = 'black'
            }
        }
    }, ]]

    ["crypto"] = {
        custom = false,
        app = "crypto",
        color = "img/apps/crypto.png",
        tooltipText = "Crypto",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 41,
        creator = "Crypto LTD",
        Alerts = 0,
        password = false,
        isGame = false,
        description = "Un échange crypto pour tous ces passionnés de diamants",
        score = "4.25", -- Options: 0, 0.25, 0.5, 0.75, 1, 1.25, 1.50, 1.75, 2, 2.25, 2.50, 2.75, 3, 3.25, 3.50, 3.75, 4, 4.25, 4.50, 4.75, 5
        rating = "316K Notes",
        age = "18+",
        extraDescription = {
            {
                header = "CRYPTO",
                head = "Échange de crypto-monnaie",
                image = "https://v2.cimg.co/news/75173/174150/adobestock-iryna-budanova-1-1.jpg",
                footer = "Crypto : Achetez du Bitcoin !",
                textcolor = 'white'
            }
        }
    },
}
