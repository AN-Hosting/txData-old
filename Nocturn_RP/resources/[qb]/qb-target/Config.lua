local QBCore = exports['qb-core']:GetCoreObject()

Config = {
    -- Debug mode (will print object detials and create line for cursor and cam position)
    Debug = false,
    Standalone = false,
    DrawOutline = true,
    OutlineColor = {40, 237, 250, 255},
    DrawColor = {255, 255, 255, 150},
    SuccessDrawColor = {40, 237, 250, 255},
    ErrorDrawColor = {255, 0, 0, 255},
    DrawDistance = 15.0,
    DrawSprite = true,
    EnableDefaultOptions = true,
    EnableMouseRotate = false,
    MaxDistance = 7.0,
    DefaultDistance = 2,
    OpenConditons = function()
        return true
    end,
    KeyMappingSettings = {
        Label = "Ouvrir le Menu Contextuel",
        -- If you want to use a keybind, use the following format: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
        Key = "LMENU",
    },
    SelfOptions = {
        ["viewid"] = {
            type = "client",
            action = function()
                local playerId = GetPlayerServerId(PlayerId())
                local playerPed = PlayerPedId()
                local timer = 10000 -- 5 secondes

                CreateThread(function()
                    local start = GetGameTimer()
                    while GetGameTimer() - start < timer do
                        local coords = GetEntityCoords(playerPed)
                        DrawText3D(coords.x, coords.y, coords.z + 1.0, "ID: " .. playerId)
                        Wait(0)
                    end
                end)
            end,
            icon = "fas fa-id-card",
            label = "Voir mon ID",
            priority = 100
        },
        ["optionpersonel"] = {
            icon = "fas fa-person", 
            label = "Option Personnel",
            priority = 90,
            subOptions = {
                {
                    icon = "fas fa-plus",
                    label = "Rockstar Editor",
                    subOptions = {
                        {
                            type = "command",
                            event = "record",
                            icon = "fas fa-video",
                            label = "Record"
                        },
                        {
                            type = "command",
                            event = "clip",
                            icon = "fas fa-film",
                            label = "Clip"
                        },
                        {
                            type = "command",
                            event = "saveclip",
                            icon = "fas fa-save",
                            label = "Save Clip"
                        },
                        {
                            type = "command",
                            event = "delclip",
                            icon = "fas fa-trash",
                            label = "Delete Clip"
                        },
                        {
                            type = "command",
                            event = "editor",
                            icon = "fas fa-edit",
                            label = "Editor"
                        },
                    }
                },
                {
                    type = "command",
                    event = "invoices",
                    icon = "fas fa-clipboard-check",
                    label = "Menu Facture"
                },
                {
                    type = "command",
                    event = "myfinance",
                    icon = "fas fa-clipboard",
                    label = "My Finance"
                },
            }
        },
        -- ["optionjob"] = {
        --     icon = "fas fa-folder", 
        --     label = "Option Job",
        --     priority = 80,
        --     canInteract = function(entity)
        --         local Player = QBCore.Functions.GetPlayerData()
        --         return Player.job.name ~= "unemployed"
        --     end,
        --     subOptions = {
        --         {
        --             type = "client",
        --             icon = "fas fa-clipboard",
        --             label = "Prendre son service 🔴",
        --             action = function()
        --                 if not QBCore then return end
        --                 local Player = QBCore.Functions.GetPlayerData()
        --                 if Player.job.onduty then
        --                     TriggerServerEvent('QBCore:ToggleDuty')
        --                 else
        --                     TriggerServerEvent('QBCore:ToggleDuty')
        --                 end
        --             end,
        --         },
        --         {
        --             icon = "fas fa-clipboard-check",
        --             label = "Annonces",
        --             type = "client",
        --             canInteract = function(entity)
        --                 local Player = QBCore.Functions.GetPlayerData()
        --                 return Player.job.name ~= "unemployed" and Player.job.onduty
        --             end,
        --             subOptions = {
        --                 {
        --                     type = "client",
        --                     icon = "fas fa-door-open",
        --                     label = "Annonces Ouverture",
        --                     action = function()
        --                         TriggerEvent('k5_notify:client:sendAnnouncement', {type = "open"})
        --                     end
        --                 },
        --                 {
        --                     type = "client",
        --                     icon = "fas fa-door-closed",
        --                     label = "Annonces Fermeture",
        --                     action = function()
        --                         TriggerEvent('k5_notify:client:sendAnnouncement', {type = "close"})
        --                     end
        --                 },
        --                 {
        --                     type = "client",
        --                     icon = "fas fa-clipboard",
        --                     label = "Annonces Personnalisées",
        --                     event = "k5_notify:client:customAnnouncement"
        --                 }
        --             }
        --         },
        --         {
        --             type = "command",
        --             event = "invoices",
        --             icon = "fas fa-clipboard-check",
        --             label = "Menu Facture",
        --             canInteract = function(entity)
        --                 local Player = QBCore.Functions.GetPlayerData()
        --                 return Player.job.name ~= "unemployed" and Player.job.onduty
        --             end
        --         },
        --     }
        -- },
        ["clothe"] = {
            type = "client",
            icon = "fas fa-tshirt", 
            label = "Vêtements",
            subOptions = {
                {
                    type = "client",
                    icon = "fas fa-ellipsis",
                    label = "Plus d'options",
                    subOptions = {
                        {
                            type = "command",
                            event = "gloves",
                            icon = "fas fa-mitten",
                            label = "Gants"
                        },
                        {
                            type = "command",
                            event = "visor",
                            icon = "fas fa-hat-cowboy",
                            label = "Visière"
                        },
                        {
                            type = "command",
                            event = "hair",
                            icon = "fas fa-scissors",
                            label = "Cheveux"
                        },
                        {
                            type = "command",
                            event = "glasses",
                            icon = "fas fa-glasses",
                            label = "Lunettes"
                        },
                        {
                            type = "command",
                            event = "ear",
                            icon = "fas fa-ear",
                            label = "Accessoire d'oreille"
                        },
                        {
                            type = "command",
                            event = "neck",
                            icon = "fas fa-user-tie",
                            label = "Accessoire de cou"
                        },
                        {
                            type = "command",
                            event = "watch",
                            icon = "fas fa-clock",
                            label = "Montre"
                        },
                        {
                            type = "command",
                            event = "bracelet",
                            icon = "fas fa-ring",
                            label = "Bracelet"
                        }
                    }
                },
                {
                    type = "command",
                    event = "top",
                    icon = "fas fa-shirt",
                    label = "Haut"
                },
                {
                    type = "command",
                    event = "mask",
                    icon = "fas fa-mask",
                    label = "Masque"
                },
                {
                    type = "command",
                    event = "hat",
                    icon = "fas fa-hat-cowboy",
                    label = "Chapeau"
                },
                {
                    type = "command",
                    event = "vest",
                    icon = "fas fa-vest",
                    label = "Gilet"
                },
                {
                    type = "command",
                    event = "bag",
                    icon = "fas fa-bag-shopping",
                    label = "Sac"
                },
                {
                    type = "command",
                    event = "shoes",
                    icon = "fas fa-shoe-prints",
                    label = "Chaussures"
                },
                
            }
        },
        ["emotes"] = {
            label = "Animations",
            icon = "fas fa-hand-sparkles",
            subOptions = {
                --[[ {
                    label = "Armes",
                    icon = "fas fa-gun",
                    type = "command",
                    event = "as",
                }, ]]
                {
                    label = "Menu Animations",
                    icon = "fas fa-hand-sparkles",
                    type = "command",
                    event = "emotemenu",
                },
                {
                    label = "Animations Rapide",
                    icon = "fas fa-play",
                    subOptions = {
                        {
                            label = "Danser (aléatoire)",
                            icon = "fas fa-music",
                            type = "client",
                            action = function()
                                local dances = {
                                    "dance", "dance2", "dance3", "dance4", "dance5", "dance6", "dance7", "dance8", "dance9", "boxdance",
                                    "dancef", "dancef2", "dancef3", "dancef4", "dancef5", "dancef6",
                                    "danceslow", "danceslow2", "danceslow3", "danceslow4", "danceglowstick", "danceglowstick2", "danceglowstick3", 
                                    "dancehorse", "dancehorse2", "dancehorse3", "danceupper", "danceupper2",
                                    "danceshy", "danceshy2", "danceslow", "dancesilly1", "dancesilly2", "dancesilly3",
                                    "dancesilly4", "dancesilly5", "dancesilly6", "dancesilly7", "dancesilly8", "dancesilly9",
                                    "dancesilly10", "dancedrink", "dancedrink2", "dancedrink3",
                                    "dancesexy", "dancesexy2", "dancesexy3", "dancesexy4", "dancesexy5", "dancesexy6",
                                    "dancesexy7", "dancesexy8", "dancesexy9", "dancesexy10", "dancesexy11", "dancehiphop",
                                    "dancehiphop2", "dancehiphop3", "dancethriller", "dancepop", "dancepop2", "dancepop3",
                                    "dancepop4", "dancehouse", "dancehouse2", "dancehouse3", 
                                    "danceclub", "danceclub2", "danceclub3", "danceclub4", "danceclub5", "danceclub6", "danceclub7", "danceclub8", "danceclub9", "danceclub10", "danceclub11", "danceclub12", "danceclub13", "danceclub14", "danceclub15", "danceclub16", "danceclub17",                                    "dancerobot", "dancerobot2", "dancerobot3", "dancelocking", "dancepoping", "dancefankick",
                                    "dancecrowd", "dancecrowd2", "dancecrowd3", "dancestun", "dancestun2", "dancestun3",
                                    "dancemale", "dancefemale", "dancewalk", "danceshuffle", "dancecapoeira", "dancezumba",
                                    "dancewave", "dancewave2", "dancewave3", "dancewave4", "dancewave5", "dancewave6", "dancewave7", "dancewave8", "dancewave9", "dancewave10", "dancewave11", "dancewave12", "dancewave13", "dancewave14", "dancewave15",
                                }
                                local randomDance = dances[math.random(#dances)]
                                ExecuteCommand("e " .. randomDance)
                            end,
                        },
                        {
                            label = "S'asseoir (par terre)",
                            icon = "fas fa-chair",
                            type = "command",
                            event = "e sit",
                        },
                        {
                            label = "S'asseoire (sur une chaise)",
                            icon = "fas fa-chair",
                            type = "command",
                            event = "e sitchair",
                        },
                        {
                            label = "S'allonger",
                            icon = "fas fa-bed",
                            type = "command",
                            event = "e passout3",
                        },
                        {
                            label = "Saluer",
                            icon = "fas fa-hand",
                            type = "command",
                            event = "e wave",
                        },
                        {
                            label = "Croiser les bras",
                            icon = "fas fa-user",
                            type = "command",
                            event = "e crossarms",
                        },
                    }
                },

            },
        },
    },
    Globals = {
        ObjectOptions = {},
        VehicleOptions = {
            ['vehiclepmms'] = {
                type = "command",
                event = "pmms",
                icon = "fas fa-music",
                label = "Ouvrir PMMS"
            },
            ['vehiclelock'] = {
                --id = 'unlock',
                label = 'Ouvrir/Fermer Véhicule',
                icon = 'fas fa-unlock',
                type = 'command',
                event = 'togglelocks',  
            },
            ['getintrunk'] = {
                label = 'Entrer dans le coffre',
                icon = 'fas fa-car',
                type = 'client',
                event = 'qb-trunk:client:GetIn',
                canInteract = function(entity)
                    if not entity then return false end
                    local vehClass = GetVehicleClass(entity)
                    local hasTrunk = vehClass ~= 8 and vehClass ~= 13 and vehClass ~= 14
                    local trunkPos = GetEntityBonePosition_2(entity, GetEntityBoneIndexByName(entity, 'boot'))
                    local distanceToTrunk = #(GetEntityCoords(PlayerPedId()) - trunkPos)
                    local doorOpen = GetVehicleDoorAngleRatio(entity, 5) > 0.0
                    return hasTrunk and distanceToTrunk < 3.0 and doorOpen
                end,
            },
        },
        PlayerOptions = {
            ["viewplayerid"] = {
                type = "client",
                action = function(entity)
                    local targetId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                    local timer = 10000 -- 5 secondes

                    CreateThread(function()
                        local start = GetGameTimer()
                        while GetGameTimer() - start < timer do
                            local coords = GetEntityCoords(entity)
                            DrawText3D(coords.x, coords.y, coords.z + 1.0, "ID: " .. targetId)
                            Wait(0)
                        end
                    end)
                end,
                icon = "fas fa-id-card",
                label = "Voir l'ID",
                priority = 100,
                canInteract = function(entity)
                    return IsPedAPlayer(entity)
                end
            },
            ['copyemote'] = {
                label = 'Imiter l\'individu',
                icon = 'fas fa-copy',
                type = 'command',
                event = 'copyemote',
            },
            ['steal'] = {
                -- label = 'Fouiller l\'individu',
                -- icon = 'fas fa-search',
                -- type = 'client',
                -- event = 'police:client:RobPlayer',
                name = 'search_player',
                icon = 'fas fa-search',
                label = 'Fouiller l\'individu',
                action = function(data)
                    TriggerEvent('inventory:client:search')
                end
            },
            
            ['carry'] = {
                label = 'Porter l\'individu',
                icon = 'fas fa-male',
                type = 'command',
                event = 'carry',
            },
            ['actionjob'] = { 
                label = 'Action Jobs',
                icon = 'fas fa-layer-group',
                canInteract = function(entity)
                    local Player = QBCore.Functions.GetPlayerData()
                    return Player.job.name ~= "unemployed" and Player.job.onduty
                end,
                subOptions = {
                    {
                        type = "command",
                        event = "invoices",
                        icon = "fas fa-clipboard-check",
                        label = "Menu Facture"
                    },
                    {
                        type = "command",
                        event = "directsale",
                        icon = "fas fa-clipboard",
                        label = "Menu Facture"
                    },
                },
            },
        },
        PedOptions = {},
    },
    CircleZones = {},
    BoxZones = {
        --[[["VehicleRental"] = {
            name = "vehiclerental",
            coords = vector3(109.9739, -1088.61, 28.302),
            length = 0.95,
            width = 0.9,
            heading = 345.64,
            debugPoly = false,
            minZ = 27.302,
            maxZ = 30.302, 
            options = {
                {
                  type = "client",
                  event = "qb-rental:openMenu",
                  icon = "fas fa-car",
                  label = "Araç Kiralama",
                },
            },
            distance = 3.5
        },]]
    },
    PolyZones = {},
    TargetBones = {},
    TargetModels = {
        --[[["bike"] = {
            models = {
                `bmx`,
                `cruiser`,
                `scorcher`,
                `fixter`,
                `tribike`,
                `tribike2`,
                `tribike3`,
            },
            options = {
                {
                    type = "event",
                    event = "pickup:bike",
                    icon = "fas fa-bicycle",
                    label = "Bisikleti Al",
                },
            },
            distance = 3.0
        },]]
        ["pmms"] = {
            models = {
                `p_phonograph01x`, `prop_radio_01`, `prop_boombox_01`,
                        `prop_portable_hifi_01`, `prop_ghettoblast_01`, `prop_ghettoblast_02`,
                        `prop_tapeplayer_01`, `bkr_prop_clubhouse_jukebox_01a`,
                        `bkr_prop_clubhouse_jukebox_01b`, `bkr_prop_clubhouse_jukebox_02a`,
                        `ch_prop_arcade_jukebox_01a`, `prop_50s_jukebox`, `prop_jukebox_01`,
                        `v_res_j_radio`, `v_res_fa_radioalrm`, `prop_mp3_dock`,
                        `v_res_mm_audio`, `sm_prop_smug_radio_01`, `ex_prop_ex_tv_flat_01`,
                        `prop_tv_flat_01`, `prop_tv_flat_02`, `prop_tv_flat_02b`,
                        `prop_tv_flat_03`, `prop_tv_flat_03b`, `prop_tv_flat_michael`,
                        `prop_monitor_w_large`, `hei_prop_dlc_tablet`, `prop_trev_tv_01`,
                        `prop_tv_02`, `prop_tv_03`, `prop_tv_03_overlay`,
                        `prop_laptop_lester2`, `des_tvsmash_start`, `prop_flatscreen_overlay`,
                        `prop_monitor_02`, `prop_big_cin_screen`, `v_ilev_cin_screen`,
                        `v_ilev_lest_bigscreen`, `v_ilev_mm_screen`, `v_ilev_mm_screen2`,
                        `ba_prop_battle_club_computer_01`, `ba_prop_club_laptop_dj`,
                        `ba_prop_club_laptop_dj_02`, `sm_prop_smug_monitor_01`,
                        `xm_prop_x17_tv_flat_01`, `sm_prop_smug_tv_flat_01`,
                        `xm_prop_x17_computer_02`, `xm_prop_x17_screens_02a_01`,
                        `xm_prop_x17_screens_02a_02`, `xm_prop_x17_screens_02a_03`,
                        `xm_prop_x17_screens_02a_04`, `xm_prop_x17_screens_02a_05`,
                        `xm_prop_x17_screens_02a_06`, `xm_prop_x17_screens_02a_07`,
                        `xm_prop_x17_screens_02a_08`, `xm_prop_x17_tv_ceiling_scn_01`,
                        `xm_prop_x17_tv_ceiling_scn_02`, `xm_prop_x17_tv_scrn_01`,
                        `xm_prop_x17_tv_scrn_02`, `xm_prop_x17_tv_scrn_03`,
                        `xm_prop_x17_tv_scrn_04`, `xm_prop_x17_tv_scrn_05`,
                        `xm_prop_x17_tv_scrn_06`, `xm_prop_x17_tv_scrn_07`,
                        `xm_prop_x17_tv_scrn_08`, `xm_prop_x17_tv_scrn_09`,
                        `xm_prop_x17_tv_scrn_10`, `xm_prop_x17_tv_scrn_11`,
                        `xm_prop_x17_tv_scrn_12`, `xm_prop_x17_tv_scrn_13`,
                        `xm_prop_x17_tv_scrn_14`, `xm_prop_x17_tv_scrn_15`,
                        `xm_prop_x17_tv_scrn_16`, `xm_prop_x17_tv_scrn_17`,
                        `xm_prop_x17_tv_scrn_18`, `xm_prop_x17_tv_scrn_19`,
                        `xm_screen_1`, `ex_prop_monitor_01_ex`, `gr_prop_gr_laptop_01a`,
                        `gr_prop_gr_laptop_01b`, `gr_prop_gr_trailer_monitor_01`,
                        `gr_prop_gr_trailer_monitor_02`, `gr_prop_gr_trailer_monitor_03`,
                        `gr_prop_gr_trailer_tv`, `gr_prop_gr_trailer_tv_02`,
                        `hei_prop_dlc_heist_board`, `hei_prop_hei_monitor_overlay`,
                        `sr_mp_spec_races_blimp_sign`, `xm_prop_orbital_cannon_table`,
                        `imp_prop_impexp_lappy_01a`, `w_am_digiscanner`,
                        `prop_phone_cs_frank`, `prop_phone_proto`, `prop_huge_display_01`,
                        `prop_huge_display_02`, `hei_prop_hei_muster_01`,
                        `ba_prop_battle_hacker_screen`, `xm_prop_x17_sec_panel_01`,
                        `bkr_prop_clubhouse_laptop_01a`, `bkr_prop_clubhouse_laptop_01b`,
                        `prop_tv_flat_01_screen`, `hei_prop_hst_laptop`,
                        `hei_bank_heist_laptop`, `xm_prop_x17dlc_monitor_wall_01a`,
                        `ch_prop_ch_tv_rt_01a`, `apa_mp_h_str_avunitl_01_b`,
                        `apa_mp_h_str_avunitl_04`, `apa_mp_h_str_avm_01`,
                        `apa_mp_h_str_avm_03`, `apa_mp_h_str_avunits_01`,
                        `apa_mp_h_str_avunits_04`, `hei_heist_str_avunitl_03`,
                        `xs_prop_arena_screen_tv_01`, `xs_prop_arena_bigscreen_01`,
                        `vw_prop_vw_arcade_01_screen`, `vw_prop_vw_arcade_02_screen`,
                        `vw_prop_vw_arcade_02b_screen`, `vw_prop_vw_arcade_02c_screen`,
                        `vw_prop_vw_arcade_02d_screen`, `vw_prop_vw_cinema_tv_01`,
                        `pbus2`, `blimp3`
            },
            options = {
                {
                    type = "command",
                    event = "pmms",
                    icon = "fas fa-music",
                    label = "Ouvrir PMMS",
                },
            }
        },
    },
    Peds = {}
}


