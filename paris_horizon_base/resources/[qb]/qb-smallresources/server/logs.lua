local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['default'] = 'https://discord.com/api/webhooks/1350064109890175016/mSk670S9WC8ZQ8FsbJq06irDxMKnoQ0Ccs5mXKsL0i4xehqqK7qIgdancDfFQQ4SF_TU',
    ['testwebhook'] = 'https://discord.com/api/webhooks/1350064109890175016/mSk670S9WC8ZQ8FsbJq06irDxMKnoQ0Ccs5mXKsL0i4xehqqK7qIgdancDfFQQ4SF_TU',
    ['playermoney'] = 'https://discord.com/api/webhooks/1350064184930471936/a9dSCohG4gmA5o5rVCnfOaGV6vjKpWkWlB4abi8BaR9eE8irMkkxQCNX_hEJJ8FnQH8M',
    ['playerinventory'] = 'https://discord.com/api/webhooks/1350064228601430077/im14chUQWURuZJNqmWxNJUofdrSb6NNQkBROFTcRFlBdDskKIUKCV6tYSyYZ7DmASjms',
    ['robbing'] = 'https://discord.com/api/webhooks/1350064289427361874/hfJWDlePQriLWRvfZzzb_22JlpCPeDuOfCLloYWrIdCnV6w9F7N5Uc9ww4j3kPwrHGiy',
    ['cuffing'] = 'https://discord.com/api/webhooks/1350064337141629059/2tbDhOGZlDUsG7fifflvoje5mZSUJ60ZEaIcBrbwS7ENI2EJ6Md1RvSEAP2d5xUElUYw',
    ['drop'] = 'https://discord.com/api/webhooks/1350064402120048661/Qtxo0unlv842QiEaHOpSWdXkkQNjlMHKEB0pzq0xwB6zBpcHYFOUZraELCSordluLdj9',
    ['trunk'] = 'https://discord.com/api/webhooks/1350064462102794261/wPsVIRZGG4Xo18UOB6qHbC5C9SD25MBL1euI68VyFUuer0RoNC1a7VdbXDIY4f7zjGUv',
    ['stash'] = 'https://discord.com/api/webhooks/1350064516037087306/YziItaoFxIiPtr_3dGLQTjDO_tpXT0YoA_GJgSPati_C0IInRw2zue5ibddG3rWVHsAA',
    ['glovebox'] = 'https://discord.com/api/webhooks/1350064564561248256/EX43Mp1KG5h5-YFwZO73lJLVOuELLeeGkTcMYwJstWQoEiB6BGaUTWT5mnAZR7E64_5A',
    ['banking'] = 'https://discord.com/api/webhooks/1350063917279219823/oYiDRJV_gNn3CmGYopImjwpOYkEE9-8Yi1zYLshu6sCdDnxqTYHTU-bXHhNAZOryEBtS',
    ['vehicleshop'] = 'https://discord.com/api/webhooks/1350064635193069568/WgaBlT7M3t0tmO7lJPmLtiIn9T15NP84mb11DpcxoPiuKKJyf1hDD0hEu1Nq6Pr3XUcF',
    ['vehicleupgrades'] = 'https://discord.com/api/webhooks/1350064679031935079/wnsJas04UznNlK3Dq3B8AW0pKV8WblmZeLYjv9IhpH4PZVqfNX_u_2zaTBUq6QP3ckhU',
    ['shops'] = 'https://discord.com/api/webhooks/1350065047807983750/KJhfuEi3mSMEq4M-Y4W18BXswUn4hIATh5z_DFdIDQOduK-hMDQtPvN-X4XvI7Rt8znR',
    ['dealers'] = 'https://discord.com/api/webhooks/1350065102459506749/GDzfvJ687U6e81eUBJuNRYgvBRVitBPLmcFUHtUll8h7Imkw-mmcs9dpkoV3L7sU_CoM',
    ['storerobbery'] = 'https://discord.com/api/webhooks/1350065145287540757/_pXLNAqFQM35dkRU5VLVyRSjoA9LszC32o1BgoapItDTEWviD2OxmZrB3B8V5ESGVH5Q',
    ['bankrobbery'] = 'https://discord.com/api/webhooks/1350065282214924351/G4219sFU1OvnjMQTYO2dI677N0XHE0hvrB0ZgGaCuvGm6mefREZkuZZKBSt_x4WTUy8T',
    ['powerplants'] = 'https://discord.com/api/webhooks/1350065332563218506/EuFsjqeg885-5WCZvBgcHA8NdV1zojMrv2qT9vxMI34WOsGJchxJGnk41a2UUQINNwmv',
    ['death'] = 'https://discord.com/api/webhooks/1350065376540758047/0Z-bGeqTmxmNPYRzFoCndGltjfkhVNopyJ1FRzYZYwEX90_0BcVK7Pn-v66LTcROj0o1',
    ['joinleave'] = 'https://discord.com/api/webhooks/1350065428122042368/ctv2AJsogWZ071ddE3I3ckHvzpPzukBJZCMeAZLjYFZzveBVXNtNxKk7Xq5bpIbyuuuv',
    ['ooc'] = 'https://discord.com/api/webhooks/1350065475450834996/LUAk_OxmW7IL5fMdVn-yHMIwB_OTo5cMLcUAetJ-roVUuLYun3-7BQTxnCnnFSUgvXWW',
    ['report'] = 'https://discord.com/api/webhooks/1350065525987868754/pUQIbYN0deyJf1gSZkoqZINWPBmUtfdtgmy05XdkDq59PEp8Zxq-Bg-zdtCtbLUGQ23u',
    ['me'] = 'https://discord.com/api/webhooks/1350065572146319372/BFFoI-O4JxW2D3lb7kQO0Ci_JO2u9cY3HOAo-oL-qPvoP37NB6Gg3oVikZBwEprvAR5-',
    ['pmelding'] = 'https://discord.com/api/webhooks/1350065621420736632/33hghiWsK42IYs6pvLzBudsBTMDOQhibHV72y9ukyCHacNxXLWaOGlbqrnkEGM-gqaJf',
    ['112'] = 'https://discord.com/api/webhooks/1350065680585854976/BjPluqfa0tp2VDBsIV2w9toFO8b9ef_t9BfBC47klvPu4kdiNIDFlf0rZ0KCDhNWVI4T',
    ['bans'] = 'https://discord.com/api/webhooks/1350065743349157918/flXrpY0ht3a3XQ9f_i-QD3bBwXh78TZYg_WXtNL_OnfVCfRuE7W4_6cXEwQlYqXKrJ1x',
    ['anticheat'] = 'https://discord.com/api/webhooks/1350065780036997121/YiiHw1U_tQ_0ePSliFXLL8tC-zHfRgbIwkYt_Nft4Wl0BG6Pl_GLNAgUZXreBW25sYNt',
    ['weather'] = 'https://discord.com/api/webhooks/1350065830418714674/jnYlpbTCk9WfGpRSAIN6eea5ukxcMdIqm3Lv2DjhQitzU-DKL1AiYVGaYJ_bneH7n9mG',
    ['moneysafes'] = 'https://discord.com/api/webhooks/1350065870935953459/Zsi5yvckPsnEEsPATJaV6NM6cY_sLyBMm0RKQdNoxkU3vW2H6HoZFGY7Qo4Z2f7TrcpX',
    ['bennys'] = 'https://discord.com/api/webhooks/1350065910873854014/zatllE0gDYfQpUpEk0mAmO2cYd_ucqP9GYpkDG_O1177JVgU1IOlnd0cyxHQsIvhY6DH',
    ['bossmenu'] = 'https://discord.com/api/webhooks/1350065954855456800/rm78NlA_GpZdEYd9CyPNVH7Pg4e1ViofOs687ZVSS0vHZweU5oADHrprNLUVySZ3Zql6',
    ['robbery'] = 'https://discord.com/api/webhooks/1350066004075614279/6DYqsqgZCRHr5sdn6nMrf3Uwq8MyUT96I3RpltIaLxwvuX6qE4BZBV9q2IMRGR0OZ37r',
    ['casino'] = 'https://discord.com/api/webhooks/1350066083725316166/BpzEJbBRO_SMcTZKmza3yCP8YS92ugLYlELN2zk4AQ1TGZ0uYCVmI2BTsRpoPUv1kIsi',
    ['traphouse'] = 'https://discord.com/api/webhooks/1350066144920469629/ga616Ise-2E9iKJ-WPSKlWbX8HbhFpgn6PKhIIJJxX-Q3QDEif8WanYPfj-kRX44ky3M',
    ['911'] = 'https://discord.com/api/webhooks/1350066213316853810/9hDklt-5q4yuyjbpH8BouNd7DJ4M75dYpxlMDrdnwiyybQl6kMMnE8PasQBQnyjZYuRq',
    ['palert'] = 'https://discord.com/api/webhooks/1350066251740876881/ljPCHrdgwDfnS3npea_eeX8jZ6uSe8txDtlUfKoorAvUQQyW8j_YiU7_otNpO3z4g6Gy',
    ['itemplacement'] = 'https://discord.com/api/webhooks/1350066417638051870/tuZBKBeok--I8dhO5x2-RFxzS1J6EYzafzYiUi2TKTLBPAmPHfL71Wg52vq0AU4PQUCM',
    ['qbjobs'] = 'https://discord.com/api/webhooks/1350066324524765224/RGQjQnOwsDKVAfczfiYzys-YQFgqPwL49GzA1expFgfdP1oUFlciK02jVI0iYidS7Q4P',
}

local colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ['lightgreen'] = 65309,
}

local logQueue = {}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone, imageUrl)
    local tag = tagEveryone or false

    if Config.Logging == 'discord' then
        if not Webhooks[name] then
            print('Tried to call a log that isn\'t configured with the name of ' .. name)
            return
        end
        local webHook = Webhooks[name] ~= '' and Webhooks[name] or Webhooks['default']
        local embedData = {
            {
                ['title'] = title,
                ['color'] = colors[color] or colors['default'],
                ['footer'] = {
                    ['text'] = os.date('%c'),
                },
                ['description'] = message,
                ['author'] = {
                    ['name'] = 'QBCore Logs',
                    ['icon_url'] = 'https://raw.githubusercontent.com/GhzGarage/qb-media-kit/main/Display%20Pictures/Logo%20-%20Display%20Picture%20-%20Stylized%20-%20Red.png',
                },
                ['image'] = imageUrl and imageUrl ~= '' and { ['url'] = imageUrl } or nil,
            }
        }

        if not logQueue[name] then logQueue[name] = {} end
        logQueue[name][#logQueue[name] + 1] = { webhook = webHook, data = embedData }

        if #logQueue[name] >= 10 then
            local postData = { username = 'QB Logs', embeds = {} }

            if tag then
                postData.content = '@everyone'
            end

            for i = 1, #logQueue[name] do postData.embeds[#postData.embeds + 1] = logQueue[name][i].data[1] end
            PerformHttpRequest(logQueue[name][1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
            logQueue[name] = {}
        end
    elseif Config.Logging == 'fivemanage' then
        local FiveManageAPIKey = GetConvar('FIVEMANAGE_LOGS_API_KEY', 'false')
        if FiveManageAPIKey == 'false' then
            print('You need to set the FiveManage API key in your server.cfg')
            return
        end
        local extraData = {
            level = tagEveryone and 'warn' or 'info', -- info, warn, error or debug
            message = title,                          -- any string
            metadata = {                              -- a table or object with any properties you want
                description = message,
                playerId = source,
                playerLicense = GetPlayerIdentifierByType(source, 'license'),
                playerDiscord = GetPlayerIdentifierByType(source, 'discord')
            },
            resource = GetInvokingResource(),
        }
        PerformHttpRequest('https://api.fivemanage.com/api/logs', function(statusCode, response, headers)
            -- Uncomment the following line to enable debugging
            -- print(statusCode, response, json.encode(headers))
        end, 'POST', json.encode(extraData), {
            ['Authorization'] = FiveManageAPIKey,
            ['Content-Type'] = 'application/json',
        })
    end
end)

Citizen.CreateThread(function()
    local timer = 0
    while true do
        Wait(1000)
        timer = timer + 1
        if timer >= 60 then -- If 60 seconds have passed, post the logs
            timer = 0
            for name, queue in pairs(logQueue) do
                if #queue > 0 then
                    local postData = { username = 'QB Logs', embeds = {} }
                    for i = 1, #queue do
                        postData.embeds[#postData.embeds + 1] = queue[i].data[1]
                    end
                    PerformHttpRequest(queue[1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
                    logQueue[name] = {}
                end
            end
        end
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function()
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
