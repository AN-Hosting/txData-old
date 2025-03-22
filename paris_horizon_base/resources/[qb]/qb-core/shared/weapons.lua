QBShared = QBShared or {}
QBShared.Weapons = {
	-- // WEAPONS
	-- Melee
	[`weapon_unarmed`]               = { name = 'weapon_unarmed', label = 'Poings', weapontype = 'Melee', ammotype = nil, damagereason = 'Tué au corps à corps / Frappé / Exécuté / Battu / Assassiné' },
	[`weapon_dagger`]                = { name = 'weapon_dagger', label = 'Dague', weapontype = 'Melee', ammotype = nil, damagereason = 'Poignardé / Lacéré / Éviscéré' },
	[`weapon_bat`]                   = { name = 'weapon_bat', label = 'Batte', weapontype = 'Melee', ammotype = nil, damagereason = 'Tué au corps à corps / Frappé / Exécuté / Battu / Assassiné' },
	[`weapon_bottle`]                = { name = 'weapon_bottle', label = 'Bouteille Cassée', weapontype = 'Melee', ammotype = nil, damagereason = 'Poignardé / Lacéré / Éviscéré' },
	[`weapon_crowbar`]               = { name = 'weapon_crowbar', label = 'Pied de biche', weapontype = 'Melee', ammotype = nil, damagereason = 'Tué au corps à corps / Frappé / Exécuté / Battu / Assassiné' },
	[`weapon_flashlight`]            = { name = 'weapon_flashlight', label = 'Lampe torche', weapontype = 'Melee', ammotype = nil, damagereason = 'Tué au corps à corps / Frappé / Exécuté / Battu / Assassiné' },
	[`weapon_golfclub`]              = { name = 'weapon_golfclub', label = 'Club de golf', weapontype = 'Melee', ammotype = nil, damagereason = 'Tué au corps à corps / Frappé / Exécuté / Battu / Assassiné' },
	[`weapon_hammer`]                = { name = 'weapon_hammer', label = 'Marteau', weapontype = 'Melee', ammotype = nil, damagereason = 'Tué au corps à corps / Frappé / Exécuté / Battu / Assassiné' },
	[`weapon_hatchet`]               = { name = 'weapon_hatchet', label = 'Hachette', weapontype = 'Melee', ammotype = nil, damagereason = 'Poignardé / Lacéré / Éviscéré' },
	[`weapon_knuckle`]               = { name = 'weapon_knuckle', label = 'Poing américain', weapontype = 'Melee', ammotype = nil, damagereason = 'Tué au corps à corps / Frappé / Exécuté / Battu / Assassiné' },
	[`weapon_knife`]                 = { name = 'weapon_knife', label = 'Couteau', weapontype = 'Melee', ammotype = nil, damagereason = 'Poignardé / Lacéré / Éviscéré' },
	[`weapon_machete`]               = { name = 'weapon_machete', label = 'Machette', weapontype = 'Melee', ammotype = nil, damagereason = 'Poignardé / Lacéré / Éviscéré' },
	[`weapon_switchblade`]           = { name = 'weapon_switchblade', label = 'Couteau à cran d\'arrêt', weapontype = 'Melee', ammotype = nil, damagereason = 'Poignardé / Lacéré / Éviscéré' },
	[`weapon_nightstick`]            = { name = 'weapon_nightstick', label = 'Matraque', weapontype = 'Melee', ammotype = nil, damagereason = 'Tué au corps à corps / Frappé / Exécuté / Battu / Assassiné' },
	[`weapon_wrench`]                = { name = 'weapon_wrench', label = 'Clé anglaise', weapontype = 'Melee', ammotype = nil, damagereason = 'Tué au corps à corps / Frappé / Exécuté / Battu / Assassiné' },
	[`weapon_battleaxe`]             = { name = 'weapon_battleaxe', label = 'Hache de guerre', weapontype = 'Melee', ammotype = nil, damagereason = 'Poignardé / Lacéré / Éviscéré' },
	[`weapon_poolcue`]               = { name = 'weapon_poolcue', label = 'Queue de billard', weapontype = 'Melee', ammotype = nil, damagereason = 'Tué au corps à corps / Frappé / Exécuté / Battu / Assassiné' },
	[`weapon_briefcase`]             = { name = 'weapon_briefcase', label = 'Mallette', weapontype = 'Melee', ammotype = nil, damagereason = 'Tué au corps à corps / Frappé / Exécuté / Battu / Assassiné' },
	[`weapon_briefcase_02`]          = { name = 'weapon_briefcase_02', label = 'Mallette', weapontype = 'Melee', ammotype = nil, damagereason = 'Tué au corps à corps / Frappé / Exécuté / Battu / Assassiné' },
	[`weapon_garbagebag`]            = { name = 'weapon_garbagebag', label = 'Sac poubelle', weapontype = 'Melee', ammotype = nil, damagereason = 'Tué au corps à corps / Frappé / Exécuté / Battu / Assassiné' },
	[`weapon_handcuffs`]             = { name = 'weapon_handcuffs', label = 'Menottes', weapontype = 'Melee', ammotype = nil, damagereason = 'Tué au corps à corps / Frappé / Exécuté / Battu / Assassiné' },
	[`weapon_bread`]                 = { name = 'weapon_bread', label = 'Baguette', weapontype = 'Melee', ammotype = nil, damagereason = 'Tué au corps à corps / Frappé / Exécuté / Battu / Assassiné' },
	[`weapon_stone_hatchet`]         = { name = 'weapon_stone_hatchet', label = 'Hache en pierre', weapontype = 'Melee', ammotype = nil, damagereason = 'Poignardé / Lacéré / Éviscéré' },
	[`weapon_candycane`]             = { name = 'weapon_candycane', label = 'Candy Cane', weapontype = 'Melee', ammotype = nil, damagereason = 'Melee Killed / Whacked / Executed / Beat down / Musrdered / Battered / Candy Caned' },
		[`weapon_prolaser4`] = { -- Weapon hash (uses compile-time Jenkins hashes)
			name = 'weapon_prolaser4', -- The internal spawn name of the weapon (e.g., weapon_pistol)
			label = 'Pistolet Radar', -- The display name of the weapon shown to players
			weapontype = 'Melee', -- The type of weapon (e.g., "Pistol", "Shotgun", "Rifle")
			ammotype = nil, -- The type of ammo the weapon uses (e.g., AMMO_PISTOL, AMMO_SHOTGUN)
			damageReason = 'Melee Killed' -- A customizable message that appears in kill notifications to describe the cause of death
		},
	-- Handguns
	-- Pistolets
    [`weapon_pistol`]                = { name = 'weapon_pistol', label = 'Pistolet', weapontype = 'Pistol', ammotype = 'AMMO_PISTOL', damagereason = 'Abattu / Tiré dessus / Criblé de balles' },
    [`weapon_pistol_mk2`]            = { name = 'weapon_pistol_mk2', label = 'Pistolet MK2', weapontype = 'Pistol', ammotype = 'AMMO_PISTOL', damagereason = 'Abattu / Tiré dessus / Criblé de balles' },
    [`weapon_combatpistol`]          = { name = 'weapon_combatpistol', label = 'Pistolet de Combat', weapontype = 'Pistol', ammotype = 'AMMO_PISTOL', damagereason = 'Abattu / Tiré dessus / Criblé de balles' },
    [`weapon_appistol`]              = { name = 'weapon_appistol', label = 'Pistolet Perforant', weapontype = 'Pistol', ammotype = 'AMMO_PISTOL', damagereason = 'Abattu / Tiré dessus / Criblé de balles' },
    [`weapon_stungun`]               = { name = 'weapon_stungun', label = 'Taser', weapontype = 'Pistol', ammotype = 'AMMO_STUNGUN', damagereason = 'Électrocuté' },
    [`weapon_pistol50`]              = { name = 'weapon_pistol50', label = 'Pistolet .50', weapontype = 'Pistol', ammotype = 'AMMO_PISTOL', damagereason = 'Abattu / Tiré dessus / Criblé de balles' },
    [`weapon_snspistol`]             = { name = 'weapon_snspistol', label = 'Pistolet SNS', weapontype = 'Pistol', ammotype = 'AMMO_PISTOL', damagereason = 'Abattu / Tiré dessus / Criblé de balles' },
    [`weapon_snspistol_mk2`]         = { name = 'weapon_snspistol_mk2', label = 'Pistolet SNS MK2', weapontype = 'Pistol', ammotype = 'AMMO_PISTOL', damagereason = 'Abattu / Tiré dessus / Criblé de balles' },
    [`weapon_heavypistol`]           = { name = 'weapon_heavypistol', label = 'Pistolet Lourd', weapontype = 'Pistol', ammotype = 'AMMO_PISTOL', damagereason = 'Abattu / Tiré dessus / Criblé de balles' },
    [`weapon_vintagepistol`]         = { name = 'weapon_vintagepistol', label = 'Pistolet Vintage', weapontype = 'Pistol', ammotype = 'AMMO_PISTOL', damagereason = 'Abattu / Tiré dessus / Criblé de balles' },
    [`weapon_flaregun`]              = { name = 'weapon_flaregun', label = 'Pistolet de Détresse', weapontype = 'Pistol', ammotype = 'AMMO_FLARE', damagereason = 'Brûlé' },
    [`weapon_marksmanpistol`]        = { name = 'weapon_marksmanpistol', label = 'Pistolet de Précision', weapontype = 'Pistol', ammotype = 'AMMO_PISTOL', damagereason = 'Abattu / Tiré dessus / Criblé de balles' },
    [`weapon_revolver`]              = { name = 'weapon_revolver', label = 'Revolver', weapontype = 'Pistol', ammotype = 'AMMO_PISTOL', damagereason = 'Abattu / Tiré dessus / Criblé de balles' },
    [`weapon_revolver_mk2`]          = { name = 'weapon_revolver_mk2', label = 'Revolver MK2', weapontype = 'Pistol', ammotype = 'AMMO_PISTOL', damagereason = 'Abattu / Tiré dessus / Criblé de balles' },
    [`weapon_doubleaction`]          = { name = 'weapon_doubleaction', label = 'Revolver Double Action', weapontype = 'Pistol', ammotype = 'AMMO_PISTOL', damagereason = 'Abattu / Tiré dessus / Criblé de balles' },
    [`weapon_raypistol`]             = { name = 'weapon_raypistol', label = 'Pistolet Laser', weapontype = 'Pistol', ammotype = 'AMMO_PISTOL', damagereason = 'Désintégré' },
    [`weapon_ceramicpistol`]         = { name = 'weapon_ceramicpistol', label = 'Pistolet en Céramique', weapontype = 'Pistol', ammotype = 'AMMO_PISTOL', damagereason = 'Abattu / Tiré dessus / Criblé de balles' },
    [`weapon_navyrevolver`]          = { name = 'weapon_navyrevolver', label = 'Revolver Navy', weapontype = 'Pistol', ammotype = 'AMMO_PISTOL', damagereason = 'Abattu / Tiré dessus / Criblé de balles' },
    [`weapon_gadgetpistol`]          = { name = 'weapon_gadgetpistol', label = 'Pistolet Gadget', weapontype = 'Pistol', ammotype = 'AMMO_PISTOL', damagereason = 'Abattu / Tiré dessus / Criblé de balles' },
    [`weapon_stungun_mp`]            = { name = 'weapon_stungun_mp', label = 'Taser', weapontype = 'Pistol', ammotype = 'AMMO_STUNGUN', damagereason = 'Électrocuté' },
    [`weapon_pistolxm3`]             = { name = 'weapon_pistolxm3', label = 'Pistolet XM3', weapontype = 'Pistol', ammotype = 'AMMO_PISTOL', damagereason = 'Abattu / Tiré dessus / Criblé de balles' },

    -- Mitraillettes
    [`weapon_microsmg`]              = { name = 'weapon_microsmg', label = 'Micro SMG', weapontype = 'Submachine Gun', ammotype = 'AMMO_SMG', damagereason = 'Criblé / Mitraillé / Déchiqueté' },
    [`weapon_smg`]                   = { name = 'weapon_smg', label = 'Mitraillette', weapontype = 'Submachine Gun', ammotype = 'AMMO_SMG', damagereason = 'Criblé / Mitraillé / Déchiqueté' },
    [`weapon_smg_mk2`]               = { name = 'weapon_smg_mk2', label = 'Mitraillette MK2', weapontype = 'Submachine Gun', ammotype = 'AMMO_SMG', damagereason = 'Criblé / Mitraillé / Déchiqueté' },
    [`weapon_assaultsmg`]            = { name = 'weapon_assaultsmg', label = 'Mitraillette d\'Assaut', weapontype = 'Submachine Gun', ammotype = 'AMMO_SMG', damagereason = 'Criblé / Mitraillé / Déchiqueté' },
    [`weapon_combatpdw`]             = { name = 'weapon_combatpdw', label = 'PDW de Combat', weapontype = 'Submachine Gun', ammotype = 'AMMO_SMG', damagereason = 'Criblé / Mitraillé / Déchiqueté' },
    [`weapon_machinepistol`]         = { name = 'weapon_machinepistol', label = 'Tec-9', weapontype = 'Submachine Gun', ammotype = 'AMMO_PISTOL', damagereason = 'Criblé / Mitraillé / Déchiqueté' },
    [`weapon_minismg`]               = { name = 'weapon_minismg', label = 'Mini SMG', weapontype = 'Submachine Gun', ammotype = 'AMMO_SMG', damagereason = 'Criblé / Mitraillé / Déchiqueté' },
    [`weapon_raycarbine`]            = { name = 'weapon_raycarbine', label = 'Carabine Laser', weapontype = 'Submachine Gun', ammotype = 'AMMO_SMG', damagereason = 'Désintégré' },

	-- Shotguns
	[`weapon_pumpshotgun`]           = { name = 'weapon_pumpshotgun', label = 'Fusil à Pompe', weapontype = 'Shotgun', ammotype = 'AMMO_SHOTGUN', damagereason = 'Dévasté / Pulvérisé / Explosé' },
    [`weapon_pumpshotgun_mk2`]       = { name = 'weapon_pumpshotgun_mk2', label = 'Fusil à Pompe MK2', weapontype = 'Shotgun', ammotype = 'AMMO_SHOTGUN', damagereason = 'Dévasté / Pulvérisé / Explosé' },
    [`weapon_sawnoffshotgun`]        = { name = 'weapon_sawnoffshotgun', label = 'Fusil à Canon Scié', weapontype = 'Shotgun', ammotype = 'AMMO_SHOTGUN', damagereason = 'Dévasté / Pulvérisé / Explosé' },
    [`weapon_assaultshotgun`]        = { name = 'weapon_assaultshotgun', label = 'Fusil à Pompe d\'Assaut', weapontype = 'Shotgun', ammotype = 'AMMO_SHOTGUN', damagereason = 'Dévasté / Pulvérisé / Explosé' },
    [`weapon_bullpupshotgun`]        = { name = 'weapon_bullpupshotgun', label = 'Fusil à Pompe Bullpup', weapontype = 'Shotgun', ammotype = 'AMMO_SHOTGUN', damagereason = 'Dévasté / Pulvérisé / Explosé' },
    [`weapon_musket`]                = { name = 'weapon_musket', label = 'Mousquet', weapontype = 'Shotgun', ammotype = 'AMMO_SHOTGUN', damagereason = 'Dévasté / Pulvérisé / Explosé' },
    [`weapon_heavyshotgun`]          = { name = 'weapon_heavyshotgun', label = 'Fusil à Pompe Lourd', weapontype = 'Shotgun', ammotype = 'AMMO_SHOTGUN', damagereason = 'Dévasté / Pulvérisé / Explosé' },
    [`weapon_dbshotgun`]             = { name = 'weapon_dbshotgun', label = 'Fusil à Double Canon', weapontype = 'Shotgun', ammotype = 'AMMO_SHOTGUN', damagereason = 'Dévasté / Pulvérisé / Explosé' },
    [`weapon_autoshotgun`]           = { name = 'weapon_autoshotgun', label = 'Fusil à Pompe Auto', weapontype = 'Shotgun', ammotype = 'AMMO_SHOTGUN', damagereason = 'Dévasté / Pulvérisé / Explosé' },
    [`weapon_combatshotgun`]         = { name = 'weapon_combatshotgun', label = 'Fusil à Pompe de Combat', weapontype = 'Shotgun', ammotype = 'AMMO_SHOTGUN', damagereason = 'Dévasté / Pulvérisé / Explosé' },

    -- Fusils d'assaut
    [`weapon_assaultrifle`]          = { name = 'weapon_assaultrifle', label = 'Fusil d\'Assaut', weapontype = 'Assault Rifle', ammotype = 'AMMO_RIFLE', damagereason = 'Abattu / Neutralisé / Éliminé' },
    [`weapon_assaultrifle_mk2`]      = { name = 'weapon_assaultrifle_mk2', label = 'Fusil d\'Assaut MK2', weapontype = 'Assault Rifle', ammotype = 'AMMO_RIFLE', damagereason = 'Abattu / Neutralisé / Éliminé' },
    [`weapon_carbinerifle`]          = { name = 'weapon_carbinerifle', label = 'Carabine', weapontype = 'Assault Rifle', ammotype = 'AMMO_RIFLE', damagereason = 'Abattu / Neutralisé / Éliminé' },
    [`weapon_carbinerifle_mk2`]      = { name = 'weapon_carbinerifle_mk2', label = 'Carabine MK2', weapontype = 'Assault Rifle', ammotype = 'AMMO_RIFLE', damagereason = 'Abattu / Neutralisé / Éliminé' },
    [`weapon_advancedrifle`]         = { name = 'weapon_advancedrifle', label = 'Fusil Avancé', weapontype = 'Assault Rifle', ammotype = 'AMMO_RIFLE', damagereason = 'Abattu / Neutralisé / Éliminé' },
    [`weapon_specialcarbine`]        = { name = 'weapon_specialcarbine', label = 'Carabine Spéciale', weapontype = 'Assault Rifle', ammotype = 'AMMO_RIFLE', damagereason = 'Abattu / Neutralisé / Éliminé' },
    [`weapon_specialcarbine_mk2`]    = { name = 'weapon_specialcarbine_mk2', label = 'Carabine Spéciale MK2', weapontype = 'Assault Rifle', ammotype = 'AMMO_RIFLE', damagereason = 'Abattu / Neutralisé / Éliminé' },
    [`weapon_bullpuprifle`]          = { name = 'weapon_bullpuprifle', label = 'Fusil Bullpup', weapontype = 'Assault Rifle', ammotype = 'AMMO_RIFLE', damagereason = 'Abattu / Neutralisé / Éliminé' },
    [`weapon_bullpuprifle_mk2`]      = { name = 'weapon_bullpuprifle_mk2', label = 'Fusil Bullpup MK2', weapontype = 'Assault Rifle', ammotype = 'AMMO_RIFLE', damagereason = 'Abattu / Neutralisé / Éliminé' },
    [`weapon_compactrifle`]          = { name = 'weapon_compactrifle', label = 'Fusil Compact', weapontype = 'Assault Rifle', ammotype = 'AMMO_RIFLE', damagereason = 'Abattu / Neutralisé / Éliminé' },
    [`weapon_militaryrifle`]         = { name = 'weapon_militaryrifle', label = 'Fusil Militaire', weapontype = 'Assault Rifle', ammotype = 'AMMO_RIFLE', damagereason = 'Abattu / Neutralisé / Éliminé' },
    [`weapon_heavyrifle`]            = { name = 'weapon_heavyrifle', label = 'Fusil Lourd', weapontype = 'Assault Rifle', ammotype = 'AMMO_RIFLE', damagereason = 'Abattu / Neutralisé / Éliminé' },

    -- Mitrailleuses légères
    [`weapon_mg`]                    = { name = 'weapon_mg', label = 'Mitrailleuse', weapontype = 'Light Machine Gun', ammotype = 'AMMO_MG', damagereason = 'Mitraillé / Criblé / Déchiqueté' },
    [`weapon_combatmg`]              = { name = 'weapon_combatmg', label = 'Mitrailleuse de Combat', weapontype = 'Light Machine Gun', ammotype = 'AMMO_MG', damagereason = 'Mitraillé / Criblé / Déchiqueté' },
    [`weapon_combatmg_mk2`]          = { name = 'weapon_combatmg_mk2', label = 'Mitrailleuse de Combat MK2', weapontype = 'Light Machine Gun', ammotype = 'AMMO_MG', damagereason = 'Mitraillé / Criblé / Déchiqueté' },
    [`weapon_gusenberg`]             = { name = 'weapon_gusenberg', label = 'Mitrailleuse Thompson', weapontype = 'Light Machine Gun', ammotype = 'AMMO_MG', damagereason = 'Mitraillé / Criblé / Déchiqueté' },

    -- Fusils de précision
    [`weapon_sniperrifle`]           = { name = 'weapon_sniperrifle', label = 'Fusil de Sniper', weapontype = 'Sniper Rifle', ammotype = 'AMMO_SNIPER', damagereason = 'Snipé / Abattu à distance / Dans le viseur' },
    [`weapon_heavysniper`]           = { name = 'weapon_heavysniper', label = 'Fusil de Sniper Lourd', weapontype = 'Sniper Rifle', ammotype = 'AMMO_SNIPER', damagereason = 'Snipé / Abattu à distance / Dans le viseur' },
    [`weapon_heavysniper_mk2`]       = { name = 'weapon_heavysniper_mk2', label = 'Fusil de Sniper Lourd MK2', weapontype = 'Sniper Rifle', ammotype = 'AMMO_SNIPER', damagereason = 'Snipé / Abattu à distance / Dans le viseur' },
    [`weapon_marksmanrifle`]         = { name = 'weapon_marksmanrifle', label = 'Fusil de Précision', weapontype = 'Sniper Rifle', ammotype = 'AMMO_SNIPER', damagereason = 'Snipé / Abattu à distance / Dans le viseur' },
    [`weapon_marksmanrifle_mk2`]     = { name = 'weapon_marksmanrifle_mk2', label = 'Fusil de Précision MK2', weapontype = 'Sniper Rifle', ammotype = 'AMMO_SNIPER', damagereason = 'Snipé / Abattu à distance / Dans le viseur' },
    [`weapon_remotesniper`]          = { name = 'weapon_remotesniper', label = 'Fusil de Sniper Télécommandé', weapontype = 'Sniper Rifle', ammotype = 'AMMO_SNIPER_REMOTE', damagereason = 'Snipé / Abattu à distance / Dans le viseur' },

	-- Heavy Weapons
	[`weapon_rpg`]                   = { name = 'weapon_rpg', label = 'Lance-roquettes', weapontype = 'Heavy Weapons', ammotype = 'AMMO_RPG', damagereason = 'Tué / Explosé / Pulvérisé / Détruit / Anéanti' },
	[`weapon_grenadelauncher`]       = { name = 'weapon_grenadelauncher', label = 'Lance-grenades', weapontype = 'Heavy Weapons', ammotype = 'AMMO_GRENADELAUNCHER', damagereason = 'Tué / Explosé / Pulvérisé / Détruit / Anéanti' },
	[`weapon_grenadelauncher_smoke`] = { name = 'weapon_grenadelauncher_smoke', label = 'Lance-grenades fumigènes', weapontype = 'Heavy Weapons', ammotype = 'AMMO_GRENADELAUNCHER', damagereason = 'Tué / Explosé / Pulvérisé / Détruit / Anéanti' },
	[`weapon_minigun`]               = { name = 'weapon_minigun', label = 'Minigun', weapontype = 'Heavy Weapons', ammotype = 'AMMO_MINIGUN', damagereason = 'Tué / Explosé / Pulvérisé / Détruit / Anéanti' },
	[`weapon_firework`]              = { name = 'weapon_firework', label = 'Lance-feux d\'artifice', weapontype = 'Heavy Weapons', ammotype = nil, damagereason = 'Tué / Explosé / Pulvérisé / Détruit / Anéanti' },
	[`weapon_railgun`]               = { name = 'weapon_railgun', label = 'Canon électrique', weapontype = 'Heavy Weapons', ammotype = nil, damagereason = 'Tué / Explosé / Pulvérisé / Détruit / Anéanti' },
	[`weapon_railgunxm3`]            = { name = 'weapon_railgunxm3', label = 'Canon électrique XM3', weapontype = 'Heavy Weapons', ammotype = nil, damagereason = 'Tué / Explosé / Pulvérisé / Détruit / Anéanti' },
	[`weapon_hominglauncher`]        = { name = 'weapon_hominglauncher', label = 'Lance-missiles guidé', weapontype = 'Heavy Weapons', ammotype = 'AMMO_STINGER', damagereason = 'Tué / Explosé / Pulvérisé / Détruit / Anéanti' },
	[`weapon_compactlauncher`]       = { name = 'weapon_compactlauncher', label = 'Lance-grenades compact', weapontype = 'Heavy Weapons', ammotype = nil, damagereason = 'Tué / Explosé / Pulvérisé / Détruit / Anéanti' },
	[`weapon_rayminigun`]            = { name = 'weapon_rayminigun', label = 'Minigun laser', weapontype = 'Heavy Weapons', ammotype = 'AMMO_MINIGUN', damagereason = 'Tué / Explosé / Pulvérisé / Détruit / Anéanti' },
	[`weapon_emplauncher`]           = { name = 'weapon_emplauncher', label = 'Lance-IEM', weapontype = 'Heavy Weapons', ammotype = 'AMMO_EMPLAUNCHER', damagereason = 'Mort' },

	-- Throwables
	[`weapon_grenade`]               = { name = 'weapon_grenade', label = 'Grenade', weapontype = 'Throwable', ammotype = nil, damagereason = 'Explosé / Déchiqueté / Pulvérisé' },
	[`weapon_bzgas`]                 = { name = 'weapon_bzgas', label = 'Gaz BZ', weapontype = 'Throwable', ammotype = nil, damagereason = 'Asphyxié' },
	[`weapon_molotov`]               = { name = 'weapon_molotov', label = 'Cocktail Molotov', weapontype = 'Throwable', ammotype = nil, damagereason = 'Brûlé vif / Carbonisé / Calciné' },
	[`weapon_stickybomb`]            = { name = 'weapon_stickybomb', label = 'C4', weapontype = 'Throwable', ammotype = nil, damagereason = 'Explosé / Déchiqueté / Pulvérisé' },
	[`weapon_proxmine`]              = { name = 'weapon_proxmine', label = 'Mine de proximité', weapontype = 'Throwable', ammotype = nil, damagereason = 'Explosé / Déchiqueté / Pulvérisé' },
	[`weapon_snowball`]              = { name = 'weapon_snowball', label = 'Boule de neige', weapontype = 'Throwable', ammotype = nil, damagereason = 'Mort' },
	[`weapon_pipebomb`]              = { name = 'weapon_pipebomb', label = 'Bombe artisanale', weapontype = 'Throwable', ammotype = nil, damagereason = 'Explosé / Déchiqueté / Pulvérisé' },
	[`weapon_ball`]                  = { name = 'weapon_ball', label = 'Balle', weapontype = 'Throwable', ammotype = 'AMMO_BALL', damagereason = 'Mort' },
	[`weapon_smokegrenade`]          = { name = 'weapon_smokegrenade', label = 'Grenade fumigène', weapontype = 'Throwable', ammotype = nil, damagereason = 'Mort' },
	[`weapon_flare`]                 = { name = 'weapon_flare', label = 'Fusée de détresse', weapontype = 'Throwable', ammotype = 'AMMO_FLARE', damagereason = 'Mort' },

	-- Miscellaneous
	[`weapon_petrolcan`]             = { name = 'weapon_petrolcan', label = 'Bidon d\'essence', weapontype = 'Miscellaneous', ammotype = 'AMMO_PETROLCAN', damagereason = 'Mort' },
	[`gadget_parachute`]             = { name = 'gadget_parachute', label = 'Parachute', weapontype = 'Miscellaneous', ammotype = nil, damagereason = 'Mort' },
	[`weapon_fireextinguisher`]      = { name = 'weapon_fireextinguisher', label = 'Extincteur', weapontype = 'Miscellaneous', ammotype = nil, damagereason = 'Mort' },
	[`weapon_hazardcan`]             = { name = 'weapon_hazardcan', label = 'Bidon dangereux', weapontype = 'Miscellaneous', ammotype = 'AMMO_PETROLCAN', damagereason = 'Mort' },
	[`weapon_fertilizercan`]         = { name = 'weapon_fertilizercan', label = 'Bidon d\'engrais', weapontype = 'Miscellaneous', ammotype = 'AMMO_FERTILIZERCAN', damagereason = 'Mort' },
	[`weapon_barbed_wire`]           = { name = 'weapon_barbed_wire', label = 'Fil barbelé', weapontype = 'Miscellaneous', ammotype = nil, damagereason = 'Transpercé' },
	[`weapon_drowning`]              = { name = 'weapon_drowning', label = 'Noyade', weapontype = 'Miscellaneous', ammotype = nil, damagereason = 'Noyé' },
	[`weapon_drowning_in_vehicle`]   = { name = 'weapon_drowning_in_vehicle', label = 'Noyade en véhicule', weapontype = 'Miscellaneous', ammotype = nil, damagereason = 'Noyé' },
	[`weapon_bleeding`]              = { name = 'weapon_bleeding', label = 'Hémorragie', weapontype = 'Miscellaneous', ammotype = nil, damagereason = 'Saigné à mort' },
	[`weapon_electric_fence`]        = { name = 'weapon_electric_fence', label = 'Clôture électrique', weapontype = 'Miscellaneous', ammotype = nil, damagereason = 'Électrocuté' },
	[`weapon_explosion`]             = { name = 'weapon_explosion', label = 'Explosion', weapontype = 'Miscellaneous', ammotype = nil, damagereason = 'Tué / Explosé / Pulvérisé / Détruit / Anéanti' },
	[`weapon_fall`]                  = { name = 'weapon_fall', label = 'Chute', weapontype = 'Miscellaneous', ammotype = nil, damagereason = 'Suicide' },
	[`weapon_exhaustion`]            = { name = 'weapon_exhaustion', label = 'Épuisement', weapontype = 'Miscellaneous', ammotype = nil, damagereason = 'Mort' },
	[`weapon_hit_by_water_cannon`]   = { name = 'weapon_hit_by_water_cannon', label = 'Canon à eau', weapontype = 'Miscellaneous', ammotype = nil, damagereason = 'Mort' },
	[`weapon_rammed_by_car`]         = { name = 'weapon_rammed_by_car', label = 'Percuté par un véhicule', weapontype = 'Miscellaneous', ammotype = nil, damagereason = 'Écrasé / Renversé' },
	[`weapon_run_over_by_car`]       = { name = 'weapon_run_over_by_car', label = 'Écrasé par un véhicule', weapontype = 'Miscellaneous', ammotype = nil, damagereason = 'Écrasé / Renversé' },
	[`weapon_heli_crash`]            = { name = 'weapon_heli_crash', label = 'Crash d\'hélicoptère', weapontype = 'Miscellaneous', ammotype = nil, damagereason = 'Crash d\'hélicoptère' },
	[`weapon_fire`]                  = { name = 'weapon_fire', label = 'Feu', weapontype = 'Miscellaneous', ammotype = nil, damagereason = 'Brûlé vif / Carbonisé / Calciné' },

	-- Animals
	[`weapon_animal`]                = { name = 'weapon_animal', label = 'Animal', weapontype = 'Animals', ammotype = nil, damagereason = 'Dévoré' },
	[`weapon_cougar`]                = { name = 'weapon_cougar', label = 'Puma', weapontype = 'Animals', ammotype = nil, damagereason = 'Dévoré' },
}
