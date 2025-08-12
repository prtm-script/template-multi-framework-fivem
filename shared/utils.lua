Utils = {}

-- Debug logging function
function Utils.Log(level, message, ...)
    if not Config.Logging.enabled then return end
    
    local levels = {
        debug = 1,
        info = 2,
        warn = 3,
        error = 4
    }
    
    local currentLevel = levels[Config.Logging.level] or 2
    local messageLevel = levels[level] or 2
    
    if messageLevel >= currentLevel then
        local formattedMessage = string.format(message, ...)
        local timestamp = os.date('%Y-%m-%d %H:%M:%S')
        local logMessage = string.format('[%s] [%s] %s: %s', 
            timestamp, 
            string.upper(level), 
            Config.ScriptName, 
            formattedMessage
        )
        
        if Config.Logging.consoleOutput then
            print(logMessage)
        end
        
        if Config.Logging.saveToFile then
            -- Save to log file (implement if needed)
            Utils.SaveToLogFile(logMessage)
        end
    end
end

-- Save log to file
function Utils.SaveToLogFile(message)
    -- Implementation for saving logs to file
    -- This is a placeholder - implement as needed
end

-- Table utilities
function Utils.TableLength(t)
    local count = 0
    for _ in pairs(t) do count = count + 1 end
    return count
end

function Utils.TableContains(t, value)
    for _, v in pairs(t) do
        if v == value then
            return true
        end
    end
    return false
end

function Utils.TableMerge(t1, t2)
    for k, v in pairs(t2) do
        if type(v) == "table" and type(t1[k]) == "table" then
            Utils.TableMerge(t1[k], v)
        else
            t1[k] = v
        end
    end
    return t1
end

-- String utilities
function Utils.StringSplit(str, delimiter)
    local result = {}
    local from = 1
    local delim_from, delim_to = string.find(str, delimiter, from)
    
    while delim_from do
        table.insert(result, string.sub(str, from, delim_from - 1))
        from = delim_to + 1
        delim_from, delim_to = string.find(str, delimiter, from)
    end
    
    table.insert(result, string.sub(str, from))
    return result
end

function Utils.StringTrim(str)
    return str:match("^%s*(.-)%s*$")
end

-- Number utilities
function Utils.Round(num, decimals)
    local mult = 10^(decimals or 0)
    return math.floor(num * mult + 0.5) / mult
end

function Utils.Clamp(value, min, max)
    return math.min(math.max(value, min), max)
end

-- Vector utilities
function Utils.GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2 + (z2 - z1)^2)
end

function Utils.GetDistanceBetweenVectors(vec1, vec2)
    return Utils.GetDistanceBetweenCoords(vec1.x, vec1.y, vec1.z, vec2.x, vec2.y, vec2.z)
end

-- Time utilities
function Utils.GetCurrentTimestamp()
    return os.time()
end

function Utils.FormatTime(seconds)
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local secs = seconds % 60
    
    return string.format("%02d:%02d:%02d", hours, minutes, secs)
end

-- Validation utilities
function Utils.IsValidPlayer(source)
    return source and source > 0 and GetPlayerName(source) ~= nil
end

function Utils.IsValidJob(job)
    return job and type(job) == "table" and job.name
end

-- Notification utilities
function Utils.Notify(source, message, type, duration)
    if not Config.DefaultSettings.notification then return end
    
    type = type or 'info'
    duration = duration or Config.Notifications.duration
    
    -- Framework specific notification will be handled by the framework adapter
    if Framework and Framework.Notify then
        Framework.Notify(source, message, type, duration)
    else
        -- Fallback notification
        TriggerClientEvent('chat:addMessage', source, {
            color = {255, 255, 255},
            multiline = true,
            args = {Config.ScriptName, message}
        })
    end
end

-- Export utilities
exports('Utils', function()
    return Utils
end)
