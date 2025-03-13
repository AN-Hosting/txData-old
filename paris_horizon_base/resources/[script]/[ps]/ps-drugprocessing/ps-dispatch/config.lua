Config = Config or {}

Config.AuthorizedJobs = {
    ["police_nationale"] = {
        roles = { ['all'] = true },
        label = "Police Nationale"
    },
    ["gendarmerie_nationale"] = {
        roles = { ['all'] = true },
        label = "Gendarmerie Nationale"
    }
}

-- Si nécessaire, ajoutez aussi :
Config.JobOne = 'police_nationale'
Config.JobTwo = 'gendarmerie_nationale' 