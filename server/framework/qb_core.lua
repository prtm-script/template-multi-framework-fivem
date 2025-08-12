-- QB-Core Server Adapter
QBCore = nil
Framework.QB = {}

-- Initialize QB-Core
function Framework.QB.Init()
    QBCore = exports['qb-core']:GetCoreObject()
    Utils.Log('debug', 'QB-Core server initialized')
end

-- Get player object
function Framework.QB.GetPlayer(source)
    if QBCore then
        return QBCore.Functions.GetPlayer(source)
    end
    return nil
end

-- Get player data
function Framework.QB.GetPlayerData(source)
    if QBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            return {
                source = source,
                citizenid = Player.PlayerData.citizenid,
                license = Player.PlayerData.license,
                name = Player.PlayerData.name,
                job = Player.PlayerData.job,
                gang = Player.PlayerData.gang,
                position = Player.PlayerData.position,
                money = Player.PlayerData.money,
                metadata = Player.PlayerData.metadata,
                charinfo = Player.PlayerData.charinfo
            }
        end
    end
    return nil
end

-- Get player job
function Framework.QB.GetPlayerJob(source)
    if QBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            return Player.PlayerData.job
        end
    end
    return nil
end

-- Get player gang
function Framework.QB.GetPlayerGang(source)
    if QBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            return Player.PlayerData.gang
        end
    end
    return nil
end

-- Check if player has job
function Framework.QB.HasJob(source, jobName)
    if QBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            return Player.PlayerData.job.name == jobName
        end
    end
    return false
end

-- Check if player has gang
function Framework.QB.HasGang(source, gangName)
    if QBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            return Player.PlayerData.gang.name == gangName
        end
    end
    return false
end

-- Get player citizenid
function Framework.QB.GetPlayerCitizenId(source)
    if QBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            return Player.PlayerData.citizenid
        end
    end
    return nil
end

-- Get player money
function Framework.QB.GetPlayerMoney(source, account)
    if QBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            return Player.PlayerData.money[account] or 0
        end
    end
    return 0
end

-- Add player money
function Framework.QB.AddPlayerMoney(source, account, amount)
    if QBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            Player.Functions.AddMoney(account, amount)
            return true
        end
    end
    return false
end

-- Remove player money
function Framework.QB.RemovePlayerMoney(source, account, amount)
    if QBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            Player.Functions.RemoveMoney(account, amount)
            return true
        end
    end
    return false
end

-- Set player job
function Framework.QB.SetPlayerJob(source, jobName, grade)
    if QBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            Player.Functions.SetJob(jobName, grade or 0)
            return true
        end
    end
    return false
end

-- Set player gang
function Framework.QB.SetPlayerGang(source, gangName, grade)
    if QBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            Player.Functions.SetGang(gangName, grade or 0)
            return true
        end
    end
    return false
end

-- Get all players
function Framework.QB.GetPlayers()
    if QBCore then
        return QBCore.Functions.GetPlayers()
    end
    return {}
end

-- Get players with job
function Framework.QB.GetPlayersWithJob(jobName)
    if QBCore then
        local players = {}
        local Players = QBCore.Functions.GetPlayers()
        
        for _, playerId in ipairs(Players) do
            local Player = QBCore.Functions.GetPlayer(playerId)
            if Player and Player.PlayerData.job.name == jobName then
                table.insert(players, playerId)
            end
        end
        
        return players
    end
    return {}
end

-- Get players with gang
function Framework.QB.GetPlayersWithGang(gangName)
    if QBCore then
        local players = {}
        local Players = QBCore.Functions.GetPlayers()
        
        for _, playerId in ipairs(Players) do
            local Player = QBCore.Functions.GetPlayer(playerId)
            if Player and Player.PlayerData.gang.name == gangName then
                table.insert(players, playerId)
            end
        end
        
        return players
    end
    return {}
end

-- Show notification
function Framework.QB.ShowNotification(source, message, type, duration)
    if QBCore then
        TriggerClientEvent('QBCore:Notify', source, message, type, duration)
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
function Framework.QB.TriggerClientEvent(source, eventName, ...)
    TriggerClientEvent(eventName, source, ...)
end

-- Get offline player
function Framework.QB.GetOfflinePlayer(citizenid)
    if QBCore then
        return QBCore.Functions.GetOfflinePlayer(citizenid)
    end
    return nil
end

-- Save player data
function Framework.QB.SavePlayerData(source)
    if QBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            Player.Functions.Save()
            return true
        end
    end
    return false
end

-- Get player metadata
function Framework.QB.GetPlayerMetadata(source)
    if QBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            return Player.PlayerData.metadata
        end
    end
    return {}
end

-- Set player metadata
function Framework.QB.SetPlayerMetadata(source, key, value)
    if QBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            Player.Functions.SetMetaData(key, value)
            return true
        end
    end
    return false
end
