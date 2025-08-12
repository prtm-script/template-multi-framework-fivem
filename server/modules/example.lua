-- Example Server Module
-- This file shows how to use the multi-framework template on server side

local ExampleModule = {}

-- Example function to get all players with a specific job
function ExampleModule.GetPlayersWithJob(jobName)
    if Framework.IsReady() then
        local players = Framework.GetPlayersWithJob(jobName)
        Utils.Log('info', 'Found %d players with job: %s', #players, jobName)
        return players
    end
    return {}
end

-- Example function to give money to all players with a specific job
function ExampleModule.GiveMoneyToJob(jobName, amount, account)
    if Framework.IsReady() then
        local players = Framework.GetPlayersWithJob(jobName)
        local successCount = 0
        
        for _, playerId in ipairs(players) do
            if Framework.AddPlayerMoney(playerId, account or 'cash', amount) then
                Framework.ShowNotification(playerId, 'You received $' .. amount .. ' for your job!', 'success')
                successCount = successCount + 1
            end
        end
        
        Utils.Log('info', 'Gave money to %d players with job: %s', successCount, jobName)
        return successCount
    end
    return 0
end

-- Example function to set job for a player
function ExampleModule.SetPlayerJob(source, jobName, grade)
    if Framework.IsReady() then
        if Framework.SetPlayerJob(source, jobName, grade or 0) then
            Framework.ShowNotification(source, 'Your job has been set to: ' .. jobName, 'success')
            Utils.Log('info', 'Player %s job set to: %s (grade: %d)', GetPlayerName(source), jobName, grade or 0)
            return true
        else
            Framework.ShowNotification(source, 'Failed to set job', 'error')
            return false
        end
    end
    return false
end

-- Example function to get player statistics
function ExampleModule.GetPlayerStats(source)
    if Framework.IsReady() then
        local playerData = Framework.GetPlayerData(source)
        if playerData then
            local stats = {
                name = playerData.name or 'Unknown',
                job = playerData.job and playerData.job.name or 'None',
                group = playerData.group or 'None',
                money = {
                    cash = Framework.GetPlayerMoney(source, 'cash'),
                    bank = Framework.GetPlayerMoney(source, 'bank')
                }
            }
            
            Utils.Log('info', 'Player stats for %s: Job=%s, Group=%s, Cash=$%d, Bank=$%d', 
                stats.name, stats.job, stats.group, stats.money.cash, stats.money.bank)
            
            return stats
        end
    end
    return nil
end

-- Example function to broadcast message to all players with a specific group
function ExampleModule.BroadcastToGroup(groupName, message, type)
    if Framework.IsReady() then
        local players = Framework.GetPlayersWithGroup(groupName)
        local sentCount = 0
        
        for _, playerId in ipairs(players) do
            Framework.ShowNotification(playerId, message, type or 'info')
            sentCount = sentCount + 1
        end
        
        Utils.Log('info', 'Broadcasted message to %d players with group: %s', sentCount, groupName)
        return sentCount
    end
    return 0
end

-- Example function to save all online players
function ExampleModule.SaveAllPlayers()
    if Framework.IsReady() then
        local players = Framework.GetPlayers()
        local savedCount = 0
        
        for _, playerId in ipairs(players) do
            if Framework.SavePlayerData(playerId) then
                savedCount = savedCount + 1
            end
        end
        
        Utils.Log('info', 'Saved data for %d players', savedCount)
        return savedCount
    end
    return 0
end

-- Example chat command to set job
RegisterCommand('setjob', function(source, args, rawCommand)
    if #args < 2 then
        Framework.ShowNotification(source, 'Usage: /setjob [playerid] [jobname] [grade]', 'error')
        return
    end
    
    local targetId = tonumber(args[1])
    local jobName = args[2]
    local grade = tonumber(args[3]) or 0
    
    if not targetId or not jobName then
        Framework.ShowNotification(source, 'Invalid arguments', 'error')
        return
    end
    
    if ExampleModule.SetPlayerJob(targetId, jobName, grade) then
        Framework.ShowNotification(source, 'Job set successfully for player ' .. targetId, 'success')
    end
end, true)

-- Example chat command to give money to job
RegisterCommand('givejobmoney', function(source, args, rawCommand)
    if #args < 3 then
        Framework.ShowNotification(source, 'Usage: /givejobmoney [jobname] [amount] [account]', 'error')
        return
    end
    
    local jobName = args[1]
    local amount = tonumber(args[2])
    local account = args[3] or 'cash'
    
    if not amount or amount <= 0 then
        Framework.ShowNotification(source, 'Invalid amount', 'error')
        return
    end
    
    local successCount = ExampleModule.GiveMoneyToJob(jobName, amount, account)
    Framework.ShowNotification(source, 'Gave money to ' .. successCount .. ' players', 'success')
end, true)

-- Example chat command to get player stats
RegisterCommand('playerstats', function(source, args, rawCommand)
    local targetId = source
    
    if #args >= 1 then
        targetId = tonumber(args[1])
        if not targetId then
            Framework.ShowNotification(source, 'Invalid player ID', 'error')
            return
        end
    end
    
    local stats = ExampleModule.GetPlayerStats(targetId)
    if stats then
        Framework.ShowNotification(source, 'Player: ' .. stats.name, 'info')
        Framework.ShowNotification(source, 'Job: ' .. stats.job, 'info')
        Framework.ShowNotification(source, 'Group: ' .. stats.group, 'info')
        Framework.ShowNotification(source, 'Cash: $' .. stats.money.cash, 'info')
        Framework.ShowNotification(source, 'Bank: $' .. stats.money.bank, 'info')
    else
        Framework.ShowNotification(source, 'Failed to get player stats', 'error')
    end
end, false)

-- Example chat command to broadcast to group
RegisterCommand('broadcastgroup', function(source, args, rawCommand)
    if #args < 2 then
        Framework.ShowNotification(source, 'Usage: /broadcastgroup [groupname] [message]', 'error')
        return
    end
    
    local groupName = args[1]
    table.remove(args, 1)
    local message = table.concat(args, ' ')
    
    local sentCount = ExampleModule.BroadcastToGroup(groupName, message, 'info')
    Framework.ShowNotification(source, 'Message sent to ' .. sentCount .. ' players', 'success')
end, true)

-- Example chat command to save all players
RegisterCommand('saveall', function(source, args, rawCommand)
    local savedCount = ExampleModule.SaveAllPlayers()
    Framework.ShowNotification(source, 'Saved data for ' .. savedCount .. ' players', 'success')
end, true)

-- Export module functions
exports('GetPlayersWithJob', ExampleModule.GetPlayersWithJob)
exports('GiveMoneyToJob', ExampleModule.GiveMoneyToJob)
exports('SetPlayerJob', ExampleModule.SetPlayerJob)
exports('GetPlayerStats', ExampleModule.GetPlayerStats)
exports('BroadcastToGroup', ExampleModule.BroadcastToGroup)
exports('SaveAllPlayers', ExampleModule.SaveAllPlayers)

Utils.Log('info', 'Example server module loaded')
