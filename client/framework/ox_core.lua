-- OX-Core Client Adapter
Framework.OX = {}

-- Initialize OX-Core
function Framework.OX.Init()
    -- OX-Core uses exports directly, no need to wait for object
    Utils.Log('debug', 'OX-Core client initialized')
end

-- Get player data
function Framework.OX.GetPlayerData()
    local ox = exports.ox_core
    if ox then
        return ox.GetPlayerData()
    end
    return nil
end

-- Get player job
function Framework.OX.GetPlayerJob()
    local ox = exports.ox_core
    if ox then
        local playerData = ox.GetPlayerData()
        return playerData.job
    end
    return nil
end

-- Get player group
function Framework.OX.GetPlayerGroup()
    local ox = exports.ox_core
    if ox then
        local playerData = ox.GetPlayerData()
        return playerData.group
    end
    return nil
end

-- Check if player has job
function Framework.OX.HasJob(jobName)
    local ox = exports.ox_core
    if ox then
        local playerData = ox.GetPlayerData()
        return playerData.job.name == jobName
    end
    return false
end

-- Check if player has group
function Framework.OX.HasGroup(groupName)
    local ox = exports.ox_core
    if ox then
        local playerData = ox.GetPlayerData()
        return playerData.group == groupName
    end
    return false
end

-- Get player identifier
function Framework.OX.GetPlayerIdentifier()
    local ox = exports.ox_core
    if ox then
        local playerData = ox.GetPlayerData()
        return playerData.identifier
    end
    return nil
end

-- Get player coords
function Framework.OX.GetPlayerCoords()
    local ox = exports.ox_core
    if ox then
        local playerData = ox.GetPlayerData()
        return playerData.coords
    end
    return nil
end

-- Show notification
function Framework.OX.ShowNotification(message, type, duration)
    local ox = exports.ox_core
    if ox then
        ox.notify({
            title = Config.ScriptName,
            description = message,
            type = type or 'info',
            duration = duration or Config.Notifications.duration
        })
    else
        -- Fallback notification
        SetNotificationTextEntry('STRING')
        AddTextComponentString(message)
        DrawNotification(false, false)
    end
end

-- Show help notification
function Framework.OX.ShowHelpNotification(message)
    local ox = exports.ox_core
    if ox then
        ox.notify({
            title = 'Help',
            description = message,
            type = 'info',
            duration = 5000
        })
    else
        -- Fallback help notification
        BeginTextCommandDisplayHelp('STRING')
        AddTextComponentSubstringPlayerName(message)
        EndTextCommandDisplayHelp(0, false, true, -1)
    end
end

-- Trigger server event
function Framework.OX.TriggerServerEvent(eventName, ...)
    TriggerServerEvent(eventName, ...)
end

-- Get closest player
function Framework.OX.GetClosestPlayer()
    local ox = exports.ox_core
    if ox then
        return ox.GetClosestPlayer()
    end
    return nil
end

-- Get closest player coords
function Framework.OX.GetClosestPlayerCoords()
    local ox = exports.ox_core
    if ox then
        local closestPlayer = ox.GetClosestPlayer()
        if closestPlayer ~= -1 then
            return GetEntityCoords(GetPlayerPed(closestPlayer))
        end
    end
    return nil
end

-- Is player dead
function Framework.OX.IsPlayerDead()
    local ox = exports.ox_core
    if ox then
        local playerData = ox.GetPlayerData()
        return playerData.metadata and playerData.metadata.isdead
    end
    return false
end

-- Get player money
function Framework.OX.GetPlayerMoney(account)
    local ox = exports.ox_core
    if ox then
        local playerData = ox.GetPlayerData()
        if playerData.accounts then
            for _, accountData in pairs(playerData.accounts) do
                if accountData.name == account then
                    return accountData.money
                end
            end
        end
    end
    return 0
end

-- Get player metadata
function Framework.OX.GetPlayerMetadata()
    local ox = exports.ox_core
    if ox then
        local playerData = ox.GetPlayerData()
        return playerData.metadata or {}
    end
    return {}
end

-- Get player status
function Framework.OX.GetPlayerStatus()
    local ox = exports.ox_core
    if ox then
        return ox.GetPlayerStatus()
    end
    return {}
end

-- Initialize when resource starts
CreateThread(function()
    Framework.OX.Init()
end)
