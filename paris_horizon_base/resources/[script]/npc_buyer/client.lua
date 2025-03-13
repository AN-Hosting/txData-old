local QBCore = exports['qb-core']:GetCoreObject()

local npcModel = `mp_m_weed_01` -- Modifier le modèle du PNJ
local npcCoords = vector3(1742.22, -1619.64, 112.69) -- Modifier la position du PNJ

Citizen.CreateThread(function()
    RequestModel(npcModel)
    while not HasModelLoaded(npcModel) do
        Wait(100)
    end

    local npc = CreatePed(4, npcModel, npcCoords.x, npcCoords.y, npcCoords.z - 1.0, 90.0, false, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    FreezeEntityPosition(npc, true)

    exports['qb-target']:AddTargetEntity(npc, {
        options = {
            {
                type = "client",
                event = "npc_buyer:openSellMenu",
                icon = "fas fa-money-bill-wave",
                label = "Vendre des objets",
            }
        },
        distance = 2.0
    })
end)

RegisterNetEvent("npc_buyer:openSellMenu", function()
    QBCore.Functions.TriggerCallback("npc_buyer:getSellableItems", function(items, playerMoney)
        if items and #items > 0 then
            -- Utiliser l'événement de qb-shops pour ouvrir le menu
            TriggerEvent("qb-shops:client:OpenShop", "revendeur", items)
        else
            QBCore.Functions.Notify("Vous n'avez rien à vendre", "error")
        end
    end)
end)

-- Écouter l'événement d'achat de qb-shops
RegisterNetEvent('npc_buyer:client:sellItems')
AddEventHandler('npc_buyer:client:sellItems', function(items)
    TriggerServerEvent("npc_buyer:sellItems", items)
end)
