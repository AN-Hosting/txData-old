$(function () {
    // Configuration des animations
    const ANIMATION_DURATION = 300;
    const FADE_DURATION = 200;

    // Fonction utilitaire pour les animations
    const animateElement = (element, show) => {
        if (show) {
            $(element).fadeIn(FADE_DURATION).css('visibility', 'visible');
        } else {
            $(element).fadeOut(FADE_DURATION).css('visibility', 'hidden');
        }
    };

    // Gestionnaire principal des messages
    window.addEventListener('message', function (event) {
        const data = event.data;

        switch (data.action) {
            case "UpdateMoney":
                if (data.account === 'money') {
                    $(".dwallet").text(`${data.icon} ${data.money}`);
                    animateElement('.wallet', true);
                    setTimeout(() => animateElement('.wallet', false), data.time);
                } else if (data.account === 'bank') {
                    $(".dbank").text(`${data.icon} ${data.money}`);
                    animateElement('.bank', true);
                    setTimeout(() => animateElement('.bank', false), data.time);
                }
                break;

            case "playerLoggedIn":
                $(".allstatus").fadeIn(ANIMATION_DURATION).css("display", "flex");
                break;

            case "hideHUD":
                $(".allstatus").fadeOut(ANIMATION_DURATION);
                $(".wallet, .bank, .job, .id, .gang, .ammo").css("visibility", "hidden");
                break;

            case "showHUD":
                $(".allstatus").fadeIn(ANIMATION_DURATION);
                $(".wallet, .bank, .job, .id, .gang, .ammo").css("visibility", "visible");
                break;

                case "UpdateAmmo":
                    if (data.current !== undefined && data.max !== undefined) {
                        $(".dammo").text(`${data.current}/${data.max}`);
                        animateElement('.ammo', true);
                        setTimeout(() => animateElement('.ammo', false), 2000);
                    } else {
                        // Si aucune arme n'est équipée, cacher le carré des munitions
                        animateElement('.ammo', false);
                    }
                    break;
        }
    });

    // Gestionnaire des mises à jour d'état
    window.addEventListener('message', function (event) {
        const { wallet, bank, id, job, job_grade, gang, gang_grade } = event.data;
        
        if (wallet !== undefined) $(".dwallet").text(wallet);
        if (bank !== undefined) $(".dbank").text(bank);
        if (id !== undefined) $(".did").text(id);
        if (job !== undefined && job_grade !== undefined) {
            $(".djob").text(`${job} - ${job_grade}`);
        }
        if (gang !== undefined) {
            if (gang === "none") {
                $(".dgang").text("Sans Gang");
            } else if (gang_grade !== undefined) {
                $(".dgang").text(`${gang} - ${gang_grade}`);
            } else {
                $(".dgang").text(gang);
            }
        }
    });
});
