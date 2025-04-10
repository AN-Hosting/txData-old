local entitiesStaticIdsData = {} -- { [stepStaticId] = { heistId, stageId, stepId, entityData, stepData } }
local queueEntities = {} -- { stepStaticId = {heistId, stageId, stepId, stepStaticId, entityData} }
local isQueueProcessing = false
local QUEUE_ACCUMULATION_TIME <const> = 1000

function RobberiesCreator.areThereObjectsForHeist(heistId)
    for _, entityData in pairs(entitiesStaticIdsData) do
        if(entityData.heistId == heistId) then
            return true
        end
    end

    return false
end

function RobberiesCreator.disableObjectsOfHeist(heistId)
    for stepStaticId, entityData in pairs(entitiesStaticIdsData) do
        if(entityData.heistId == heistId) then
            RobberiesCreator.setStepDisabled(stepStaticId, true)
        end
    end
end

function RobberiesCreator.getDataFromStepStaticId(stepStaticId)
    local data = entitiesStaticIdsData[stepStaticId]
    return data.heistId, data.stageId, data.stepId, data.stepData
end

local function sendEntitiesToClient(serverId, entitiesToSend)
    TriggerLatentClientEvent(Utils.eventsPrefix .. ":spawnQueuedEntities", serverId, 25000, entitiesToSend)
end

RegisterNetEvent(Utils.eventsPrefix .. ":askForEntities", function()
    local playerId = source
    sendEntitiesToClient(playerId, entitiesStaticIdsData)
end)

local function queueEntitySpawn(stepStaticId)
    queueEntities[stepStaticId] = Utils.deepCopy(entitiesStaticIdsData[stepStaticId])

    if isQueueProcessing then return end
    isQueueProcessing = true

    SetTimeout(QUEUE_ACCUMULATION_TIME, function()
        sendEntitiesToClient(-1, queueEntities)
        queueEntities = {}
        isQueueProcessing = false
    end)
end

function RobberiesCreator.spawnEntityInCoords(heistId, stageId, stepId, entityData, index)
    local stepStaticId = RobberiesCreator.getStaticId(heistId, stageId, stepId, index)

    if(entitiesStaticIdsData[stepStaticId]) then
        RobberiesCreator.deleteEntityWithStaticId(stepStaticId)
        Citizen.Wait(1000) -- Wait a bit to avoid issues with the entity deletion
    end

    if(not RobberiesCreator.Heists[heistId]) then return end -- Heist doesn't exist anymore

    local stepData = RobberiesCreator?.Heists?[heistId]?.stages?[stageId]?.steps?[stepId]

    entitiesStaticIdsData[stepStaticId] = {
        heistId = heistId,
        stageId = stageId,
        stepId = stepId,
        entityData = entityData,
        stepData = RobberiesCreator?.Heists?[heistId]?.stages?[stageId]?.steps?[stepId]
    }

    queueEntitySpawn(stepStaticId)

    if(stepData.method == "SEARCH_POINTS") then
        RobberiesCreator.addAvailableSearchPoint(heistId, stageId, stepId, stepStaticId)
    end
end

function RobberiesCreator.deleteEntityWithStaticId(stepStaticId)
    if not entitiesStaticIdsData[stepStaticId] then return end

    TriggerClientEvent(Utils.eventsPrefix .. ":deleteStaticId", -1, stepStaticId)

    entitiesStaticIdsData[stepStaticId] = nil

    if queueEntities[stepStaticId] then
        queueEntities[stepStaticId] = nil
    end

    -- Reset
    RobberiesCreator.setStepBeingUsed(stepStaticId, nil)
    RobberiesCreator.setStepDisabled(stepStaticId, nil)
end

function RobberiesCreator.deleteEntitiesForHeistId(heistId)
    for stepStaticId, entityData in pairs(entitiesStaticIdsData) do
        if(entityData.heistId == heistId) then
            RobberiesCreator.setStepDisabled(stepStaticId, true)

            -- TODO: Add that if the step is being used (trolley) it has to add to pending deletion rather than delete it
            RobberiesCreator.deleteEntityWithStaticId(stepStaticId)
        end
    end
end

function RobberiesCreator.deleteAllHeistsEntities()
    entitiesStaticIdsData = {}

    TriggerClientEvent(Utils.eventsPrefix .. ":deleteAllHeistsEntities", -1)
end

RegisterNetEvent(Utils.eventsPrefix .. ":heist:requestStaticStepAsHidden", function(stepStaticId)
    local playerId = source

    TriggerClientEvent(Utils.eventsPrefix .. ":heist:setStaticStepAsHidden", -1, stepStaticId)
end)
