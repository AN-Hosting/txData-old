local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    for _, v in pairs(QBCore.Shared.Vehicles) do
        local text
        local name = v.name and string.lower(v.name) or ""
        local brand = v.brand and string.lower(v.brand) or ""
        if v.brand and string.match(name, brand) then
            local nameWithoutBrand = string.gsub(name, brand, "")
            text = v.brand .. ' ' .. nameWithoutBrand
        else
            text = v.name or "Unknown Vehicle"
        end
        if v.hash and v.hash ~= 0 then
            AddTextEntryByHash(v.hash, text)
        end
    end
end)