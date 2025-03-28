

-- cyberbar créer par Minox
Config.DoorList['cyberbar-cyberbar'] = {
    distance = 3,
    doorType = 'door',
    objName = 1925421092,
    authorizedJobs = { ['cyberbar'] = 0 },
    objCoords = vec3(341.453216, -939.637818, 29.567646),
    doorLabel = 'cyberbar',
    locked = true,
    doorRate = 1.0,
    fixText = false,
    objYaw = 0.0,
}

-- cyberbar2 créer par Minox
Config.DoorList['cyberbar-cyberbar2'] = {
    authorizedJobs = { ['cyberbar'] = 0 },
    doorLabel = 'cyberbar',
    doorType = 'double',
    locked = true,
    doorRate = 1.0,
    doors = {
        {objName = -658414514, objYaw = 89.999969482422, objCoords = vec3(347.373840, -904.169190, 28.248384)},
        {objName = -658414514, objYaw = 270.00003051758, objCoords = vec3(347.373840, -906.299378, 28.248384)}
    },
    distance = 3,
}

-- cyberbar3 créer par Minox
Config.DoorList['cyberbar-cyberbar3'] = {
    authorizedJobs = { ['cyberbar'] = 0 },
    doorLabel = 'cyberbar',
    doorType = 'double',
    locked = true,
    doorRate = 1.0,
    doors = {
        {objName = -956579645, objYaw = 270.0, objCoords = vec3(310.252686, -907.979858, 28.319436)},
        {objName = 1250772920, objYaw = 89.999977111816, objCoords = vec3(310.247986, -906.015870, 28.319436)}
    },
    distance = 3,
}