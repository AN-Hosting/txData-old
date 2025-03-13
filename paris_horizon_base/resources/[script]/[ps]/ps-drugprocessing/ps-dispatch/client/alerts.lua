local function DrugSaleAlert()
    local coords = GetEntityCoords(cache.ped)
    local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
    
    -- Utiliser ps-dispatch avec le même format que votre script d'organes
    exports['ps-dispatch']:CustomAlert({
        coords = coords,
        message = "Vente de stupéfiants suspectée",
        dispatchCode = "10-31",
        description = "Vente de drogue signalée à " .. streetName,
        radius = 50.0,
        sprite = 51,
        color = 1,
        scale = 1.0,
        length = 3,
    })
end
exports('DrugSaleAlert', DrugSaleAlert) 