local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand('ph-menuperso', function()
    local Player = QBCore.Functions.GetPlayerData()
    local charInfo = Player.charinfo
    local jobInfo = Player.job
    local gangInfo = Player.gang
    local money = Player.money
    local onDuty = Player.job.onduty

    local serviceCommand = Config.ServiceCommands[jobInfo.name] or 'service_default'  -- Commande par défaut si le métier n'est pas configuré

    exports['qb-menu']:openMenu({
        {
            header = '📱 Menu Personnel',
            isMenuHeader = true
        },
        {
            header = '❌ Quitter',
            params = {
                event = 'qb-menu:client:closemenu',
                args = {}
            }
        },
        {
            header = '📋 Détails Personnels',
            txt = 'Voir les détails de votre personnage',
            params = {
                event = 'qb-menu:client:personaeldetail',
                args = {}
            }
        },
        {
            header = '👔 Menu Job',
            txt = 'Accéder au menu métier',
            params = {
                event = 'qb-jobmenu:client:backtojobmenu',
                args = {}
            }
        },
        {
            header = '📄 Menu Facture',
            txt = 'Accéder au menu Facture',
            params = {
                event = 'ph-menuperso:client:invoices',
                args = {}
            }
        },
        {
            header = '💵 Menu Finances',
            params = {
                event = 'ph-menuperso:client:myfinance',
                args = {}
            }
        },
        {
            header = '⚡ Menu Actions',
            txt = 'Accéder aux différentes actions',
            params = {
                event = 'qb-menu:client:actionsMenu',
                args = {}
            }
        }
    })
end)

RegisterNetEvent('qb-menu:client:actionsMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = '◀️ Retour au menu principal',
            params = {
                event = 'qb-menu:client:mainMenu',
                args = {}
            }
        },
        {
            header = '😊 Menu Emote',
            txt = 'Ouvrir menu emote',
            params = {
                event = 'ph-menuperso:client:emotemenu',
                args = {}
            }
        },
        {
            header = '🎥 Menu Editor',
            txt = 'Ouvrir menu Rockstar Editor',
            params = {
                event = 'ph-menuperso:client:rockstareditor',
                args = {}
            }
        }
    })
end)

RegisterNetEvent('qb-menu:client:personaeldetail', function()
    local Player = QBCore.Functions.GetPlayerData()
    local charInfo = Player.charinfo
    local jobInfo = Player.job

    exports['qb-menu']:openMenu({
        {
            header = '📋 Menu Détails Personnels',
            isMenuHeader = true
        },
        {
            header = '◀️ Retour au menu principal',
            params = {
                event = 'qb-menu:client:mainMenu',
                args = {}
            }
        },
        {
            header = '👤 Identité',
            txt = string.format('Nom: %s %s | Téléphone: %s', charInfo.firstname, charInfo.lastname, charInfo.phone),
            isMenuHeader = true
        },
        {
            header = '💼 Emploi',
            txt = string.format('Métier: %s - %s (Grade %s)', jobInfo.label, jobInfo.name, jobInfo.grade.name),
            isMenuHeader = true
        },
        {
            header = '💳 Numéro de compte',
            txt = charInfo.account,
            isMenuHeader = true
        },
        -- {
        --     header = '🚗 Permis de conduire',
        --     txt = charInfo.driverlicense == "1" and "Permis valide" or "Pas de permis",
        --     isMenuHeader = true
        -- },
        {
            header = '📱 Téléphone',
            txt = charInfo.phone,
            isMenuHeader = true
        }
    })
end)

RegisterNetEvent('ph-menuperso:client:rockstareditor', function()
    exports['qb-menu']:openMenu({
        {
            header = '◀️ Retour',
            params = {
                event = 'qb-menu:client:actionsMenu',
                args = {}
            }
        },
        {
            header = '⏺️ Record',
            params = {
                event = 'ph-menuperso:client:record',
                args = {}
            }
        },
        {
            header = '🎬 Clip',
            params = {
                event = 'ph-menuperso:client:clip',
                args = {}
            }
        },
        {
            header = '💾 Save Clip',
            params = {
                event = 'ph-menuperso:client:saveclip',
                args = {}
            }
        },
        {
            header = '🗑️ Delete Clip',
            params = {
                event = 'ph-menuperso:client:delclip',
                args = {}
            }
        },
        {
            header = '✏️ Editor',
            params = {
                event = 'ph-menuperso:client:editor',
                args = {}
            }
        }
    })
end)

RegisterNetEvent('qb-menu:client:mainMenu', function()
    ExecuteCommand('ph-menuperso')
end)

-- RegisterKeyMapping('ph-menuperso', 'Ouvrir Menu Personnel', 'keyboard', 'F5')

RegisterNetEvent('ph-menuperso:client:emotemenu', function()
    Wait(100)
    ExecuteCommand('emotemenu')
end)

RegisterNetEvent('ph-menuperso:client:invoices', function()
    Wait(100)
    ExecuteCommand('invoices')
end)

RegisterNetEvent('ph-menuperso:client:myfinance', function()
    Wait(100)
    ExecuteCommand('myfinance')
end)

RegisterNetEvent('ph-menuperso:client:record', function()
    Wait(100)
    ExecuteCommand('record')
end)
RegisterNetEvent('ph-menuperso:client:clip', function()
    Wait(100)
    ExecuteCommand('clip')
end)
RegisterNetEvent('ph-menuperso:client:saveclip', function()
    Wait(100)
    ExecuteCommand('saveclip')
end)
RegisterNetEvent('ph-menuperso:client:delclip', function()
    Wait(100)
    ExecuteCommand('delclip')
end)
RegisterNetEvent('ph-menuperso:client:editor', function()
    Wait(100)
    ExecuteCommand('editor')
end)



RegisterCommand('service_default', function()
    QBCore.Functions.Notify('Error: Invalid service command', 'error', 5000)

end)