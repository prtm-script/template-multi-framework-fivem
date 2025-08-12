Framework = {}
Framework.Current = nil
Framework.Detected = false

-- Framework detection function
function Framework.Detect()
    Utils.Log('info', 'Detecting framework...')
    
    -- Check if framework is manually set
    if Config.Framework ~= 'auto' then
        Framework.Current = Config.Framework
        Framework.Detected = true
        Utils.Log('info', 'Framework manually set to: %s', Config.Framework)
        return Framework.Current
    end
    
    -- Auto-detect framework
    local detectedFramework = nil
    
    -- Check ES Extended
    if GetResourceState('es_extended') == 'started' then
        local ESX = exports['es_extended']:getSharedObject()
        if ESX then
            detectedFramework = 'es_extended'
            Utils.Log('info', 'ES Extended detected')
        end
    end
    
    -- Check QB-Core
    if not detectedFramework and GetResourceState('qb-core') == 'started' then
        local QBCore = exports['qb-core']:GetCoreObject()
        if QBCore then
            detectedFramework = 'qb_core'
            Utils.Log('info', 'QB-Core detected')
        end
    end
    
    -- Check QBX-Core
    if not detectedFramework and GetResourceState('qbx_core') == 'started' then
        local QBXCore = exports['qbx_core']:GetCoreObject()
        if QBXCore then
            detectedFramework = 'qbx_core'
            Utils.Log('info', 'QBX-Core detected')
        end
    end
    
    -- Check OX-Core
    if not detectedFramework and GetResourceState('ox_core') == 'started' then
        local ox = exports.ox_core
        if ox then
            detectedFramework = 'ox_core'
            Utils.Log('info', 'OX-Core detected')
        end
    end
    
    if detectedFramework then
        Framework.Current = detectedFramework
        Framework.Detected = true
        Utils.Log('info', 'Framework detected: %s', detectedFramework)
    else
        Utils.Log('warn', 'No supported framework detected, using fallback mode')
        Framework.Current = 'fallback'
        Framework.Detected = false
    end
    
    return Framework.Current
end

-- Initialize framework
function Framework.Init()
    Framework.Detect()
    
    if Framework.Detected then
        Utils.Log('info', 'Initializing framework: %s', Framework.Current)
        
        -- Load framework specific adapter
        if Framework.Current == 'es_extended' then
            Framework.LoadESExtended()
        elseif Framework.Current == 'qb_core' then
            Framework.LoadQBCore()
        elseif Framework.Current == 'qbx_core' then
            Framework.LoadQBXCore()
        elseif Framework.Current == 'ox_core' then
            Framework.LoadOXCore()
        end
        
        Utils.Log('info', 'Framework initialized successfully')
    else
        Utils.Log('warn', 'Using fallback framework mode')
        Framework.LoadFallback()
    end
end

-- Framework specific loaders
function Framework.LoadESExtended()
    Utils.Log('debug', 'Loading ES Extended adapter')
    -- ES Extended specific initialization will be handled by the adapter file
end

function Framework.LoadQBCore()
    Utils.Log('debug', 'Loading QB-Core adapter')
    -- QB-Core specific initialization will be handled by the adapter file
end

function Framework.LoadQBXCore()
    Utils.Log('debug', 'Loading QBX-Core adapter')
    -- QBX-Core specific initialization will be handled by the adapter file
end

function Framework.LoadOXCore()
    Utils.Log('debug', 'Loading OX-Core adapter')
    -- OX-Core specific initialization will be handled by the adapter file
end

function Framework.LoadFallback()
    Utils.Log('debug', 'Loading fallback framework')
    -- Fallback implementation for when no framework is detected
end

-- Framework status check
function Framework.IsReady()
    return Framework.Detected and Framework.Current ~= nil
end

function Framework.GetCurrent()
    return Framework.Current
end

function Framework.IsFramework(name)
    return Framework.Current == name
end

-- Export framework object
exports('GetFramework', function()
    return Framework
end)

exports('IsFrameworkReady', function()
    return Framework.IsReady()
end)

exports('GetCurrentFramework', function()
    return Framework.GetCurrent()
end)
