local k5NotifSettingsOpen = false

Citizen.CreateThread(function()
end)

RegisterNetEvent("k5_notify:notify")
AddEventHandler("k5_notify:notify", function(title, text, type, duration)
  notify(title, text, type, duration)
end)

function notify(title, text, type, duration)
  SendNUIMessage({
    action = "notify",
    data = {
      title = title,
      text = text,
      type = type,
      duration = duration
    }
  })
end

RegisterCommand('notifysettings', function()
  if k5NotifSettingsOpen then
    closeSettings() 
  else
    k5NotifSettingsOpen = true
    SendNUIMessage({
      action = "settings"
    })
    SetNuiFocus(true, true)
  end
end)

function closeSettings()
  k5NotifSettingsOpen = false
  SendNUIMessage({
    action = "closeSettings"
  })
  SetNuiFocus(false, false)
end


RegisterNUICallback("action", function(data, cb)
	if data.action == "close" then
		closeSettings()
  end
end)

local QBCore = exports['qb-core']:GetCoreObject()

-- Menu principal
local function OpenAnnonceMenu()
    local PlayerData = QBCore.Functions.GetPlayerData()
    
    if PlayerData.job.name == 'unemployed' then
        notify('Erreur', 'Vous devez avoir un emploi pour accéder aux annonces.', 'error')
        return
    end

    exports['qb-menu']:openMenu({
        {
            header = '📣 Annonces ' .. PlayerData.job.label,
            isMenuHeader = true
        },

        {
            header = '❌ Fermer',
            params = {
                event = "qb-jobmenu:client:Menu:Close",
                args = {}
            }
        },
        {
            header = '◀️ Retour',
            params = {
                event = "qb-jobmenu:client:backtojobmenu",
                args = {}
            }
        },
        {
            header = '🟢 Ouverture',
            txt = 'Annoncer l\'ouverture de l\'établissement',
            params = {
                event = "k5_notify:client:sendAnnouncement",
                args = {
                    type = "open"
                }
            }
        },
        {
            header = '🔴 Fermeture',
            txt = 'Annoncer la fermeture de l\'établissement',
            params = {
                event = "k5_notify:client:sendAnnouncement",
                args = {
                    type = "close"
                }
            }
        },
        {
            header = '✏️ Message personnalisé',
            txt = 'Envoyer une annonce personnalisée',
            params = {
                event = "k5_notify:client:customAnnouncement"
            }
        }
    })
end

-- Événement pour les annonces prédéfinies
RegisterNetEvent('k5_notify:client:sendAnnouncement')
AddEventHandler('k5_notify:client:sendAnnouncement', function(data)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local jobLabel = PlayerData.job.label

    if data.type == "open" then
        TriggerServerEvent('k5_notify:server:sendAnnouncement', 'open', jobLabel)
    elseif data.type == "close" then
        TriggerServerEvent('k5_notify:server:sendAnnouncement', 'close', jobLabel)
    end
end)

-- Événement pour l'annonce personnalisée
RegisterNetEvent('k5_notify:client:customAnnouncement')
AddEventHandler('k5_notify:client:customAnnouncement', function()
    local dialog = exports['qb-input']:ShowInput({
        header = "✍️ Nouvelle Annonce",
        submitText = "📢 Envoyer",
        inputs = {
            {
                text = "Votre message",
                name = "message",
                type = "text",
                isRequired = true
            }
        }
    })

    if dialog and dialog.message then
        TriggerServerEvent('k5_notify:server:sendCustomAnnouncement', dialog.message)
    end
end)

-- Event pour ouvrir le menu
RegisterNetEvent('k5_notify:client:openAnnonceMenu')
AddEventHandler('k5_notify:client:openAnnonceMenu', function()
    OpenAnnonceMenu()
end)