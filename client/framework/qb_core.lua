-- QB-Core Client Adapter
QBCore = nil
Framework.QB = {}

-- Initialize QB-Core
function Framework.QB.Init()
    while QBCore == nil do
        QBCore = exports['qb-core']:GetCoreObject()
        Wait(0)
    end
    
    Utils.Log('debug', 'QB-Core client initialized')
end

-- Get player data
function Framework.QB.GetPlayerData()
    if QBCore then
        return QBCore.Functions.GetPlayerData()
    end
    return nil
end

-- Get player job
function Framework.QB.GetPlayerJob()
    if QBCore then
        local playerData = QBCore.Functions.GetPlayerData()
        return playerData.job
    end
    return nil
end

-- Get player gang
function Framework.QB.GetPlayerGang()
    if QBCore then
        local playerData = QBCore.Functions.GetPlayerData()
        return playerData.gang
    end
    return nil
end

-- Check if player has job
function Framework.QB.HasJob(jobName)
    if QBCore then
        local playerData = QBCore.Functions.GetPlayerData()
        return playerData.job.name == jobName
    end
    return false
end

-- Check if player has gang
function Framework.QB.HasGang(gangName)
    if QBCore then
        local playerData = QBCore.Functions.GetPlayerData()
        return playerData.gang.name == gangName
    end
    return false
end

-- Get player citizenid
function Framework.QB.GetPlayerCitizenId()
    if QBCore then
        local playerData = QBCore.Functions.GetPlayerData()
        return playerData.citizenid
    end
    return nil
end

-- Get player coords
function Framework.QB.GetPlayerCoords()
    if QBCore then
        local playerData = QBCore.Functions.GetPlayerData()
        return playerData.position
    end
    return nil
end

-- Show notification
function Framework.QB.ShowNotification(message, type, duration)
    if QBCore then
        QBCore.Functions.Notify(message, type, duration)
    else
        -- Fallback notification
        SetNotificationTextEntry('STRING')
        AddTextComponentString(message)
        DrawNotification(false, false)
    end
end

-- Show help notification
function Framework.QB.ShowHelpNotification(message)
    if QBCore then
        QBCore.Functions.Notify(message, 'primary', 5000)
    else
        -- Fallback help notification
        BeginTextCommandDisplayHelp('STRING')
        AddTextComponentSubstringPlayerName(message)
        EndTextCommandDisplayHelp(0, false, true, -1)
    end
end

-- Trigger server event
function Framework.QB.TriggerServerEvent(eventName, ...)
    TriggerServerEvent(eventName, ...)
end

-- Get closest player
function Framework.QB.GetClosestPlayer()
    if QBCore then
        return QBCore.Functions.GetClosestPlayer()
    end
    return nil
end

-- Get closest player coords
function Framework.QB.GetClosestPlayerCoords()
    if QBCore then
        local closestPlayer = QBCore.Functions.GetClosestPlayer()
        if closestPlayer ~= -1 then
            return GetEntityCoords(GetPlayerPed(closestPlayer))
        end
    end
    return nil
end

-- Is player dead
function Framework.QB.IsPlayerDead()
    if QBCore then
        local playerData = QBCore.Functions.GetPlayerData()
        return playerData.metadata and playerData.metadata.isdead
    end
    return false
end

-- Get player money
function Framework.QB.GetPlayerMoney(account)
    if QBCore then
        local playerData = QBCore.Functions.GetPlayerData()
        if playerData.money then
            return playerData.money[account] or 0
        end
    end
    return 0
end

-- Get player metadata
function Framework.QB.GetPlayerMetadata()
    if QBCore then
        local playerData = QBCore.Functions.GetPlayerData()
        return playerData.metadata or {}
    end
    return {}
end

-- Get player charinfo
function Framework.QB.GetPlayerCharInfo()
    if QBCore then
        local playerData = QBCore.Functions.GetPlayerData()
        return playerData.charinfo or {}
    end
    return {}
end

-- Initialize when resource starts
CreateThread(function()
    Framework.QB.Init()
end)
