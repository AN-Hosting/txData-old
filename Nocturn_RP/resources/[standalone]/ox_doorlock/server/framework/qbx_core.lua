local QBX = exports.qbx_core

function GetPlayer(playerId)
    local player = { source = playerId }
    return player
end

function GetCharacterId(player)
	return QBX:GetPlayer(player.source).PlayerData.citizenid
end

function IsPlayerInGroup(player, filter)
    local type = type(filter)
    
    if type == 'string' then
        local playerData = QBCore.Functions.GetPlayer(player.source)
        return playerData.PlayerData.job.name == filter
    else
        local tabletype = table.type(filter)
        local playerData = QBCore.Functions.GetPlayer(player.source)
        
        if tabletype == 'hash' then
            local grade = filter[playerData.PlayerData.job.name]
            
            if grade and grade <= playerData.PlayerData.job.grade.level then
                return true
            end
        elseif tabletype == 'array' then
            for i = 1, #filter do
                if playerData.PlayerData.job.name == filter[i] then
                    return true
                end
            end
        end
    end
    
    return false
end
