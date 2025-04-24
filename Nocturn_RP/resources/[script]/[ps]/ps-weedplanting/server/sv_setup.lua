MySQL.ready(function()
    -- Check if weedplants table exists
    print('^3[ps-weedplanting] ^5Vérification de la table weedplants dans la base de données^7')
    local success, result = pcall(MySQL.scalar.await, 'SELECT 1 FROM `weedplants` LIMIT 1')

    if not success then
        print('^3[ps-weedplanting] ^5Table weedplants non trouvée, création...^7')

        local create_success, create_result = pcall(function()
            return MySQL.query.await([[
                CREATE TABLE IF NOT EXISTS `weedplants` (
                    `id` int(11) NOT NULL AUTO_INCREMENT,
                    `coords` longtext NOT NULL CHECK (json_valid(`coords`)),
                    `time` datetime NOT NULL,
                    `fertilizer` longtext NOT NULL CHECK (json_valid(`fertilizer`)),
                    `water` longtext NOT NULL CHECK (json_valid(`water`)),
                    `gender` varchar(45) NOT NULL,
                    PRIMARY KEY (`id`)
                )
            ]])
        end)

        if create_success then
            print('^3[ps-weedplanting] ^5Table weedplants créée avec succès^7')
        else
            print('^3[ps-weedplanting] ^1Erreur lors de la création de la table weedplants: ' .. tostring(create_result) .. '^7')
        end
    else
        print('^3[ps-weedplanting] ^5Table weedplants existante vérifiée^7')

        -- Vérifier structure de la table
        local structure_success, structure_result = pcall(function() 
            return MySQL.query.await('DESCRIBE `weedplants`')
        end)
        
        if structure_success then
            print('^3[ps-weedplanting] ^5Structure de la table weedplants:^7')
            for _, column in pairs(structure_result) do
                print('^3[ps-weedplanting] ^5- ' .. column.Field .. ' (' .. column.Type .. ')^7')
            end
        else
            print('^3[ps-weedplanting] ^1Erreur lors de la vérification de la structure: ' .. tostring(structure_result) .. '^7')
        end
    end
end)