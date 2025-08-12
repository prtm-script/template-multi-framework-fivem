-- ES Extended Server Adapter
ESX = nil
Framework.ESX = {}

-- Initialize ES Extended
function Framework.ESX.Init()
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Utils.Log('debug', 'ES Extended server initialized')
end

-- Get player object
function Framework.ESX.GetPlayer(source)
    if ESX then
        return ESX.GetPlayerFromId(source)
    end
    return nil
end

-- Get player data
function Framework.ESX.GetPlayerData(source)
    if ESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            return {
                source = source,
                identifier = xPlayer.identifier,
                name = xPlayer.name,
                job = xPlayer.job,
                group = xPlayer.group,
                coords = xPlayer.coords,
                accounts = xPlayer.accounts,
                inventory = xPlayer.inventory,
                loadout = xPlayer.loadout,
                metadata = xPlayer.metadata
            }
        end
    end
    return nil
end

-- Get player job
function Framework.ESX.GetPlayerJob(source)
    if ESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            return xPlayer.job
        end
    end
    return nil
end

-- Get player group
function Framework.ESX.GetPlayerGroup(source)
    if ESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            return xPlayer.group
        end
    end
    return nil
end

-- Check if player has job
function Framework.ESX.HasJob(source, jobName)
    if ESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            return xPlayer.job.name == jobName
        end
    end
    return false
end

-- Check if player has group
function Framework.ESX.HasGroup(source, groupName)
    if ESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            return xPlayer.group == groupName
        end
    end
    return false
end

-- Get player identifier
function Framework.ESX.GetPlayerIdentifier(source)
    if ESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            return xPlayer.identifier
        end
    end
    return nil
end

-- Get player money
function Framework.ESX.GetPlayerMoney(source, account)
    if ESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            return xPlayer.getAccount(account).money
        end
    end
    return 0
end

-- Add player money
function Framework.ESX.AddPlayerMoney(source, account, amount)
    if ESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            xPlayer.addAccountMoney(account, amount)
            return true
        end
    end
    return false
end

-- Remove player money
function Framework.ESX.RemovePlayerMoney(source, account, amount)
    if ESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            xPlayer.removeAccountMoney(account, amount)
            return true
        end
    end
    return false
end

-- Set player job
function Framework.ESX.SetPlayerJob(source, jobName, grade)
    if ESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            xPlayer.setJob(jobName, grade or 0)
            return true
        end
    end
    return false
end

-- Set player group
function Framework.ESX.SetPlayerGroup(source, groupName)
    if ESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            xPlayer.setGroup(groupName)
            return true
        end
    end
    return false
end

-- Get all players
function Framework.ESX.GetPlayers()
    if ESX then
        return ESX.GetPlayers()
    end
    return {}
end

-- Get players with job
function Framework.ESX.GetPlayersWithJob(jobName)
    if ESX then
        local players = {}
        local xPlayers = ESX.GetPlayers()
        
        for _, playerId in ipairs(xPlayers) do
            local xPlayer = ESX.GetPlayerFromId(playerId)
            if xPlayer and xPlayer.job.name == jobName then
                table.insert(players, playerId)
            end
        end
        
        return players
    end
    return {}
end

-- Get players with group
function Framework.ESX.GetPlayersWithGroup(groupName)
    if ESX then
        local players = {}
        local xPlayers = ESX.GetPlayers()
        
        for _, playerId in ipairs(xPlayers) do
            local xPlayer = ESX.GetPlayerFromId(playerId)
            if xPlayer and xPlayer.group == groupName then
                table.insert(players, playerId)
            end
        end
        
        return players
    end
    return {}
end

-- Show notification
function Framework.ESX.ShowNotification(source, message, type, duration)
    if ESX then
        TriggerClientEvent('esx:showNotification', source, message, type, duration)
    else
        -- Fallback notification
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 255, 255},
            multiline = true,
            args = {Config.ScriptName, message}
        })
    end
end

-- Trigger client event
function Framework.ESX.TriggerClientEvent(source, eventName, ...)
    TriggerClientEvent(eventName, source, ...)
end

-- Get offline player
function Framework.ESX.GetOfflinePlayer(identifier)
    if ESX then
        return ESX.GetPlayerFromIdentifier(identifier)
    end
    return nil
end

-- Save player data
function Framework.ESX.SavePlayerData(source)
    if ESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            xPlayer.save()
            return true
        end
    end
    return false
end
