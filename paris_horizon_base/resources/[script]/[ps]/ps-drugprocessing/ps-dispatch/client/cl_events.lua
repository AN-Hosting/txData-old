-- Fonction pour l'alerte de vente de drogue
function DrugSale(coords)
    local street1 = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street2 = GetStreetAndZone(coords)
    
    local data = {
        displayCode = '10-31',
        description = 'Vente de stupéfiants suspectée',
        priority = 2,
        title = 'Vente de Drogue',
        coords = coords,
        street = street1.. " | "..street2,
        callsign = 'CIVIL',
        blipSprite = 51,
        blipColour = 1,
        blipScale = 1.0,
        blipLength = 120, -- Durée du blip en secondes
        recipientList = {'police', 'gendarmerie'} -- Les services qui recevront l'alerte
    }
    
    TriggerServerEvent('ps-dispatch:server:notify', data)
end

exports('DrugSale', DrugSale) 