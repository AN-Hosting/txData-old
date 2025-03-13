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
            header = 'Identité',
            txt = string.format('Nom: %s %s | Téléphone: %s', charInfo.firstname, charInfo.lastname, charInfo.phone),
            icon = 'fas fa-id-card',
            isMenuHeader = true
        },
        {
            header = 'Emploi',
            txt = string.format('Métier: %s - %s (Grade %s)', jobInfo.label, jobInfo.name, jobInfo.grade.name),
            icon = 'fas fa-briefcase',
            isMenuHeader = true
        },
        {
            header = 'Quitter',
            icon = 'fa-solid fa-backward',
            params = {
                event = 'qb-menu:client:closemenu',
                args = {}
            }
        },
        {
            header = 'Service',
            txt = string.format('Statut: %s | Cliquez pour changer', onDuty and 'En Service' or 'Hors Service'),
            icon = onDuty and 'fas fa-toggle-on' or 'fas fa-toggle-off',
            params = {
                event = 'ph-menuperso:client:toggleDuty',
                args = {}
            }
        },
        {
            header = 'Service Téléphone',
            txt = 'Prendre le service téléphone',
            icon = 'fas fa-phone',
            params = {
                event = 'ph-menuperso:client:takeService',
                args = { command = serviceCommand }
            }
        },
        {
            header = 'Menu Facture',
            txt = 'Accéder au menu Facture',
            icon = 'fas fa-file',
            params = {
                event = 'ph-menuperso:client:invoices',
                args = {}
            }
        },
        {
            header = 'Menu Actions',
            txt = 'Accéder aux différentes actions',
            icon = 'fas fa-list',
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
            header = 'Retour au menu principal',
            icon = 'fa-solid fa-backward',
            params = {
                event = 'qb-menu:client:mainMenu',
                args = {}
            }
        },
        {
            header = 'Menu Emote',
            txt = 'Ouvrir menu emote',
            icon = 'fas fa-face-smile',
            params = {
                event = 'ph-menuperso:client:emotemenu',
                args = {}
            }
        }
    })
end)

RegisterNetEvent('qb-menu:client:mainMenu', function()
    ExecuteCommand('ph-menuperso')
end)

RegisterKeyMapping('ph-menuperso', 'Ouvrir Menu Personnel', 'keyboard', 'F5')

RegisterNetEvent('ph-menuperso:client:toggleDuty', function()
    local Player = QBCore.Functions.GetPlayerData()
    if Player.job.onduty then
        TriggerServerEvent('QBCore:ToggleDuty')
    else
        TriggerServerEvent('QBCore:ToggleDuty')
    end
    Wait(100)
    ExecuteCommand('ph-menuperso')
end)

RegisterNetEvent('ph-menuperso:client:emotemenu', function()
    Wait(100)
    ExecuteCommand('emotemenu')
end)

RegisterNetEvent('ph-menuperso:client:invoices', function()
    Wait(100)
    ExecuteCommand('invoices')
end)

RegisterNetEvent('ph-menuperso:client:takeService', function(data)
    ExecuteCommand(data.command)
    Wait(100)
    ExecuteCommand('ph-menuperso')
end)

RegisterCommand('service_default', function()
    QBCore.Functions.Notify('Error: Invalid service command', 'error', 5000)

end)