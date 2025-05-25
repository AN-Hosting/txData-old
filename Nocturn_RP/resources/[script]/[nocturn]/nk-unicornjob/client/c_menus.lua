local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('nk-unicornjob:Client:JuicesMenu', function()
    TriggerEvent('qb-menu:client:openMenu', {
        {id = 0,header = Language.Menu.Juices, txt = "" },
        {id = 1,header = Language.Menu.OrangeJuice, txt = "Requis : 1x Orange", params = {event = "nk-unicornjob:Client:GiveJuice", args = { juice = 1 }}},
        {id = 2,header = Language.Menu.StrawberryJuice, txt = "Requis : 1x Fraise", params = {event = "nk-unicornjob:Client:GiveJuice", args = { juice = 2 }}},
        {id = 3,header = Language.Menu.KiwiJuice, txt = "Requis : 1x Kiwi", params = {event = "nk-unicornjob:Client:GiveJuice", args = { juice = 3 }}},
        {id = 4,header = Language.Menu.BananaJuice, txt = "Requis : 1x Banane", params = {event = "nk-unicornjob:Client:GiveJuice", args = { juice = 4 }}},
        {id = 5,header = Language.Menu.BanStraw, txt = "Requis : 1x Fraise & 1x Banane", params = {event = "nk-unicornjob:Client:GiveJuice", args = { juice = 5 }}},
        {id = 6,header = Language.Menu.Close,txt = '', params = {event = 'qb-menu:closeMenu'}}
    })
end)

RegisterNetEvent('nk-unicornjob:Client:FruitsMenu', function()
    TriggerEvent('qb-menu:client:openMenu', {
        {id = 0,header = Language.Menu.Fruits, txt = "" },
        {id = 1,header = Language.Menu.Orange, txt = "", params = {event = "nk-unicornjob:Client:GiveFruit", args = { fruit = 1 }}},
        {id = 2,header = Language.Menu.Strawberry, txt = "", params = {event = "nk-unicornjob:Client:GiveFruit", args = { fruit = 2 }}},
        {id = 3,header = Language.Menu.Kiwi, txt = "", params = {event = "nk-unicornjob:Client:GiveFruit", args = { fruit = 3 }}},
        {id = 4,header = Language.Menu.Banana, txt = "", params = {event = "nk-unicornjob:Client:GiveFruit", args = { fruit = 4 }}},
        {id = 5,header = Language.Menu.Watermelon, txt = "", params = {event = "nk-unicornjob:Client:GiveFruit", args = { fruit = 5 }}},
        {id = 6,header = Language.Menu.Coconut, txt = "", params = {event = "nk-unicornjob:Client:GiveFruit", args = { fruit = 6 }}},
        {id = 7,header = Language.Menu.Close,txt = '', params = {event = 'qb-menu:closeMenu'}}
    })
end)



