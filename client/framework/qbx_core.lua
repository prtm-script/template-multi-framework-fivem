-- QBX-Core Client Adapter
QBXCore = nil
Framework.QBX = {}

-- Initialize QBX-Core
function Framework.QBX.Init()
    while QBXCore == nil do
        QBXCore = exports['qbx_core']:GetCoreObject()
        Wait(0)
    end
    
    Utils.Log('debug', 'QBX-Core client initialized')
end

-- Get player data
function Framework.QBX.GetPlayerData()
    if QBXCore then
        return QBXCore.Functions.GetPlayerData()
    end
    return nil
end

-- Get player job
function Framework.QBX.GetPlayerJob()
    if QBXCore then
        local playerData = QBXCore.Functions.GetPlayerData()
        return playerData.job
    end
    return nil
end

-- Get player gang
function Framework.QBX.GetPlayerGang()
    if QBXCore then
        local playerData = QBXCore.Functions.GetPlayerData()
        return playerData.gang
    end
    return nil
end

-- Check if player has job
function Framework.QBX.HasJob(jobName)
    if QBXCore then
        local playerData = QBXCore.Functions.GetPlayerData()
        return playerData.job.name == jobName
    end
    return false
end

-- Check if player has gang
function Framework.QBX.HasGang(gangName)
    if QBXCore then
        local playerData = QBXCore.Functions.GetPlayerData()
        return playerData.gang.name == gangName
    end
    return false
end

-- Get player citizenid
function Framework.QBX.GetPlayerCitizenId()
    if QBXCore then
        local playerData = QBXCore.Functions.GetPlayerData()
        return playerData.citizenid
    end
    return nil
end

-- Get player coords
function Framework.QBX.GetPlayerCoords()
    if QBXCore then
        local playerData = QBXCore.Functions.GetPlayerData()
        return playerData.position
    end
    return nil
end

-- Show notification
function Framework.QBX.ShowNotification(message, type, duration)
    if QBXCore then
        QBXCore.Functions.Notify(message, type, duration)
    else
        -- Fallback notification
        SetNotificationTextEntry('STRING')
        AddTextComponentString(message)
        DrawNotification(false, false)
    end
end

-- Show help notification
function Framework.QBX.ShowHelpNotification(message)
    if QBXCore then
        QBXCore.Functions.Notify(message, 'primary', 5000)
    else
        -- Fallback help notification
        BeginTextCommandDisplayHelp('STRING')
        AddTextComponentSubstringPlayerName(message)
        EndTextCommandDisplayHelp(0, false, true, -1)
    end
end

-- Trigger server event
function Framework.QBX.TriggerServerEvent(eventName, ...)
    TriggerServerEvent(eventName, ...)
end

-- Get closest player
function Framework.QBX.GetClosestPlayer()
    if QBXCore then
        return QBXCore.Functions.GetClosestPlayer()
    end
    return nil
end

-- Get closest player coords
function Framework.QBX.GetClosestPlayerCoords()
    if QBXCore then
        local closestPlayer = QBXCore.Functions.GetClosestPlayer()
        if closestPlayer ~= -1 then
            return GetEntityCoords(GetPlayerPed(closestPlayer))
        end
    end
    return nil
end

-- Is player dead
function Framework.QBX.IsPlayerDead()
    if QBXCore then
        local playerData = QBXCore.Functions.GetPlayerData()
        return playerData.metadata and playerData.metadata.isdead
    end
    return false
end

-- Get player money
function Framework.QBX.GetPlayerMoney(account)
    if QBXCore then
        local playerData = QBXCore.Functions.GetPlayerData()
        if playerData.money then
            return playerData.money[account] or 0
        end
    end
    return 0
end

-- Get player metadata
function Framework.QBX.GetPlayerMetadata()
    if QBXCore then
        local playerData = QBXCore.Functions.GetPlayerData()
        return playerData.metadata or {}
    end
    return {}
end

-- Get player charinfo
function Framework.QBX.GetPlayerCharInfo()
    if QBXCore then
        local playerData = QBXCore.Functions.GetPlayerData()
        return playerData.charinfo or {}
    end
    return {}
end

-- Initialize when resource starts
CreateThread(function()
    Framework.QBX.Init()
end)
