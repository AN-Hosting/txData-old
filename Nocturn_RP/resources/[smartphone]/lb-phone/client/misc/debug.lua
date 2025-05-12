RegisterCommand("phonedebug", function()
    Config.Debug = not Config.Debug

    SendReactMessage("toggleDebug", Config.Debug)
    print("DEBUG:", Config.Debug)
end, false)

local function RegisterDebugCommand(command, fn)
    if not Config.Debug then
        return
    end

    RegisterCommand(command, fn, false)
end

RegisterDebugCommand("getphonecache", function()
    SendReactMessage("printCache")
end)

RegisterDebugCommand("getphonestacks", function()
    SendReactMessage("printStacks")
end)

if not Config.Debug then
    return
end

RegisterCommand("phonenotification", function()
    ---@type Notification
    local notification = {
        app = "Settings",
        title = "Test notification",
        content = "This is a test notification",
    }

    exports["lb-phone"]:SendNotification(notification)
end, false)
