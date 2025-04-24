--- Process Branch

server.registerUseableItem(Config.BranchItem, function(source, item)
    print('^3[ps-weedplanting] ^5Utilisation d\'une branche par le joueur ' .. source .. '^7')
    
    if not server.hasItem(source, item.name) then 
        print('^3[ps-weedplanting] ^1Le joueur n\'a pas l\'item requis^7')
        return 
    end

    local removeItem = lib.callback.await('weedplanting:client:UseBranch', source)
    print('^3[ps-weedplanting] ^5Résultat du callback UseBranch: ' .. tostring(removeItem) .. '^7')

    if removeItem then
        local item = server.getItem(source, Config.BranchItem)
        print('^3[ps-weedplanting] ^5Item récupéré: ' .. (item and 'oui' or 'non') .. '^7')

        if not item then
            print('^3[ps-weedplanting] ^1Impossible de récupérer l\'item^7')
            return 
        end
    
        local health = item?.metadata?.health or item?.info?.health or 100
        print('^3[ps-weedplanting] ^5Santé de la branche: ' .. health .. '^7')

        if server.removeItem(source, item.name, 1, item.metadata or item.info, item.slot) then
            print('^3[ps-weedplanting] ^5Item retiré avec succès, ajout de ' .. health .. ' weed^7')
            local success = server.addItem(source, Config.WeedItem, health)
            print('^3[ps-weedplanting] ^5Résultat de l\'ajout: ' .. tostring(success) .. '^7')
            
            if not success then
                print('^3[ps-weedplanting] ^1Échec de l\'ajout avec server.addItem, tentative directe^7')
                -- Tentative directe
                server.addItemDirect(source, Config.WeedItem, health)
            end
        else
            print('^3[ps-weedplanting] ^1Échec du retrait de l\'item^7')
        end
    end
end)

--- Package Bags

server.registerUseableItem(Config.WeedItem, function(source, item)
    local src = source
    local hasItem = server.hasItem(src, Config.WeedItem, 20)
    print('^3[ps-weedplanting] ^5Vérification possède 20 weed: ' .. tostring(hasItem) .. '^7')

    if hasItem then
        local removeItem = lib.callback.await('weedplanting:client:UseDryWeed', source)
        print('^3[ps-weedplanting] ^5Résultat du callback UseDryWeed: ' .. tostring(removeItem) .. '^7')

        if removeItem then
            if server.removeItem(src, Config.WeedItem, 20) then
                print('^3[ps-weedplanting] ^5Items retirés avec succès, ajout d\'un paquet^7')
                local success = server.addItem(src, Config.PackedWeedItem, 1)
                print('^3[ps-weedplanting] ^5Résultat de l\'ajout: ' .. tostring(success) .. '^7')
                
                if not success then
                    print('^3[ps-weedplanting] ^1Échec de l\'ajout avec server.addItem, tentative directe^7')
                    -- Tentative directe
                    server.addItemDirect(src, Config.PackedWeedItem, 1)
                end
            else
                print('^3[ps-weedplanting] ^1Échec du retrait des items^7')
            end
        end
    else
        utils.notify(src, Locales['notify_title_processing'], Locales['not_enough_dryweed'], 'error', 2500)
    end
end)
