-- ES Extended Client Adapter
ESX = nil
Framework.ESX = {}

-- Initialize ES Extended
function Framework.ESX.Init()
    while ESX == nil do
        ESX = exports['es_extended']:getSharedObject()
        Wait(0)
    end
    
    Utils.Log('debug', 'ES Extended client initialized')
end

-- Get player data
function Framework.ESX.GetPlayerData()
    if ESX then
        return ESX.GetPlayerData()
    end
    return nil
end

-- Get player job
function Framework.ESX.GetPlayerJob()
    if ESX then
        local playerData = ESX.GetPlayerData()
        return playerData.job
    end
    return nil
end

-- Get player group
function Framework.ESX.GetPlayerGroup()
    if ESX then
        local playerData = ESX.GetPlayerData()
        return playerData.group
    end
    return nil
end

-- Check if player has job
function Framework.ESX.HasJob(jobName)
    if ESX then
        local playerData = ESX.GetPlayerData()
        return playerData.job.name == jobName
    end
    return false
end

-- Check if player has group
function Framework.ESX.HasGroup(groupName)
    if ESX then
        local playerData = ESX.GetPlayerData()
        return playerData.group == groupName
    end
    return false
end

-- Get player identifier
function Framework.ESX.GetPlayerIdentifier()
    if ESX then
        local playerData = ESX.GetPlayerData()
        return playerData.identifier
    end
    return nil
end

-- Get player coords
function Framework.ESX.GetPlayerCoords()
    if ESX then
        local playerData = ESX.GetPlayerData()
        return playerData.coords
    end
    return nil
end

-- Show notification
function Framework.ESX.ShowNotification(message, type, duration)
    if ESX then
        ESX.ShowNotification(message, type, duration)
    else
        -- Fallback notification
        SetNotificationTextEntry('STRING')
        AddTextComponentString(message)
        DrawNotification(false, false)
    end
end

-- Show help notification
function Framework.ESX.ShowHelpNotification(message)
    if ESX then
        ESX.ShowHelpNotification(message)
    else
        -- Fallback help notification
        BeginTextCommandDisplayHelp('STRING')
        AddTextComponentSubstringPlayerName(message)
        EndTextCommandDisplayHelp(0, false, true, -1)
    end
end

-- Trigger server event
function Framework.ESX.TriggerServerEvent(eventName, ...)
    TriggerServerEvent(eventName, ...)
end

-- Get closest player
function Framework.ESX.GetClosestPlayer()
    if ESX then
        return ESX.Game.GetClosestPlayer()
    end
    return nil
end

-- Get closest player coords
function Framework.ESX.GetClosestPlayerCoords()
    if ESX then
        local closestPlayer = ESX.Game.GetClosestPlayer()
        if closestPlayer ~= -1 then
            return GetEntityCoords(GetPlayerPed(closestPlayer))
        end
    end
    return nil
end

-- Is player dead
function Framework.ESX.IsPlayerDead()
    if ESX then
        return ESX.GetPlayerData().IsDead
    end
    return false
end

-- Get player money
function Framework.ESX.GetPlayerMoney(account)
    if ESX then
        local playerData = ESX.GetPlayerData()
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

-- Initialize when resource starts
CreateThread(function()
    Framework.ESX.Init()
end)
