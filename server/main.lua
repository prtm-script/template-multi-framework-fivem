-- Multi-Framework Template Server Main
local FrameworkReady = false

-- Initialize framework when resource starts
CreateThread(function()
    while not Framework.IsReady() do
        Wait(100)
    end
    
    FrameworkReady = true
    Utils.Log('info', 'Server framework ready: %s', Framework.GetCurrent())
end)

-- Unified Framework Interface
Framework = Framework or {}

-- Unified Player Functions
function Framework.GetPlayer(source)
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.GetPlayer(source)
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.GetPlayer(source)
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.GetPlayer(source)
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.GetPlayer(source)
    end
    return nil
end

function Framework.GetPlayerData(source)
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.GetPlayerData(source)
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.GetPlayerData(source)
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.GetPlayerData(source)
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.GetPlayerData(source)
    end
    return nil
end

function Framework.GetPlayerJob(source)
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.GetPlayerJob(source)
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.GetPlayerJob(source)
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.GetPlayerJob(source)
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.GetPlayerJob(source)
    end
    return nil
end

function Framework.GetPlayerGroup(source)
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.GetPlayerGroup(source)
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.GetPlayerGroup(source)
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.GetPlayerGroup(source)
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.GetPlayerGroup(source)
    end
    return nil
end

function Framework.HasJob(source, jobName)
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.HasJob(source, jobName)
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.HasJob(source, jobName)
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.HasJob(source, jobName)
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.HasJob(source, jobName)
    end
    return false
end

function Framework.HasGroup(source, groupName)
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.HasGroup(source, groupName)
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.HasGroup(source, groupName)
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.HasGroup(source, groupName)
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.HasGroup(source, groupName)
    end
    return false
end

function Framework.GetPlayerIdentifier(source)
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.GetPlayerIdentifier(source)
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.GetPlayerCitizenId(source)
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.GetPlayerCitizenId(source)
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.GetPlayerIdentifier(source)
    end
    return nil
end

function Framework.GetPlayerMoney(source, account)
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.GetPlayerMoney(source, account)
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.GetPlayerMoney(source, account)
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.GetPlayerMoney(source, account)
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.GetPlayerMoney(source, account)
    end
    return 0
end

function Framework.AddPlayerMoney(source, account, amount)
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.AddPlayerMoney(source, account, amount)
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.AddPlayerMoney(source, account, amount)
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.AddPlayerMoney(source, account, amount)
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.AddPlayerMoney(source, account, amount)
    end
    return false
end

function Framework.RemovePlayerMoney(source, account, amount)
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.RemovePlayerMoney(source, account, amount)
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.RemovePlayerMoney(source, account, amount)
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.RemovePlayerMoney(source, account, amount)
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.RemovePlayerMoney(source, account, amount)
    end
    return false
end

function Framework.SetPlayerJob(source, jobName, grade)
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.SetPlayerJob(source, jobName, grade)
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.SetPlayerJob(source, jobName, grade)
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.SetPlayerJob(source, jobName, grade)
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.SetPlayerJob(source, jobName, grade)
    end
    return false
end

function Framework.SetPlayerGroup(source, groupName)
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.SetPlayerGroup(source, groupName)
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.SetPlayerGroup(source, groupName)
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.SetPlayerGroup(source, groupName)
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.SetPlayerGroup(source, groupName)
    end
    return false
end

function Framework.GetPlayers()
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.GetPlayers()
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.GetPlayers()
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.GetPlayers()
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.GetPlayers()
    end
    return {}
end

function Framework.GetPlayersWithJob(jobName)
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.GetPlayersWithJob(jobName)
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.GetPlayersWithJob(jobName)
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.GetPlayersWithJob(jobName)
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.GetPlayersWithJob(jobName)
    end
    return {}
end

function Framework.GetPlayersWithGroup(groupName)
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.GetPlayersWithGroup(groupName)
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.GetPlayersWithGroup(groupName)
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.GetPlayersWithGroup(groupName)
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.GetPlayersWithGroup(groupName)
    end
    return {}
end

function Framework.ShowNotification(source, message, type, duration)
    if Framework.IsFramework('es_extended') then
        Framework.ESX.ShowNotification(source, message, type, duration)
    elseif Framework.IsFramework('qb_core') then
        Framework.QB.ShowNotification(source, message, type, duration)
    elseif Framework.IsFramework('qbx_core') then
        Framework.QBX.ShowNotification(source, message, type, duration)
    elseif Framework.IsFramework('ox_core') then
        Framework.OX.ShowNotification(source, message, type, duration)
    else
        -- Fallback notification
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 255, 255},
            multiline = true,
            args = {Config.ScriptName, message}
        })
    end
end

function Framework.TriggerClientEvent(source, eventName, ...)
    TriggerClientEvent(eventName, source, ...)
end

function Framework.GetOfflinePlayer(identifier)
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.GetOfflinePlayer(identifier)
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.GetOfflinePlayer(identifier)
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.GetOfflinePlayer(identifier)
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.GetOfflinePlayer(identifier)
    end
    return nil
end

function Framework.SavePlayerData(source)
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.SavePlayerData(source)
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.SavePlayerData(source)
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.SavePlayerData(source)
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.SavePlayerData(source)
    end
    return false
end

-- Export unified interface
exports('GetPlayer', Framework.GetPlayer)
exports('GetPlayerData', Framework.GetPlayerData)
exports('GetPlayerJob', Framework.GetPlayerJob)
exports('GetPlayerGroup', Framework.GetPlayerGroup)
exports('HasJob', Framework.HasJob)
exports('HasGroup', Framework.HasGroup)
exports('GetPlayerIdentifier', Framework.GetPlayerIdentifier)
exports('GetPlayerMoney', Framework.GetPlayerMoney)
exports('AddPlayerMoney', Framework.AddPlayerMoney)
exports('RemovePlayerMoney', Framework.RemovePlayerMoney)
exports('SetPlayerJob', Framework.SetPlayerJob)
exports('SetPlayerGroup', Framework.SetPlayerGroup)
exports('GetPlayers', Framework.GetPlayers)
exports('GetPlayersWithJob', Framework.GetPlayersWithJob)
exports('GetPlayersWithGroup', Framework.GetPlayersWithGroup)
exports('ShowNotification', Framework.ShowNotification)
exports('TriggerClientEvent', Framework.TriggerClientEvent)
exports('GetOfflinePlayer', Framework.GetOfflinePlayer)
exports('SavePlayerData', Framework.SavePlayerData)

-- Example server event
RegisterNetEvent('multi_framework:server:example')
AddEventHandler('multi_framework:server:example', function()
    local source = source
    if FrameworkReady then
        local playerData = Framework.GetPlayerData(source)
        local job = Framework.GetPlayerJob(source)
        
        Framework.ShowNotification(source, 'Framework: ' .. Framework.GetCurrent(), 'success')
        Framework.ShowNotification(source, 'Job: ' .. (job and job.name or 'None'), 'info')
        
        -- Trigger client event as example
        Framework.TriggerClientEvent(source, 'multi_framework:example')
    end
end)

-- Player join event
AddEventHandler('playerJoining', function()
    Utils.Log('info', 'Player joining: %s', GetPlayerName(source))
end)

-- Player drop event
AddEventHandler('playerDropped', function(reason)
    Utils.Log('info', 'Player dropped: %s (Reason: %s)', GetPlayerName(source), reason)
end)

Utils.Log('info', 'Multi-Framework Template Server loaded')
