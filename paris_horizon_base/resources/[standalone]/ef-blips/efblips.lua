if Config.blipsShow then
    CreateThread(function()
        for _,v in pairs(Config.Locations) do
            local blip = AddBlipForCoord(v.vector)
            SetBlipSprite(blip, v.sprite)
            SetBlipScale(blip, v.scale)
            SetBlipColour(blip, v.color)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.text)
            EndTextCommandSetBlipName(blip)
        end
    end)
    CreateThread(function()
        for _, v in pairs(Config.LocationsGang) do
            -- Création du Blip principal
            local blip = AddBlipForCoord(v.vector)
            SetBlipSprite(blip, v.sprite)
            SetBlipScale(blip, v.scale)
            SetBlipColour(blip, v.color)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.text)
            EndTextCommandSetBlipName(blip)

            -- Création du cercle autour du Blip (si activé dans la config)
            if v.radius and v.radius > 0 then
                local blipCircle = AddBlipForRadius(v.vector, v.radius)
                SetBlipAlpha(blipCircle, 128) -- Transparence du cercle (0-255)
                SetBlipColour(blipCircle, v.colorraduis) -- Même couleur que le blip
            end
        end
    end)
end

