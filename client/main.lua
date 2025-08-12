-- Multi-Framework Template Client Main
local PlayerData = {}
local FrameworkReady = false

-- Unified Framework Interface
Framework = Framework or {}

-- Initialize framework when resource starts
CreateThread(function()
    while not Framework.IsReady() do
        Wait(100)
    end
    
    FrameworkReady = true
    Utils.Log('info', 'Client framework ready: %s', Framework.GetCurrent())
    
    -- Initialize player data
    Framework.InitPlayerData()
end)

-- Initialize player data
function Framework.InitPlayerData()
    if Framework.IsFramework('es_extended') then
        PlayerData = Framework.ESX.GetPlayerData() or {}
    elseif Framework.IsFramework('qb_core') then
        PlayerData = Framework.QB.GetPlayerData() or {}
    elseif Framework.IsFramework('qbx_core') then
        PlayerData = Framework.QBX.GetPlayerData() or {}
    elseif Framework.IsFramework('ox_core') then
        PlayerData = Framework.OX.GetPlayerData() or {}
    end
    
    Utils.Log('debug', 'Player data initialized')
end)

-- Unified Player Functions
function Framework.GetPlayerData()
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.GetPlayerData()
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.GetPlayerData()
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.GetPlayerData()
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.GetPlayerData()
    end
    return PlayerData
end

function Framework.GetPlayerJob()
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.GetPlayerJob()
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.GetPlayerJob()
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.GetPlayerJob()
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.GetPlayerJob()
    end
    return nil
end

function Framework.GetPlayerGroup()
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.GetPlayerGroup()
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.GetPlayerGroup()
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.GetPlayerGroup()
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.GetPlayerGroup()
    end
    return nil
end

function Framework.HasJob(jobName)
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.HasJob(jobName)
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.HasJob(jobName)
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.HasJob(jobName)
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.HasJob(jobName)
    end
    return false
end

function Framework.HasGroup(groupName)
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.HasGroup(groupName)
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.HasGroup(groupName)
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.HasGroup(groupName)
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.HasGroup(groupName)
    end
    return false
end

function Framework.GetPlayerIdentifier()
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.GetPlayerIdentifier()
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.GetPlayerCitizenId()
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.GetPlayerCitizenId()
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.GetPlayerIdentifier()
    end
    return nil
end

function Framework.GetPlayerCoords()
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.GetPlayerCoords()
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.GetPlayerCoords()
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.GetPlayerCoords()
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.GetPlayerCoords()
    end
    return nil
end

function Framework.ShowNotification(message, type, duration)
    if Framework.IsFramework('es_extended') then
        Framework.ESX.ShowNotification(message, type, duration)
    elseif Framework.IsFramework('qb_core') then
        Framework.QB.ShowNotification(message, type, duration)
    elseif Framework.IsFramework('qbx_core') then
        Framework.QBX.ShowNotification(message, type, duration)
    elseif Framework.IsFramework('ox_core') then
        Framework.OX.ShowNotification(message, type, duration)
    else
        -- Fallback notification
        SetNotificationTextEntry('STRING')
        AddTextComponentString(message)
        DrawNotification(false, false)
    end
end

function Framework.ShowHelpNotification(message)
    if Framework.IsFramework('es_extended') then
        Framework.ESX.ShowHelpNotification(message)
    elseif Framework.IsFramework('qb_core') then
        Framework.QB.ShowHelpNotification(message)
    elseif Framework.IsFramework('qbx_core') then
        Framework.QBX.ShowHelpNotification(message)
    elseif Framework.IsFramework('ox_core') then
        Framework.OX.ShowHelpNotification(message)
    else
        -- Fallback help notification
        BeginTextCommandDisplayHelp('STRING')
        AddTextComponentSubstringPlayerName(message)
        EndTextCommandDisplayHelp(0, false, true, -1)
    end
end

function Framework.TriggerServerEvent(eventName, ...)
    TriggerServerEvent(eventName, ...)
end

function Framework.GetClosestPlayer()
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.GetClosestPlayer()
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.GetClosestPlayer()
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.GetClosestPlayer()
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.GetClosestPlayer()
    end
    return nil
end

function Framework.GetClosestPlayerCoords()
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.GetClosestPlayerCoords()
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.GetClosestPlayerCoords()
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.GetClosestPlayerCoords()
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.GetClosestPlayerCoords()
    end
    return nil
end

function Framework.IsPlayerDead()
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.IsPlayerDead()
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.IsPlayerDead()
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.IsPlayerDead()
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.IsPlayerDead()
    end
    return false
end

function Framework.GetPlayerMoney(account)
    if Framework.IsFramework('es_extended') then
        return Framework.ESX.GetPlayerMoney(account)
    elseif Framework.IsFramework('qb_core') then
        return Framework.QB.GetPlayerMoney(account)
    elseif Framework.IsFramework('qbx_core') then
        return Framework.QBX.GetPlayerMoney(account)
    elseif Framework.IsFramework('ox_core') then
        return Framework.OX.GetPlayerMoney(account)
    end
    return 0
end

-- Export unified interface
exports('GetPlayerData', Framework.GetPlayerData)
exports('GetPlayerJob', Framework.GetPlayerJob)
exports('GetPlayerGroup', Framework.GetPlayerGroup)
exports('HasJob', Framework.HasJob)
exports('HasGroup', Framework.HasGroup)
exports('GetPlayerIdentifier', Framework.GetPlayerIdentifier)
exports('GetPlayerCoords', Framework.GetPlayerCoords)
exports('ShowNotification', Framework.ShowNotification)
exports('ShowHelpNotification', Framework.ShowHelpNotification)
exports('TriggerServerEvent', Framework.TriggerServerEvent)
exports('GetClosestPlayer', Framework.GetClosestPlayer)
exports('GetClosestPlayerCoords', Framework.GetClosestPlayerCoords)
exports('IsPlayerDead', Framework.IsPlayerDead)
exports('GetPlayerMoney', Framework.GetPlayerMoney)

-- Example usage event
RegisterNetEvent('multi_framework:example')
AddEventHandler('multi_framework:example', function()
    if FrameworkReady then
        local playerData = Framework.GetPlayerData()
        local job = Framework.GetPlayerJob()
        
        Framework.ShowNotification('Framework: ' .. Framework.GetCurrent(), 'success')
        Framework.ShowNotification('Job: ' .. (job and job.name or 'None'), 'info')
    end
end)

-- Player data update events
if Framework.IsFramework('es_extended') then
    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function(xPlayer)
        PlayerData = xPlayer
        Utils.Log('debug', 'ES Extended player loaded')
    end)
elseif Framework.IsFramework('qb_core') then
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
    AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
        PlayerData = Framework.GetPlayerData()
        Utils.Log('debug', 'QB-Core player loaded')
    end)
elseif Framework.IsFramework('qbx_core') then
    RegisterNetEvent('QBXCore:Client:OnPlayerLoaded')
    AddEventHandler('QBXCore:Client:OnPlayerLoaded', function()
        PlayerData = Framework.GetPlayerData()
        Utils.Log('debug', 'QBX-Core player loaded')
    end)
elseif Framework.IsFramework('ox_core') then
    RegisterNetEvent('ox:playerLoaded')
    AddEventHandler('ox:playerLoaded', function()
        PlayerData = Framework.GetPlayerData()
        Utils.Log('debug', 'OX-Core player loaded')
    end)
end

Utils.Log('info', 'Multi-Framework Template Client loaded')
