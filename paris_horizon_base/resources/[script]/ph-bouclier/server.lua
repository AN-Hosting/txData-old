local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('bouclier', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    
    if not Player then
        print("Erreur : Player est nil")
        return
    end

    if not Player.Functions.GetItemByName(item.name) then 
        print("Item non trouvé dans l'inventaire.")
        return 
    end

    TriggerClientEvent('ph-bouclier:bouclier', source)
end)