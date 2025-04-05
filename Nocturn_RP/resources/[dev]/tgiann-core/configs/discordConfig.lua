-- Don't share the bot token with anyone
discordConfig = {
    guildId = '',               -- Set to the ID of your guild
    botToken = '',              -- Search google "How to get discord bot token"
    cacheDiscordRoles = true,   -- true to cache player roles, false to make a new Discord Request every time
    cacheDiscordRolesTime = 60, -- if CacheDiscordRoles is true, how long to cache roles before clearing (in seconds)
}

config.discordLog = {
    name = "TGIANN",
    avatar = "",
}
