QBCore = exports['qb-core']:GetCoreObject()
onDuty = false
whitelisted = false
local PlayerJob = {}
-- events
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        onDuty = PlayerData.job.onduty
     end)
 end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() ~= resource then return end
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        onDuty = PlayerJob.onduty
    end)
end)

RegisterNetEvent('qb-jobmenu:client:toggleDuty', function()
    local Player = QBCore.Functions.GetPlayerData()
    if Player.job.onduty then
        TriggerServerEvent('QBCore:ToggleDuty')
    else
        TriggerServerEvent('QBCore:ToggleDuty')
    end
    Wait(100)
    openJobMenu()
end)

RegisterNetEvent('qb-jobmenu:client:takeService', function(data)
    ExecuteCommand(data.command)
    Wait(100)
    openJobMenu()
end)

-- Create menu from config
function openJobMenu()
    for k,v in pairs(Config.Jobs) do
        if PlayerJob.name == k then
            local JobMenu = { { header = '📋 '..PlayerJob.label.." - Menu Principal", isMenuHeader = true } }
            JobMenu[#JobMenu + 1] = { header = '❌ Fermer', txt = "", params = { event = "qb-jobmenu:client:Menu:Close" } }
            JobMenu[#JobMenu + 1] = { header = '◀️ Retour au menu principal', txt = "", params = { event = "qb-menu:client:mainMenu" } }

            -- Menu Annonces
            JobMenu[#JobMenu + 1] = {
                header = '📢 Menu Annonces',
                txt = 'Gérer les annonces de l\'établissement',
                params = {
                    event = 'k5_notify:client:openAnnonceMenu',
                    args = {}
                }
            }

            -- Options de service
            JobMenu[#JobMenu + 1] = {
                header = (onDuty and '🟢 ' or '🔴 ')..'Service',
                txt = string.format('Statut: %s | Cliquez pour changer', onDuty and 'En Service' or 'Hors Service'),
                params = {
                    event = 'qb-jobmenu:client:toggleDuty',
                    args = {}
                }
            }
            
            JobMenu[#JobMenu + 1] = {
                header = '📱 Service Téléphone',
                txt = 'Prendre le service téléphone',
                params = {
                    event = 'qb-jobmenu:client:takeService',
                    args = { command = Config.ServiceCommands[PlayerJob.name] }
                }
            }

            for key,val in pairs(v.menuoptions) do
                if val.submenu == "" then 
                    if PlayerJob.grade.level >= val.rank then
                        -- Conversion des icônes FA en émojis pour les options du menu
                        local newIcon = "📋 " -- emoji par défaut
                        if val.icon:find("bell") then newIcon = "🔔 "
                        elseif val.icon:find("info") then newIcon = "ℹ️ "
                        elseif val.icon:find("key") then newIcon = "🔑 "
                        elseif val.icon:find("id%-card") then newIcon = "📇 "
                        elseif val.icon:find("list%-check") then newIcon = "📝 "
                        elseif val.icon:find("heart%-pulse") then newIcon = "💓 "
                        elseif val.icon:find("question") then newIcon = "❓ "
                        elseif val.icon:find("user%-group") then newIcon = "👥 "
                        elseif val.icon:find("magnifying%-glass") then newIcon = "🔍 "
                        elseif val.icon:find("user%-lock") then newIcon = "🔒 "
                        elseif val.icon:find("road") then newIcon = "🛣️ "
                        elseif val.icon:find("triangle%-exclamation") then newIcon = "⚠️ "
                        elseif val.icon:find("torii%-gate") then newIcon = "🚧 "
                        elseif val.icon:find("sign") then newIcon = "🚸 "
                        elseif val.icon:find("campground") then newIcon = "⛺ "
                        elseif val.icon:find("lightbulb") then newIcon = "💡 "
                        elseif val.icon:find("caret%-up") then newIcon = "🔺 "
                        elseif val.icon:find("trash") then newIcon = "🗑️ "
                        end
                        
                        JobMenu[#JobMenu+1] = { header = newIcon..val.header, txt = val.txt, params = { event = val.event, args = val.subheader } }
                    end
                end
            end
            exports['qb-menu']:openMenu(JobMenu)
            whitelisted = true
        end
    end
    if not whitelisted then
        QBCore.Functions.Notify("Vous n'avez pas accès à ce menu", 'error', 3500)
    end
end

RegisterNetEvent("qb-jobmenu:client:opensubmenu", function(subname)
    for k,v in pairs(Config.Jobs) do
        if PlayerJob.name == k then
            if onDuty == true then
                local SubJobMenu = { { header = '📋 '..PlayerJob.label.." - Sous-menu", isMenuHeader = true } }
                SubJobMenu[#SubJobMenu + 1] = { header = '❌ Fermer', txt = "", params = { event = "qb-jobmenu:client:Menu:Close" } }
                SubJobMenu[#SubJobMenu + 1] = { header = '◀️ Retour', txt = "", params = { event = "qb-jobmenu:client:backtojobmenu" } }
                
                for key,val in pairs(v.menuoptions) do
                    if val.submenu == subname and val.subheader == "" then
                        local newIcon = "📋 " -- emoji par défaut
                        if val.icon:find("heart%-pulse") then newIcon = "💓 "
                        elseif val.icon:find("question") then newIcon = "❓ "
                        elseif val.icon:find("user%-group") then newIcon = "👥 "
                        elseif val.icon:find("magnifying%-glass") then newIcon = "🔍 "
                        elseif val.icon:find("user%-lock") then newIcon = "🔒 "
                        end
                        
                        SubJobMenu[#SubJobMenu+1] = { header = newIcon..val.header, txt = val.txt, params = { event = val.event } }
                    end
                end
                exports['qb-menu']:openMenu(SubJobMenu)
            end
        end
    end
end)

-- RegisterCommand("openJobMenu", function()
--     openJobMenu()
-- end)

RegisterNetEvent("qb-jobmenu:client:backtojobmenu",function()
    openJobMenu()
end)