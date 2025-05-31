-- | # For help with this script: https://discord.gg/thugstudios
-- | # For more free scripts: https://discord.gg/thugstudios
-- | # For the best quality scripts: https://discord.gg/thugstudios

-- | # Framework ------------------------------------------------------------------------------------

Framework = nil
Functions = {}

if Config.Settings['Framework'] == 'esx' then
    Framework = exports['es_extended']:getSharedObject()
elseif Config.Settings['Framework'] == 'qb' then
    Framework = exports['qb-core']:GetCoreObject()
elseif Config.Settings['Framework'] == 'old-qb' then
    Citizen.CreateThread(function()
        while Framework == nil do
            TriggerEvent('QBCore:GetObject', function(obj) Framework = obj end)
            Citizen.Wait(200)
        end
    end)
elseif Config.Settings['Framework'] == 'qbox' then
    if GetResourceState('qbx_core') == 'started' then
        Framework = exports['qbx-core']:GetCoreObject()
    elseif GetResourceState('qbx-core') == 'started' then
        Framework = exports['qbx_core']:GetCoreObject()
    end
end

-- | # Functions ------------------------------------------------------------------------------------

if Config.Settings['Framework'] == 'esx' then
    Functions = {
        Create_Character = function(source, info)
            local src = source
            local license = Get_Player_License(src)
            local edited_license = Edit_License(license)
            Functions.Get_Characters(src, function(chars)
                if chars ~= nil then
                    local Slots = 0
                    for k, v in pairs(chars) do
                        Slots = Slots + 1
                    end

                    Slot = Slots + 1
                else
                    Slot = 1
                end
                if info.gender == 0 then
                    info.gender = "m"
                elseif info.gender == 1 then
                    info.gender = "f"
                end
                info.dateofbirth = info.birthdate
                info.height =  180
                TriggerEvent('esx:onPlayerJoined', src, "char"..Slot, info)
                Framework.Players["char"..Slot..":"..edited_license[2]] = true
                Wait(1000)
                if Config.Settings['Give_Starter_Items'] then
                    local Player = Framework.GetPlayerFromId(src)
                    for item, v in pairs(Config.Settings['Starter_Items']) do
                        if Config.Settings['Inventory'] == "ox-inv" then
                            exports.ox_inventory:AddItem(src, item, v.amount)
                        else
                            Player.addInventoryItem(item, v.amount)
                        end
                    end
                end
            end)
        end,
        Play_Character = function(source, identifier)
            local src = source
            local char_idf = Edit_License(identifier)
            char_idf = char_idf[1]
            TriggerEvent('esx:onPlayerJoined', src, char_idf)
        end,
        Delete_Character = function(source, identifier)
            local src = source
            DropPlayer(src, Config.Locale['Character_Delete_Kick_Message'])
            Wait(200)
            Execute_Sql('DELETE FROM users WHERE identifier = ?', { identifier })
        end,
        Save_Setting = function(identifier, category, id)
            Execute_Sql("UPDATE users SET " .. category .. " = ? WHERE identifier = ?", {id, identifier})        
        end,
        Get_Characters = function(source, cb)
            local chars = {}
            local src = source
            local license = Get_Player_License(src)
            local edited_license = Edit_License(license)
            local id = 'char%:' .. edited_license[2]

            Execute_Sql('SELECT * FROM users WHERE identifier LIKE ?', {'%' .. id .. '%'}, function(result)
                if #result == 0 then
                    cb(chars)
                    return
                end
                for i = 1, (#result), 1 do
                    local skinData = { model = '', skin = '' }
                    local selected_vehicle = result[i].selected_vehicle or 1
                    local selected_animation = result[i].selected_animation or 1

                    Execute_Sql('SELECT * FROM playerskins WHERE citizenid = ?', {'%' .. id .. '%'}, function(skinResult)
                        if #skinResult > 0 then
                            skinData.model = skinResult[1].model
                            skinData.skin = skinResult[1].skin
                        end
                        local insertData = {
                            char_idf = result[i].identifier,
                            firstname = result[i].firstname,
                            lastname = result[i].lastname,
                            job = "Unemployed",
                            cash = json.decode(result[i].accounts).money or 0,
                            bank = json.decode(result[i].accounts).bank,
                            nationality = "Los Santos",
                            selected_vehicle = selected_vehicle,
                            selected_animation = selected_animation,
                            dateofbirth = result[i].dateofbirth,
                            gender = (result[i].sex == "m") and 0 or 1
                        }
                        table.insert(chars, insertData)
                        Execute_Sql('SELECT * FROM job_grades WHERE job_name = @job_name AND grade = @grade', {
                            ['@job_name'] = result[i].job,
                            ['@grade'] = result[i].job_grade
                        }, function(jobResult)
                            if jobResult[1] ~= nil then
                                _job = jobResult[1].label
                            else
                                _job = "Unemployed"
                            end

                            for k, v in ipairs(chars) do
                                if v.char_idf == result[i].identifier then
                                    chars[k].job = _job
                                end
                            end
                        end)
                        if i == #result then
                            cb(chars)
                        end
                    end)
                end
            end)
        end,
        Get_Last_Position = function(source, cb, identifier)
            Execute_Sql('SELECT * FROM users WHERE identifier = ?', {identifier}, function(result)
                for i = 1, (#result), 1 do
                    cb(json.decode(result[i].position))
                end
            end)
        end,
        Register_Server_Callback = function(name, cb, ...)
            Framework.RegisterServerCallback(name, cb, ...)
        end,
        Trigger_Server_Callback = function(name, cb, ...)
            Framework.TriggerServerCallback(name, cb, ...)
        end,
    }
elseif Config.Settings['Framework'] == 'qb' or Config.Settings['Framework'] == 'old-qb' or Config.Settings['Framework'] == 'qbox' then
    Functions = {
        Create_Character = function(source, info)
            local src = source
            Framework.Player.Login(src, false, { charinfo = info })
            Wait(1000)
            if Config.Settings['Give_Starter_Items'] then
                local Player = Framework.Functions.GetPlayer(src)
                for item, v in pairs(Config.Settings['Starter_Items']) do
                    if Config.Settings['Inventory'] == "ox-inv" then
                        exports.ox_inventory:AddItem(src, item, v.amount)
                    else
                        Player.Functions.AddItem(item, v.amount)
                    end
                end
            end
        end,
        Play_Character = function(source, identifier)
            local src = source
            Framework.Player.Login(src, identifier)
        end,
        Delete_Character = function(source, identifier)
            local src = source
            DropPlayer(src, Config.Locale['Character_Delete_Kick_Message'])
            Wait(200)
            Execute_Sql('DELETE FROM players WHERE citizenid = ?', { identifier })
            Execute_Sql('DELETE FROM player_vehicles WHERE citizenid = ?', { identifier })
            Execute_Sql('DELETE FROM player_outfits WHERE citizenid = ?', { identifier })
            Execute_Sql('DELETE FROM player_houses WHERE citizenid = ?', { identifier })
            Execute_Sql('DELETE FROM player_contacts WHERE citizenid =?', { identifier })
            Execute_Sql('DELETE FROM playerskins WHERE citizenid =?', { identifier })
        end,
        Save_Setting = function(identifier, category, id)
            Execute_Sql("UPDATE players SET " .. category .. " = ? WHERE citizenid = ?", {id, identifier})        
        end,
        Get_Characters = function(source, cb)
            local chars = {}
            local src = source
            local license = Get_Player_License(src)
            
            Execute_Sql('SELECT * FROM players WHERE license = ?', {license}, function(result)
                if #result == 0 then
                    cb(chars)
                    return
                end
                for i = 1, (#result), 1 do
                    local char = result[i]
                    local citizenid = char.citizenid
                    local skinData = { model = '', skin = '' }
                    
                    Execute_Sql('SELECT * FROM playerskins WHERE citizenid = ?', {citizenid}, function(skinResult)
                        if #skinResult > 0 then
                            skinData.model = skinResult[1].model
                            skinData.skin = skinResult[1].skin
                        end
        
                        local selected_vehicle = char.selected_vehicle or 1
                        local selected_animation = char.selected_animation or 1

                        local insertData = {
                            char_idf = citizenid,
                            firstname = json.decode(char.charinfo).firstname,
                            lastname = json.decode(char.charinfo).lastname,
                            job = json.decode(char.job).label,
                            cash = json.decode(char.money).cash,
                            bank = json.decode(char.money).bank,
                            nationality = json.decode(char.charinfo).nationality,
                            dateofbirth = json.decode(char.charinfo).birthdate,
                            gender = json.decode(char.charinfo).gender,
                            skin = skinData.skin,
                            selected_vehicle = selected_vehicle,
                            selected_animation = selected_animation,
                            model = skinData.model
                        }
                        table.insert(chars, insertData)
                        if i == #result then
                            cb(chars)
                        end
                    end)
                end
            end)
        end,        
        Get_Last_Position = function(source, cb, citizenid)
            Execute_Sql('SELECT * FROM players WHERE citizenid = ?', {citizenid}, function(result)
                for i = 1, (#result), 1 do
                    cb(json.decode(result[i].position))
                end
            end)
        end,
        Register_Server_Callback = function(name, cb, ...)
            Framework.Functions.CreateCallback(name, cb, ...)
        end,
        Trigger_Server_Callback = function(name, cb, ...)
            Framework.Functions.TriggerCallback(name, cb, ...)
        end
    }
end