-- Webhook for instapic posts, recommended to be a public channel
INSTAPIC_WEBHOOK = "https://discord.com/api/webhooks/1353675821176586270/MxhqJrYwsRXkhywwCevxmH4o-sgH1qjGHRHialjIGWrfZ0SdXj6G_o6qLnMzte5VISid/"
-- Webhook for birdy posts, recommended to be a public channel
BIRDY_WEBHOOK = "https://discord.com/api/webhooks/1353733640344829972/Y_VEZJPgEHrC-S40caAXhGeBd_hUvAS1RGPbf8ZhyQlrqQ_xKa_uCn1R8HpxrC_WfIMH/"

-- Discord webhook for server logs
LOGS = {
    Default = "https://discord.com/api/webhooks/", -- set to false to disable
    Calls = "https://discord.com/api/webhooks/",
    Messages = "https://discord.com/api/webhooks/",
    InstaPic = "https://discord.com/api/webhooks/",
    Birdy = "https://discord.com/api/webhooks/",
    YellowPages = "https://discord.com/api/webhooks/",
    Marketplace = "https://discord.com/api/webhooks/",
    Mail = "https://discord.com/api/webhooks/",
    Wallet = "https://discord.com/api/webhooks/",
    DarkChat = "https://discord.com/api/webhooks/",
    Services = "https://discord.com/api/webhooks/",
    Crypto = "https://discord.com/api/webhooks/",
    Trendy = "https://discord.com/api/webhooks/",
    Uploads = "https://discord.com/api/webhooks/" -- all camera uploads will go here
}

DISCORD_TOKEN = nil -- you can set a discord bot token here to get the players discord avatar for logs

-- Set your API keys for uploading media here.
-- Please note that the API key needs to match the correct upload method defined in Config.UploadMethod.
-- The default upload method is Fivemanage
-- We STRONGLY discourage using Discord as an upload method, as uploaded files may become inaccessible after a while.
-- You can get your API keys from https://fivemanage.com/
-- A video tutorial for how to set up Fivemanage can be found here: https://www.youtube.com/watch?v=y3bCaHS6Moc
API_KEYS = {
    Video = "MiJAHUKnVKGAsbHPZDoNuLpmW5qvUlOI",
    Image = "qF08mw8WBG6aadR12wO8FnSvEVmFt5gx",
    Audio = "7JHMlgfxreluKtZCuqx38jnt2a397puv",
}
