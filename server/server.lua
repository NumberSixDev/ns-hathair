local QBCore = exports['qb-core']:GetCoreObject()

if Config.UseItem == true then
    QBCore.Functions.CreateUseableItem("hairband", function(source, item)
            TriggerClientEvent("ns-hathair:useitem", source)
    end)
end
