--[[
    Welcome to the qs-weed configuration guide!

    Before you start setting up your new asset, take a moment to read this guide carefully.
    We’ll walk you through each key part of the configuration step by step, ensuring you can
    tailor everything to perfectly match your server’s requirements.

    Key configuration sections will be marked clearly, like this one you’re reading now.
    In these sections, we’ll break down each setting available in this file to help you understand
    and configure it with ease.

    Flexibility is a priority here. Most of the settings are customizable, allowing you to adapt
    them to your framework, whether it's ESX, QBCore, or another. You’ll find all configurable files
    located in `client/custom/*` for client-side adjustments or `server/custom/*` for server-side changes.

    Before diving in, please review our complete documentation for detailed guidance:
    https://docs.quasar-store.com/information/welcome

    This resource is fully customizable, making it simple to adjust features to fit your server’s needs.
    Take your time exploring and enjoy building your weed management system!
]]

Config = {}
Locales = {}

--[[
    Choose your preferred language!

    In this section, you can select the main language for your asset. We have a wide
    selection of default languages available, located in the locales/* folder.

    If your language is not listed, don't worry! You can easily create a new one
    by adding a new file in the locales folder and customizing it to your needs.

    Default languages available:
        'ar'     -- Arabic
        'bg'     -- Bulgarian
        'ca'     -- Catalan
        'cs'     -- Czech
        'da'     -- Danish
        'de'     -- German
        'el'     -- Greek
        'en'     -- English
        'es'     -- Spanish
        'fa'     -- Persian
        'fr'     -- French
        'he'     -- Hebrew
        'hi'     -- Hindi
        'hu'     -- Hungarian
        'it'     -- Italian
        'ja'     -- Japanese
        'ko'     -- Korean
        'nl'     -- Dutch
        'no'     -- Norwegian
        'pl'     -- Polish
        'pt'     -- Portuguese
        'ro'     -- Romanian
        'ru'     -- Russian
        'sl'     -- Slovenian
        'sv'     -- Swedish
        'th'     -- Thai
        'tr'     -- Turkish
        'zh-CN'  -- Chinese (Simplified)
        'zh-TW'  -- Chinese (Traditional)

    After selecting your preferred language, be sure to save your changes and test
    the asset to ensure everything works as expected!
]]

Config.Language = 'fr'

--[[
    The current system will automatically detect if you are using 'qb-core' or 'es_extended'.
    However, if you have renamed your framework, you can clear the value in `Config.Framework`
    and manually add your framework name after adjusting the framework-specific files within
    this script.

    Keep in mind that this detection is automated. Avoid making edits here unless you’re certain
    of the changes, as incorrect modifications can disrupt functionality.
]]

local esxHas = GetResourceState('es_extended') == 'started'
local qbHas = GetResourceState('qb-core') == 'started'
local qbxHas = GetResourceState('qbx_core') == 'started'

Config.Framework = esxHas and 'esx' or qbxHas and 'qbx' or qbHas and 'qb' or 'standalone'

--[[
    General asset settings: here you can adjust options like the growth time for plants
    or add random areas on the map for plantations.

    Please avoid modifying the final settings, as changing them could disrupt the functionality
    of the asset.
]]

Config.PoliceJobs = { -- Specify jobs that have permission for creating houses
    'police',
    'sheriff'
}

Config.HarvestTime = (60 * 1000) * 9.6 -- Growth time in milliseconds
Config.MaxPlants = 10                  -- Maximum number of plants allowed per house

Config.WeedArea = {                    -- Define random plantation areas on the map
    {
        id = 'weed-area-01',
        minZ = 1,
        maxZ = 800,
        points = {
            vec3(3140.91, 4104.55, 77.57),
            vec3(2092.42, 1953.03, 77.57),
            vec3(3122.73, 1595.45, 77.57),
            vec3(3728.79, 3989.39, 77.57)
        }
    }
}

--[[
    Do not modify this section; any changes may disrupt the asset’s functionality.

    Config.Props defines the various stages of weed growth with specific models.
    These props correspond to different stages, from initial planting ('stage-a')
    through full growth ('stage-g').
]]

Config.UseableItems = {
    {
        itemName = 'weed_white-widow_seed',
        plantName = 'white-widow',
    },
    {
        itemName = 'weed_white-weed_skunk_seed',
        plantName = 'skunk',
    },
    {
        itemName = 'weed_purple-haze_seed',
        plantName = 'purple-haze',
    },
    {
        itemName = 'weed_og-kush_seed',
        plantName = 'og-kush',
    },
    {
        itemName = 'weed_amnesia_seed',
        plantName = 'amnesia',
    },
    {
        itemName = 'weed_ak47_seed',
        plantName = 'ak47',
    },
    {
        itemName = 'weed_nutrition',
    },
}

Config.Plants = {
    ['og-kush'] = {
        ['label'] = 'OG Kush',
        ['item'] = 'ogkush',
        ['stages'] = {
            ['stage-a'] = 'bkr_prop_weed_01_small_01c',
            ['stage-b'] = 'bkr_prop_weed_01_small_01b',
            ['stage-c'] = 'bkr_prop_weed_01_small_01a',
            ['stage-d'] = 'bkr_prop_weed_med_01b',
            ['stage-e'] = 'bkr_prop_weed_lrg_01a',
            ['stage-f'] = 'bkr_prop_weed_lrg_01b',
            ['stage-g'] = 'bkr_prop_weed_lrg_01b',
        },
        ['highestStage'] = 'stage-g'
    },
    ['amnesia'] = {
        ['label'] = 'Amnesia',
        ['item'] = 'amnesia',
        ['stages'] = {
            ['stage-a'] = 'bkr_prop_weed_01_small_01c',
            ['stage-b'] = 'bkr_prop_weed_01_small_01b',
            ['stage-c'] = 'bkr_prop_weed_01_small_01a',
            ['stage-d'] = 'bkr_prop_weed_med_01b',
            ['stage-e'] = 'bkr_prop_weed_lrg_01a',
            ['stage-f'] = 'bkr_prop_weed_lrg_01b',
            ['stage-g'] = 'bkr_prop_weed_lrg_01b',
        },
        ['highestStage'] = 'stage-g'
    },
    ['skunk'] = {
        ['label'] = 'Skunk',
        ['item'] = 'skunk',
        ['stages'] = {
            ['stage-a'] = 'bkr_prop_weed_01_small_01c',
            ['stage-b'] = 'bkr_prop_weed_01_small_01b',
            ['stage-c'] = 'bkr_prop_weed_01_small_01a',
            ['stage-d'] = 'bkr_prop_weed_med_01b',
            ['stage-e'] = 'bkr_prop_weed_lrg_01a',
            ['stage-f'] = 'bkr_prop_weed_lrg_01b',
            ['stage-g'] = 'bkr_prop_weed_lrg_01b',
        },
        ['highestStage'] = 'stage-g'
    },
    ['ak47'] = {
        ['label'] = 'AK 47',
        ['item'] = 'ak47',
        ['stages'] = {
            ['stage-a'] = 'bkr_prop_weed_01_small_01c',
            ['stage-b'] = 'bkr_prop_weed_01_small_01b',
            ['stage-c'] = 'bkr_prop_weed_01_small_01a',
            ['stage-d'] = 'bkr_prop_weed_med_01b',
            ['stage-e'] = 'bkr_prop_weed_lrg_01a',
            ['stage-f'] = 'bkr_prop_weed_lrg_01b',
            ['stage-g'] = 'bkr_prop_weed_lrg_01b',
        },
        ['highestStage'] = 'stage-g'
    },
    ['purple-haze'] = {
        ['label'] = 'Purple Haze',
        ['item'] = 'purplehaze',
        ['stages'] = {
            ['stage-a'] = 'bkr_prop_weed_01_small_01c',
            ['stage-b'] = 'bkr_prop_weed_01_small_01b',
            ['stage-c'] = 'bkr_prop_weed_01_small_01a',
            ['stage-d'] = 'bkr_prop_weed_med_01b',
            ['stage-e'] = 'bkr_prop_weed_lrg_01a',
            ['stage-f'] = 'bkr_prop_weed_lrg_01b',
            ['stage-g'] = 'bkr_prop_weed_lrg_01b',
        },
        ['highestStage'] = 'stage-g'
    },
    ['white-widow'] = {
        ['label'] = 'White Widow',
        ['item'] = 'whitewidow',
        ['stages'] = {
            ['stage-a'] = 'bkr_prop_weed_01_small_01c',
            ['stage-b'] = 'bkr_prop_weed_01_small_01b',
            ['stage-c'] = 'bkr_prop_weed_01_small_01a',
            ['stage-d'] = 'bkr_prop_weed_med_01b',
            ['stage-e'] = 'bkr_prop_weed_lrg_01a',
            ['stage-f'] = 'bkr_prop_weed_lrg_01b',
            ['stage-g'] = 'bkr_prop_weed_lrg_01b',
        },
        ['highestStage'] = 'stage-g'
    },
}

Config.Props = {
    ['stage-a'] = 'bkr_prop_weed_01_small_01c',
    ['stage-b'] = 'bkr_prop_weed_01_small_01b',
    ['stage-c'] = 'bkr_prop_weed_01_small_01a',
    ['stage-d'] = 'bkr_prop_weed_med_01b',
    ['stage-e'] = 'bkr_prop_weed_lrg_01a',
    ['stage-f'] = 'bkr_prop_weed_lrg_01b',
    ['stage-g'] = 'bkr_prop_weed_lrg_01b',
}

local implemenetCaches = {} -- Internal cache for tracking error implementations, do not modify
-- Function to handle error implementations
function ImplementError(name)
    if implemenetCaches[name] then
        return
    end
    print('^1[IMPLEMENT ERROR]^7', name) -- Outputs an error message with the name of the issue
    implemenetCaches[name] = true        -- Caches the name to prevent repeated error messages
end
