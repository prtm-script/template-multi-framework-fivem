-- Example Client Module
-- This file shows how to use the multi-framework template

local ExampleModule = {}

-- Example function that works with any framework
function ExampleModule.ShowPlayerInfo()
    if Framework.IsReady() then
        local playerData = Framework.GetPlayerData()
        local job = Framework.GetPlayerJob()
        local group = Framework.GetPlayerGroup()
        
        if playerData then
            Framework.ShowNotification('Player: ' .. (playerData.name or 'Unknown'), 'info')
            Framework.ShowNotification('Job: ' .. (job and job.name or 'None'), 'info')
            Framework.ShowNotification('Group: ' .. (group or 'None'), 'info')
        end
    end
end

-- Example function to check if player has specific job
function ExampleModule.CheckJob(jobName)
    if Framework.IsReady() then
        if Framework.HasJob(jobName) then
            Framework.ShowNotification('You have the job: ' .. jobName, 'success')
            return true
        else
            Framework.ShowNotification('You do not have the job: ' .. jobName, 'error')
            return false
        end
    end
    return false
end

-- Example function to get player money
function ExampleModule.ShowMoney()
    if Framework.IsReady() then
        local cash = Framework.GetPlayerMoney('cash')
        local bank = Framework.GetPlayerMoney('bank')
        
        Framework.ShowNotification('Cash: $' .. cash, 'info')
        Framework.ShowNotification('Bank: $' .. bank, 'info')
    end
end

-- Example function to trigger server event
function ExampleModule.TriggerExample()
    if Framework.IsReady() then
        Framework.TriggerServerEvent('multi_framework:server:example')
    end
end

-- Example keybind (F5)
RegisterCommand('example_info', function()
    ExampleModule.ShowPlayerInfo()
end, false)

RegisterKeyMapping('example_info', 'Show Player Info', 'keyboard', 'F5')

-- Example chat command
RegisterCommand('checkjob', function(source, args)
    if args[1] then
        ExampleModule.CheckJob(args[1])
    else
        Framework.ShowNotification('Usage: /checkjob [jobname]', 'error')
    end
end, false)

-- Example chat command for money
RegisterCommand('money', function()
    ExampleModule.ShowMoney()
end, false)

-- Example chat command for server event
RegisterCommand('example', function()
    ExampleModule.TriggerExample()
end, false)

-- Export module functions
exports('ShowPlayerInfo', ExampleModule.ShowPlayerInfo)
exports('CheckJob', ExampleModule.CheckJob)
exports('ShowMoney', ExampleModule.ShowMoney)
exports('TriggerExample', ExampleModule.TriggerExample)

Utils.Log('info', 'Example module loaded')
