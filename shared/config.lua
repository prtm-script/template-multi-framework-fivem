Config = {}

-- Framework Configuration
Config.Framework = 'auto' -- 'auto', 'es_extended', 'qb_core', 'qbx_core', 'ox_core'
Config.Debug = false
Config.Locale = 'id'

-- Script Configuration
Config.ScriptName = 'Multi Framework Template'
Config.ScriptVersion = '1.0.0'

-- Default Settings
Config.DefaultSettings = {
    enabled = true,
    notification = true,
    sound = true
}

-- Framework Specific Settings
Config.FrameworkSettings = {
    es_extended = {
        -- ES Extended specific settings
        useLegacyEvents = true,
        legacyPlayerObject = true
    },
    qb_core = {
        -- QB-Core specific settings
        useQBEvents = true,
        useQBNotify = true
    },
    qbx_core = {
        -- QBX-Core specific settings
        useQBXEvents = true,
        useQBXNotify = true
    },
    ox_core = {
        -- OX-Core specific settings
        useOXEvents = true,
        useOXNotify = true,
        useTypeScript = true
    }
}

-- Notification Settings
Config.Notifications = {
    position = 'top-right',
    duration = 5000,
    sound = true
}

-- Logging
Config.Logging = {
    enabled = true,
    level = 'info', -- 'debug', 'info', 'warn', 'error'
    saveToFile = true,
    consoleOutput = true
}

-- Database Settings (if needed)
Config.Database = {
    table = 'multi_framework_data',
    autoCreate = true
}

-- Export this config for other resources
exports('GetConfig', function()
    return Config
end)
