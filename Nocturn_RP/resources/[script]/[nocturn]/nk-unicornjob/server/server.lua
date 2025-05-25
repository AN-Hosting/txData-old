local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("berry_hydrating", function(source, item)
    local src = source
    TriggerClientEvent("nk-unicornjob:Drink", src, "berry_hydrating", "berry_hydrating", "amb@world_human_drinking@coffee@male@idle_a", "idle_b", 'v_ret_fh_bscup', 28422, { x=0.01, y=-0.01, z=0.00 }, Config.Thirst["LemonSlushy"], true, false)
end)

QBCore.Functions.CreateUseableItem("green_dream", function(source, item)
    local src = source
    TriggerClientEvent("nk-unicornjob:Drink", src, "green_dream", "green_dream", "amb@world_human_drinking@coffee@male@idle_a", "idle_b", 'v_ret_fh_bscup', 28422, { x=0.01, y=-0.01, z=0.00 }, Config.Thirst["OrangeSlushy"], true, false)
end)

QBCore.Functions.CreateUseableItem("island_breeze", function(source, item)
    local src = source
    TriggerClientEvent("nk-unicornjob:Drink", src, "island_breeze", "island_breeze", "amb@world_human_drinking@coffee@male@idle_a", "idle_b", 'v_ret_fh_bscup', 28422, { x=0.01, y=-0.01, z=0.00 }, Config.Thirst["BlueberrySlushy"], true, false)
end)

QBCore.Functions.CreateUseableItem("just_peachy", function(source, item)
    local src = source
    TriggerClientEvent("nk-unicornjob:Drink", src, true, "just_peachy", 'just_peachy', Config.Locals["Progressbar"]["Chewing"]["Time"], Config.Hunger["NormalGumball"], "mp_player_inteat@burger", "mp_player_int_eat_burger")
end)

QBCore.Functions.CreateUseableItem("watermelon_dream", function(source, item)
    local src = source
    TriggerClientEvent("nk-unicornjob:Drink", src, true, "watermelon_dream", 'watermelon_dream', Config.Locals["Progressbar"]["Chewing"]["Time"], Config.Hunger["BananaGumball"], "mp_player_inteat@burger", "mp_player_int_eat_burger")
end)

QBCore.Functions.CreateUseableItem("kiwi_juice", function(source, item)
    local src = source
    TriggerClientEvent("nk-unicornjob:Drink", src, true, "kiwi_juice", 'kiwi_juice', Config.Locals["Progressbar"]["Chewing"]["Time"], Config.Hunger["BlueberryGumball"], "mp_player_inteat@burger", "mp_player_int_eat_burger")
end)

QBCore.Functions.CreateUseableItem("orange_juice", function(source, item)
    local src = source
    TriggerClientEvent("nk-unicornjob:Drink", src, true, "orange_juice", 'orange_juice', Config.Locals["Progressbar"]["Chewing"]["Time"], Config.Hunger["CherryGumball"], "mp_player_inteat@burger", "mp_player_int_eat_burger")
end)

QBCore.Functions.CreateUseableItem("strawberry_juice", function(source, item)
    local src = source
    TriggerClientEvent("nk-unicornjob:Drink", src, true, "strawberry_juice", 'strawberry_juice', Config.Locals["Progressbar"]["Chewing"]["Time"], Config.Hunger["MintGumball"], "mp_player_inteat@burger", "mp_player_int_eat_burger")
end)

QBCore.Functions.CreateUseableItem("banana_juice", function(source, item)
    local src = source
    TriggerClientEvent("nk-unicornjob:Drink", src, "banana_juice", "banana_juice", "amb@world_human_drinking@coffee@male@idle_a", "idle_a", 'prop_mug_02', 28422, { x=0.01, y=-0.01, z=-0.00 }, Config.Thirst["Coffee"], false, true)
end)

QBCore.Functions.CreateUseableItem("cocktail", function(source, item)
    local src = source
    TriggerClientEvent("nk-unicornjob:DrinkAlcahol", src, "cocktail", "cocktail", "amb@world_human_drinking@coffee@male@idle_a", "idle_a", 'prop_plastic_cup_02', 28422, { x=0.01, y=-0.01, z=0.00 }, Config.Thirst["Sprite"], true, false)
end)

QBCore.Functions.CreateUseableItem("coconut_drink", function(source, item)
    local src = source
    TriggerClientEvent("nk-unicornjob:DrinkAlcahol", src, "coconut_drink", "coconut_drink", "amb@world_human_drinking@coffee@male@idle_a", "idle_a", 'prop_plastic_cup_02', 28422, { x=0.01, y=-0.01, z=0.00 }, Config.Thirst["CocaCola"], true, false)
end)

QBCore.Functions.CreateUseableItem("island_fantasy", function(source, item)
    local src = source
    TriggerClientEvent("nk-unicornjob:DrinkAlcahol", src, "island_fantasy", "island_fantasy.Pepper", "amb@world_human_drinking@coffee@male@idle_a", "idle_a", 'prop_plastic_cup_02', 28422, { x=0.01, y=-0.01, z=0.00 }, Config.Thirst["DRPepper"], true, false)
end)

QBCore.Functions.CreateUseableItem("kamikaze", function(source, item)
    local src = source
    TriggerClientEvent("nk-unicornjob:DrinkAlcahol", src, false, "kamikaze", 'kamikaze', Config.Locals["Progressbar"]["Snacks"]["Time"], Config.Hunger["Nachos"], "mp_player_inteat@burger", "mp_player_int_eat_burger", 'prop_ld_snack_01', 18905, { x=0.07, y=-0.02, z=0.00 })
end)

QBCore.Functions.CreateUseableItem("redhot_daquiri", function(source, item)
    local src = source
    TriggerClientEvent("nk-unicornjob:DrinkAlcahol", src, false, "redhot_daquiri", 'redhot_daquiri', Config.Locals["Progressbar"]["Snacks"]["Time"], Config.Hunger["Crisps"], "mp_player_inteat@burger", "mp_player_int_eat_burger", 'prop_ld_snack_01', 18905, { x=0.07, y=-0.02, z=0.00 })
end)





RegisterNetEvent('nk-unicornjob:Server:RemoveItem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
end)

RegisterNetEvent('nk-unicornjob:server:CraftNonAlcoholic', function(data, weapon)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local receiveAmount = 3
    Player.Functions.AddItem(data, receiveAmount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[data], "add")
end)

RegisterNetEvent('nk-unicornjob:server:CraftAlcoholic', function(data, weapon)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local receiveAmount = 3
    Player.Functions.AddItem(data, receiveAmount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[data], "add")
end)

QBCore.Functions.CreateCallback('nk-unicornjob:server:Materials', function(source, cb, materials)
    local src = source
    local tem = 0
    local player = QBCore.Functions.GetPlayer(source)
    for k, v in pairs(materials) do
        if player.Functions.GetItemByName(v.item) and player.Functions.GetItemByName(v.item).amount >= v.amount then
            tem = tem + 1
            if tem == #materials then
                cb(true)
            end
        else
            cb(false)
            return
        end
    end
end)
